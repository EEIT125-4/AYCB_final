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
import org.springframework.web.bind.annotation.SessionAttributes;

import member.MemberBean;
import product.cartModel.CartItem;
import product.cartModel.ProductDB;
import product.cartService.OrderService;

@Controller
@SessionAttributes({ "cart", "totalPrice", "totalQtyOrdered" })
public class CarWorkingController {

	@Autowired
	OrderService os;
	
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
			@RequestParam(value = "count", defaultValue = "0" ,required = false) Integer count, 
			HttpSession session) {

		ProductDB db = os.getProductDB();
		CartItem newCartItem = new CartItem(productno, count);
		
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
		return "redirect:AllProducts";//"+context.getContextPath()+"/
	}

	@GetMapping("/add")
	public String Add() {
		return "product/order";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/shopping")
	public String TodoShopping(Model model, 
			@RequestParam(value = "todo", required = false) String todo, 
			HttpSession session) {

		if (todo.equals("shop")) {

			return "redirect:AllProducts";

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

			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("totalQtyOrdered", totalQtyOrdered);
			
			System.out.println("totalPrice" + totalPrice);
			System.out.println("totalQtyOrdered" + totalQtyOrdered);

			return "product/checkout";
		}
		return "";

	}

	//@RequestParam(value = "cartIndex", required = false) Integer cartIndex,
	//@PathVariable Integer cartIndex,
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
