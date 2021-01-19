package comment.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import comment.model.CommentBean;
import comment.service.CommentService;
import member.MemberBean;
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

//留言板練習用	
	@GetMapping("/comment")
	public String home(Model model) {
		model.addAttribute("member");
		return "comment/displayBoard"; 
	}

	@PostMapping("/leaveComment")
	@ResponseBody
	public Map<String, Object> leaveComment(
			@RequestParam(value ="comment" ,required = false)String s,
			@RequestParam(value="memberid" ,required = false)Integer memberid,
			@RequestParam(value="key" ,required = false)Integer key,
			@RequestParam(value="type",required = false)String type
	)
	{//Model model, @ModelAttribute("comment") CommentBean cb
		System.out.println("leaving comment");
		try {
			
			System.out.println("mb id="+memberid);
			System.out.println("key="+key);
			System.out.println("type="+type);
			
		
			CommentBean cb=new CommentBean();
			MemberBean member=memberService.getMember(memberid);
			Timestamp time = new Timestamp(new Date().getTime());
			DateFormat df = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss");
//	        Timestamp sqlDate = new Timestamp(utilDate.getTime());//uilt date轉sql date

			cb.setMember(memberService.getMember(memberid));
			cb.setType(type);
			cb.setKeynumber(String.valueOf(key));
			cb.setCommentTime(time);
			cb.setContentBox(s);
			System.out.println("cb now:" + cb);
			commentService.insertComment(cb);
			Map<String, Object> data = new HashMap<>();
			data.put("membername", cb.getMember().getName());
			data.put("CommentTime", cb.getCommentTime());
			data.put("ContentBox", (Timestamp.valueOf(cb.getContentBox())));
			data.put("imageId", "/AYCB_final/pic/"+member.getIconid());
			System.out.println("留言成功:"+cb);
			return data;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
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
		
		

//		for(CommentBean c:replys) {
//			System.out.println("check:"+c.getContentBox());
//			
//		}
//		results.put("reply"+cb.getCommentId(),replys);

	
//	}
//	List<CommentBean>replyTest=(List<CommentBean>)results.get("reply48");
//	
//	for(CommentBean cBean:replyTest) {
//		System.out.println("48號:"+cBean.getContentBox());
//	}
		
		
//		
		
//		List<CommentBean>comments=commentService.queryComment(type, key);
		
//		return commentService.queryComment(type, key);
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
	
//新增留言


}
