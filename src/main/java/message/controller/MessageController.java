package message.controller;

import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


@Controller
public class MessageController {
	
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value={"/message/"})
		public String home() {
			return "message/test";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}


}
