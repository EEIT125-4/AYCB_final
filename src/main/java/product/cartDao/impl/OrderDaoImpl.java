package product.cartDao.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.cartDao.OrderDao;
import product.cartModel.OrderBean;
import product.cartModel.OrderItemBean;
import product.cartModel.ProductDB;
import product.model.ProductBean;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SessionFactory factory;

	public OrderDaoImpl() {
	}

	@SuppressWarnings({ "unchecked", "static-access" })
	@Override
	public ProductDB getProductDB() {

		Session session = factory.getCurrentSession();
		String hql = "FROM ProductBean";
		List<ProductBean> products = new ArrayList<ProductBean>();
		List<String> nameList = new ArrayList<String>();
		List<Double> priceList = new ArrayList<Double>();
		List<String> imgList = new ArrayList<String>();

		Query<ProductBean> query1 = session.createQuery(hql);

		products = query1.getResultList();

		// System.out.println("products:"+products);

		for (ProductBean p : products) {

			nameList.add(p.getProductname());
			// System.out.println(p.getProductname());

			priceList.add(p.getProductprice());
			// System.out.println(p.getProductprice());
			
			imgList.add(p.getImagepath());
		}
		ProductDB PD = new ProductDB();

		PD.setProductName(nameList);
		PD.setProductPrice(priceList);
		PD.setProductImage(imgList);

		return PD;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> selectAllOrder() {
		
		List<OrderBean> list = new ArrayList<OrderBean>();
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean";
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> selectOrderBean(String name) {

		List<OrderBean> list = new ArrayList<OrderBean>();
		String hq1 = "FROM OrderBean o WHERE o.customerId = :name";
		Session session = factory.getCurrentSession();

		Query<OrderBean> query = session.createQuery(hq1);
		list = query.setParameter("name", name).getResultList();
		return list;

	}
	
	@SuppressWarnings("unchecked")
	@Override	
	public List<OrderItemBean> selectOrderItem(int no){
		
		List<OrderItemBean> list = new ArrayList<OrderItemBean>();
		String sql = "SELECT * FROM OrderItems WHERE fkOrderNo = " + no;
		Session session = factory.getCurrentSession();
		
		list = session.createNativeQuery(sql).addEntity(OrderItemBean.class).getResultList();
		
//		for(OrderItemBean item : list) {
//			item.getProductNo();
//			System.out.println("ProductNo"+item.getProductNo());
//			item.getProductName();
//			System.out.println("ProductName"+item.getProductName());
//			item.getProductPrice();
//			System.out.println("ProductPrice"+item.getProductPrice());
//			item.getQuantity();
//			System.out.println("Quantity"+item.getQuantity());
//		}		
		return list;		
	}
	
	@Override
	public boolean insertOrderBean(OrderBean order) {

		Session session = factory.getCurrentSession();
		session.save(order);
		return true;

	}

	@Override
	public boolean updateOrderBean(OrderBean order) {

		Session session = factory.getCurrentSession();
		session.update(order);
		return true;

	}

	@Override
	public boolean deleteOrderBean(int no) {

		Session session = factory.getCurrentSession();
		OrderBean order = new OrderBean();
		order.setOrderNo(no);
		session.delete(order);

		return true;

	}

	@Override
	public OrderBean selectUpdateBean(int ino) {

		Session session = factory.getCurrentSession();
		OrderBean order = session.get(OrderBean.class, ino);

		return order;

	}

	@Override
	public Map<String, Object> getBrandNumber() {
		
Map<String, Object> brandMap = new HashMap<String, Object>();
		
		List<String> brandName = new ArrayList<String>();
		brandName.add("Biotherm");
		brandName.add("olay");
		brandName.add("Dr.Morita ");
		brandName.add("Origins");
		
		List<Integer> brandCount = new ArrayList<Integer>();
				
		Session session = factory.getCurrentSession();
		String sq1 = "SELECT * FROM OrderItems o WHERE o.brandName = 'Biotherm' " ;
		String sq2 = "SELECT * FROM OrderItems o WHERE o.brandName = 'olay' " ;
		String sq3 = "SELECT * FROM OrderItems o WHERE o.brandName = 'Dr.Morita' " ;
		String sq4 = "SELECT * FROM OrderItems o WHERE o.brandName = 'Origins' " ;
														
		brandCount.add(session.createNativeQuery(sq1).getResultList().size());
		brandCount.add(session.createNativeQuery(sq2).getResultList().size());
		brandCount.add(session.createNativeQuery(sq3).getResultList().size());
		brandCount.add(session.createNativeQuery(sq4).getResultList().size());
		
		brandMap.put("brandName", brandName);
		brandMap.put("brandCount", brandCount);
		
		return brandMap;
	}


}
