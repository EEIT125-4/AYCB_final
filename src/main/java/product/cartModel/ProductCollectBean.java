//package product.cartModel;
//
//import java.util.Date;
//
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//import member.MemberBean;
//import product.model.ProductBean;
//
//@Entity
//@Table(name = "ProductCollect")
//public class ProductCollectBean {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer  pcNo;	
//	private Date  pcDate;
//	
//	@ManyToOne
//	@JoinColumn(name="fkMemberID")
//	MemberBean member;
//	
//	@ManyToOne
//	@JoinColumn(name="fkProduNo")
//	ProductBean product;
//
//	public ProductCollectBean() {
//		super();
//	}
//
//	public ProductCollectBean(Integer pcNo, Date pcDate, MemberBean member, ProductBean product) {
//		super();
//		this.pcNo = pcNo;
//		this.pcDate = pcDate;
//		this.member = member;
//		this.product = product;
//	}
//
//	public Integer getPcNo() {
//		return pcNo;
//	}
//
//	public void setPcNo(Integer pcNo) {
//		this.pcNo = pcNo;
//	}
//
//	public Date getPcDate() {
//		return pcDate;
//	}
//
//	public void setPcDate(Date pcDate) {
//		this.pcDate = pcDate;
//	}
//
//	public MemberBean getMember() {
//		return member;
//	}
//
//	public void setMember(MemberBean member) {
//		this.member = member;
//	}
//
//	public ProductBean getProduct() {
//		return product;
//	}
//
//	public void setProduct(ProductBean product) {
//		this.product = product;
//	}
//
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("ProductCollectBean [pcNo=");
//		builder.append(pcNo);
//		builder.append(", pcDate=");
//		builder.append(pcDate);
//		builder.append(", member=");
//		builder.append(member);
//		builder.append(", product=");
//		builder.append(product);
//		builder.append("]");
//		return builder.toString();
//	}
//	
//	
//}
