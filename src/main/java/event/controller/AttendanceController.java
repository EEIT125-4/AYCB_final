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
import event.service.EventService;
import event.validator.AttendanceValidator;
import member.Service.MemberService;


@Controller
public class AttendanceController {
	
	    
	    @Autowired
	    AttendanceService attendanceService;
	  
		@Autowired
		ServletContext servletContext;
		
		@Autowired
		EventService eventService;
		
		@Autowired
		MemberService memberService;
		
		
		//select 查詢所有報名
		@GetMapping("event/showAttendance")
		public String list(Model model) {
			model.addAttribute("attendances", attendanceService.getAllAttendance());
			
			return "event/showAttendance";
		}
		
		
		@GetMapping("event/showAllAttendanceByID")
		public String attendancelist(Model model,
				@RequestParam (value="id" ) Integer id
			) {
			System.out.println(id);
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(id);
			model.addAttribute("attendancelist",attendancelist);
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++"+attendancelist);
			
			return "event/showAttendance";
		}

		//insert
		@GetMapping("event/attendanceForm")
		public String showEmptyForm(Model model,
				@RequestParam(value="eventid" ) Integer eventid //取得attendanceForm值
//			    ,@RequestParam(value="account") String account //取得attendanceForm值
				) {
			
		   //加入event
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+eventid);
//			System.out.println("==================================="+account);
			String eventname= eventService.getEvent(eventid).getEventname();
			System.out.println("eventname="+eventname);
			model.addAttribute("eventid", eventid);
			model.addAttribute("eventname", eventname);
			
//			System.out.println("============================="+account);
//			model.addAttribute("account", account);
			
			
			
			Attendance attendance = new Attendance(); //new attendanceForm 儲存格
			System.out.println("888888888888888888888888888888888888"+attendance);
//			attendance.setEvent(eventname);
			model.addAttribute("attendance",attendance);
			
//			attendance.setMemberID("TEST1214");
//			attendance.setPhone("0912345678");
//			attendance.setMailaddress("test@gmail.com");
//			attendance.setEventID("1");
//			attendance.setPax("2");
			
			return "event/attendanceForm";
		}
		
		@PostMapping("event/attendanceForm")
		public String add(
				@ModelAttribute("attendance") Attendance attendance,
				BindingResult result, Model model,
				@RequestParam (value="eventid" ) Integer eventid,
				@RequestParam (value="account" ) String account,
				HttpServletRequest request) {
			AttendanceValidator validator =new AttendanceValidator();
			validator.validate(attendance, result);
			if(result.hasErrors()) {
				return "event/attendanceForm";
			}
			try {
				System.out.println("------------------------------------------------------------------------------"+eventid);
				attendance.setEvent(eventService.getEvent(eventid));
				attendance.setMember(memberService.getMember(account));
				attendanceService.save(attendance);
			} catch (org.hibernate.exception.ConstraintViolationException e) {
				//result.rejectValue("account", "", "帳號已存在，請重新輸入");
				return "event/attendanceForm";
			} catch (Exception ex) {
				System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
				result.rejectValue("account", "", "請通知系統人員...");
				return "event/attendanceForm";
			}
			
			return "redirect:/event/showAttendance";
		}
		@GetMapping(value = "event/update")
		public String showDataForm(				
				//@PathVariable("aid") Integer aid, 
				Model model,
				@RequestParam(value="aid" ,required = false)Integer aid ) {
			Attendance attendance = attendanceService.getAttendance(aid);
			model.addAttribute(attendance);
			System.out.println("編輯前:"+attendance);
			
			
			
			return "event/update";
		}
		
		
		@PostMapping(value = "event/update")		
		public String modify(
				@ModelAttribute("attendance") Attendance attendance, 
				BindingResult result, 
				Model model,
//				@PathVariable Integer id, 
				HttpServletRequest request,
				@RequestParam(value="eventid")Integer eventid,
				@RequestParam(value="memberid")Integer memberid
				) {
			
			System.out.println("報名編輯:"+attendance);
			AttendanceValidator validator = new AttendanceValidator();
			attendance.setMember(memberService.getMember(memberid));
			attendance.setEvent(eventService.getEvent(eventid));
			validator.validate(attendance, result);
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), attendance=" + attendance);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "event/update";
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
//		
//		@GetMapping(value="")
//		public ModelAndView  showevent(@RequestParam(value="aid",required = false)Integer aid) {
//			
//			ModelAndView mav=new ModelAndView();
//			mav.addObject("aid", aid);
//			mav.setViewName("event/attendanceForm");
//			
//			return mav;
//			
//		}
		
		
		
		
}
