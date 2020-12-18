package member.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value={"/member/login"})
		public String login() {
			return "member/login";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}


}
