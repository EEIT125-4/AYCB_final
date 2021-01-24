package message.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import member.MemberBean;


@Entity
@Table
public class Messagebox implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer messageid;
	@Column(columnDefinition = "NVARCHAR(MAX) NOT NULL")
	private String content ;
	@Column(columnDefinition = "NVARCHAR(50)")
	private String type; 
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sendfrom")
	private MemberBean sendfrom;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sendto")
	private MemberBean sendto;

		
	private Date senddate;
	
	public Messagebox() {

	}

	

	public Integer getMessageid() {
		return messageid;
	}



	public void setMessageid(Integer messageid) {
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
