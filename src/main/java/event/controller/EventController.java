package event.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import event.model.Event;
import event.service.EventService;
import event.validator.EventValidator;


@Controller
@RequestMapping("/event")
public class EventController {
	
	   @Autowired
	   EventService eventService;
	  
		@Autowired
		ServletContext servletContext;
		
		
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
		
//			event.setEventname("活動一");
//			event.setEventdate("2020-12-25");
//			event.setEventlocation("中壢區");
//			event.setEventdescription("test");
//			event.setHost("host");
//			event.setHostphone("0912345678");
//			event.setPax("11");
			model.addAttribute("event",event);
				
			return "event/eventForm";
		}				
		
		@PostMapping("/eventForm")
		public String add(@ModelAttribute("event") Event event,
				BindingResult result, Model model,
				HttpServletRequest request) {
			EventValidator validator =new EventValidator();
			validator.validate(event, result);
			if(result.hasErrors()) {
				return "event/eventForm";
			}
			MultipartFile img = event.getEventimage();
			String originalFilename = img.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				event.setFilename(originalFilename);
			}// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (img != null && !img.isEmpty()) {
				try {
					byte[] b = img.getBytes();
					Blob blob = new SerialBlob(b);
					event.setEventimg(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			
			try {
				eventService.save(event);
			} catch (org.hibernate.exception.ConstraintViolationException e) {
				//result.rejectValue("account", "", "帳號已存在，請重新輸入");
				return "event/attendanceForm";
			} catch (Exception ex) {
				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
				result.rejectValue("account", "", "請通知系統人員...");
				return "event/attendanceForm";
			}
			
			return "event/showEvent";
		}
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
			return "redirect:event/showAttendance";
		}
		

}
