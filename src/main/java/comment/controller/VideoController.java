
package comment.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import comment.model.Video;
import comment.service.VideoService;
import event.validator.AttendanceValidator;
import tool.Common;

@Controller
@SessionAttributes({ "video" })
public class VideoController {

	@Autowired
	VideoService vs;

	@Autowired
	ServletContext context;

	// select all 秀出所有影片
	@GetMapping("comment/videolist")
	public String list(Model model) {// ,RedirectAttributes redirectAttributes
		model.addAttribute("videolist", vs.selectAllVideo());
//		redirectAttributes.addFlashAttribute("videolist",vs.selectAllVideo());
		return "comment/video";
	}

	// 創一個空白區塊來放影片(insert)
	@GetMapping("video/empty")
	public String showEmptyForm(Model model) {
		Video video = new Video();
		model.addAttribute("video", video);
		return "comment/videoForm";
	}

//insert一個新的影片	
	@PostMapping("video/empty")
	
	public String insertNewVideo(Model model, //@RequestParam(value = "option") Integer option,
			@RequestParam(value = "file") MultipartFile file, @ModelAttribute("video") Video video)
			throws IOException, ServletException {

		
		System.out.println("video:"+video);
		
		
		
//		如果是傳網址
//		if(option==1) {
//			vs.insertVideo(video);
//			System.out.println("上傳分享網址OK");
//			
//			
//		}
//		 如果有傳影片過來
//		if (option == 2) {
			try {

				if (file != null && file.getSize() > 0) {

					System.out.println("影片路徑" + context.getRealPath("/"));
					video.setCommentTime(new Timestamp(new Date().getTime()));
					video.setUrl(Common.saveVideo(file));
					vs.insertVideo(video);

					System.out.println("video upload done");
				} else {
					System.out.println("no video");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("error occur while video upload: " + e.getMessage());
			}
		

		return "redirect:/comment/videolist";
	}

	// insert一部影片
	@GetMapping("comment/videoForm")
	public String add(@ModelAttribute("video") Video video, BindingResult result, Model model,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			return "comment/videoForm";
		}
		try {
			vs.insertVideo(video);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			return "comment/videoForm";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
			return "comment/videoForm";
		}
		return "comment/videoForm";
	}

	// 去到更新的頁面
	@GetMapping("/uploadedVideo")
	public String UploadedVideo() {
		return "comment/videoUpdate";
	}

	// 選擇一部需要更新的影片
	@GetMapping(value = "video/update")
	public String showDataForm(Model model, @RequestParam(value = "update", required = false) Integer id) {
		Video videolist = vs.selectUpdateVideo(id);
		model.addAttribute(videolist);
		return "comment/videoUpdate";
	}

	// 更新影片
	@PostMapping(value = "comment/update")
	public String modify(@ModelAttribute("updatevideo") Video video, BindingResult result, Model model,
			HttpServletRequest request, @RequestParam(value = "aid", required = false) Integer aid) {
		AttendanceValidator validator = new AttendanceValidator();
		validator.validate(video, result);
		if (result.hasErrors()) {
			System.out.println("result hasErrors(), video=" + video);
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "commet/videoUpdate";
		}
		vs.updateVideo(video);
		return "redirect:/comment/video";
	}

	// 刪除影片
	@GetMapping(value = "comment/delete")
	public String delete(@RequestParam(value = "aid", required = false) Integer aid) {
		vs.deleteVideo(aid);
		return "redirect:/comment/video";
	}
}