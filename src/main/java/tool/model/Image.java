package tool.model;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.SQLException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.web.multipart.MultipartFile;

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
	
	/**
	 * Kevin:以輸入檔案命名並儲存Blob
	 * @param file
	 * @throws IOException
	 * @throws SerialException
	 * @throws SQLException
	 */
	public Image(MultipartFile file) throws IOException, SerialException, SQLException {
		
		byte[] b = file.getBytes();
		Blob blob = new SerialBlob(b);

		this.setImage(blob);
		this.setFilename(file.getOriginalFilename());
		
		
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
	
	public void setImage(MultipartFile file) throws IOException, SerialException, SQLException {
		
		byte[] b = file.getBytes();
		Blob blob = new SerialBlob(b);
		this.filename=file.getOriginalFilename();
		this.image=blob;
		
		
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
}