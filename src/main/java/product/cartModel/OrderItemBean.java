package product.cartModel;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;



//本類別封裝單筆訂單資料
@Entity
@Table(name="OrderItems")
public class OrderItemBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;//單筆訂單編號
	private String productImg;
	//private String brandNo;
	//private String brandName;
	private Integer productNo;
	private String productName;
	private Double productPrice;//單價
	private Integer quantity;//數量
	//private Double discount;//折扣
	//private String description;//描述
//	@ManyToOne
//	@JoinColumn(name="orderNo")
//	OrderBean orderBean;//訂單編號FK
	
	public OrderItemBean() {
		super();
	}
	public OrderItemBean(Integer seqno, String productImg, Integer productNo, String productName, Double productPrice,
			Integer quantity) {
		super();
		this.seqno = seqno;
		this.productImg = productImg;
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.quantity = quantity;
	}
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItemBean [seqno=");
		builder.append(seqno);
		builder.append(", productImg=");
		builder.append(productImg);
		builder.append(", productNo=");
		builder.append(productNo);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", productPrice=");
		builder.append(productPrice);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append("]");
		return builder.toString();
	}
	

}
