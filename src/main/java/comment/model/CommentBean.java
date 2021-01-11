package comment.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import member.MemberBean;


@Entity
@Table(name="comment")
public class CommentBean implements Serializable{
	
	@Id
//	 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer commentId;	
//	@Id
	@ManyToOne
	@JoinColumn(name = "member")
	@JsonIgnoreProperties({ "password", "address","phone","birth","email" })
	private MemberBean member;
//	@Id
	private String keynumber;
//	@Id
	private String type;
	
	@Column(columnDefinition = "datetime")
	private Timestamp commentTime;
	
	@Column(columnDefinition = "datetime")
	private Timestamp editTime;
	
	
	private String contentBox;
	@Column(columnDefinition="int default 0")
	private Integer status=0;
	
	

	public CommentBean() {
		
	}
	
	
	

	public Timestamp getEditTime() {
		return editTime;
	}




	public void setEditTime(Timestamp editTime) {
		this.editTime = editTime;
	}




	public MemberBean getMember() {
		return member;
	}

	

	public void setMember(MemberBean member) {
		this.member = member;
	}



	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public String getContentBox() {
		return contentBox;
	}

	public void setContentBox(String contentBox) {
		this.contentBox = contentBox;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getKeynumber() {
		return keynumber;
	}

	public void setKeynumber(String keynumber) {
		this.keynumber = keynumber;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}




	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentBean [commentId=");
		builder.append(commentId);
		builder.append(", member=");
		builder.append(member.getName());
		builder.append(", keynumber=");
		builder.append(keynumber);
		builder.append(", type=");
		builder.append(type);
		builder.append(", commentTime=");
		builder.append(commentTime);
		builder.append(", editTime=");
		builder.append(editTime);
		builder.append(", contentBox=");
		builder.append(contentBox);
		builder.append(", status=");
		builder.append(status);
		builder.append("]");
		return builder.toString();
	}



}
