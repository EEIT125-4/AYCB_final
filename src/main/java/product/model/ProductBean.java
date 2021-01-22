package product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Product")
public class ProductBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productno;
	private String brandno;
	private String brandname;
	private String producttype;
	private String productname;
	private String productseries;
	private String productcategory;
	private Double productprice;
	@Column(columnDefinition= "int NOT NULL default(0)")
	private Integer productstatus;
	private String imagepath;
	@Column(columnDefinition= "int NOT NULL default(50)")
	private Integer stock;
	@Column(columnDefinition= "int NOT NULL default(1)")
	private Integer status;
	private String skintype;
	@Column(columnDefinition= "NVARCHAR(10) NOT NULL default('product')")
	private final String identify="product";
	

	@Transient
	private MultipartFile productimage;  	
	
	@Transient
	public MultipartFile getProductimage() {
		return productimage;
	}

	@Transient
	public void setProductimage(MultipartFile productimage) {
		this.productimage = productimage;
	}

	public ProductBean() {
		super();
	}
	
	public ProductBean(Integer productno, String brandno, String brandname, String producttype, String productname,
			String productseries, String productcategory, Double productprice, Integer productstatus, String imagepath,
			Integer stock, Integer status, String skintype, MultipartFile productimage) {
		super();
		this.productno = productno;
		this.brandno = brandno;
		this.brandname = brandname;
		this.producttype = producttype;
		this.productname = productname;
		this.productseries = productseries;
		this.productcategory = productcategory;
		this.productprice = productprice;
		this.productstatus = productstatus;
		this.imagepath = imagepath;
		this.stock = stock;
		this.status = status;
		this.skintype = skintype;
		this.productimage = productimage;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductBean [productno=");
		builder.append(productno);
		builder.append(", brandno=");
		builder.append(brandno);
		builder.append(", brandname=");
		builder.append(brandname);
		builder.append(", producttype=");
		builder.append(producttype);
		builder.append(", productname=");
		builder.append(productname);
		builder.append(", productseries=");
		builder.append(productseries);
		builder.append(", productcategory=");
		builder.append(productcategory);
		builder.append(", productprice=");
		builder.append(productprice);
		builder.append(", productstatus=");
		builder.append(productstatus);
		builder.append(", imagepath=");
		builder.append(imagepath);
		builder.append(", stock=");
		builder.append(stock);
		builder.append(", status=");
		builder.append(status);
		builder.append(", skintype=");
		builder.append(skintype);
		builder.append(", identify=");
		builder.append(identify);
		builder.append(", productimage=");
		builder.append(productimage);
		builder.append("]");
		return builder.toString();
	}

	public String getIdentify() {
		return identify;
	}

	public Integer getProductno() {
		return productno;
	}

	public void setProductno(Integer productno) {
		this.productno = productno;
	}

	public String getBrandno() {
		return brandno;
	}

	public void setBrandno(String brandno) {
		this.brandno = brandno;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getProducttype() {
		return producttype;
	}

	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductseries() {
		return productseries;
	}

	public void setProductseries(String productseries) {
		this.productseries = productseries;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public String getSkintype() {
		return skintype;
	}

	public void setSkintype(String skintype) {
		this.skintype = skintype;
	}

	public Double getProductprice() {
		return productprice;
	}

	public void setProductprice(Double productprice) {
		this.productprice = productprice;
	}
	
	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public Integer getProductstatus() {
		return productstatus;
	}

	public void setProductstatus(Integer productstatus) {
		this.productstatus = productstatus;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}