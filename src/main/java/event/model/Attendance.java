package event.model;




import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Attendance")
public class Attendance{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer aid;
	@Column(columnDefinition = "nvarchar(max)")
	String memberid;
	String phone;
	String mailaddress;
	String eventid;
	String pax;
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Attendance [aid=");
		builder.append(aid);
		builder.append(", memberid=");
		builder.append(memberid);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", mailaddress=");
		builder.append(mailaddress);
		builder.append(", eventid=");
		builder.append(eventid);
		builder.append(", pax=");
		builder.append(pax);
		builder.append("]");
		return builder.toString();
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
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
	public String getEventid() {
		return eventid;
	}
	public void setEventid(String eventid) {
		this.eventid = eventid;
	}
	public String getPax() {
		return pax;
	}
	public void setPax(String pax) {
		this.pax = pax;
	}
	public Attendance(Integer aid, String memberid, String phone, String mailaddress, String eventid, String pax) {
		super();
		this.aid = aid;
		this.memberid = memberid;
		this.phone = phone;
		this.mailaddress = mailaddress;
		this.eventid = eventid;
		this.pax = pax;
	}
	public Attendance() {
		super();
		
	}
	
	
    
}   
   
    
    
	

	