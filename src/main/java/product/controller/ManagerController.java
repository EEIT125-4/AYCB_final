package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import product.model.ProductBean;
import product.service.ProductService;

@Controller
public class ManagerController {

	@Autowired
	ProductService ps;
	
	@PostMapping("/Add")
	public String add(@ModelAttribute("ProductBean") ProductBean pb				
	) {
		ps.saveproduct(pb);
		return "redirect:/MProduct";
	}
	
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
	    binder.setAllowedFields(
	    "brandname", 
	    "producttype", 
	    "productname", 
	    "productseries", 
	    "productcategory", 
	    "companyId", 
	    "productprice",
	    ""	//圖片
	    );
	}
	
	@GetMapping
	public String update(@ModelAttribute("ProductBean") ProductBean pb
	) {
		ps.updateProduct(pb);
		return "redirect:/product/mproduct";
	}
	
//	@GetMapping
//	public String delete(
//	) {
//		ps.deleteProduct(no);
//		return "redirect:/allproducts";
//	}
	
	@GetMapping("/Manager")
	public String manager(Model model) {
		return "product/manager";
	}
	
	@GetMapping("/MProduct")
	public String mproduct(Model model) {
		return "product/mproduct";
	}
}
