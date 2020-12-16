package comment.controller;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CommentController {
	
		@Autowired
		ServletContext servletContext;
		
		@RequestMapping(value={"/comment/"})
		public String home() {
			return "/comment/displayBoard";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}
		
		
		
		@RequestMapping(value={"/comment/article"})
		public String article() {
			return "comment/article";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}
		
		@RequestMapping(value={"/comment/videoList"})
		public String videoList() {
			return "comment/videoList";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}


}


