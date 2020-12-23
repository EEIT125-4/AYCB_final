package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;

	@GetMapping("/AllProducts")
	public String allProducts(Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo
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
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
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
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
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
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
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
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo,
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
	public String detail(Model model, 
			@RequestParam(value = "no", required = false) Integer no
	) {
		ProductBean detail = ps.getProduct(no);
		model.addAttribute("Detail", detail);
		return "product/detail";
	}
}