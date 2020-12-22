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
import product.cartModel.ProductDB;
import product.cartService.OrderService;



@Transactional
@Service
public class OrderServiceImpl implements OrderService {
	
	//SessionFactory factory = HibernateUtils.getSessionFactory();
	
	//OrderDao dao = new OrderDaoImpl();
	
	@Autowired
	OrderDao dao;
	
	
	
	public ProductDB getProductDB() {
		  
//		  Session session = factory.getCurrentSession();
//		  Transaction tx = null;
//		  
//		  try {
//		   tx = session.beginTransaction();
		   System.out.println("準備撈DB");
		   ProductDB PD = dao.getProductDB();
//		   tx.commit();
//		  } catch (Exception e) {
//			  if (tx != null) {
//					tx.rollback();
//				}
//				e.printStackTrace();
//				
//		  }
		  //System.out.println("PD:"+ PD);
		  return PD;
		 }
	
	
	@Override
	public List<OrderBean> selectOrderitem(String name) {		
		
		
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		List<OrderBean> list = dao.selectOrderitem(name);
//			tx.commit();
//		
//		} catch (Exception ex) {
//			if(tx != null) {
//				tx.rollback();
//				
//			}		
//			ex.printStackTrace();
//		}
		return list;			
	}
	
	
	@Override
	public boolean insertOrderitem(OrderBean order) {
		 
		boolean result = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			
			dao.insertOrderitem(order);
//			tx.commit();
			result = true;
//		}catch (Exception ex) {
//				if(tx != null) {
//					tx.rollback();
//					result = false;
//				}
//				ex.printStackTrace();
//			}
		return result;
		
	}
	
	
	@Override
	public boolean updateOrderitem(OrderBean order) {
		
		boolean result = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			
			dao.updateOrderitem(order);
//			tx.commit();
			result = true;
//		}catch (Exception ex) {
//				if(tx != null) {
//					tx.rollback();
//					result = false;
//				}
//				ex.printStackTrace();
//			}
		return result;				
	}
	
	
	@Override
	public boolean deleteOrderitem(int no) {
		
		boolean result = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			dao.deleteOrderitem(no);
//			tx.commit();
			result = true;
//		}catch (Exception ex) {
//				if(tx != null) {
//					tx.rollback();
//					result = false;
//				}
//				ex.printStackTrace();
//			}
		return result;		
	}
	
	
	@Override
	public OrderBean selectUpdateitem(int ino) {
		
		//OrderBean order = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		OrderBean order = dao.selectUpdateitem(ino);
//			tx.commit();
//			
//		}catch (Exception ex) {
//				if(tx != null) {
//					tx.rollback();
//					
//				}
//				ex.printStackTrace();
//			}
		return order;
	}
	
	
	
}
