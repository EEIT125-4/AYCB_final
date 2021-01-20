package comment.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import comment.model.CommentBean;
import comment.service.CommentService;
import member.Service.MemberService;

@SessionAttributes({ "comment","commentList" })
@Controller
public class CommentController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	MemberService memberService;

	@Autowired
	CommentService commentService;

//	@GetMapping("/comment/")
//	public String home(Model model) {
//		model.addAttribute("member");
//		return "comment/displayBoard"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
//	}

	@PostMapping("/leaveComment")
	@ResponseBody
	public boolean leaveComment(
			@RequestParam(value = "comment")String s,
			@RequestParam(value="memberid")Integer memberid,
			@RequestParam(value="key")Integer key,
			@RequestParam(value="type")String type
	)
	{//Model model, @ModelAttribute("comment") CommentBean cb
		System.out.println("leaving comment");
		try {
			
			System.out.println("mb id="+memberid);
			System.out.println("key="+key);
			System.out.println("type="+type);
			
		
			CommentBean cb=new CommentBean();
			Timestamp time = new Timestamp(new Date().getTime());
			cb.setMember(memberService.getMember(memberid));
			cb.setType(type);
			cb.setKeynumber(String.valueOf(key));
			cb.setCommentTime(time);
			cb.setContentBox(s);
			System.out.println("cb now:" + cb);
			commentService.insertComment(cb);
			System.out.println("留言成功:"+cb);
			return true;
			
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	@PostMapping("/loadComment")
	@ResponseBody
	public Map loadComment(

			@RequestParam(value="type")String type,
			@RequestParam(value="key")String key						
			) {
		System.out.printf("查尋條件 type=%s,key=%s",type,key);
		
		Map results=new HashMap();
		//查詢特定類別的留言
		List<CommentBean>comments=commentService.queryComment(type, key);
		
		results.put("comments", comments);
		List<CommentBean>replys=new ArrayList<CommentBean>();
		for(CommentBean cb:comments) {
			replys.addAll(commentService.queryComment("comment", String.valueOf(cb.getCommentId())));
			
			
				
			}
		for(CommentBean c:replys) {
			System.out.println("check:"+c.getContentBox());
			results.put("replys", replys);
			
			
			
		}
		

		return results;
		
	}
	
	/**
	 * 載入
	 * @param type
	 * @param key
	 * @return
	 */
	@GetMapping("/loadReply")
	@ResponseBody
	public List<CommentBean> loadReply(

			@RequestParam(value="type")String type,
			@RequestParam(value="key")String key						
			) {
		System.out.printf("查尋回覆 type=%s,key=%s",type,key);
		
		return commentService.queryComment(type, key);
		
	}
	
	
	@PostMapping("/deleteComment")
	@ResponseBody
	public boolean editComment(@RequestParam(value="commentId")Integer commentId) {
		try {
		System.out.println("delete comment");
		
		
		
		commentService.deleteComment(commentId);
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	
	}
	



}
