package tool.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table
public class Image implements Serializable{

	
	
	public Image() {
		
		
	}
	

	
	public Image(Integer imgid, String filename, String filepath, Blob image) {
		super();
		this.imgid = imgid;
		this.filename = filename;
		this.filepath = filepath;
		this.image = image;
	}



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer imgid;
	@Column(columnDefinition = "nvarchar(Max)")
	private String filename;
	@Column(columnDefinition = "nvarchar(Max)")
	private String filepath;
	@JsonIgnore
	private Blob image;
	public Integer getImgid() {
		return imgid;
	}
	public void setImgid(Integer imgid) {
		this.imgid = imgid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Image [imgid=");
		builder.append(imgid);
		builder.append(", filename=");
		builder.append(filename);
		builder.append(", filepath=");
		builder.append(filepath);
		builder.append(", image=");
		builder.append(image);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}