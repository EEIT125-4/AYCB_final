package event.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import event.model.Attendance;
import event.model.Event;
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
	
		@GetMapping("event/ajaxShowAttendance")
		public@ResponseBody List<Attendance> ajaxlist(
//				Model model
				) {	
			System.out.println("成功進入ajaxshowattendancce");
			List<Attendance> list = new ArrayList<Attendance>();
			list = attendanceService.getAllAttendance();
			System.out.println("印出"+list);
			return list;
			
			
//			return attendanceService.getAllAttendance();
		}
		
		//查詢會員報名的活動
		@GetMapping("event/showAllAttendanceByID")
		public String attendancelist(Model model,
			 @RequestParam (value="id") Integer id
			) {
//			System.out.println(id);
//			Integer id=memberService.getMember(account).getId();
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(id);
			model.addAttribute("attendancelist",attendancelist);
			System.out.println("attendancelist"+attendancelist);
			
			return "event/showAttendanceByID";
		}
		
		//查詢參加活動的會員
		@GetMapping("event/showAllAttendanceByEvent")
		public String attendanceOfEvent(Model model,
				@RequestParam(value="eventid") Integer eventid
				) {
			System.out.println("查詢參加活動的會員");
			List<Attendance> attendanceOfEvent=attendanceService.getAllAttendancebyEvent(eventid);
			model.addAttribute("attendanceOfEvent", attendanceOfEvent);
			System.out.println(attendanceOfEvent);
			
			return "event/showAttendanceByEvent";
		}
		

		//新增報名
		@GetMapping("event/attendanceForm")
		public String showEmptyForm(Model model,
				@RequestParam(value="eventid" ) Integer eventid //取得attendanceForm值
			   ,@RequestParam(value="membercatcher" ,required = false) String membercatcher //取得member值
				) {
			System.out.println("--------------"+ membercatcher);
			if(membercatcher!="") {
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
			
		}else {
			return "member/login";
		}
		}
		
		@PostMapping("event/attendanceForm")
		public String add(
				@ModelAttribute("attendance") Attendance attendance,
				BindingResult result, Model model,
				@RequestParam (value="eventid" ) Integer eventid,
				@RequestParam (value="account" ) String account,
				HttpServletRequest request) {
			System.out.println("會員帳號++++++++++++++++++++"+account);
			AttendanceValidator validator =new AttendanceValidator();
			validator.validate(attendance, result);
			if(result.hasErrors()) {
				return "event/attendanceForm";
			}
			try {
				System.out.println("------------------------------------------------------------------------------"+eventid);
				Event event = eventService.getEvent(eventid);
				event.setPax(attendance.getPax()+event.getPax());
				eventService.updateEvent(event);
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
			
			Integer id=memberService.getMember(account).getId();
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(id);
			model.addAttribute("attendancelist",attendancelist);
			System.out.println("attendancelist"+attendancelist);
			
			return "event/showAttendanceByID";
			
			
		}
		
		//更新報名資料
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
			return "redirect:/event/showAttendanceByID";
		}	
		
		
		@GetMapping(value = "event/delete")
		public String delete(
			//	@PathVariable("aid") Integer aid
				@RequestParam(value="aid" ,required = false)Integer aid
				) {
			attendanceService.deleteAttendance(aid);
			return "redirect:/event/showAttendanceByID";
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
