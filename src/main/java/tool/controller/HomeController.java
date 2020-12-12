package tool.controller;

import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


@Controller
public class HomeController {
	
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value={"/","/Home"})
		public String home() {
			return "index";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}

//		@RequestMapping("/Home")
//		public String home() {
//			return "index";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
//		}

}
