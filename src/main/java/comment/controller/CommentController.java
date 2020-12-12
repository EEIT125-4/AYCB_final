package comment.controller;

import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


@Controller
public class CommentController {
	
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value={"/comment/"})
		public String home() {
			return "/comment/displayBoard";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}


}
