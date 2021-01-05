package product.controller;

<<<<<<< HEAD
<<<<<<< HEAD
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
=======
>>>>>>> parent of b635b29... 1/5 Julia
=======
>>>>>>> parent of b635b29... 1/5 Julia
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import product.model.ProductBean;
import product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;
<<<<<<< HEAD
<<<<<<< HEAD
	@Autowired
	CommentService cs;
	
	/*
	 * K:廣告輪播AJAX取圖
	 */
	
	@GetMapping("/ads")
	@ResponseBody
	public String getAds(){
		
		List<ProductBean>products=new ArrayList<ProductBean>();
		products=ps.getAllProducts();
		
		Gson gson=new Gson();
		String result=gson.toJson(products);
		System.out.println("gson parse:"+result);
		
		return gson.toJson(products);

		
	}

	@GetMapping("/AllProducts")
	public String allProducts(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo
=======
=======
>>>>>>> parent of b635b29... 1/5 Julia

	@GetMapping("/AllProducts")
	public String allProducts(Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo
<<<<<<< HEAD
>>>>>>> parent of b635b29... 1/5 Julia
=======
>>>>>>> parent of b635b29... 1/5 Julia
	) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getTotalPages()) {
			pageNo = ps.getTotalPages();
		}
		List<ProductBean> list = ps.getPage(pageNo);
		model.addAttribute("Products", list);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getTotalPages());
		return "product/allproducts";
	}

	@GetMapping("/Brand")
	public String brand(Model model, 
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "brand", required = false) String brandname
	) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getBrandTotalPages(brandname)) {
			pageNo = ps.getBrandTotalPages(brandname);
		}
		List<ProductBean> list = ps.getBrandPage(brandname, pageNo);
		List<String> brand = ps.getOneBrand(brandname);
		model.addAttribute("Products", list);
		model.addAttribute("OneBrand", brand);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getBrandTotalPages(brandname));
		return "product/brandproduct";
	}

	@GetMapping("/Series")
	public String series(Model model,
<<<<<<< HEAD
<<<<<<< HEAD
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
=======
=======
>>>>>>> parent of b635b29... 1/5 Julia
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
>>>>>>> parent of b635b29... 1/5 Julia
			@RequestParam(value = "series", required = false) String productseries
	) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getSeriesTotalPages(productseries)) {
			pageNo = ps.getSeriesTotalPages(productseries);
		}
		List<ProductBean> list = ps.getSeriesPage(productseries, pageNo);
		List<String> series = ps.getOneSeries(productseries);
		model.addAttribute("Products", list);
		model.addAttribute("OneSeries", series);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getSeriesTotalPages(productseries));
		return "product/seriesproduct";
	}

	@GetMapping("/Cate")
	public String cate(Model model, 
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "cate", required = false) String productcategory
	) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getCateTotalPages(productcategory)) {
			pageNo = ps.getCateTotalPages(productcategory);
		}
		List<ProductBean> list = ps.getCatePage(productcategory, pageNo);
		List<String> cate = ps.getOneCate(productcategory);
		model.addAttribute("Products", list);
		model.addAttribute("OneCate", cate);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getCateTotalPages(productcategory));
		return "product/cateproduct";
	}
	
	@GetMapping("/Keyword")
	public String keyword(Model model,
<<<<<<< HEAD
<<<<<<< HEAD
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
=======
=======
>>>>>>> parent of b635b29... 1/5 Julia
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
>>>>>>> parent of b635b29... 1/5 Julia
			@RequestParam(value = "keyword", required = false) String keyword
	) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getKeywordTotalPages(keyword)) {
			pageNo = ps.getKeywordTotalPages(keyword);
		}
		List<ProductBean> list = ps.getKeywordPage(keyword, pageNo);
		model.addAttribute("Products", list);
		model.addAttribute("Keyword", keyword);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getKeywordTotalPages(keyword));
		return "product/keywordproducts";
	}
	
	@GetMapping("/Detail")
<<<<<<< HEAD
<<<<<<< HEAD
	public ModelAndView detail(Model model, 
			@RequestParam(value = "no", required = false) Integer no
	) {
		ModelAndView mav=new ModelAndView();
		
		ProductBean detail = ps.getProduct(no);
//		model.addAttribute("Detail", detail);
		mav.addObject("Detail",detail);
		CommentBean commentBean=new CommentBean();
//		model.addAttribute("leave",commentBean);
		mav.addObject("leave",commentBean);
		mav.setViewName("product/detail");
		return mav;
	}
	
/*
 * Kevin:for ajax response
 */
	@PostMapping("/Detail")
	@ResponseBody
	public String leaveComment(Model model, @ModelAttribute("leave") CommentBean cb) {

		System.out.println("comment:" + cb);
		// JAVA的Date轉SQL的Date
		Timestamp time = new Timestamp(new Date().getTime());
//		
		cb.setCommentTime(time);
		cs.insertComment(cb);
		List<CommentBean> list = cs.selectAll();
		model.addAttribute("comments", list);
	
		return "OK";
	}
	
	
	
	@GetMapping(value = "/GetSeriesByBrand", produces = "application/json")
	public @ResponseBody List<String> getSeriesByBrand(
			@RequestParam("brandname") String brandname
	){
		List<String> list = ps.getSeriesByBrand(brandname);
		return list;
	}
	
	@GetMapping(value = "/GetProductsBySeries", produces = "application/json")
	public @ResponseBody List<ProductBean> getProductsBySeries(
			@RequestParam("series") String series
	){
		List<ProductBean> list = ps.getSeriesProduct(series);
		return list;
	}
	
	@GetMapping(value = "/GetBrand", produces = "application/json")
	public @ResponseBody List<String> getBrand(){
		List<String> list = ps.getBrand();
		return list;
	}
}
=======
	public String detail(Model model, 
			@RequestParam(value = "no", required = false) Integer no
	) {
		ProductBean detail = ps.getProduct(no);
		model.addAttribute("Detail", detail);
		return "product/detail";
	}
}
>>>>>>> parent of b635b29... 1/5 Julia
=======
	public String detail(Model model, 
			@RequestParam(value = "no", required = false) Integer no
	) {
		ProductBean detail = ps.getProduct(no);
		model.addAttribute("Detail", detail);
		return "product/detail";
	}
}
>>>>>>> parent of b635b29... 1/5 Julia
