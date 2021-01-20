package event.controller;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.validation.ObjectError;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import event.model.Attendance;
import event.model.Event;
import event.service.AttendanceService;
import event.service.EventService;
import event.validator.AttendanceValidator;
import member.MemberBean;
import member.Service.MemberService;


@Controller
//@SessionAttributes ({"attendance"})
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
			
			//return "event/showAllAttendanceBackstage";
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
			 @RequestParam (value="memberid") Integer memberid
			) {
			System.out.println(memberid);
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(memberid);
			model.addAttribute("attendancelist",attendancelist);
			System.out.println("attendancelist"+attendancelist);
			
			return "event/showAttendanceByID";
		}
		
		//查詢參加活動的會員
		@GetMapping("event/showAllAttendanceByEvent")
		public String attendanceOfEvent(Model model,
				@RequestParam(value="eventid") Integer eventid
				) {
			System.out.println(eventid);
			System.out.println("查詢參加活動的會員");
			List<Attendance> attendanceOfEvent=attendanceService.getAllAttendancebyEvent(eventid);
			model.addAttribute("attendanceOfEvent", attendanceOfEvent);
			System.out.println(attendanceOfEvent);
			
			return "event/showAttendanceByEvent";
		}
		

		//新增報名
		@GetMapping("event/attendanceForm")
		public String showEmptyForm(Model model,
				@RequestParam(value="eventid",required = false) Integer eventid, //取得attendanceForm值
			   @RequestParam(value="membercatcher" ,required = false) String membercatcher, //取得member值
			   @RequestParam(value="memberid" ,required = false) Integer memberid
//			   ,
//			   @RequestParam(value="member" ,required = false) MemberBean member
			   
				) {
			System.out.println("--------------"+ membercatcher);
			
			//判斷是否登入會員
			if(membercatcher!="") {
		    //判斷重複報名
			if(attendanceService.isDup(memberid, eventid)) {
			//加入event	
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+eventid);

			String eventname= eventService.getEvent(eventid).getEventname();
			System.out.println("eventname="+eventname);
			model.addAttribute("eventid", eventid);
			model.addAttribute("eventname", eventname);
			
			Attendance attendance = new Attendance(); //new attendanceForm 儲存格
			System.out.println("888888888888888888888888888888888888"+attendance);

			model.addAttribute("attendance",attendance);
			return "event/attendanceForm";
			}else {
				model.addAttribute("check","1");
				model.addAttribute("events", eventService.getAllEvent());
				return "event/showEvent";
			}
						
		}else {
			return "member/login";
		}
		}
		
		@PostMapping("event/attendanceForm")
		public String add(
				@ModelAttribute("attendance") Attendance attendance,
				BindingResult result,
				Model model,
				@RequestParam (value="eventid" ) Integer eventid,
				@RequestParam (value="account" ) String account,
				@RequestParam (value="eventname",required = false) String eventname,			
				HttpServletRequest request) {
			System.out.println("attendance="+attendance);
				System.out.println("abvcascascas"+eventname);
			AttendanceValidator validator =new AttendanceValidator();
			validator.validate(attendance, result);
			if(result.hasErrors()) {
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				System.out.println("1111111111111111");
				model.addAttribute("eventid", eventid);
				model.addAttribute("eventname",eventname);
				return "event/attendanceForm";
			}
			
				System.out.println("------------------------------------------------------------------------------"+eventid);
				Event event = eventService.getEvent(eventid);
				event.setPax(attendance.getPax()+event.getPax());
				if(event.getPax()<=event.getTotalpax()) {
					eventService.updateEvent(event);

				}else {
					System.out.println("222222222222222222222");
					model.addAttribute("eventid", eventid);
					model.addAttribute("pax1", "人數大於上限值，請重新輸入");
					return "event/attendanceForm";
				}
				
				attendance.setEvent(eventService.getEvent(eventid));
				attendance.setMember(memberService.getMember(account));		
				attendanceService.save(attendance);
			
			
			return "redirect:/event/trans";			
		}
		
		@GetMapping("event/trans")
		public String jumpturn(Model model,HttpSession session) {
			MemberBean mb = (MemberBean) session.getAttribute("member");
			Integer id=memberService.getMember(mb.getAccount()).getId();
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(id);
			model.addAttribute("attendancelist",attendancelist);
			return "event/showAttendanceByID";
		}
		
		//更新報名資料
		@GetMapping(value = "event/update")
		public String showDataForm(				
				//@PathVariable("aid") Integer aid, 
				Model model,
				@RequestParam(value="aid" ,required = false)Integer aid ) {
			Attendance attendance = attendanceService.getAttendance(aid);
			model.addAttribute("attendance",attendance);
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
				@RequestParam(value="oldpax")Integer pax,
//				@RequestParam(value="newpax")Integer newpax,
				@RequestParam(value="memberid")Integer memberid,
				@RequestParam(value="aid")Integer aid
				) {
			
			System.out.println("報名編輯:"+attendance);
			AttendanceValidator validator = new AttendanceValidator();
			validator.validate(attendance, result);
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), attendance=" + attendance);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
					Attendance attend = attendanceService.getAttendance(aid);
					model.addAttribute("attendance",attend);
				}return "event/update";
			}
			Event event = eventService.getEvent(eventid);
			System.out.println(attendance.getPax());
			event.setPax(event.getPax()-pax+attendance.getPax());
			if(event.getPax()<=event.getTotalpax()) {
				eventService.updateEvent(event);
			}else {
				System.out.println("222222222222222222222");				
				model.addAttribute("pax1", "人數大於上限值，請重新輸入");
				Attendance attend = attendanceService.getAttendance(aid);
				model.addAttribute("attendance",attend);
				return "event/update";
			}
			attendance.setEvent(eventService.getEvent(eventid));
			attendance.setMember(memberService.getMember(memberid));					
			attendanceService.updateAttendance(attendance);
			return "redirect:/event/trans";
		}	
		
		
		@GetMapping(value = "event/delete")
		public String delete(Model model,
				@RequestParam(value="id" ,required = false) Integer id,
				@RequestParam(value="aid" ,required = false)Integer aid,
				@RequestParam(value="eventid" ,required = false)Integer eventid				
				) {
			System.out.println("456456546");
			Event event = eventService.getEvent(eventid);
			Attendance attendance=attendanceService.getAttendance(aid);
			event.setPax(event.getPax()- attendance.getPax());
			eventService.updateEvent(event);
			attendanceService.deleteAttendance(aid);
			model.addAttribute("aa","123");
			List<Attendance> attendancelist=attendanceService.getAllAttendancebyID(id);
			model.addAttribute("attendancelist",attendancelist);
			return "event/showAttendanceByID";
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
