package product.cartModel;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;


import javax.persistence.Entity;
import javax.persistence.CascadeType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//本類別存放訂單資料
@Entity
@Table(name="OrderTable")
public class OrderBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderNo;//產品編號
	//@ManyToOne(cascade = CascadeType.ALL)
	//@JoinColumn(name="fk_memberId")	
	private String 	customerId;//會員ID
	private Double	totalAmount;//總價
	private Date  orderDate;//訂購日期
	//private String	shippingAddress;//地址
	private String status;
	//(name = "fkOrderNo", referencedColumnName = "orderNo")
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="fkOrderNo",referencedColumnName = "orderNo")
	Set<OrderItemBean> items = new LinkedHashSet<OrderItemBean>();

	public OrderBean() {
		super();
	}

	public OrderBean(Integer orderNo, String customerId, Double totalAmount, Date orderDate, String status,
			Set<OrderItemBean> items) {
		super();
		this.orderNo = orderNo;
		this.customerId = customerId;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.status = status;
		this.items = items;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderBean [orderNo=");
		builder.append(orderNo);
		builder.append(", customerId=");
		builder.append(customerId);
		builder.append(", totalAmount=");
		builder.append(totalAmount);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", status=");
		builder.append(status);
		builder.append(", items=");
		builder.append(items);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
