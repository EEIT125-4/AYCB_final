package comment.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comment.model.Video;
import comment.service.VideoService;
import event.validator.AttendanceValidator;

@Controller

public class VideoController {

	 @Autowired
	    VideoService videoService;
	  
		@Autowired
		ServletContext servletContext;

		//select all 秀出所有影片
		@GetMapping("comment/video")
		public String list(Model model) {
			model.addAttribute("video", videoService.selectAllVideo());
			return "comment/video";
		}

		//創一個空白區塊來放影片
		@GetMapping("video/empty")
		public String showEmptyForm(Model model) {
			Video video = new Video();
			model.addAttribute("video",video);			
			return "comment/videoForm";
		}
		
		//insert一部影片
		@GetMapping("comment/videoForm")
		public String add(@ModelAttribute("video") Video video,
				BindingResult result, Model model,
				HttpServletRequest request) {
//			VideoValidator validator =new VideoValidator();
//			validator.validate(video, result);
			if(result.hasErrors()) {
				return "comment/videoForm";
			}
			try {
				videoService.insertVideo(video);
			} catch (org.hibernate.exception.ConstraintViolationException e) {
				//result.rejectValue("account", "", "帳號已存在，請重新輸入");
				return "comment/videoForm";
			} catch (Exception ex) {
				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
				result.rejectValue("account", "", "請通知系統人員...");
				return "comment/videoForm";
			}
			return "comment/videoForm"; 
		}
		
		//選擇一部需要更新的影片
		@GetMapping(value = "comment/update")
		public String showDataForm(				
				Model model,
				@RequestParam(value="update" ,required = false)Integer aid ) {
			Video video = videoService.selectUpdateVideo(aid);
			model.addAttribute(video);
			return "event/update";
		}
		
		//更新影片
		@PostMapping(value = "comment/update")		
		public String modify(
				@ModelAttribute("updatevideo") Video video, 
				BindingResult result, 
				Model model,
//				@PathVariable Integer id, 
				HttpServletRequest request,
				@RequestParam(value="aid",required = false)Integer aid
				) {
			AttendanceValidator validator = new AttendanceValidator();
			validator.validate(video, result);
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), video=" + video);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "commet/videoForm";
			}
			videoService.updateVideo(video);
			return "redirect:/comment/video";
		}	
		
		//刪除影片
		@GetMapping(value = "comment/delete")
		public String delete(
			//	@PathVariable("aid") Integer aid
				@RequestParam(value="aid" ,required = false)Integer aid
				) {
			videoService.deleteVideo(aid);
			return "redirect:/comment/video";
		}
}
