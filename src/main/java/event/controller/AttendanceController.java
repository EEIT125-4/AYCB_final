package event.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;

import event.model.Attendance;
import event.service.AttendanceService;
import event.validator.AttendanceValidator;


@Controller
public class AttendanceController {
	
	    @Autowired
	    AttendanceService attendanceService;
	  
		@Autowired
		ServletContext servletContext;
		
		
//		@GetMapping("/event")
//		public String home() {
//			return "event/eventIndex";     // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
//		}
		
		//select
		@GetMapping("event/showAttendance")
		public String list(Model model) {
			model.addAttribute("attendances", attendanceService.getAllAttendance());
			return "event/showAttendance";
		}

		//insert
		@GetMapping("event/attendanceForm")
		public String showEmptyForm(Model model) {
			Attendance attendance = new Attendance();
			model.addAttribute("attendance",attendance);
//			attendance.setMemberID("TEST1214");
//			attendance.setPhone("0912345678");
//			attendance.setMailaddress("test@gmail.com");
//			attendance.setEventID("1");
//			attendance.setPax("2");
			
			return "event/attendanceForm";
		}
		
		@PostMapping("event/attendanceForm")
		public String add(@ModelAttribute("attendance") Attendance attendance,
				BindingResult result, Model model,
				HttpServletRequest request) {
			AttendanceValidator validator =new AttendanceValidator();
			validator.validate(attendance, result);
			if(result.hasErrors()) {
				return "event/attendanceForm";
			}
			try {
				attendanceService.save(attendance);
			} catch (org.hibernate.exception.ConstraintViolationException e) {
				//result.rejectValue("account", "", "帳號已存在，請重新輸入");
				return "event/attendanceForm";
			} catch (Exception ex) {
				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
				result.rejectValue("account", "", "請通知系統人員...");
				return "event/attendanceForm";
			}
			
			return "event/showAttendance"; 
		}
		@GetMapping(value = "event/update")
		public String showDataForm(				
				//@PathVariable("aid") Integer aid, 
				Model model,
				@RequestParam(value="aid" ,required = false)Integer aid ) {
			Attendance attendance = attendanceService.getAttendance(aid);
			model.addAttribute(attendance);
			return "event/update";
		}
		
		
		@PostMapping(value = "event/update")		
		public String modify(
				@ModelAttribute("updateattendance") Attendance attendance, 
				BindingResult result, 
				Model model,
//				@PathVariable Integer id, 
				HttpServletRequest request,
				@RequestParam(value="aid",required = false)Integer aid
				) {
			AttendanceValidator validator = new AttendanceValidator();
			validator.validate(attendance, result);
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), attendance=" + attendance);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "event/attendanceForm";
			}
			attendanceService.updateAttendance(attendance);
			return "redirect:/event/showAttendance";
		}	
		@GetMapping(value = "event/delete")
		public String delete(
			//	@PathVariable("aid") Integer aid
				@RequestParam(value="aid" ,required = false)Integer aid
				) {
			attendanceService.deleteAttendance(aid);
			return "redirect:/event/showAttendance";
		}
		
		
}
