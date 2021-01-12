package blog.model;


import java.util.Date;

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
@Table(name = "blog")
public class Blog {
	@Id
	// 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer blogId;	
	
	@ManyToOne
	@JoinColumn(name = "member")
	private MemberBean member;
	@Column(columnDefinition= "smalldatetime")
	private Date commentTime;
	@Column(columnDefinition= "NVARCHAR(50) NOT NULL")
	private String title;
	@Column(columnDefinition= "NVARCHAR(MAX) NOT NULL")
	private String reflection;
	@Column(columnDefinition= "NVARCHAR(MAX)")
	private String blogCategory;
	private Integer picture=0;
	@Column(columnDefinition="int default 0")
	private Integer thumbs=0;
	@Column(columnDefinition= "NVARCHAR(10) NOT NULL default('blog')")
	private final String identify="blog";
	
	
	
	//初步規劃:
	/*
	 * 0=預設顯示狀態
	 * 1=審核中
	 * 2=維護中
	 * 3=用戶設置刪除
	 * 
	 */
	@Column(columnDefinition="int default 0")
	private Integer status=0;
	@Column(columnDefinition= "smalldatetime")
	private Date fixedtime;
	@Column(columnDefinition="int default 0")
	private Integer views;

	public Blog() {
		
	}

	public Blog(Integer blogId, MemberBean member, Date commentTime, String title, String reflection, Integer picture,
			Integer status, Date fixedtime) {
		super();
		this.blogId = blogId;
		this.member = member;
		this.commentTime = commentTime;
		this.title = title;
		this.reflection = reflection;
		this.picture = picture;
		this.status = status;
		this.fixedtime = fixedtime;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	
	public String getBlogcategory() {
		return blogCategory;
	}

	public void setBlogcategory(String blogcategory) {
		this.blogCategory = blogcategory;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	
	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
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

	public Integer getPicture() {
		return picture;
	}

	public void setPicture(Integer picture) {
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
	
	

	public Integer getThumbs() {
		return thumbs;
	}

	public void setThumbs(Integer thumbs) {
		this.thumbs = thumbs;
	}
	

	public String getIdentify() {
		return identify;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [blogId=");
		builder.append(blogId);
		builder.append(", member=");
		builder.append(member.getAccount());
		builder.append(", commentTime=");
		builder.append(commentTime);
		builder.append(", title=");
		builder.append(title);
		builder.append(", reflection=");
		builder.append(reflection);
		builder.append(", picture=");
		builder.append(picture);
		builder.append(", thumbs=");
		builder.append(thumbs);
		builder.append(", identify=");
		builder.append(identify);
		builder.append(", status=");
		builder.append(status);
		builder.append(", fixedtime=");
		builder.append(fixedtime);
		builder.append(", views=");
		builder.append(views);
		builder.append("]");
		return builder.toString();
	}

	
	

	

}
