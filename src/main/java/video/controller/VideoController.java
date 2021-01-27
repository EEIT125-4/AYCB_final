
package video.controller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
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

import com.google.gson.Gson;

import event.validator.AttendanceValidator;
import member.MemberBean;
import member.Service.MemberService;
import product.model.CollectBean;
import product.service.ProductService;
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
	
	ProductService ps;

	@Autowired
	ServletContext context;

	@GetMapping("/video")
	public String list(Model model,

			@RequestParam(value = "search", required = false) String search) {// ,RedirectAttributes redirectAttributes

		List<Video> list = new ArrayList<Video>();
		model.addAttribute("categorys", vs.getAllCategory());
		if (search != null) {
			list = vs.searchVideo(search);

		} else {
			list = vs.selectAllVideo();

		}
		model.addAttribute("videolist", list);
//		redirectAttributes.addFlashAttribute("videolist",vs.selectAllVideo());
		return "video/videoIndex";
	}

	@GetMapping("/video/videoWatch")
	public String list(Model model, @RequestParam(value = "videoID", required = false) Integer videoID,
			HttpSession session

	) {
		Video video = vs.queryById(videoID);
		video.setViewCount(video.getViewCount() + 1);
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

			System.out.println("num=" + num);

			List<Video> videoList = vs.getRandomVideo(num);
			for (Video v : videoList) {
				System.out.println("v=" + v.getTitle());
			}
			System.out.println("送回影片資料");
			return videoList;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 創一個空白區塊來放影片(insert)
	@GetMapping("video/edit")
	public String showEmptyForm(Model model, @RequestParam(value = "videoId", required = false) Integer videoId) {
		Video video = null;
		if (videoId != null) {
			video = vs.queryById(videoId);

		} else {
			video = new Video();
		}

		model.addAttribute("video", video);
		return "video/videoForm";
	}

//insert一個新的影片	
	@PostMapping("video/edit")

	public String uploadVideo(Model model, // @RequestParam(value = "option") Integer option,
			@RequestParam(value = "imagefile") MultipartFile imagefile,
			@RequestParam(value = "videofile") MultipartFile videofile,
			@RequestParam(value = "memberId") Integer memberId, @ModelAttribute("video") Video video)
			throws IOException, ServletException {

		System.out.println("video:" + video.getVideoId());

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
			// 圖片儲存判斷
			if (imagefile != null && imagefile.getSize()>0) {
				if (video.getCoverUrl() != null) {
					Common.deleteFile(video.getCoverUrl());

				}

				video.setCoverUrl(Common.saveImage(imagefile));

			}

			// 影片儲存判斷
			if (videofile != null && videofile.getSize()>0) {
				if (video.getUrl() != null) {
					Common.deleteFile(video.getUrl());

				}

				video.setUrl(Common.saveVideo(videofile));

			}

			// 日期判斷
			if (video.getCommentTime() != null) {

				video.setFixedTime(new Timestamp(new Date().getTime()));

			} else {

				video.setCommentTime(new Timestamp(new Date().getTime()));
			}

			MemberBean member = ms.getMember(memberId);
			if (member == null) {
				throw new Exception("沒有上傳會員資料");
			}
			video.setMember(member);
			vs.updateVideo(video);
//			vs.insertVideo(video);

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
	@PostMapping(value = "video/delete")
	@ResponseBody
	public boolean delete(@RequestParam(value = "vid", required = false) Integer vid) {
		try {
			vs.deleteVideo(vid);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@GetMapping(value = "video/MyVideoList")
	@ResponseBody
	public String getMyVideoList(HttpSession session) {// @RequestAttribute("member")MemberBean mb

		MemberBean mb = (MemberBean) session.getAttribute("member");
		if (mb != null) {
			Gson gson = new Gson();

			// debug
			List<Video> videos = vs.getVideoByMember(mb);
			for (Video v : videos) {
				System.out.println("v:" + v.getTitle());

			}

			return gson.toJson(vs.getVideoByMember(mb));
		} else {
			return null;
		}

	}

	@GetMapping(value = "video/getMoreVideo")
	@ResponseBody
	public List getMoreVideo(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "index", required = false) Integer index) {
		Integer num = 3;

		System.out.println("keyword=" + keyword + "/index=" + index);
		return vs.getMoreVideos("", index, num);

	}

	@GetMapping(value = "video/recentVideo")

	public String getMoreVideo(@RequestParam(value = "max", required = false) Integer max, Model model) {

		if (max == null) {
			max = 3;
		}
		List<Video> list = vs.recentVideo(max);
		model.addAttribute("videolist", list);
		model.addAttribute("categorys", vs.getAllCategory());
		return "video/videoIndex";

	}

	@GetMapping(value = "video/mostViewVideo")

	public String getMoreVideo(Model model) {

		List<Video> list = vs.mostViewVideo();
		model.addAttribute("videolist", list);
		model.addAttribute("categorys", vs.getAllCategory());
		return "video/videoIndex";

	}
	
	
	 class transfer implements Serializable{
		 
		 String tag;
		 List<Integer>datas;
		 
		 
		 
		 
	 } 

//取得後台分析資料

	@SuppressWarnings("rawtypes")
	@GetMapping(value = "video/analysis")
	@ResponseBody
	public Map getAnalysis() {

		try {

			Map analysis = new LinkedHashMap<String, Map>();
			// 類別與觀看數總和
			Map viewByCategory=vs.getViewsByCategory();
			
			List<String>categorys=new ArrayList<String>();
			List<Integer>categoryviews=new ArrayList<Integer>();
			
			Iterator entries = viewByCategory.entrySet().iterator();

			while (entries.hasNext()) {

				Map.Entry entry = (Map.Entry) entries.next();

				String key = (String) entry.getKey();
				categorys.add(key);

				Integer value = (Integer) entry.getValue();
				categoryviews.add(value);
				System.out.println("Key = " + key + ", Value = " + value);
			}
			
			Map<String,List>vbc=new LinkedHashMap<String, List>();
			vbc.put("categorys", categorys);
			vbc.put("categoryviews",categoryviews);
			analysis.put("vbc", vbc);

			
//			analysis.put("category", vs.getViewsByCategory());
			// TOP5熱門影片
			List<Video> list = vs.mostViewVideo();
			Map<String,List> top = new LinkedHashMap<String, List>();
			
//			top.put("category",list.)
			List<String>names=new ArrayList<String>();
			List<Integer>views=new ArrayList<Integer>();
			
			for (int i = 0; i < list.size(); i++) {
				Video v = list.get(i);
				names.add(v.getTitle());
				views.add(v.getViewCount());
				
			}
			top.put("names", names);
			top.put("views", views);

			
			analysis.put("top", top);

			// 上傳日期分佈

			return analysis;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	
	@GetMapping(value = "video/allvideo")
	@ResponseBody
	public List<Video> getallvideo() {

		try {
			return vs.selectAllVideo();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@GetMapping(value = "video/backstage")

	public String backstage(Model model) {

		List<Video> list = vs.mostViewVideo();
		model.addAttribute("videolist", list);
		model.addAttribute("categorys", vs.getAllCategory());
		return "video/videoBackstage";

	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "video/storagectcheck", produces = "application/json")
	public @ResponseBody Map collectcheck(Model model, HttpSession session) {
		List<Integer> list = new ArrayList<>();
		MemberBean member = (MemberBean) session.getAttribute("member");
		List<CollectBean> collection =vs.collection(member.getId()); 
				
		if (collection != null) {
			for (int i = 0; i < collection.size(); i++) {
				list.add(collection.get(i).getVid());
				System.out.println("collect="+collection.get(i).getVid());
			}
		}
		Map map = new HashMap();
		map.put("No", list);
		return map;
	}
	
	@GetMapping(value = "video/storage", produces = "application/json")
	public @ResponseBody boolean collect(Model model, HttpSession session, @RequestParam("mid") Integer mid,
			@RequestParam("vid") Integer vid) {
		List<Integer> list = vs.findcollection(mid);
		
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				if (vid == list.get(i)) {
					int pk = vs.pkcollection(mid, vid);
					ps.delcollection(pk);
					return false;
				}
			}
		}
		vs.addcollection(mid, vid);
		return true;
	}
	

}