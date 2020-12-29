package product.cartController;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import member.MemberBean;
import product.cartModel.CartItem;
import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartService.OrderService;

@Controller
@SessionAttributes({ "cart","totalPrice","totalQtyOrdered","member"})
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/orderInsert")
	public String OrderInsert(Model model,SessionStatus sessionStatus, HttpSession session, HttpServletRequest request) {
		
		Double totalPrice = (Double) model.getAttribute("totalPrice");
		//Integer totalQtyOrder = (Integer) model.getAttribute("totalQtyOrdered");
		List<CartItem> items = (List<CartItem>) model.getAttribute("cart");
		
		MemberBean memberBean =((MemberBean)session.getAttribute("member"));		
		String name = memberBean.getName();
		
		Set<OrderItemBean> details = new HashSet<OrderItemBean>();
		for(CartItem cart : items) {
			OrderItemBean oib = new OrderItemBean(null, cart.getProductNo(), cart.getProductName(), cart.getProductPrice(), cart.getQtyOrdered());
			details.add(oib);
		}
	
//		java.util.Date date = new Date(); 
//		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sTimeString = sdf.format(new Date());
		Timestamp tTime = Timestamp.valueOf(sTimeString);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss: SSS");
//		TimeZone zone = TimeZone.getTimeZone("Asia/Taipei");
//		sdf.setTimeZone(zone);
//		Date now = new Date();	
		
		OrderBean order = new OrderBean(null, name, totalPrice, tTime, "付款成功", details);
		
	
		os.insertOrderBean(order);
		
		//session.removeAttribute("cart");
		//session.invalidate();
		
		//sessionStatus.setComplete();
		//request.getSession(true).removeAttribute("cart");//移除session
		
		return "product/commit";		
	}
	

	@GetMapping("/orderDelete")
	public String OrderDelete(Model model,
							   @RequestParam(value = "deleteindex", required = false) int deleteindex
	){
		System.out.println("delete process");
		
		os.deleteOrderBean(deleteindex);

		return "redirect:/orderManagement";
	}
	
	@GetMapping("/pickOrderUpdate")
	public String PickOrderUpdate(Model model,
							@RequestParam(value = "updateindex", required = false) int updateindex
	){
		System.out.println("PickOrderUpdate");
		
		OrderBean pickOrder = os.selectUpdateBean(updateindex);
		
		model.addAttribute("pickOrder", pickOrder);
		
		return "product/updateOrder";
	}
	
	@GetMapping("/orderUpdate")
	public String OrderUpdate(Model model,
							@RequestParam(value = "orderNo", required = false) Integer orderNo,
							@RequestParam(value = "customerId", required = false) String customerId,
							@RequestParam(value = "price", required = false) Double price,
							@RequestParam(value = "quantity", required = false) Integer quantity,
							@RequestParam(value = "status", required = false) String status							
	){
		System.out.println("OrderUpdate");
		System.out.println("order_No"+orderNo);
		System.out.println("customer_Id"+customerId);
		System.out.println("price"+price);
		System.out.println("quantity"+quantity);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sTimeString = sdf.format(new Date());
		Timestamp tTime = Timestamp.valueOf(sTimeString);
		
//		OrderBean updateOrder = new OrderBean(orderNo, customerId, price, tTime, status, items);		
//		if (os.updateOrderBean(updateOrder)) {
//			System.out.println("Let orderUpdate done!");
//			return "product/orderUpdateThanks";
//		} else{
//				return "product/orderUpdateThanks";
//		}
	
		return "redirect:/orderManagement";
	}
	
	@GetMapping("/orderUpdateThanks")
	public String OrderUpdateThanks( ) {
		
		return "product/orderUpdateThanks";
	}
	
	@GetMapping("/selectOrderItem")
	public String SelectOrderItem(Model model,
			@RequestParam(value = "selectindex", required = false) int selectindex			
	){
		
		List<OrderItemBean> itemList = os.selectOrderItem(selectindex);
		model.addAttribute("itemList", itemList);
		
		return "product/historyOrderItem";
	}

	@GetMapping("/orderManagement")
	public String OrderManagement( ) {
		
		return "product/historyOrders";
	}
	
	@ModelAttribute("orderList")
	public List<OrderBean> OrderSelect (HttpSession session, HttpServletRequest request){
		
		MemberBean memberBean =((MemberBean)session.getAttribute("member"));
		
		String name = memberBean.getName();
		
		List<OrderBean>  orderList = new ArrayList<OrderBean>();
		
		orderList = os.selectOrderBean(name);
		
		
		//System.out.println(orderlist);
		
		return orderList;
	}
	
	
	
}
