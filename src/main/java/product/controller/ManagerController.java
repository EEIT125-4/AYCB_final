package product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.service.ProductService;
import tool.model.Image;
import tool.service.ImageService;

@Controller
public class ManagerController {

	@Autowired
	ProductService ps;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	ImageService imgService;
	
//	// 新增
//	@GetMapping("/Mpadd")
//	public String mpadd(Model model) {
//		ProductBean pb = new ProductBean();
//		model.addAttribute("ProductBean", pb);
//		return "product/mpadd";
//	}
	
	// 新增
	@PostMapping("/GetAllProduct")
	public String add(
			@ModelAttribute("ProductBean") ProductBean pb,
			@ModelAttribute("UPBean") ProductBean upb,
			@RequestParam(value = "todo", required = false) String todo
	) {
		System.out.println(todo);
		if(todo.equals("update")) {
			ps.updateProduct(upb);
			return "redirect:/GetAllProduct";
		} else {
			System.out.println("~~~~~~~~");
			MultipartFile productImage = pb.getProductimage();
			if (productImage != null && productImage.getSize() > 0) {
				// 這邊是存在Tomcat的路徑,但網站重佈署時就會消失,所以目前方案是存在專案實際位置,每次重新佈署時就會自動同步
				System.out.println("有圖片" + context.getRealPath("/"));
	
				try {
					Image img = new Image(productImage);
	
					imgService.saveImage(img);
					pb.setImagepath(img.getImgid().toString());
					System.out.println("圖片儲存完畢,id=" + img.getImgid()+",filename="+img.getFilename());
	
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
				}
	
			} else {
				System.out.println("沒有圖片");
			}
			
			ps.saveproduct(pb);
			return "redirect:/GetAllProduct";
		}
	}
	
	// 更新
//	@GetMapping("/Mpupdate")
//	public String mpupdate(Model model,
//			@RequestParam(value = "no", required = false) Integer no
//	) {
//		
//		ProductBean pb = ps.getProduct(no);
//		model.addAttribute("ProductBean", pb);
//		System.out.println("no1" + pb);
//		return "product/mpdetail";
//	}
	
	// 更新
//	@PostMapping("/Mpupdate")
//	public String update(
//			@ModelAttribute("ProductBean") ProductBean pb
//	) {
//		ps.updateProduct(pb);
//		System.out.println("update" + pb);
//		return "redirect:/MProduct";
//	}
	
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
	@GetMapping(value = "/Delete", produces = "application/json")
	public @ResponseBody boolean delete(
			@RequestParam(value = "no", required = false) Integer no
	) {
		ps.deleteProduct(no);
		return true;
	}
	
	@GetMapping("/Manager")
	public String manager(Model model) {
		return "product/manager";
	}
	
//	// 後台商品頁路徑
//	@GetMapping("/MProduct")
//	public String mproduct() {
//		return "product/mproduct";
//	}
	
	// 後台選廠商顯示
	@GetMapping(value = "/Brands", produces = "application/json")
	public @ResponseBody List<String> brands(Model model) {
		List<String> list = ps.getBrand();
		return list;
	}
	
	// 後台選廠商顯示
	@GetMapping(value = "/GetProductsByBrand", produces = "application/json")
	public @ResponseBody List<ProductBean> getProductsByBrand(Model model,
			@RequestParam("brandname") String brandname
	) {
		List<ProductBean> list = ps.getBrandProduct(brandname);
		return list;
	}
	
	@GetMapping(value = "/GetProductTotal", produces = "application/json")
	public @ResponseBody long getProductTotal(Model model) {
		long count = ps.getProductTotal();
		return count;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/GetBrandTotal", produces = "application/json")
	public @ResponseBody Map getBrandTotal(Model model) {
		long total = ps.getBrandTotal();
		
		List<Integer> count = new ArrayList<Integer>();
		List<String> brand = ps.getBrand();
		for(int i = 0; i<brand.size(); i++) {
			count.add((int)ps.getBrandTotalPages(brand.get(i)));
		}
		Map map = new HashMap();
		map.put("BrandTotal", total);
		map.put("Brands", brand);
		map.put("Count", count);

		return map;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping(value = "/GetCateTotal", produces = "application/json")
	public @ResponseBody Map getCateTotal(Model model) {
		List<Integer> count = new ArrayList<Integer>();
		List<String> cate = ps.getCate();
		for(int i = 0; i<cate.size(); i++) {
			count.add((int)ps.getCateTotalPages(cate.get(i)));
		}
		Map map = new HashMap();
		map.put("Cates", cate);
		map.put("Count", count);

		return map;
	}
	
	@GetMapping("/GetAllProduct")
	public ModelAndView getAllProduct(Model model) {
		ModelAndView mav = new ModelAndView();
		
		ProductBean pb = new ProductBean();
		mav.addObject("ProductBean", pb);
		ProductBean upb = new ProductBean();
		mav.addObject("UPBean", upb);
		
		List<ProductBean> list = ps.getAllProducts();
		mav.addObject("Products", list);
		mav.setViewName("product/mproduct");
		return mav;
	}
}
