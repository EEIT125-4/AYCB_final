package product.cartController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import product.cartModel.OrderBean;
import product.cartService.OrderService;

@Controller
public class OrderManagerController {

	@Autowired
	OrderService os;
	
	@GetMapping("/allOrderList")
	public String SelectAllOrders(Model model) {

		List<OrderBean> list = new ArrayList<OrderBean>();

		list = os.selectAllOrder();
		
		model.addAttribute("AllOrders", list);
		
		return "product/allHistoryOrders";
	}
}
