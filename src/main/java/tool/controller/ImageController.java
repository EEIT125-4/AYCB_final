package tool.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tool.Common;
import tool.model.Image;
import tool.service.ImageService;


@Controller
public class ImageController {
	
	String noImage = "/images/noImage.jpg";
	
	
	
	@Autowired
	ImageService service;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/uploadImage.do")
	@ResponseBody
	
	public Map<String, String> receiveImage(@RequestPart("upload") MultipartFile file, HttpServletRequest request) {
	   
		
		Map<String, String>result=new HashMap<String, String>();
		
		try {
			
			result.put("url", Common.DOMAIN+Common.saveImage(file));
			result.put("uploaded","true");
			System.out.println("ckeditor上傳成功");
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("上傳失敗");
			result.put("uploaded","false");
			return null;
			
		}
		
		
		
	}
	
	
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
