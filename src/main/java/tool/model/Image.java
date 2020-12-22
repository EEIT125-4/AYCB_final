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

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer imgid;
	@Column(columnDefinition = "nvarchar(Max)")
	private String filename;
	
	@JsonIgnore
	private Blob image;
	
	
	public Image() {
				
	}
	

	
	public Image(Integer imgid, String filename, Blob image) {
		super();
		this.imgid = imgid;
		this.filename = filename;
		
		this.image = image;
	}



	
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
	
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
}