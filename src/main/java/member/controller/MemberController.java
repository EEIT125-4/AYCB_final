package member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import antlr.build.Tool;
import member.MemberBean;
import member.Service.MemberService;
import tool.Common;
import tool.GlobalService;

@Controller

@SessionAttributes("memberBean")


public class MemberController {

    @Autowired
	SessionFactory factory ;
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberService memberService;

	@GetMapping(value = { "/member/login" })
	public String login() {

		return "member/login"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}

	@GetMapping(value = { "/member/center" })
	public String center() {

		return "member/center"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}

	@GetMapping("/register") // 註冊頁
	public String getregister(Model model) {
		MemberBean memberbean = new MemberBean();

		model.addAttribute("member", memberbean);

		System.out.println("member" + memberbean.getName());

		return "member/register";
	}

	@PostMapping("/accountcheck")
	@ResponseBody
	public List<MemberBean> Check() {

		List<MemberBean> list = memberService.getAllMembers();
		for (MemberBean m : list) {

			System.out.println("acc:" + m.getAccount());
		}

		return list;// memberService.checkDup();

	}

	@PostMapping("/memberConfirm") // 確認頁
	public String register(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
			HttpServletRequest request) {

		member.setId(null);

		member.setPhone("");

		model.addAttribute("member", member);

		if (memberService.isDup(member.getAccount())) {
			return "member/register";

		} else {
			return "member/memberConfirm";
		}

	}

	@PostMapping("/insert") // 新增
	public String insert(@ModelAttribute("member") MemberBean member, BindingResult result, Model model
	// HttpServletRequest request

	) {
		
		System.out.println("取得" + member.getAccount());
		String password=member.getPassword();
		System.out.println("原始密碼:"+password);
		password=Common.getMD5Endocing(password);
		System.out.println("加密後密碼:"+password);
		member.setPassword(password);
		memberService.insertregister(member);
		
		
		return "member/login";

	}

	@RequestMapping("/captcha") // 顯示圖形驗證碼
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {

		SpecCaptcha captcha = new SpecCaptcha(130, 48);

		CaptchaUtil.out(captcha, request, response);
//        System.out.println("+++++++++++++"+captcha);

	}

	@PostMapping("/login") // 登入
	public String checklogin(@RequestParam(value = "user", required = false) String user,
			@RequestParam(value = "pwd", required = false) String pwd, Model model, String Qcode, HttpSession session,
			HttpServletRequest request) {
		System.out.println("驗證中,輸入值為"+Qcode);
		boolean login = false;
		if (user.equals("") || pwd.equals("") || Qcode.equals("")) {
			System.out.println("有輸入值為空");

			login=false;
		}
		
		

		if (memberService.identify(user, pwd)) {
			System.out.println("登入成功");
			MemberBean mb=memberService.getMember(user);
			
			session.setAttribute("member", mb);
			return "index";
		}else {
			System.out.println("登入失敗");
			return "member/login";	
		}

	}

	@GetMapping("/logout") // 登出
	public String logout(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
			HttpSession session, HttpServletRequest request) {
		session.removeAttribute("member");
//		System.out.println(member);
//		MemberBean m2 = (MemberBean) request.getAttribute("member");
//
//		// System.out.println("m2:"+m2.getName());
//		System.out.println("取得" + member.getAccount());

		return "index";

	}

	@GetMapping("member/update") // 更新Get
	public String update(Model model) {

		return "member/update";

	}

	@PostMapping("/member/updateComplete") // 更新post
	public String updateComplete(Model model, HttpSession session,
			@RequestParam(value = "username", required = false) String name,
			@RequestParam(value = "useraddress", required = false) String address,
			@RequestParam(value = "userphone", required = false) String phone,
			@RequestParam(value = "useremail", required = false) String email,
			@RequestParam(value = "pwd", required = false) String pwd,
			@RequestParam(value = "birth", required = false) Date birth) {
		System.out.println("確認更新===============");
		MemberBean mb = (MemberBean) session.getAttribute("member");
		mb.setName(name);
		mb.setAddress(address);
		mb.setPhone(phone);

		mb.setPassword(pwd);
		System.out.println("目前名字是" + mb.getName());
		memberService.update(mb);
		return "index";

	}



      @PostMapping("member/google")
     
      public String googlelogin (@RequestParam(value = "googlename", required = false) String name ,
		 @RequestParam(value = "googlegender", required = false) String gender,
		 @RequestParam(value = "googleemail", required = false) String email)
		  {
    	  boolean res=memberService.emailcheck(email);
    	  if(res==false) 
    	  {MemberBean memberBean=new MemberBean(0, null, name, null, null, null, null, email, gender, null);
    	  
    		  memberService.insertregister(memberBean);
  
    	  }
    	  System.out.println(res);
	     return "index";
      }
}
	
