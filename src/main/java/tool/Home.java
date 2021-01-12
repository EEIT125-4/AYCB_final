package tool;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import product.service.ProductService;

@Controller
@SessionAttributes({"brand", "series", "cate", "recordlist"})
public class Home {

	@Autowired
	ProductService ps;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/")
	public String home(Model model) {
		List<String> brand = (List<String>) model.getAttribute("brand");
		List<String> series = (List<String>) model.getAttribute("series");
		List<String> cate = (List<String>) model.getAttribute("cate");
//		List<ProductBean> recordlist = (List<ProductBean>) model.getAttribute("recordlist");
		model.addAttribute("Brands", brand);
		model.addAttribute("Series", series);
		model.addAttribute("Cates", cate);
//		model.addAttribute("Recordlist", recordlist);
		return "index";
	}
	
	@ModelAttribute("brand")
	public List<String> initBrands(Model model){
		List<String> brand = ps.getBrand();
		return brand;
	}
	
	@ModelAttribute("series")
	public List<String> initSeries(Model model){
		List<String> series = ps.getSeries();
		return series;
	}
	
	@ModelAttribute("cate")
	public List<String> initCates(Model model){
		List<String> cate = ps.getCate();
		return cate;
	}
	
//	@SuppressWarnings("unchecked")
//	@ModelAttribute("recordlist")
//	public List<ProductBean> initrecordlist(Model model){
//		List<ProductBean> pb = (List<ProductBean>) new ProductBean();
//		return pb;
//	}
	
}
