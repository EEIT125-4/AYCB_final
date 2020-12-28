package comment.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import member.MemberBean;

@Entity
@Table(name = "blog")
public class Blog {
	@Id
	// 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer blogId;	
	
	@ManyToOne
	@JoinColumn(name = "member")
	private MemberBean member;
	@Column(columnDefinition= "NVARCHAR(MAX) NOT NULL")
	private Date commentTime;
	private String title;
	private String reflection;
	private Blob picture;
	private Integer status;
	private Date fixedtime;
	
	@Transient
	MultipartFile pic;

	public Blog() {
	}

	public Blog(Integer blogId, MemberBean member, Date commentTime, String title, String reflection, Blob picture,
			Integer status, Date fixedtime, MultipartFile pic) {
		super();
		this.blogId = blogId;
		this.member = member;
		this.commentTime = commentTime;
		this.title = title;
		this.reflection = reflection;
		this.picture = picture;
		this.status = status;
		this.fixedtime = fixedtime;
		this.pic = pic;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReflection() {
		return reflection;
	}

	public void setReflection(String reflection) {
		this.reflection = reflection;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getFixedtime() {
		return fixedtime;
	}

	public void setFixedtime(Date fixedtime) {
		this.fixedtime = fixedtime;
	}

	public MultipartFile getPic() {
		return pic;
	}

	public void setPic(MultipartFile pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [blogId=");
		builder.append(blogId);
		builder.append(", member=");
		builder.append(member);
		builder.append(", commentTime=");
		builder.append(commentTime);
		builder.append(", title=");
		builder.append(title);
		builder.append(", reflection=");
		builder.append(reflection);
		builder.append(", picture=");
		builder.append(picture);
		builder.append(", status=");
		builder.append(status);
		builder.append(", fixedtime=");
		builder.append(fixedtime);
		builder.append(", pic=");
		builder.append(pic);
		builder.append("]");
		return builder.toString();
	}

	
	
}
