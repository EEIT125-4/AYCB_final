package subscript.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import member.MemberBean;
import message.model.MessageBean;

@Entity
@Table(name="follow")
public class Follow implements Serializable{
	
	
	@OneToOne
	@JoinColumn(name="subscriptType",referencedColumnName = "messageType")
	//@EmbeddedId
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="memberPK",referencedColumnName="pk")
	MemberBean mb;
	

	public Follow() {
		
	}




	
	
}
