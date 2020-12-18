package message.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class MessagTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer typePK;
	@Column(columnDefinition = "NVARCHAR(50)")
	private String messageType;

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	
	
	

}
