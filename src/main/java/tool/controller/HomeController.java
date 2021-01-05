package tool.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import product.model.ProductBean;
import product.service.ProductService;


@Controller
public class HomeController {
	
		@Autowired
		ProductService ps;
		
		@RequestMapping(value={"/index"})//,"/Home"
		public String home(Model model) {
			System.out.println("welcome home");
			List<ProductBean> list = ps.getAllProducts();
			model.addAttribute("list", list);
			System.out.println("get product list");
			for(ProductBean p:list) {
				
				System.out.println("p:"+p.getProductname()+"/"+p.getImagepath());
			}
				
			return "index";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
			
			
		}
		
		


}
