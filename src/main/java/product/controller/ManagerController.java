package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.service.ProductService;

@Controller
public class ManagerController {

	@Autowired
	ProductService ps;

	@GetMapping("/Mallp")
	public String mallp(Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getTotalPages()) {
			pageNo = ps.getTotalPages();
		}
		List<ProductBean> list = ps.getPage(pageNo);
		model.addAttribute("Products", list);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getTotalPages());
		return "product/mproduct";
	}

	@GetMapping("/Mpadd")
	public String mpadd(Model model) {
		ProductBean pb = new ProductBean();
		model.addAttribute("ProductBean", pb);
		return "product/mpadd";
	}

	@PostMapping("/Mpadd")
	public String add(@ModelAttribute("ProductBean") ProductBean pb) {
		ps.saveproduct(pb);
		return "redirect:/MProduct";
	}

	@GetMapping("/Mpupdate")
	public String mpupdate(Model model, @RequestParam(value = "no", required = false) Integer no) {
		ProductBean pb = ps.getProduct(no);
		System.out.println("pb number is:" + no);
		model.addAttribute("ProductBean", pb);
		return "product/mpdetail";
	}

	@PostMapping("/Mpupdate")
	public String update(@ModelAttribute("ProductBean") ProductBean pb) {
		
		System.out.println("new PB value:" + pb);

		ps.updateProduct(pb);

		return "redirect:/MProduct";
	}

	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("productno", "brandno", "skintype", "brandname", "producttype", "productname",
				"productseries", "productcategory", "companyId", "productprice", "" // image
		);
	}

	@GetMapping("/Delete")
	public String delete(@RequestParam(value = "no", required = false) Integer no) {
		ps.deleteProduct(no);
		return "redirect:/MProduct";
	}

	@GetMapping("/Manager")
	public String manager(Model model) {
		return "product/manager";
	}

	@GetMapping("/MProduct")
	public String mproduct(Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) Integer pageNo) {
		if (pageNo == 0) {
			pageNo = 1;
		} else if (pageNo > ps.getTotalPages()) {
			pageNo = ps.getTotalPages();
		}
		List<ProductBean> list = ps.getPage(pageNo);
		model.addAttribute("Products", list);
		model.addAttribute("Pages", String.valueOf(pageNo));
		model.addAttribute("TotalPages", ps.getTotalPages());
		return "product/mproduct";
	}

//	@GetMapping("/Mpdetail")
//	public String mpdetail(Model model,
//			@RequestParam(value = "no", required = false) Integer no
//	) {
//		ProductBean detail = ps.getProduct(no);
//		model.addAttribute("Detail", detail);
//		return "product/mpdetail";
//	}
}
