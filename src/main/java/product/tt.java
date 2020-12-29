package product;

import product.dao.ProductDao;
import product.dao.impl.ProductDaoImpl;

public class tt {

	public static void main(String[] args) {
		ProductDao dao = new ProductDaoImpl();
		
		System.out.println(dao.ra("洗面乳"));

	}

}
