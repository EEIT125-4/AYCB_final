package product.cartController;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import product.cartModel.OrderBean;
import product.cartService.OrderService;

@Controller
@SessionAttributes({ "cart","totalPrice","totalQtyOrdered" })
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@GetMapping("/orderInsert")
	public String OrderInsert(Model model,SessionStatus sessionStatus, HttpSession session) {
		
		Double totalPrice = (Double) model.getAttribute("totalPrice");
		Integer totalQtyOrder = (Integer) model.getAttribute("totalQtyOrdered");
		
		//MemberBean memberBean =((MemberBean)request.getSession(true).getAttribute("login_session"));
		
//		java.util.Date date = new Date(); 
//		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss: SSS");
		TimeZone zone = TimeZone.getTimeZone("Asia/Taipei");
		sdf.setTimeZone(zone);
		Date now = new Date();	
		
//		order.setCustomerId(memberBean.getName());
		//"name"= memberBean.getName
		OrderBean order = new OrderBean( null, "name", now, totalPrice, totalQtyOrder, "付款成功");
		
		os.insertOrderitem(order);
		
		session.invalidate();
		
		//sessionStatus.setComplete();
		//request.getSession(true).removeAttribute("cart");//移除session
		
		return "product/commit";		
	}
	
//	@GetMapping("/Allproducts")
//	public String ToAllproducts() {
//		return "product/allproducts";
//	}
	
	@GetMapping("/orderDelete")
	public String OrderDelete(Model model,
							   SessionStatus sessionStatus,
							   @RequestParam(value = "todo", required = false) String todo
	){
		
		String a = "product/allproducts";
		String b = "product/checkout";
		String c = null;		
		
		if (todo.equalsIgnoreCase("delete")) {
			
			System.out.println("delete process");
			
		}
	
		return "product/historyOrders";
	}

	@GetMapping("/orderSelect")
	public String OrderSelect(Model model){
		
		List<OrderBean> orderlist = os.selectOrderitem("name");
		model.addAttribute("orderlist", orderlist);
		
		return "product/historyOrders";
	}
	
	@GetMapping("/orderUpdate")
	public String OrderUpdate(Model model){
		
		return "product/updateOrder";
	}
	
	
	
}
