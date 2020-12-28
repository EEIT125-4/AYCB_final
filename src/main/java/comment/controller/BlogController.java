package comment.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import comment.model.Blog;
import comment.service.BlogService;
import event.validator.EventValidator;

@Controller
//@RequestMapping("/blog")
public class BlogController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	BlogService blogService;

	//選擇所有留言資料顯現出來(select all)
	@GetMapping("comment/blog")
	public String getAll(Model model) {
			System.out.println("blog all");
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
		model.addAttribute("dis_board", bg);

		return "comment/blogForm";
	}

	//新增照片
	@PostMapping("/blogForm")
	public String add(@ModelAttribute("blog") Blog blog, BindingResult result, Model model,
			HttpServletRequest request) {
		EventValidator validator = new EventValidator();
		validator.validate(blog, result);
		if (result.hasErrors()) {
			return "comment/blogForm";
		}
		MultipartFile img = blog.getPic();
		String originalFilename = img.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			blog.setTitle(originalFilename);
		} // 建立Blob物件，交由 Hibernate 寫入資料庫
		if (img != null && !img.isEmpty()) {
			try {
				byte[] b = img.getBytes();
				Blob blob = new SerialBlob(b);
				blog.setPicture(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		try {
			blogService.insertBlog(blog);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			// result.rejectValue("account", "", "帳號已存在，請重新輸入");
			return "comment/blogForm";
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("account", "", "請通知系統人員...");
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

	@DeleteMapping(value = "comment/${Blog.id}")
	public String delete(@PathVariable("id") Integer id) {
		blogService.deleteBlog(id);
		return "redirect:comment/blog";
	}

}
