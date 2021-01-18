package comment.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import member.MemberBean;

@Entity
@Table(name="reply")
public class ReplyBean implements Serializable{

	@Id
	private Integer replyId;
	@ManyToOne
	@JoinColumn(name = "member")
	@JsonIgnoreProperties({ "password", "address","phone","birth","email" })
	private MemberBean member;
	private String keynumber;
	private String type;
	
	@Column(columnDefinition = "datetime")
	private Timestamp commentTime;
	
	@Column(columnDefinition = "datetime")
	private Timestamp editTime;
	
	private String contentBox;
	@Column(columnDefinition="int default 0")
	private Integer status=0;
	
	public ReplyBean() {
	
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
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

	public Timestamp getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public Timestamp getEditTime() {
		return editTime;
	}

	public void setEditTime(Timestamp editTime) {
		this.editTime = editTime;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReplyBean [replyId=");
		builder.append(replyId);
		builder.append(", member=");
		builder.append(member);
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
