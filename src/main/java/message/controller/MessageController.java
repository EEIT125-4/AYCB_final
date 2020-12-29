package message.controller;

import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.auth.MD4;

import message.model.MessageBean;
import message.service.MessageService;
import net.bytebuddy.agent.builder.AgentBuilder.CircularityLock.Global;
import product.model.ProductBean;
import tool.GlobalService;
import tool.model.Image;
import tool.service.ImageService;

@Controller
//@SessionAttributes("message")
public class MessageController {

	@Autowired
	MessageService ms;

	@Autowired
	ImageService imgService;
	@Autowired
	ServletContext context;

	@PostMapping(value = { "/message/update_step" })
	public String update(Model model, @ModelAttribute("message") MessageBean message,
			@RequestParam(value = "submit") String s, @RequestParam(value = "id", required = false) String id) {
		System.out.println("submit:" + s);

		if (s.equals("edit")) {

			System.out.println("in update");
			message = ms.getMessage(id);
			model.addAttribute("message", message);
			return "message/newMsg";

		} else if (s.equals("delete")) {
			System.out.println("in delete");
			imgService.deleteImage(ms.getMessage(id).getImageid());
			ms.deleteMessage(id);
			return query(model, "", "", "", "");

		} else if (s.equals("update")) {

			try {

				MultipartFile file = message.getFile();

				// 如果有傳檔案過來
				if (file != null && file.getSize() > 0) {

					System.out.println("有收到圖片");
					Image img = null;

					try {
						// 如果message有存圖片的主鍵
						if (message.getImageid() != null) {
							img = imgService.getImage(message.getImageid());
							System.out.println("old圖片ID:" + img.getImgid());
						} else {
							img = new Image(file);
						}

						// 更新圖片名稱
						img.setImage(file);

						// 更新圖片內容
						imgService.saveImage(img);
						message.setImageid(img.getImgid());
						System.out.println("圖片儲存完畢,id=" + img.getImgid()+",filename="+img.getFilename());

					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
					}
				} else {
					System.out.println("沒有圖片");
				}

				java.sql.Date date = new java.sql.Date(new Date().getTime());
				// 儲存更新日期
				message.setEditDate(date);

				ms.updateMessage(message);
				System.out.println("更新成功");

			} catch (Exception e) {

				System.err.println("更新過程發生異常");
				e.printStackTrace();

			}

			System.out.println("撈取列表並前往");
//			model.addAttribute("message", ms.getAllMessages());

			return "redirect:/message/query";

		}

		return null;

	}

	@GetMapping(value = "/message/types")
	@ResponseBody
	public List<String> queryTypes() {
		System.out.println("ajax request");
		List<String> types = ms.queryMessageType();// 訊息types
//		for (String s : types) {
//			System.out.println("type:" + s);
//		}

		return types;

	}

	public List<MessageBean> getAllMessage() {

		return ms.getAllMessages();
	}

	@GetMapping(value = { "/message/query" })
	public String query(Model model, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "sort", defaultValue = "") String sort,
			@RequestParam(value = "count", defaultValue = "") String count,
			@RequestParam(value = "word", defaultValue = "") String word

	) {

		List<MessageBean> list = new ArrayList<MessageBean>();// 訊息
		List<String> types = ms.queryMessageType();// 訊息types

		if (!type.equals("") || !sort.equals("") || !count.equals("") || !word.equals("")) {
			String sql = "";

			if (!word.equals("")) {

				sql = " select*from message_table where type like'%" + word + "%'" + " or content like'%" + word + "%'"
						+ " or title like '%" + word + "%'" + " or date like '%" + word + "%'";

			} else {
				sql = "select " + count + " *from message_table where type like '%" + type + "%' order by id " + sort;

			}

			list = ms.queryMessage(sql);

		} else {
			list = ms.getAllMessages();
			System.out.println("query all message");

		}

		model.addAttribute("allMessage", list);
		model.addAttribute("types", types);

		return "message/msgPage2"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖

	}

	@GetMapping(value = { "/message/new" })
	public String newMessage(Model model) {

		System.out.println("new message");
		MessageBean message = new MessageBean();
		model.addAttribute("message", message);

		return "message/newMsg";

	}

	@PostMapping(value = "/message/new")

	public String insertNewMessage(Model model, @RequestParam(value = "submit", required = false) String submit,
			@ModelAttribute("message") MessageBean message) throws IOException, ServletException {

		System.out.println("file:" + message.getFile().getSize());
		System.out.println("MultipartFile 名稱:" + message.getFile().getOriginalFilename());
		System.out.printf("動作為:%s\n", submit);
		System.out.println("messageID:" + message.getId());

		System.out.println("insert");
		try {
			System.out.println("textArea:" + message.getContent());
			MultipartFile file = message.getFile();
			// 新增圖片
			// 如果有傳檔案過來
			if (file != null && file.getSize() > 0) {
				// 這邊是存在Tomcat的路徑,但網站重佈署時就會消失,所以目前方案是存在專案實際位置,每次重新佈署時就會自動同步
				System.out.println("有圖片" + context.getRealPath("/"));

				try {
					Image img = new Image(file);

					imgService.saveImage(img);
					message.setImageid(img.getImgid());
					System.out.println("圖片儲存完畢,id=" + img.getImgid()+",filename="+img.getFilename());

				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
				}

			} else {
				System.out.println("沒有圖片");
			}

			java.sql.Date date = new java.sql.Date(new Date().getTime());
			message.setDate(date);

			ms.save(message);
			System.out.println("訊息存檔成功");

		} catch (Exception e) {

			System.err.println("訊息儲存過程發生異常");

		}

		model.addAttribute("message", ms.getAllMessages());
		return "redirect:/message/query";

	}

}
