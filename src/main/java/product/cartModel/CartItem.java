package product.cartModel;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import product.model.ProductBean;


public class CartItem {
	
	//private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	private int productNo;
	private int qtyOrdered;// 採購數量
	ProductBean productBean;
	
	
	public CartItem() {
		
	}

	public CartItem(int productNo, int qtyOrdered) {

		this.productNo = productNo;
		this.qtyOrdered = qtyOrdered;
	}
	
	
	public CartItem(int productNo, int qtyOrdered, ProductBean productBean) {
		super();
		this.productNo = productNo;
		this.qtyOrdered = qtyOrdered;
		this.productBean = productBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
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
		return productBean.getProductname();
	}

	public Double getProductPrice() {
		return productBean.getProductprice();
	}
	
	public String getProductImage() {
		return productBean.getImagepath();
	}
	
	public String getBrandName() {
		return productBean.getBrandname();
	}
	
	public String getProductSeries() {
		return productBean.getProductseries();
	}
}
