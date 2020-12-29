package tool.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import tool.model.Image;
import tool.service.ImageService;


@Controller
public class ImageController {
	
	String noImage = "/images/noImage.jpg";
	
	
	
	@Autowired
	ImageService service;
	
	@Autowired
	ServletContext context;
	
	
	@GetMapping("/pic/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		Image img =service.getImage(id);
		if (img == null) {
			
			System.out.println("img is null");
			
			String path = noImage;
			
			body = fileToByteArray(path);
			
			re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

			return re;
		}
		String filename =img.getFilename();
		
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = img.getImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			//預設無圖片路徑
			String path = noImage;
			
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
/**
 * 
 * @param path
 * @return byte[]
 * K:byte預設大小819200,這個大小不確定以後會不會成為問題
 */
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		System.out.println("path"+context.getContextPath());
	
			try (InputStream is = context.getResourceAsStream(path);
					
					ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
				
				System.out.println("resource"+context.getResource(path));
				
				byte[] b = new byte[819200];
				int length=0;
				while ((length = is.read(b)) != -1) {
					baos.write(b, 0, length);
				}
				result = baos.toByteArray();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		

		
		
	}
	
	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
