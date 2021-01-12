package product.cartModel;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;


public class CartItem {
	
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	private int productNo;
	private int qtyOrdered;// 採購數量

	
	public CartItem() {
		
	}

	public CartItem(int productNo, int qtyOrdered) {

		this.productNo = productNo;
		this.qtyOrdered = qtyOrdered;
	}
	
	
	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getQtyOrdered() {
		return qtyOrdered;
	}

	public void setQtyOrdered(int qtyOrdered) {
		this.qtyOrdered = qtyOrdered;
	}

	public String getProductName() {
		return ProductDB.getProductName(productNo-2);
	}

	public Double getProductPrice() {
		return ProductDB.getProductPrice(productNo-2);
	}
	
	public String getProductImage() {
		return ProductDB.getProductImage(productNo-2);
	}

}
