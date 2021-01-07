package comment.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import member.MemberBean;


@Entity
@Table(name="comment")
public class CommentBean{
	
	@Id
	// 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer commentId;	
	
	@ManyToOne
	@JoinColumn(name = "member")
	private MemberBean member;
	
	@Column(columnDefinition = "smalldatetime")
	private Timestamp commentTime;
	private String contentBox;
	private Integer status;
	private String keynumber;
	private String type;
	

	public CommentBean() {
	}

	

	public CommentBean(Integer commentId, MemberBean member, Timestamp commentTime, String contentBox, Integer status,
			String keynumber, String type) {
		super();
		this.commentId = commentId;
		this.member = member;
		this.commentTime = commentTime;
		this.contentBox = contentBox;
		this.status = status;
		this.keynumber = keynumber;
		this.type = type;
	}



	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
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
		builder.append(member);
		builder.append(", commentTime=");
		builder.append(commentTime);
		builder.append(", contentBox=");
		builder.append(contentBox);
		builder.append(", status=");
		builder.append(status);
		builder.append(", keynumber=");
		builder.append(keynumber);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}

	

}
