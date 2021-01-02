package comment.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import comment.model.CommentBean;
import comment.service.CommentService;
import member.MemberBean;

@SessionAttributes({ "comment", "dis_board", "member" })
@Controller
public class CommentController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	CommentService commentService;


//		@GetMapping("comment/empty")
//		public String showEmptyForm(Model model) {
//			Blog bg = new Blog();
//			model.addAttribute("blog", bg);
//			return "comment/blogForm";
//		}
//	
	//空白的表格
	@GetMapping("comment/")
	public String home(Model model) {
		System.out.println("in comment");
		CommentBean comment=new CommentBean();
		model.addAttribute("comment",comment);

		return "comment/commentBoard";
	}
	
	@PostMapping("comment/CommentController")
	public String steps(Model model, HttpSession session,
			@RequestParam(value = "submit", required = false) String submit,
			@RequestParam(value = "confirm", required = false) String confirm,
			@RequestParam(value = "delete", required = false) String delete,
			@RequestParam(value = "update", required = false) String update,
			@RequestParam(value = "confirmupdate", required = false) String confirmupdate,
			@RequestParam(value = "cheat", required = false) String cheat,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "age", required = false) Integer age,
			@RequestParam(value = "status", required = false, defaultValue = "0") Integer status,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "commentId", required = false) Integer commentId,
			@RequestParam(value = "keynumber", required = false) String keynumber,
			@RequestParam(value = "type", required = false) String type

	) {
		System.out.println("update~~~:" + update);
		System.out.println("confirmupdate:" + confirmupdate);
		System.out.println("delete" + delete);
//送出一筆留言(insert)

		if (submit != null) {
			CommentBean comment = new CommentBean(null, (MemberBean) session.getAttribute("member"), null, content,
					status, keynumber, type);
			model.addAttribute("comment", comment);
			return "comment/commentConfirm";
		}
//insert的確認送出的留言
		if (confirm != null) {
			
			System.out.println("comment confirm");
			// JAVA的Date轉SQL的Date
			Timestamp time = new Timestamp(new Date().getTime());
			java.sql.Date sqlDate = new java.sql.Date(time.getTime());
			// SQL的Date轉JAVA的Date
			java.util.Date utilDate = new java.util.Date();
			utilDate.setTime(sqlDate.getTime());
			CommentBean comment = new CommentBean(
					commentId,
					(MemberBean) session.getAttribute("member"),
					time,
					content,
					status,
					keynumber, 
					type);

			try {
				System.out.println("一筆資料" + comment);
				System.out.println("comment:" + comment.getMember().getName());

				commentService.insertComment(comment);
				List<CommentBean> cb = commentService.selectAll();
				model.addAttribute("dis_board", cb);
				return "/comment/commentSelectAll";
			} catch (Exception e) {
				return "comment/CommentCancel";
			}
		}

//刪除一筆留言
		if (delete != null) {

			System.out.println("delete id:" + commentId);
			System.out.println("deleteComment");
			commentService.deleteComment(commentId);

			try {
				List<CommentBean> cb = commentService.selectAll();
				model.addAttribute("dis_board", cb);
				if (cheat != null && cheat.equals("cheat")) {
					return "comment/commentSelectAll";
				} else {
					return "comment/commentSelectAll";
				}

			} catch (Exception e) {
				System.out.println("error");
				e.printStackTrace();
			}
		}
//按下更新鍵,到另一個頁面去做修改
		if (update != null) {
			System.out.println("commentID:"+commentId);
			
			CommentBean comment = commentService.selectUpdateitem(commentId);
			System.out.println("comment"+comment);
			System.out.println("update page" + comment);
			model.addAttribute("comment", comment);
			return "comment/commentUpdate";
		}
//update的確認更新
		if (confirmupdate != null) {
			System.out.println("confirmupdate:" + confirmupdate);
//			java.util.Date now = new java.util.Date();
			Timestamp time = new Timestamp(new Date().getTime());
			java.sql.Date sqlDate = new java.sql.Date(time.getTime());
			java.util.Date utilDate = new java.util.Date();
			utilDate.setTime(sqlDate.getTime());
//			String commentTime = String.valueOf(utilDate);
			CommentBean comment = new CommentBean(
					commentId,
					(MemberBean) session.getAttribute("member"),
					time,
					content,
					status,
					keynumber,
					type);
			try {
				commentService.updateComment(comment);
				System.out.println("updateComment" + comment);
				List<CommentBean> cb = commentService.selectAll();
				model.addAttribute("dis_board", cb);
				if (cheat != null && cheat.equals("cheat")) {
					return "comment/commentSelectAll";
				} else {
					return "comment/commentSelectAll";
				}
			} catch (Exception e) {
				System.out.println("error");

				e.printStackTrace();
			}

		}
		if (category != null) {
			List<CommentBean> cb = commentService.selectAll();
			model.addAttribute("dis_board", cb);
			return "comment/commentSelectAll";
		}
		return "comment/commentSelectAll";

	}

//選擇所有留言資料顯現出來(select all)
	@GetMapping("/comment/select")
	public String getAll(Model model) {
		List<CommentBean> cb = commentService.selectAll();
		model.addAttribute("dis_board", cb);
		return "comment/commentSelectAll";
	}

//controller控制跳轉頁面	
	@RequestMapping("/comment/article")
	public String gotoArticle(Model model) {
		return "comment/article";
	}

	@RequestMapping("/video")
	public String gotoVideo(Model model) {
		return "comment/video";
	}

	@RequestMapping("/blog")
	public String gotoBlog(Model model) {
		return "comment/blog";
	}


}
