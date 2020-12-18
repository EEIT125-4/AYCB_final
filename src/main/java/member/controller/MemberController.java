package member.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberBean;
import member.Service.MemberService;


@Controller
public class MemberController {
	
		@Autowired
		MemberService ms;
		
		@RequestMapping(value={"/member/login"})
		
		public String login(HttpSession session) {
			MemberBean mb=ms.getMember("jjj");
			
			session.setAttribute("member",mb);
			
			
			return "/Home";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}


}
