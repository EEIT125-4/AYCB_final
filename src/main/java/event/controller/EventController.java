package event.controller;

import java.io.ByteArrayOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sun.xml.fastinfoset.stax.EventLocation;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import event.model.Event;
import event.service.EventService;
import event.validator.EventValidator;

import tool.Common;

@Controller
@RequestMapping("/event")
public class EventController {
	
	    @Autowired
	    EventService eventService;
	  
		@Autowired
		ServletContext context;
		
		
		@GetMapping("/")
		public String home() {
			return "event/eventIndex";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
		}
		
		@GetMapping("/showEvent")
		public String list(Model model) {
			model.addAttribute("events", eventService.getAllEvent());
			return "event/showEvent";
		}
		
		@GetMapping("/eventForm")
		public String showEmptyForm(Model model) {
			Event event = new Event();
			event.setEventname("event1");
			model.addAttribute("event",event);
				
			return "event/eventForm";
		}				
		
		@PostMapping("/eventForm")
		public String add(Model model,
				@ModelAttribute("event") Event event,			      
//			    @RequestParam(value = "eventname" ,required = false) String eventname,
//				@RequestParam(value = "eventdate" ,required = false) String eventdate,
//				@RequestParam(value = "evnetlocation",required = false) String eventlocation,
//				@RequestParam(value = "eventdescription",required = false) String eventdescription,
//				@RequestParam(value = "host",required = false) String host,
//				@RequestParam(value = "hostphone",required = false) String hostphone,
//				@RequestParam(value = "pax",required = false) String pax,
				@RequestParam(value = "file",required = false) MultipartFile file,
		    HttpServletRequest request) {
			
			System.out.println("------"+event);
			System.out.println("++++"+event.getEventname());
			System.out.println(file);
						
			String path = null;
			try {
				path = Common.saveImage(file);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			event.setFilename(path);
			
			
//			EventValidator validator =new EventValidator();
//			validator.validate(event, result);
//			if(result.hasErrors()) {
//				return "event/eventForm";
//			}
//			MultipartFile img = event.getEventimage();
//			String originalFilename = img.getOriginalFilename();
//			
//				event.setFilename(originalFilename);
//			
//			// 建立Blob物件，交由 Hibernate 寫入資料庫
//			if (img != null && !img.isEmpty()) {
//				try {
//					byte[] b = img.getBytes();
//					Blob blob = new SerialBlob(b);
//					event.setEventimg(blob);
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//				}
//			}
						
		eventService.save(event);
			
//			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			String rootDirectory = context.getRealPath("/");
//			
//			// 將上傳的檔案移到指定的資料夾
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "Eventimage_" + event.getEventid() + ext);
//			img.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
			
			return "redirect:/event/showEvent";
		}
		
		
		//update
		@GetMapping(value = "event/${Attendance.aid}")
		public String showDataForm(@PathVariable("eventID") Integer eventID, Model model) {
			Event event = eventService.getEvent(eventID);
			model.addAttribute(event);
			return "event/update";
		}
		
		
		@PostMapping(value = "event/${Event.id}")		
		public String modify(
				@ModelAttribute("event") Event event, 
				BindingResult result, 
				Model model,
				@PathVariable Integer id, 
				HttpServletRequest request) {
			EventValidator validator = new EventValidator();
			validator.validate(event, result);
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), event=" + event);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "crm/insertMember";
			}
			eventService.updateEvent(event);
			return "redirect:event/showAttendance";
		}	
		@DeleteMapping(value = "event/${Event.id}")
		public String delete(@PathVariable("id") Integer id) {
			eventService.delete(id);
			return "redirect:/event/showAttendance";
		}
		@GetMapping("/img/{id}")
		public ResponseEntity<byte[]> getPicture(@PathVariable("eventid") Integer eventid) {
			
			byte[] body = null;
			ResponseEntity<byte[]> re = null;
			MediaType mediaType = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());

			Event event = eventService.getEvent(eventid);
			if (event == null) {
				return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
			}
			String filename = event.getFilename();
			if (filename != null) {
				if (filename.toLowerCase().endsWith("jfif")) {
					mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
				} else {
					mediaType = MediaType.valueOf(context.getMimeType(filename));
					headers.setContentType(mediaType);
				}
			}
			Blob blob = event.getEventimg();
			if (blob != null) {
				body = blobToByteArray(blob);
			} else {
				String path = null;
				
				body = fileToByteArray(path);
			}
			re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

			return re;
		}
		private byte[] blobToByteArray(Blob blob) {
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
		private byte[] fileToByteArray(String path) {
			byte[] result = null;
			try (InputStream is = context.getResourceAsStream(path);
					ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
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
