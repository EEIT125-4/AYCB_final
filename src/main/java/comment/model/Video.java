package comment.model;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
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
import javax.persistence.Transient;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.web.multipart.MultipartFile;

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
	private Timestamp commentTime;
	@Column(columnDefinition = "NVARCHAR(50) NOT NULL")
	private String title;
	@Column(columnDefinition = "NVARCHAR(max) NOT NULL")
	private String url;
	private Integer status;
	private Integer thumbsup;
	@Column(columnDefinition= "smalldatetime")
	private Timestamp fixedTime;
	
	private Blob video;
	
	
	

	
	public Video() {
	}

	public Video(Integer videoId, MemberBean member,Timestamp commentTime, String title, String url, Integer status,
			Integer thumbsup, Timestamp fixedTime) {
		super();
		this.videoId = videoId;
		this.member = member;
		this.commentTime = commentTime;
		this.title = title;
		this.url = url;
		this.status = status;
		this.thumbsup = thumbsup;
		this.fixedTime = fixedTime;
	}
	
	


	/**
	 * 上傳檔案並依檔名設定標題
	 * @param file
	 * @throws IOException
	 * @throws SerialException
	 * @throws SQLException
	 */
public void setVideo(MultipartFile file) throws IOException, SerialException, SQLException {
		
		byte[] b = file.getBytes();
		Blob blob = new SerialBlob(b);
		this.title=file.getOriginalFilename();
		this.video=blob;
		
		
	}

public void setVideo(Blob blob) {

	
	this.video=blob;
	
	
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

	public void setCommentTime(Timestamp commentTime) {
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

	public Date getFixedTime() {
		return fixedTime;
	}

	public void setFixedTime(Timestamp fixedTime) {
		this.fixedTime = fixedTime;
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
		builder.append(", fixedTime=");
		builder.append(fixedTime);
		builder.append("]");
		return builder.toString();
	}


}
