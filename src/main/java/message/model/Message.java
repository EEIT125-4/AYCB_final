package message.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import member.MemberBean;


@Entity
@Table(name = "msgtable")
public class Message implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	String messageid;
	@Column(columnDefinition = "NVARCHAR(MAX) NOT NULL")
	private String content ;
	@Column(columnDefinition = "NVARCHAR(50)")
	private String type; 
	
//	@ManyToOne
//	@JoinColumn(name = "from")
	private MemberBean sendfrom;
	
//	@OneToMany
//	@JoinColumn(name = "to")
	private MemberBean sendto;

		
	private Date senddate;
	
	public Message() {

	}

	public String getMessageid() {
		return messageid;
	}

	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public MemberBean getSendfrom() {
		return sendfrom;
	}

	public void setSendfrom(MemberBean sendfrom) {
		this.sendfrom = sendfrom;
	}

	public MemberBean getSendto() {
		return sendto;
	}

	public void setSendto(MemberBean sendto) {
		this.sendto = sendto;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	
	
	
	

}
