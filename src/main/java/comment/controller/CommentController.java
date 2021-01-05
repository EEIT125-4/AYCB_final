package comment.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import comment.model.CommentBean;
import comment.service.CommentService;
import member.MemberBean;
import member.Service.MemberService;

@SessionAttributes({ "comment", "dis_board", "member" })
@Controller
public class CommentController {

	@Autowired
	ServletContext context;
	@Autowired
	MemberService ms;

	@Autowired
	CommentService cs;

	@GetMapping("/comment/")
	public String home(Model model) {
		model.addAttribute("member");
		return "comment/displayBoard"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}
	
	@PostMapping("/leaveComment")
	@ResponseBody
	public String leaveComment(
			Model model,
			@RequestParam("mid")Integer mid,
			@ModelAttribute("leave")CommentBean cb) {
		
		
		System.out.println("leaving comment");
		MemberBean mb=ms.getMember(mid);
		Timestamp time = new Timestamp(new Date().getTime());
		
		cb.setMember(mb);
		cb.setCommentTime(time);
		
		System.out.println("cb now:"+cb);
		cs.insertComment(cb);
		
		return "OK";
		

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
			return "comment/displayTest";
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
//			Timestamp commentTime = String.valueOf(utilDate);
			CommentBean comment = new CommentBean(
					commentId,
					(MemberBean) session.getAttribute("member"),
					time,
					content,
					status,
					keynumber, 
					type);

//			model.addAttribute("comment", comment);
			try {
				System.out.println("一筆資料" + comment);
				System.out.println("comment:" + comment.getMember().getName());

				cs.insertComment(comment);
				List<CommentBean> cb = cs.selectAll();
				model.addAttribute("dis_board", cb);
				return "/comment/select";
				// request.getRequestDispatcher("CommentThanks.jsp").forward(request, response);
				// response.sendRedirect(request.getContextPath() + "/CommentThanks.jsp");
			} catch (Exception e) {
				return "comment/CommentCancel";
			}
		}

//刪除一筆留言
		if (delete != null) {

			System.out.println("delete id:" + commentId);
			System.out.println("deleteComment");
			cs.deleteComment(commentId);

			try {
				List<CommentBean> cb = cs.selectAll();
				model.addAttribute("dis_board", cb);
				if (cheat != null && cheat.equals("cheat")) {
					return "comment/select";
				} else {
					return "comment/select";
				}

			} catch (Exception e) {
				System.out.println("error");
				e.printStackTrace();
			}
		}
//按下更新鍵,到另一個頁面去做修改
		if (update != null) {
			System.out.println("commentID:"+commentId);
			
			CommentBean comment = cs.selectUpdateitem(commentId);
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
				cs.updateComment(comment);
				System.out.println("updateComment" + comment);
				List<CommentBean> cb = cs.selectAll();
				model.addAttribute("dis_board", cb);
				if (cheat != null && cheat.equals("cheat")) {
					return "comment/select";
				} else {
					return "comment/select";
				}
			} catch (Exception e) {
				System.out.println("error");

				e.printStackTrace();
			}

		}
		if (category != null) {
			List<CommentBean> cb = cs.selectAll();
			model.addAttribute("dis_board", cb);
			return "comment/select";
		}
		return "comment/select";

	}

//選擇所有留言資料顯現出來(select all)
	@GetMapping("/comment/select")
	public String getAll(Model model) {
		List<CommentBean> cb = cs.selectAll();
		model.addAttribute("dis_board", cb);
		return "comment/select";
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

	


}
