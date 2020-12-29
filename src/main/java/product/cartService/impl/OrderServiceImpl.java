package product.cartService.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import product.cartDao.OrderDao;

import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartModel.ProductDB;
import product.cartService.OrderService;



@Transactional
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao dao;
	
	
	@Override
	public ProductDB getProductDB() {
		  
		   System.out.println("準備撈DB");
		   ProductDB PD = dao.getProductDB();

		  return PD;
		 }
	
	
	@Override
	public List<OrderBean> selectAllOrder() {
		
		List<OrderBean> list = dao.selectAllOrder();
		
		return list;
	}
	
	
	@Override
	public List<OrderBean> selectOrderBean(String name) {				

		List<OrderBean> list = dao.selectOrderBean(name);

		return list;			
	}
	
	
	@Override
	public List<OrderItemBean> selectOrderItem(int no){
		
		List<OrderItemBean> list = dao.selectOrderItem(no);
		
		return list;	
	}
	
	
	@Override
	public boolean insertOrderBean(OrderBean order) {
		 
		boolean result = false;

			dao.insertOrderBean(order);

		return result;
		
	}
	
	
	@Override
	public boolean updateOrderBean(OrderBean order) {
		
		boolean result = false;

			dao.updateOrderBean(order);

		return result;				
	}
	
	
	@Override
	public boolean deleteOrderBean(int no) {
		
		boolean result = false;

			dao.deleteOrderBean(no);

			result = true;

		return result;		
	}
	
	
	@Override
	public OrderBean selectUpdateBean(int ino) {		

		OrderBean order = dao.selectUpdateBean(ino);

		return order;
	}

			
}