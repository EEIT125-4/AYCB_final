package comment.model;

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
//	private Integer id;
//	@Column(columnDefinition= "NVARCHAR(MAX) NOT NULL")
//	private String name;
//	private String gender;
//	private Integer age;
	@Column(columnDefinition= "smalldatetime")
	private Date commentTime;
	private String title;
	private String url;
	private Integer status;
	private Integer thumbsup;
	@Column(columnDefinition= "smalldatetime")
	private Date fixedtime;

	public Video() {
	}

	public Video(Integer videoId, MemberBean member, Date commentTime, String title, String url, Integer status,
			Integer thumbsup, Date fixedtime) {
		super();
		this.videoId = videoId;
		this.member = member;
		this.commentTime = commentTime;
		this.title = title;
		this.url = url;
		this.status = status;
		this.thumbsup = thumbsup;
		this.fixedtime = fixedtime;
	}

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

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getFixedtime() {
		return fixedtime;
	}

	public void setFixedtime(Date fixedtime) {
		this.fixedtime = fixedtime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Video [videoId=");
		builder.append(videoId);
		builder.append(", member=");
		builder.append(member);
		builder.append(", commentTime=");
		builder.append(commentTime);
		builder.append(", title=");
		builder.append(title);
		builder.append(", url=");
		builder.append(url);
		builder.append(", status=");
		builder.append(status);
		builder.append(", thumbsup=");
		builder.append(thumbsup);
		builder.append(", fixedtime=");
		builder.append(fixedtime);
		builder.append("]");
		return builder.toString();
	}

	

}
