package product.cartController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.MemberBean;
import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartService.OrderService;

@Controller
@SessionAttributes({ "member" })
public class OrderManagerController {

	@Autowired
	OrderService os;
	
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
	public String OrderDelete(Model model,
							   @RequestParam(value = "deleteindex", required = false) int deleteindex
	){
		System.out.println("delete process");
		
		os.deleteOrderBean(deleteindex);

		return "redirect:/orderManager";
	}
	
	@GetMapping("/orderManager")
	public String OrderManager(Model model ) {
		
		MemberBean memberBean = (MemberBean) model.getAttribute("member");
		
		if(memberBean == null) {
			return "redirect:/member/login";
		}
		
		return "product/mHistoryOrders";
	}
	
	@ModelAttribute("AllOrders")
	public List<OrderBean> SelectAllOrders(Model model) {

		List<OrderBean> list = new ArrayList<OrderBean>();

		list = os.selectAllOrder();
				
		return list;
	}
}
