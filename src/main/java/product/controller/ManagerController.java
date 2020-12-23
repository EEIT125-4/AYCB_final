package product.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import product.model.ProductBean;
import product.service.ProductService;

@Controller
public class ManagerController {

	@Autowired
	ProductService ps;
	
	@Autowired
	ServletContext context;
	
	// 新增
	@GetMapping("/Mpadd")
	public String mpadd(Model model) {
		ProductBean pb = new ProductBean();
		pb.setBrandname("Biotherm");
		pb.setProductname("XXX");
		pb.setProductseries("XX系列");
		pb.setProductcategory("精華液");
		pb.setProductprice(1230.0);
		model.addAttribute("ProductBean", pb);
		return "product/mpadd";
	}
	
	// 新增
	@PostMapping("/Mpadd")
	public String add(@ModelAttribute("ProductBean") ProductBean pb			
	) {
		MultipartFile productImage = pb.getProductimage();
		String originalFilename = productImage.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		System.out.println(context.getContextPath());
		System.out.println(context.getResourcePaths("/"));
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, pb.getProductno() + ext);
			productImage.transferTo(file);
			pb.setImagepath(file.toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		ps.saveproduct(pb);
		return "redirect:/MProduct";
	}
	
	// 更新
	@GetMapping("/Mpupdate")
	public String mpupdate(Model model,
			@RequestParam(value = "no", required = false) Integer no
	) {
		
		ProductBean pb = ps.getProduct(no);
		model.addAttribute("ProductBean", pb);
		System.out.println("no1" + pb);
		return "product/mpdetail";
	}
	
	// 更新
	@PostMapping("/Mpupdate")
	public String update(
			@ModelAttribute("ProductBean") ProductBean pb
	) {
		ps.updateProduct(pb);
		return "redirect:/MProduct";
	}
	
	// 白名單
//	@InitBinder
//	public void whiteListing(WebDataBinder binder) {
//	    binder.setAllowedFields(
//	    "brandname", 
//	    "producttype", 
//	    "productname", 
//	    "productseries", 
//	    "productcategory", 
//	    "companyId", 
//	    "productprice",
//	    ""	//圖片
//	    );
//	}
	
	// 刪除
	@GetMapping("/Delete")
	public String delete(@RequestParam(value = "no", required = false) Integer no
	) {
		ps.deleteProduct(no);
		return "redirect:/MProduct";
	}
	
	// 後台頁路徑
	@GetMapping("/Manager")
	public String manager(Model model) {
		return "product/manager";
	}
	
	// 後台商品頁路徑
	@GetMapping("/MProduct")
	public String mproduct() {
		return "product/mproduct";
	}
	
	// 後台選廠商顯示商品
	@GetMapping(value = "/Brands", produces = "application/json")
	public @ResponseBody List<String> brands(Model model) {
		List<String> list = ps.getBrand();
		return list;
	}
	
	// 後台選廠商顯示商品
	@GetMapping(value = "/GetProductsByBrand", produces = "application/json")
	public @ResponseBody List<ProductBean> getProductsByBrand(Model model,
			@RequestParam("brandname") String brandname
	) {
		List<ProductBean> list = ps.getBrandProduct(brandname);
		return list;
	}
	
//	@GetMapping(value = "/GetBrandPage", produces = "application/json")
//	public @ResponseBody String getBrandPage(Model model,
//			@RequestParam(value = "pageNo", defaultValue = "1", required = false) Integer pageNo,
//			@RequestParam("brandname") String brandname
//	){
//		if (pageNo == 0) {
//			pageNo = 1;
//		} else if (pageNo > ps.getTotalPages()) {
//			pageNo = ps.getTotalPages();
//		}
//		List<ProductBean> list = ps.getBrandPage(pageNo, brandname);
//		model.addAttribute("Products", list);
//		model.addAttribute("Pages", String.valueOf(pageNo));
//		model.addAttribute("TotalPages", ps.getTotalPages());
//		return "product/mproduct";
//	}
}
