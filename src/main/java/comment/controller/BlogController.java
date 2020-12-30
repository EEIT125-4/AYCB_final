package comment.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comment.model.Blog;
import comment.service.BlogService;
import event.validator.EventValidator;

@Controller
public class BlogController {

	@Autowired
	ServletContext servletContext;
	

	@Autowired
	BlogService blogService;

	//選擇所有留言資料顯現出來(select all)
	@GetMapping("comment/blog")
	public String getAll(Model model) {
		
			
			List<Blog> bg = blogService.selectAllBlog();
			model.addAttribute("blog", bg);
			
			for(Blog b:bg) {
				
				System.out.println("blog:"+b);
			}
			return "comment/blog";
	}

		//空白的表格
	@GetMapping("blog/empty")
	public String showEmptyForm(Model model) {
		Blog bg = new Blog();
		model.addAttribute("blog", bg);
		return "comment/blogForm";
	}

	//新增一筆部落格文章
	@PostMapping("blog/empty")
	public String add(@ModelAttribute("blog") Blog blog, Model model,
			HttpServletRequest request,
			@RequestParam(value = "commentTime", required = false) Date commentTime,
			@RequestParam(value = "status", required = false) Integer status,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "blogId", required = false) Integer blogId,
			@RequestParam(value = "confirmupdate", required = false) String confirmupdate
			){
				System.out.println("into blogForm");
				try {
				// JAVA的Date轉SQL的Date
				Timestamp time = new Timestamp(new Date().getTime());
				java.sql.Date sqlDate = new java.sql.Date(time.getTime());
				// SQL的Date轉JAVA的Date
				java.util.Date utilDate = new java.util.Date();
				utilDate.setTime(sqlDate.getTime());
				blog.setCommentTime(sqlDate);
				blogService.insertBlog(blog);
			} catch (Exception ex) {
				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
				return "comment/blogForm";
			}
			return "comment/blog";
	}
	
	// 選擇一筆需要更新的部落格文章
	@GetMapping(value = "comment/${Blog.aid}")
	public String showDataForm(@PathVariable("blogId") Integer blogId, Model model) {
		Blog blog = blogService.selectUpdateBlog(blogId);
		model.addAttribute(blog);
		return "comment/blogUpdate";
	}

	//更新一篇部落格文章
	@PostMapping(value = "comment/${Blog.id}")
	public String modify(@ModelAttribute("blog") Blog blog, BindingResult result, Model model,
			@PathVariable Integer id, HttpServletRequest request) {
		EventValidator validator = new EventValidator();
		validator.validate(blog, result);
		if (result.hasErrors()) {
			System.out.println("result hasErrors(), blog=" + blog);
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			return "comment/blogForm";
		}
		blogService.updateBlog(blog);
		return "redirect:comment/blog";
	}

	//刪除一篇文章
	@DeleteMapping(value = "comment/${Blog.id}")
	public String delete(@PathVariable("id") Integer id) {
		blogService.deleteBlog(id);
		return "redirect:comment/blog";
	}

}
