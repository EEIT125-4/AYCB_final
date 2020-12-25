package product.cartDao.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.cartDao.OrderDao;
import product.cartModel.OrderBean;
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

		Query<ProductBean> query1 = session.createQuery(hql);

		products = query1.getResultList();

		// System.out.println("products:"+products);

		for (ProductBean p : products) {

			nameList.add(p.getProductname());
			// System.out.println(p.getProductname());

			priceList.add(p.getProductprice());
			// System.out.println(p.getProductprice());
		}

		ProductDB PD = new ProductDB();

		PD.setProductName(nameList);
		PD.setProductPrice(priceList);

		return PD;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> selectOrderitem(String name) {

		List<OrderBean> list = new ArrayList<OrderBean>();
		String hq1 = "FROM OrderBean o WHERE o.customerId = :name";
		Session session = factory.getCurrentSession();

		Query<OrderBean> query = session.createQuery(hq1);
		list = query.setParameter("name", name).getResultList();
		return list;

	}

	@Override
	public boolean insertOrderitem(OrderBean order) {

		Session session = factory.getCurrentSession();
		session.save(order);
		return true;

	}

	@Override
	public boolean updateOrderitem(OrderBean order) {

		Session session = factory.getCurrentSession();
		session.update(order);
		return true;

	}

	@Override
	public boolean deleteOrderitem(int no) {

		Session session = factory.getCurrentSession();
		OrderBean order = new OrderBean();
		order.setOrderNo(no);
		session.delete(order);

		return true;

	}

	@Override
	public OrderBean selectUpdateitem(int ino) {

		Session session = factory.getCurrentSession();
		OrderBean order = session.get(OrderBean.class, ino);

		return order;

	}

}
