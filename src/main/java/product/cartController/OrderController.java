package product.cartController;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mchange.net.MailSender;
import com.sun.xml.bind.CycleRecoverable.Context;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import mail.MyMailSender;
import member.MemberBean;
import product.cartModel.CartItem;
import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartService.OrderService;
import tool.Common;

@Controller
@SessionAttributes({ "cart","totalPrice","totalQtyOrdered","member"})
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@Autowired
	ServletContext context;

	
	
	
	public static String genAioCheckOutALL(Integer order,Double amount,String url,String itemDetail,String clentBackURL){
		
		AllInOne all = new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo("AYCBOrder"+order);
		
		SimpleDateFormat sd=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		//設定時間
		obj.setMerchantTradeDate(sd.format(new Date()));
	
		Integer total=amount.intValue();
		obj.setTotalAmount(String.valueOf(total));
		obj.setTradeDesc("test Description");
		
		/**
		 * 
		 */
		obj.setItemName(itemDetail);
		//Kevin:這裡實際上沒有效果,因為外網打不進來
		obj.setReturnURL(url);
		obj.setNeedExtraPaidInfo("N");
		obj.setClientBackURL(clentBackURL);
		String form = all.aioCheckOut(obj, null);
		
		System.out.println("form=/n"+form);
		return form;
	}
	
	
	@SuppressWarnings("unchecked")
	@GetMapping("/orderInsert")
//	@ResponseBody
	public String OrderInsert(
			
			Model model,
			SessionStatus sessionStatus,
			HttpSession session, 
			HttpServletRequest request,
			@RequestParam(value="recipientEmail",required = false)String email,
			@RequestParam(value="recipientName",required=false)String receiveName
			
			) {
		
		
		
		
		System.out.println("檢查郵件:"+email);
		System.out.println("檢查收件人名稱:"+receiveName);
		
		Double totalPrice = (Double) model.getAttribute("totalPrice");
		//Integer totalQtyOrder = (Integer) model.getAttribute("totalQtyOrdered");
		List<CartItem> items = (List<CartItem>) model.getAttribute("cart");
		
		MemberBean memberBean =((MemberBean)session.getAttribute("member"));		
		String name = memberBean.getName();
		
		Set<OrderItemBean> details = new HashSet<OrderItemBean>();
		String itemDetail="";
		for(CartItem cart : items) {
			OrderItemBean oib = new OrderItemBean(null, cart.getProductImage(), cart.getProductNo(), cart.getProductName(), cart.getProductPrice(), cart.getQtyOrdered());
			details.add(oib);
			itemDetail+=cart.getProductName()+" : "+cart.getProductPrice()+" * "+cart.getQtyOrdered()+" = $"+cart.getProductPrice()*cart.getQtyOrdered()+"#";
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
		
		if(email!=null && !email.equals("")) {
			try {
				MyMailSender.sendEmail(email, receiveName,"=====內容====",String.valueOf(order.getOrderNo()));
				System.out.println("郵件send成功");
			} catch (MessagingException e) {
				
				e.printStackTrace();
				System.err.println("郵件send失敗");
			}
		}
		
		session.removeAttribute("cart");
		session.removeAttribute("totalPrice");
		session.removeAttribute("totalQtyOrdered");
		String clientBackURL="http://localhost:8080/AYCB_final/";
		String form=genAioCheckOutALL(order.getOrderNo(), order.getTotalAmount(), context.getContextPath(),itemDetail,clientBackURL)	;
		session.setAttribute("form", form);
		
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
	
	@GetMapping("/pickOrderUpdate/{orderNo}")
	public @ResponseBody boolean PickOrderUpdate(Model model,
										@PathVariable String orderNo
	){
		System.out.println("PickOrderUpdate");
		System.out.println("orderNo : "+orderNo);
		
		String[] pk = orderNo.split("-");
		
	    String p	= pk[1];
	    int i = Integer.parseInt(p);
	    String s0 = "付款成功";
	    String s1 = "已出貨";
	    String s2 = "訂單完成";
	    
	    OrderBean pickOrder = os.selectUpdateBean(i);
	    
		if( pk[0].equals("2")) {
			
			pickOrder.setStatus(s1);
			
		}else if( pk[0].equals("3")) {
			
			pickOrder.setStatus(s2);
		} else {
			
			pickOrder.setStatus(s0);
		}
		
		boolean bollean = os.updateOrderBean(pickOrder);
			
		return bollean;		
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
