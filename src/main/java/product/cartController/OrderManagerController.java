package product.cartController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import member.MemberBean;
import product.cartModel.CartItem;
import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartService.OrderService;
import product.service.ProductService;

@Controller
@SessionAttributes({ "cart", "totalPrice", "totalQtyOrdered", "Shipping", "member", "phone", "address", "email", "receiveName"})
public class OrderManagerController {

	@Autowired
	OrderService os;
	
	@Autowired
	ProductService ps;
	
	@GetMapping("/managerSelectOrderItem")
	public String SelectOrderItem(Model model,
			@RequestParam(value = "selectindex", required = false) int selectindex			
	){
				
		MemberBean memberBean = (MemberBean) model.getAttribute("member");
		
		if(memberBean == null) {
			return "redirect:/member/login";
		}
		
		List<OrderItemBean> itemList = os.selectOrderItem(selectindex);
		model.addAttribute("itemList", itemList);
		
		return "product/mHistoryOrderItem";
	}
	
	
	@GetMapping("/managerOrderDelete")
	public @ResponseBody boolean OrderDelete(Model model,
														@RequestParam int deleteindex
			){
		System.out.println("delete process: "+deleteindex);
		
		os.deleteOrderBean(deleteindex);
		
		return true;
	}
	
	@GetMapping("/orderManager")
	public ModelAndView OrderManager(Model model ) {
		
		ModelAndView mv = new ModelAndView();
		MemberBean memberBean = (MemberBean) model.getAttribute("member");
		
		if(memberBean == null) {
			mv.setViewName("redirect:/member/login");			
		}
		
		Gson gson=new Gson();
		/*訂單品牌總覽*/
		Map<String, Object> brandList = os.getBrandNumber();
		String jsonBrandName = gson.toJson(brandList.get("brandName"));
		String jsonBrandCount = gson.toJson(brandList.get("brandCount"));
		mv.addObject("brandList", brandList);  
		mv.addObject("jsonBrandName", jsonBrandName);
		mv.addObject("jsonBrandCount", jsonBrandCount);

		
		/*訂單總數*/
		List<OrderBean> orders = os.selectAllOrder();
		int orderCount = orders.size();
		mv.addObject("orderCount", orderCount); 
//		System.out.println("orderCount"+ orderCount);
		
		/*銷售總金額*/
		Double totalAmount = 0.d;
		for(OrderBean o  : orders) {		
			
			totalAmount += o.getTotalAmount();			
		}
		System.out.println("amount"+ totalAmount);
		mv.addObject("totalAmount", totalAmount); 		
		
		mv.setViewName("/product/mHistoryOrders");
		
		return mv;
	}
	
	
	@GetMapping("/return")	
	public String ReturnsPolicy() {
		
		return "product/returnsPolicy";
	}
			
	
	@ModelAttribute("AllOrders")
	public List<OrderBean> SelectAllOrders(Model model) {

		List<OrderBean> list = new ArrayList<OrderBean>();

		list = os.selectAllOrder();
				
		return list;
	}
	
}
