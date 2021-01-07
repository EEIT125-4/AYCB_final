package member;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import event.model.Record;



@Entity

public class MemberBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer id;
	@Column(columnDefinition = "nvarchar(Max)")
	private String account;
	


	@Column(columnDefinition = "nvarchar(Max)")
	private String name;
	@Column(columnDefinition = "nvarchar(Max)")
	private String password;
	@Column(columnDefinition = "nvarchar(Max)")
	private String address;
	@Column(columnDefinition = "nvarchar(Max)")
	private String phone;
	private Date birth;
	@Column(columnDefinition = "nvarchar(Max)")
	private String email;
	@Column(columnDefinition = "nvarchar(Max)")
	private String gender;
	
	@Column(columnDefinition = "nvarchar(Max)")
	private String introduce;
	
	private Integer level;
	@Column(columnDefinition="int default 0")
	private Integer iconid;
	
	
	private boolean ckpower;
	
	
	@Transient
	@ManyToMany(mappedBy = "member",cascade = CascadeType.ALL)
	Set<Record>records=new HashSet<Record>();
	
	public Set<Record> getRecords() {
		return records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}
	
	

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public MemberBean() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getIconid() {
		return iconid;
	}

	public void setIconid(Integer iconid) {
		this.iconid = iconid;
	}
	public boolean isCkpower() {
		return ckpower;
	}

	public void setCkpower(boolean ckpower) {
		this.ckpower = ckpower;
	}


	public MemberBean(Integer id, String account, String name, String password, String address, String phone,
			Date birthday, String email, String gender) {
		super();
		id = id;
		this.account = account;
		this.name = name;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.birth = birthday;
		this.email = email;
		this.gender = gender;
     
	}

	public MemberBean(Integer id, String account, String name, String password, String address, String phone,
			Date birth, String email, String gender, Integer level, Integer iconid) {
		super();
		this.id = id;
		this.account = account;
		this.name = name;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.level = level;
		this.iconid = iconid;

	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberBean [id=");
		builder.append(id);
		builder.append(", account=");
		builder.append(account);
		builder.append(", name=");
		builder.append(name);
		builder.append(", password=");
		builder.append(password);
		builder.append(", address=");
		builder.append(address);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", email=");
		builder.append(email);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", level=");
		builder.append(level);
		builder.append(", iconid=");
		builder.append(iconid);

		builder.append("]");
		return builder.toString();
	}
	
	
	
	

}