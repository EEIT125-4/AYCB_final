package video.model;

import java.net.URLEncoder;
import java.sql.Timestamp;
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
@Table(name = "video")
public class Video {
	@Id
	// 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer videoId;	
	
	@ManyToOne
	@JoinColumn(name = "member")
	private MemberBean member;
	@Column(columnDefinition= "smalldatetime")
	private Timestamp commentTime;
	@Column(columnDefinition = "NVARCHAR(50) NOT NULL")
	private String title;
	@Column(columnDefinition = "NVARCHAR(max)")
	private String category;
	
	@Column(columnDefinition = "NVARCHAR(max)")
	private String description;
	
	
	@Column(columnDefinition = "NVARCHAR(max)")
	private String coverUrl;
	@Column(columnDefinition = "NVARCHAR(max) NOT NULL")
	private String url;
	@Column(columnDefinition = "int default 0")
	private Integer status=0;

	@Column(columnDefinition= "smalldatetime")
	private Timestamp fixedTime;
	
	@Column(columnDefinition = "int default 0")
	private Integer viewCount=0;
	
	@Column(columnDefinition = "int default 0")
	private Integer thumbsup=0;
	@Column(columnDefinition = "int default 0")
	private Integer thumbsdown=0;

	public Video() {}

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
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

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

	public String getCoverUrl() {
		return coverUrl;
	}

	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getThumbsup() {
		return thumbsup;
	}

	public void setThumbsup(Integer thumbsup) {
		this.thumbsup = thumbsup;
	}

	public Date getFixedTime() {
		return fixedTime;
	}

	public void setFixedTime(Timestamp fixedTime) {
		this.fixedTime = fixedTime;
	}
	
	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	
	
	

	public Integer getThumbsdown() {
		return thumbsdown;
	}

	public void setThumbsdown(Integer thumbsdown) {
		this.thumbsdown = thumbsdown;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

	


}
