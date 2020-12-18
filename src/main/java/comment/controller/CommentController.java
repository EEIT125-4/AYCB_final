package comment.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
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

@SessionAttributes({ "comment", "dis_board" })
@Controller

public class CommentController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	CommentService commentService;

	@GetMapping("/comment/")
	public String home() {
		return "comment/displayBoard"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}

	@PostMapping("comment/CommentController")
	public String steps(
			Model model,
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
			@RequestParam(value = "commentId", required = false) Integer commentId

	) {
		System.out.println("update~~~:"+update);
		System.out.println("confirmupdate:"+confirmupdate);
		System.out.println("delete"+delete);
//送出一筆留言(insert)
		
		if (submit != null) {
			// JAVA的Date轉SQL的Date
			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			// SQL的Date轉JAVA的Date
			java.util.Date utilDate = new java.util.Date();
			utilDate.setTime(sqlDate.getTime());
			String commentTime = String.valueOf(utilDate);
//			CommentBean comment = commentService.selectInsertitem(commentId);
			Random rnd=new Random();
			int index=rnd.nextInt();
			CommentBean comment = new CommentBean(index, null, name, gender, age, status, commentTime, content);
			model.addAttribute("comment", comment);
			return "comment/displayTest";
		}
//insert的確認送出的留言
		if (confirm != null) {
			System.out.println("comment confirm");
//			System.out.println("comment memberId:"+id);
			// JAVA的Date轉SQL的Date
			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			// SQL的Date轉JAVA的Date
			java.util.Date utilDate = new java.util.Date();
			utilDate.setTime(sqlDate.getTime());
			
			String commentTime = String.valueOf(utilDate);
			CommentBean comment = new CommentBean(1111, null, name, gender, age, status, commentTime, content);
//			model.addAttribute("comment", comment);
			try {
				System.out.println("一筆資料"+comment);
				System.out.println("comment:"+comment.getName());
				
				commentService.insertComment(comment);
				List<CommentBean> cb = commentService.selectAll();
				model.addAttribute("dis_board", cb);
				return "comment/select";
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
			commentService.deleteComment(commentId);

			try {
				List<CommentBean> cb = commentService.selectAll();
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
			CommentBean Result = commentService.selectUpdateitem(commentId);
			System.out.println("update page" + Result);

			model.addAttribute("Result", Result);
			return "comment/commentUpdate";
		}
//update的確認更新
		if (confirmupdate != null) {
			System.out.println("confirmupdate:" + confirmupdate);
			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			java.util.Date utilDate = new java.util.Date();
			utilDate.setTime(sqlDate.getTime());
			String commentTime = String.valueOf(utilDate);
			System.out.println("commentTime:"+commentTime);
			System.out.println("confirmUpdate commentbean");
			CommentBean bean = new CommentBean(id, commentId, name, gender, age, status, commentTime, content);
			try {
				commentService.updateComment(bean);
				System.out.println("updateComment"+bean);
				List<CommentBean> cb = commentService.selectAll();
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
			List<CommentBean> cb = commentService.selectAll();
			model.addAttribute("dis_board", cb);
			return "comment/select";
		}
		return "comment/select";

	}

//選擇所有留言資料顯現出來(select all)
	@GetMapping("/comment/select")
	public String getAll(Model model) {

		List<CommentBean> cb = commentService.selectAll();
		model.addAttribute("dis_board", cb);
		return "comment/select";

	}

	@RequestMapping("/comment/article")
	public String gotoArticle(Model model) {
		return "comment/article";
	}

	@RequestMapping("/comment/videoList")
	public String gotoVideoList(Model model) {
		return "comment/videoList";
	}

}
