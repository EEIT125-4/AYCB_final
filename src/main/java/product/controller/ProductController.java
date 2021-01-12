package product.controller;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import comment.model.CommentBean;
import comment.service.CommentService;
import product.model.CollectBean;
import product.model.ProductBean;
import product.service.ProductService;

@Controller
@SessionAttributes("recordlist")
public class ProductController {

	@Autowired
	ProductService ps;
	@Autowired
	CommentService cs;

	/*
	 * K:廣告輪播AJAX取圖
	 */

	@GetMapping("/ads")
	@ResponseBody
	public String getAds() {

		List<ProductBean> products = new ArrayList<ProductBean>();
		products = ps.getAllProducts();

		Gson gson = new Gson();
		String result = gson.toJson(products);
		System.out.println("gson parse:" + result);

		return gson.toJson(products);
	}

	public class PageData implements Serializable {

		private static final long serialVersionUID = 1L;
		int page;
		List<ProductBean> list;

		public int getPageNo() {
			return page;
		}

		public void setPage(int page) {
			this.page = page;
		}

		public List<ProductBean> getList() {
			return list;
		}

		public void setList(List<ProductBean> list) {
			this.list = list;
		}

		public PageData() {
		};

	}

	@GetMapping("/All")
	public String all() {
		return "product/allproducts";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/AllProducts", produces = "application/json")
	public @ResponseBody Map allProducts(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getTotalPages()) {
			pageNo = ps.getTotalPages();
		}
		List<ProductBean> list = ps.getPage(pageNo);

		Map map = new HashMap();
		map.put("Products", list);
		map.put("Pages", String.valueOf(pageNo));
		map.put("TotalPages", ps.getTotalPages());

		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/Brand", produces = "application/json")
	public @ResponseBody Map brand(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "brand", required = false) String brandname) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getBrandTotalPages(brandname)) {
			pageNo = ps.getBrandTotalPages(brandname);
		}
		List<ProductBean> list = ps.getBrandPage(brandname, pageNo);
		List<String> brand = ps.getOneBrand(brandname);

		Map map = new HashMap();
		map.put("Products", list);
		map.put("OneBrand", brand);
		map.put("Pages", String.valueOf(pageNo));
		map.put("TotalPages", ps.getBrandTotalPages(brandname));

		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/Series", produces = "application/json")
	public @ResponseBody Map series(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "series", required = false) String productseries) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getSeriesTotalPages(productseries)) {
			pageNo = ps.getSeriesTotalPages(productseries);
		}
		List<ProductBean> list = ps.getSeriesPage(productseries, pageNo);
		List<String> series = ps.getOneSeries(productseries);

		Map map = new HashMap();
		map.put("Products", list);
		map.put("OneSeries", series);
		map.put("Pages", String.valueOf(pageNo));
		map.put("TotalPages", ps.getSeriesTotalPages(productseries));
		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/Cate", produces = "application/json")
	public @ResponseBody Map cate(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "cate", required = false) String productcategory) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getCateTotalPages(productcategory)) {
			pageNo = ps.getCateTotalPages(productcategory);
		}
		List<ProductBean> list = ps.getCatePage(productcategory, pageNo);
		List<String> cate = ps.getOneCate(productcategory);

		Map map = new HashMap();
		map.put("Products", list);
		map.put("OneCate", cate);
		map.put("Pages", String.valueOf(pageNo));
		map.put("TotalPages", ps.getCateTotalPages(productcategory));
		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/Keyword", produces = "application/json")
	public @ResponseBody Map keyword(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
			@RequestParam(value = "keyword", required = false) String keyword) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getKeywordTotalPages(keyword)) {
			pageNo = ps.getKeywordTotalPages(keyword);
		}
		List<ProductBean> list = ps.getKeywordPage(keyword, pageNo);

		Map map = new HashMap();
		map.put("Products", list);
		map.put("Keyword", keyword);
		map.put("Pages", String.valueOf(pageNo));
		map.put("TotalPages", ps.getKeywordTotalPages(keyword));
		return map;
	}

	@GetMapping("/Detail")
	public ModelAndView detail(Model model, @RequestParam(value = "no", required = false) Integer no,
			@RequestParam(value = "cate", required = false) String cate) {
		ModelAndView mav = new ModelAndView();

		ProductBean detail = ps.getProduct(no);
//		model.addAttribute("Detail", detail);
		mav.addObject("Detail", detail);

		List<ProductBean> racate = ps.racate(cate);
		mav.addObject("racate", racate);

//		List<ProductBean> list = (List<ProductBean>) model.getAttribute("recordlist");
//		list.add(detail);
//		mav.addObject("recordlist", list);

		CommentBean commentBean = new CommentBean();
//		model.addAttribute("leave",commentBean);
		mav.addObject("leave", commentBean);
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
	public @ResponseBody List<String> getSeriesByBrand(@RequestParam("brandname") String brandname) {
		List<String> list = ps.getSeriesByBrand(brandname);
		return list;
	}

	@GetMapping(value = "/GetProductsBySeries", produces = "application/json")
	public @ResponseBody List<ProductBean> getProductsBySeries(@RequestParam("series") String series) {
		List<ProductBean> list = ps.getSeriesProduct(series);
		return list;
	}

	@GetMapping(value = "/GetBrand", produces = "application/json")
	public @ResponseBody List<String> getBrand() {
		List<String> list = ps.getBrand();
		return list;
	}

	@GetMapping(value = "/Collect", produces = "application/json")
	public @ResponseBody boolean collect(
			@RequestParam("mid") Integer mid, 
			@RequestParam("pid") Integer pid
	) {
		System.out.println("MMM " + mid);
		System.out.println("PPP " + pid);
		List<Integer> list = ps.findcollection(mid);
		System.out.println("list " + list);
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				System.out.println("XXX " + list.get(i));
				if (pid == list.get(i)) {
					int pk = ps.pkcollection(mid, pid);
					System.out.println("pk " + pk);
					ps.delcollection(pk);
					return false;
				}
			}
		}
		ps.addcollection(mid, pid);
		return true;
	}
}