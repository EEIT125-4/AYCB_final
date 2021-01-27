package product.cartController;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.MemberBean;
import product.cartModel.CartItem;
import product.cartModel.ProductDB;
import product.cartService.OrderService;
import product.model.ProductBean;
import product.service.ProductService;

@Controller
@SessionAttributes({ "cart", "totalPrice", "Shipping", "totalQtyOrdered", "member" })
public class CarWorkingController {

	@Autowired
	OrderService os;
	
	@Autowired
	ProductService ps;
	
	@Autowired
	ServletContext context;

	@GetMapping("/car")
	public String Car(HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("member");
		if (mb != null ) {
			System.out.println("member:" + mb.getName());
		}else {
			return "member/login";
		}
				
		return "product/order";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/cartAdd")
	public String TodoAdd(Model model, 
			@RequestParam(value = "productno", required = false) Integer productno, 
			@RequestParam(value = "count", defaultValue = "1" ,required = false) Integer count, 
			HttpSession session) {
		
		ProductBean bean = ps.getProduct(productno);	
		
		CartItem newCartItem = new CartItem(productno, count,bean);
		
		List<CartItem> theCart = new ArrayList<CartItem>();

		if (session.getAttribute("cart") == null) {

			theCart = new ArrayList<CartItem>();		

			theCart.add(newCartItem);
			
			session.setAttribute("cart",theCart);
			
			//System.out.println("cart" + theCart);

		} else {
			
		theCart=(List<CartItem>)session.getAttribute("cart");

			boolean found = false; // 旗標檢查用
					
			@SuppressWarnings("rawtypes")
			Iterator iter = theCart.iterator();// 轉結構,方便使用方法
			while (!found && iter.hasNext()) {// 假設沒找到就一筆一筆找, !found->false變true
				CartItem aCartItem = (CartItem) iter.next();			
				
				if (aCartItem.getProductNo() == newCartItem.getProductNo()) {
					aCartItem.setQtyOrdered(aCartItem.getQtyOrdered() + newCartItem.getQtyOrdered());// 同一商品的話,數量加總
					found = true;
				}
			}
			if (!found) {
				theCart.add(newCartItem);// 沒找到相同的商品就新增
			}

		}
		System.out.println("準備前往購物車");
		return "redirect:All";//"+context.getContextPath()+"/
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/addCart")
	public @ResponseBody boolean addCart(Model model, 
			@RequestParam(value = "productno", required = false) Integer productno, 
			@RequestParam(value = "count", defaultValue = "1" ,required = false) Integer count, 
			HttpSession session) {
		
		System.out.println("productno: " +productno);
		System.out.println("count: " +count);
		
		ProductBean bean = ps.getProduct(productno);	
		
		CartItem newCartItem = new CartItem(productno, count,bean);
		
		List<CartItem> theCart = new ArrayList<CartItem>();

		if (session.getAttribute("cart") == null) {

			theCart = new ArrayList<CartItem>();		

			theCart.add(newCartItem);
			
			session.setAttribute("cart",theCart);
			
			//System.out.println("cart" + theCart);

		} else {
			
		theCart=(List<CartItem>)session.getAttribute("cart");

			boolean found = false; // 旗標檢查用
					
			@SuppressWarnings("rawtypes")
			Iterator iter = theCart.iterator();// 轉結構,方便使用方法
			while (!found && iter.hasNext()) {// 假設沒找到就一筆一筆找, !found->false變true
				CartItem aCartItem = (CartItem) iter.next();			
				
				if (aCartItem.getProductNo() == newCartItem.getProductNo()) {
					aCartItem.setQtyOrdered(aCartItem.getQtyOrdered() + newCartItem.getQtyOrdered());// 同一商品的話,數量加總
					found = true;
				}
			}
			if (!found) {
				theCart.add(newCartItem);// 沒找到相同的商品就新增
			}

		}		
		return true;
	}
	
	@GetMapping("/add")	
	public String Add() {
		return "product/order";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/setQtyAjax")
	public @ResponseBody boolean setQty(Model model,
														@RequestParam Integer id,
														@RequestParam Integer Qty
			){
		List<CartItem> theCart = (List<CartItem>) model.getAttribute("cart");
		theCart.get(id).setQtyOrdered(Qty);
		System.out.println("id"+id);
		System.out.println("qty"+Qty);
		return true;
	}
	

	@SuppressWarnings("unchecked")
	@GetMapping("/shopping")
	public String TodoShopping(Model model, 
			@RequestParam(value = "todo", required = false) String todo, 
			HttpSession session) {

		if (todo.equals("shop")) {

			return "redirect:All";

		} else if (todo.equals("checkout")) {

			List<CartItem> theCart = (List<CartItem>) model.getAttribute("cart");
			System.out.println("theCart"+theCart.size());
			Double totalPrice = 0.0; // 計算總價,數字歸零
			Integer totalQtyOrdered = 0; // 總數量歸零
			for (CartItem item : theCart) {
				Double price = item.getProductPrice();
				Integer qtyOrdered = item.getQtyOrdered();
				totalPrice += price * qtyOrdered;
				totalQtyOrdered += qtyOrdered;
			}
			
			Double totalAmount = (double) Math.round(totalPrice);//round四捨五入
			Double Shipping = totalAmount + 50;
			
			model.addAttribute("totalPrice", totalAmount);
			model.addAttribute("totalQtyOrdered", totalQtyOrdered);
			model.addAttribute("Shipping", Shipping);//加運費

			
			
			System.out.println("totalPrice" + totalAmount);
			System.out.println("totalQtyOrdered" + totalQtyOrdered);
			System.out.println("Shipping" + Shipping);

			return "product/checkout";
		}
		return "";

	}

	//@RequestParam(value = "cartIndex", required = false) Integer cartIndex,
	//@PathVariable int cartIndex,
	@SuppressWarnings( "unchecked" )
	@GetMapping("/cartRemove/{cartIndex}")
	public String TodoRemove(Model model, 
			@PathVariable int cartIndex,
				HttpSession session
	){
		
		System.out.println("cartIndex"+cartIndex);
		List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
		
		System.out.println("刪除商品:" + theCart.get(cartIndex).getProductName());
		theCart.remove(cartIndex); 
		
		//session.setAttribute("cart", theCart);	
					
		return "product/order";
	}
	

}
