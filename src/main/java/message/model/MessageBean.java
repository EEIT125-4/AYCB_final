package message.model;


import java.sql.Blob;
import java.sql.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "message_table")
public class MessageBean {
	@Id
	@Column(columnDefinition = "NVARCHAR(11)")
	String id;
	@Column(columnDefinition = "NVARCHAR(MAX) NOT NULL")
	private String content,title ;
	@Column(columnDefinition = "NVARCHAR(50)")
	private String type; 
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imgpath;
	
	private Blob image;
	private String fileName;
	
	private Integer imageid;
	
	

	@Transient
	//表單提交時仍然需要此屬性
	MultipartFile file;
		
	private Date date;
	private Date editDate;

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date date) {
		this.editDate = date;
	}

	public MessageBean() {

	}
	
	

	public MessageBean(String id, String title, String desc, String type, String path,
			Date date) {
		super();
		this.id = id;
		this.title = title;
		this.content = desc;
		this.type = type;
		this.imgpath = path;
		this.date = date;
	}
	
	
	
	public MessageBean(String title, String desc, String type, String path,
			Date msg_Date) {
		super();
		
		this.title = title;
		this.content = desc;
		this.type = type;
		this.imgpath = path;
		this.date = msg_Date;
	}
	
	public Integer getImageid() {
		return imageid;
	}

	public void setImageid(Integer imageid) {
		this.imageid = imageid;
	}
	
	
//
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
//
	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}
	

	public void setContent(String desc) {
		this.content = desc;
	}

	public String getType() {
		return type;
	}

	

	public void setType(String type) {
		this.type = type;
	}

	

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setMsg_imgpath(String path) {
		this.imgpath = path;
	}

	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MessageBean [id=");
		builder.append(id);
		builder.append(", content=");
		builder.append(content);
		builder.append(", type=");
		builder.append(type);
		builder.append(", title=");
		builder.append(title);
		builder.append(", imgpath=");
		builder.append(imgpath);
		builder.append(", date=");
		builder.append(date);
		builder.append(", editDate=");
		builder.append(editDate);
		builder.append("]");
		return builder.toString();
	}

}
