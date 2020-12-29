package event.model;




import javax.persistence.CascadeType;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import member.MemberBean;

@Entity
@Table(name="Attendance")
public class Attendance{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer aid;
	String phone;
	String mailaddress;
	String pax;

	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	Event event;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	MemberBean member;
	
	
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMailaddress() {
		return mailaddress;
	}

	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}

	public String getPax() {
		return pax;
	}

	public void setPax(String pax) {
		this.pax = pax;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Attendance [aid=");
		builder.append(aid);
		builder.append(", memberid=");
		
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", mailaddress=");
		builder.append(mailaddress);
		builder.append(", pax=");
		builder.append(pax);
		builder.append("]");
		return builder.toString();
	}

	

	public Attendance(Integer aid, String phone, String mailaddress, String pax, Event event, MemberBean member) {
		super();
		this.aid = aid;
		this.phone = phone;
		this.mailaddress = mailaddress;
		this.pax = pax;
		this.event = event;
		this.member = member;
	}

	public Attendance() {
		super();
	}
	
	
}
   
    
    
	

	