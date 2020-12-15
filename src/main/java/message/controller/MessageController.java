package message.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import message.model.MessageBean;
import message.service.MessageService;

@Controller
@SessionAttributes("")
public class MessageController {

	@Autowired
	MessageService ms;

	@PostMapping(value = { "/message/update" })
	public String update(Model model, @RequestParam(value = "submit") String s, @RequestParam(value = "id") String id) {
		System.out.println(s);
		MessageBean message = ms.getMessage(id);

		if (s.equals("edit")) {
			System.out.println("in update");
			model.addAttribute("message", message);

			return "message/newMsg";

		} else if (s.equals("delete")) {
			System.out.println("in delete");
			ms.deleteMessage(id);
			return query(model, "", "", "", "");

		}

		return null;

	}

	@GetMapping(value ="/message/types" )
	@ResponseBody
	public List<String> queryTypes() {
		System.out.println("ajax request");
		List<String> types = ms.queryMessageType();// 訊息types
		for(String s:types) {
			System.out.println("type:"+s);
		}
		
		return types;

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

	@RequestMapping(value = { "/message/new" })
	public String newMessage(Model model) {

		System.out.println("new message");

		return "message/newMsg";

	}

	@RequestMapping(value = "/message/insertNewMessage") // , method=RequestMethod.POST

	// @PostMapping(value = { "/message/insertNewMessage" })
	public String insertNewMessage(Model model, @RequestParam(value = "title", defaultValue = "notitle") String title,
			@RequestParam(value = "desc", defaultValue = "nodesc") String desc,
			@RequestParam(value = "type", defaultValue = "notype") String type, @RequestParam(value = "id") String id,
			@RequestParam(value = "submit") String submit) {

		System.out.println("insert new message");
		System.out.printf("title:%s\n", title);
		System.out.printf("desc:%s\n", desc);
		System.out.printf("type:%s\n", type);
		System.out.printf("動作為:%s\n", submit);

		if (submit.equals("insert")) {
			try {

				System.out.println("textArea:" + desc);

				String imgPath = "";

				java.sql.Date date = new java.sql.Date(new Date().getTime());

//				if (part != null &&part.getSize()>0) {// 如果有傳檔案過來
//					imgPath = Common.saveImage(part);
//				}else {
//					System.out.println("沒有圖片");
//				}

				MessageBean mb = new MessageBean(title, desc, type, imgPath, date);
				ms.save(mb);

			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("上傳過程發生異常");

			}

		}

		if (submit.equals("update")) {
			try {

				System.out.println("textArea:" + desc);

				// String imgPath = "";

				java.sql.Date date = new java.sql.Date(new Date().getTime());
				MessageBean mb = ms.getMessage(id);
				mb.setEditDate(date);
				mb.setMsg_desc(desc);
				mb.setMsg_title(title);
				mb.setMsg_type(type);

				ms.updateMessage(mb);

			} catch (Exception e) {
				e.printStackTrace();
				System.err.println("上傳過程發生異常");

			}

		}

		System.out.println("重新撈取列表並前往");
		return query(model, "", "", "", "");

	}

}
