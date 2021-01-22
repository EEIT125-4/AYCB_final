package blog.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import blog.model.Blog;
import blog.service.BlogService;
import member.MemberBean;
import member.Service.MemberService;
import tool.model.Image;
import tool.service.ImageService;

@Controller
@SessionAttributes({"blog"})
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

	// 搜尋欄select search bar
		@GetMapping("/SelectSearchBar")
		public String selectSearchBar(Model model, 
				HttpSession session,
				@RequestParam(value = "search",required = false) String search,
				@RequestParam(value = "mask" ,required = false) String mask,
				@RequestParam(value = "iso",required = false) String iso,
				@RequestParam(value = "serum",required = false) String serum,
				@RequestParam(value = "you",required = false) String you,
				@RequestParam(value = "bio",required = false) String bio,
				@RequestParam(value = "olay",required = false) String olay,
				@RequestParam(value = "origin",required = false) String origin,
				@RequestParam(value = "dr",required = false) String dr,
				@RequestParam(value = "moist",required = false) String moist,
				@RequestParam(value = "care",required = false) String care,
				@RequestParam(value = "skin",required = false) String skin

				) {
			String va= null;
			if(search!=null) {
				va=search;
			} else if (mask!=null) {
				va=mask;
			} else if(iso!=null) {
				va=iso;
			} else if(serum!=null) {
				va=serum;
			}else if(you!=null) {
				va=you;
			}else if(bio!=null) {
				va=bio;
			}else if(olay!=null) {
				va=olay;
			}else if(origin!=null) {
				va=origin;
			}else if(dr!=null) {
				va=dr;
			}else if(moist!=null) {
				va=moist;
			}else if(care!=null) {
				va=care;
			}else if(skin!=null) {
				va=skin;
			}
			System.out.println("+++++++++++++++++++++++++");
			System.out.println(search);
			System.out.println("SelectSearchBar");
			List<Blog> bg = blogService.selectArticle(va);
			session.setAttribute("bgsearch", bg);
//			model.addAttribute("bgsearch", bg);
			return "blog/BlogSearch";
		}
	
//		// 搜尋欄select various button
//				@GetMapping("/SelectVariousButton")
//				public String selectVariousButton(Model model, 
//						HttpSession session,
//						@RequestParam(value = "various") String various) {
//					System.out.println("SelectVariousButton");
//					List<Blog> bg = blogService.selectArticle(various);
//					session.setAttribute("bgsearch", bg);
////					model.addAttribute("bgsearch", bg);
//					return "blog/BlogSearch";
//				}
		
	// 新增一筆部落格文章
	@PostMapping("blog/edit")
	public String add(@ModelAttribute("blog") Blog blog, Model model,
			@RequestParam(value = "memberID") Integer mid,
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
			try {
				blogService.insertBlog(blog);
				System.out.println("新增blog成功");
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("新增blog");
				// TODO: handle exception
			}
			
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
		public String editBlog(@PathVariable("blogid") Integer blogid,ModelMap model) {
			Blog bg = blogService.selectBlog(blogid);

			model.addAttribute("blog", bg);
			return "blog/blogForm";
		}

	// 更新一篇部落格文章
	@PostMapping(value = "blog/edit/{blogid}")
	
	public String modify(
			@ModelAttribute("blog") Blog blog,
			Model model,
//			@PathVariable Integer blogid,
//			@RequestParam(value = "memberID") Integer mid,
			@RequestParam(value = "file") MultipartFile file) {
		
		System.out.println("檢查ModelAttribute:"+blog);
		
		
		try {		
			// 封面圖更新
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

			Timestamp time = new Timestamp(new Date().getTime());
			
			if (blog.getCommentTime() != null) {
				// JAVA的Date轉SQL的Date
				
				blog.setFixedtime(time);
				
			}else {
				blog.setCommentTime(time);
				
			}
			blogService.updateBlog(blog);
			return getAll(model);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			return "blog/blogForm";
		}

	}
	

	
	
	@GetMapping(value="blog/adjust/")
	@ResponseBody
	public boolean adjustable(
			@RequestParam(value="blogId")Integer blogId,
			@RequestParam(value="state")String state)
	{
		System.out.println("修改部落格狀態");
		try {
			Blog blog=blogService.selectBlog(blogId);
			blog.setStatus(state);
			blogService.updateBlog(blog);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
		
		
	}
	
	//取得後台分析資料
	
	@SuppressWarnings("rawtypes")
	@GetMapping(value="blog/analysis")
	@ResponseBody
	public Map getAnalysis() {
		

		Map analysis=new HashMap();
		
		
		
		
		return analysis;
		
		
		
		
	}
	
	

	//假刪除功能
	@GetMapping(value = "blog/delete/{blogId}")
//	@ResponseBody
	public String hideBlog(@PathVariable("blogId") Integer blogId,Model model) {
		Blog bg=blogService.selectBlog(blogId);
		bg.setStatus(Blog.STATUS[3]);
		blogService.updateBlog(bg);
		return getAll(model);
		
	}
	
	@GetMapping(value="blog/backstage")
	
	
	public String backstage(Model model,HttpSession session) {
		MemberBean member=(MemberBean)session.getAttribute("member");
		if(member!=null && member.getLevel()==999) {
			List<Blog>blogs=new ArrayList<Blog>();
			blogs=blogService.selectAllBlog();
			model.addAttribute("blogs", blogs);
			List<String>titles=new ArrayList<String>();
			List<String>views=new ArrayList<String>();
			List<String>blogJson=new ArrayList<String>();
			Gson gson=new Gson();
			for(Blog b:blogs) {
				
				titles.add(gson.toJson(b.getTitle()));
				views.add(gson.toJson(b.getViews()));
				blogJson.add(gson.toJson(b));
			}
			model.addAttribute("titles",titles);
			model.addAttribute("views",views);
			model.addAttribute("blogJson",blogJson);
			
			return "blog/blogBackstage";
			
		}else {
			
			return "redirect:"+"/member/login";
		}
	
		
		
	}
	
//	@GetMapping(value="blog/getTitle")
//	public String getTitle(Model model) {
//		List<String>titles=new ArrayList<String>();
//		
//		blogs=blogService.selectAllBlog();
//		model.addAttribute("blogs", blogs);
//		return "blog/blogBackstage";
//		
//	}
	

	// 刪除一篇文章
	@PostMapping(value = "blog/delete/{blogid}")
	@ResponseBody
	public boolean delete(@PathVariable("blogid") Integer blogid) {
		
		System.out.println("嘗試刪除blog");
		try {
			blogService.deleteBlog(blogid);
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
		
	}

}
