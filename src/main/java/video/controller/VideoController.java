
package video.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import event.validator.AttendanceValidator;
import member.MemberBean;
import member.Service.MemberService;
import tool.Common;
import video.model.Video;
import video.service.VideoService;

@Controller
@SessionAttributes({ "video" })
public class VideoController {

	@Autowired
	VideoService vs;
	
	@Autowired
	MemberService ms;
	
	@Autowired
	ServletContext context;

	@GetMapping("/video")
	public String list(Model model) {// ,RedirectAttributes redirectAttributes
		model.addAttribute("videolist", vs.selectAllVideo());
//		redirectAttributes.addFlashAttribute("videolist",vs.selectAllVideo());
		return "video/videoIndex";
	}

	@GetMapping("/video/videoWatch")
	public String list(Model model, @RequestParam(value = "videoID", required = false) Integer videoID,
			HttpSession session

	) {
		Video video = vs.queryById(videoID);
		video.setViewCount(video.getViewCount()+1);
		vs.updateVideo(video);
		model.addAttribute("video", video);


		return "video/videoWatch";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "getVideo")
	@ResponseBody
	public Map<String, List<Video>> queryAll(Model model,
			@RequestParam(value = "videoCategory", required = false) String videoCategory,
			@RequestParam(value = "flag", required = false) Integer flag) {
		try {
			System.out.println("try to get video");

			Map<String, List<Video>> data = new HashMap<String, List<Video>>();

			List<Video> videoList = vs.selectAllVideo();//
			for (Video video : videoList) {
				System.out.println("video=" + video);
			}

			data.put("videoList", videoList);

			System.out.println("送回影片資料");
			return data;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@GetMapping(value = "getRandomVideo")
	@ResponseBody
	public List<Video> queryAll(Model model, @RequestParam(value = "num", required = false) Integer num) {
		
		try {
			System.out.println("try to get random video");
			

			System.out.println("num="+num);

			List<Video> videoList = vs.getRandomVideo(num);
			for(Video v:videoList) {
				System.out.println("v="+v.getTitle());
			}	
			System.out.println("送回影片資料");
			return videoList;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 創一個空白區塊來放影片(insert)
	@GetMapping("video/empty")
	public String showEmptyForm(Model model) {
		Video video = new Video();
		model.addAttribute("video", video);
		return "video/videoForm";
	}

//insert一個新的影片	
	@PostMapping("video/empty")

	public String insertNewVideo(Model model, // @RequestParam(value = "option") Integer option,
			@RequestParam(value = "imageFile") MultipartFile imageFile,
			@RequestParam(value = "videoFile") MultipartFile videoFile,
			@RequestParam(value="memberId") Integer memberId, 
			@ModelAttribute("video") Video video)
			throws IOException, ServletException {

		System.out.println("video:" + video);

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

			System.out.println("影片路徑" + context.getRealPath("/"));
			video.setCoverUrl(Common.saveImage(imageFile));
			video.setUrl(Common.saveVideo(videoFile));
			video.setCommentTime(new Timestamp(new Date().getTime()));
			
			
			MemberBean member=ms.getMember(memberId);
			if(member==null) {throw new Exception("沒有上傳會員資料");}
			video.setMember(member);

			vs.insertVideo(video);

			System.out.println("video upload done");

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("error occur while video upload: " + e.getMessage());
		}

		return "redirect:/video/";
	}

	// insert一部影片
	@GetMapping("video/videoForm")
	public String add(@ModelAttribute("video") Video video, BindingResult result, Model model,
			HttpServletRequest request) {
		if (result.hasErrors()) {
			return "video/videoForm";
		}
		try {
			vs.insertVideo(video);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			return "video/videoForm";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
			return "video/videoForm";
		}
		return "video/videoForm";
	}

	// 去到更新的頁面
	@GetMapping("/uploadedVideo")
	public String UploadedVideo() {
		return "video/videoUpdate";
	}

	// 選擇一部需要更新的影片
	@GetMapping(value = "video/update")
	public String showDataForm(Model model, @RequestParam(value = "update", required = false) Integer id) {
		Video videolist = vs.selectUpdateVideo(id);
		model.addAttribute(videolist);
		return "video/videoUpdate";
	}

	// 更新影片
	@PostMapping(value = "video/update")
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
			return "video/videoUpdate";
		}
		vs.updateVideo(video);
		return "redirect:/video/video";
	}

	// 刪除影片
	@GetMapping(value = "video/delete")
	public String delete(@RequestParam(value = "aid", required = false) Integer aid) {
		vs.deleteVideo(aid);
		return "redirect:/video/video";
	}
}