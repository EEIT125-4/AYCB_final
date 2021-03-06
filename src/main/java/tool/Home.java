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
//@SessionAttributes({ "brand", "series", "cate"})
public class Home {

	@Autowired
	ProductService ps;

	@GetMapping("/")
	public String home(Model model) {
		return "index";
	}

//	@ModelAttribute("brand")
//	public List<String> initBrands(Model model) {
//		List<String> brand = ps.getBrand();
//		return brand;
//	}
//
//	@ModelAttribute("series")
//	public List<String> initSeries(Model model) {
//		List<String> series = ps.getSeries();
//		return series;
//	}
//
//	@ModelAttribute("cate")
//	public List<String> initCates(Model model) {
//		List<String> cate = ps.getCate();
//		return cate;
//	}
}
