package product.cartDao;

import java.util.List;
import java.util.Map;

import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartModel.ProductDB;

public interface OrderDao {
	
	List<OrderBean> selectAllOrder();

	List<OrderBean> selectOrderBean(String name);
	
	List<OrderItemBean> selectOrderItem(int no);

	boolean insertOrderBean(OrderBean order);

	boolean updateOrderBean(OrderBean order);

	boolean deleteOrderBean(int no);

	OrderBean selectUpdateBean(int ino);
	
	ProductDB getProductDB();
	  
	Map<String, Object> getBrandNumber();
	
	List<OrderItemBean> getTopfive();

}