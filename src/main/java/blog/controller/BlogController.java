package blog.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import blog.model.Blog;
import blog.service.BlogService;
import event.validator.EventValidator;
import member.Service.MemberService;
import tool.model.Image;
import tool.service.ImageService;

@Controller
public class BlogController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	ImageService imgService;

	@Autowired
	BlogService blogService;

	@Autowired
	MemberService memberService;

	// 選擇所有留言資料顯現出來(select all)
	@GetMapping("/blog")
	public String getAll(Model model) {

		List<Blog> bg = blogService.selectAllBlog();
		model.addAttribute("blog", bg);

		for (Blog b : bg) {

			System.out.println("blog:" + b);
		}
		return "blog/blog";
	}

	// 空白的表格
	@GetMapping("blog/edit")
	public String showEmptyForm(Model model) {
		Blog bg = new Blog();

		model.addAttribute("blog", bg);
		return "blog/blogForm";
	}

	// 新增一筆部落格文章
	@PostMapping("blog/edit")
	public String add(@ModelAttribute("blog") Blog blog, Model model, @RequestParam(value = "memberID") Integer mid,
			@RequestParam(value = "file") MultipartFile file

	) {
		System.out.println("into blogForm");
		try {
			// JAVA的Date轉SQL的Date
			Timestamp time = new Timestamp(new Date().getTime());
			java.sql.Date sqlDate = new java.sql.Date(time.getTime());

			// 上傳封面圖
			if (file != null && file.getSize() > 0) {
				System.out.println("有收到圖片");
				Image img = null;

				try {
					if (blog.getPicture() != null && blog.getPicture() > 0) {
						img = imgService.getImage(blog.getPicture());
						System.out.println("old圖片ID:" + img.getImgid());
					} else {
						System.out.println("沒有舊圖片");
						img = new Image(file);
					}
					// 更新圖片名稱
					img.setImage(file);
					// 更新圖片內容
					imgService.saveImage(img);
					blog.setPicture(img.getImgid());
					System.out.println("圖片儲存完畢,id=" + img.getImgid() + ",filename=" + img.getFilename());

				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
				}
			} else {
				System.out.println("沒有上傳圖片");
			}

			if (blog.getCommentTime() == null) {
				blog.setCommentTime(sqlDate);
				blog.setViews(0);
				blog.setThumbs(0);

			}

			blog.setMember(memberService.getMember(mid));
			blogService.insertBlog(blog);
			return getAll(model);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			return "blog/blogForm";
		}

	}

	// 選擇一筆部落格文章
	@GetMapping(value = "blog/{blogId}")
	public ModelAndView showDataForm(@PathVariable("blogId") Integer blogId) {
		ModelAndView mav = new ModelAndView();

		Blog blog = blogService.selectBlog(blogId);
		blog.setViews(blog.getViews() + 1);
		blogService.updateBlog(blog);
		mav.addObject("blog", blog);
		mav.setViewName("blog/blogContent");

		return mav;
	}
	
	
	// 編輯部落格
		@GetMapping("blog/edit/{blogid}")
		public String editBlog(@PathVariable("blogid") Integer blogid,Model model) {
			Blog bg = blogService.selectBlog(blogid);

			model.addAttribute("blog", bg);
			return "blog/blogForm";
		}

//	// 更新一篇部落格文章
//	@PostMapping(value = "blog/edit/{blogid}")
//	
//	public String modify(
//			@ModelAttribute("blog") Blog blog,
//			Model model,
//			@PathVariable Integer blogid,
//			@RequestParam(value = "memberID") Integer mid,
//			@RequestParam(value = "file") MultipartFile file) {
//		
//		
//		// JAVA的Date轉SQL的Date
//					Timestamp time = new Timestamp(new Date().getTime());
//					java.sql.Date sqlDate = new java.sql.Date(time.getTime());
//			
//		try {		
//			// 封面圖更新
//			if (file != null && file.getSize() > 0) {
//				System.out.println("有收到圖片");
//				Image img = null;
//
//				try {
//					if (blog.getPicture() != null && blog.getPicture() > 0) {
//						img = imgService.getImage(blog.getPicture());
//						System.out.println("old圖片ID:" + img.getImgid());
//					} else {
//						System.out.println("沒有舊圖片");
//						img = new Image(file);
//					}
//					// 更新圖片名稱
//					img.setImage(file);
//					// 更新圖片內容
//					imgService.saveImage(img);
//					blog.setPicture(img.getImgid());
//					System.out.println("圖片儲存完畢,id=" + img.getImgid() + ",filename=" + img.getFilename());
//
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
//				}
//			} else {
//				System.out.println("沒有上傳圖片");
//			}
//
//			if (blog.getCommentTime() == null) {
//				blog.setCommentTime(sqlDate);
//				blog.setViews(0);
//				blog.setThumbs(0);
//
//			}
//
//			blog.setMember(memberService.getMember(mid));
//			blogService.insertBlog(blog);
//			return getAll(model);
//		} catch (Exception ex) {
//			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
//			return "blog/blogForm";
//		}
//
//	}
//	
//		blogService.updateBlog(blog);
//		return "redirect:blog/blog";
//	}
	
	

		
	

	// 刪除一篇文章
	@DeleteMapping(value = "blog/{blogid}")
	public String delete(@PathVariable("blogid") Integer blogid) {
		blogService.deleteBlog(blogid);
		return "redirect:blog/blog";
	}

}
