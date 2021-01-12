package tool;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import product.model.CollectBean;
import product.model.ProductBean;
import product.service.ProductService;

@Controller
@SessionAttributes({ "brand", "series", "cate", "recordlist", "collection"})
public class Home {

	@Autowired
	ProductService ps;

	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("recordlist") == null) {
			List<ProductBean> list = new ArrayList<>();
			session.setAttribute("recordlist", list);
		}
//		if (session.getAttribute("collection") == null) {
//			List<CollectBean> list = new ArrayList<>();
//			session.setAttribute("collection", list);
//		}
		return "index";
	}

	@ModelAttribute("brand")
	public List<String> initBrands(Model model) {
		List<String> brand = ps.getBrand();
		return brand;
	}

	@ModelAttribute("series")
	public List<String> initSeries(Model model) {
		List<String> series = ps.getSeries();
		return series;
	}

	@ModelAttribute("cate")
	public List<String> initCates(Model model) {
		List<String> cate = ps.getCate();
		return cate;
	}
}
