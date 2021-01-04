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

import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.utils.CaptchaUtil;

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
	// 註冊頁
	@GetMapping("/register") 
	public String getregister(Model model) {
		MemberBean memberbean = new MemberBean();

		model.addAttribute("member", memberbean);

		System.out.println("member" + memberbean.getName());

		return "member/register";
	}
<<<<<<< Updated upstream

=======
//帳號判斷
>>>>>>> Stashed changes
	@PostMapping("/accountcheck")
	@ResponseBody
	public List<MemberBean> Check() {

		List<MemberBean> list = memberService.getAllMembers();
		for (MemberBean m : list) {

			System.out.println("acc:" + m.getAccount());
		}

		return list;// memberService.checkDup();

	}
	
	
	//信箱確認
	@PostMapping("/emailcheck")
	@ResponseBody
	public List<MemberBean> emailCheck() {

		List<MemberBean> list = memberService.getAllMembers();
		for (MemberBean m : list) {

			System.out.println("acc:" + m.getAccount());
		}

		return list;// memberService.checkDup();

	}
	
	
	
	
	
	
	// 確認頁
	@PostMapping("/memberConfirm") 
	public String register(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
			HttpServletRequest request) {

		member.setId(null);



		model.addAttribute("member", member);

		if (memberService.isDup(member.getAccount())) {
			return "member/register";

		} else {
			return "member/memberConfirm";
		}

	}
	// 新增
	@PostMapping("/insert") 
	public String insert(@ModelAttribute("member") MemberBean member, BindingResult result, Model model
	// HttpServletRequest request

	) {
		
		System.out.println("取得" + member.getAccount());
		String password=member.getPassword();
//		System.out.println("原始密碼:"+password);
		password=Common.getMD5Endocing(password);
//		System.out.println("加密後密碼:"+password);
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

//驗證碼以及登入
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
			
			if (!CaptchaUtil.ver(Qcode, request)) {
				CaptchaUtil.clear(request); // 清除session中的验证码
//	            return JsonResult.error("验证码不正确");
				System.out.println("驗證碼錯誤");
				

			}else {
				login=true;
			}
		}else {
			
			System.out.println("會員帳密錯誤");
			login=false;
			
			
		}
	

		if (login) {
			
			System.out.println("驗證成功");
			MemberBean mb = memberService.getMember(user);
			session.setAttribute("member", mb);
			return "index";

		} else {
			System.out.println("驗證失敗");
			return "member/login";
		}

	}
//更新會員資料
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
	

	//更新密碼
	@PostMapping("member/changeComplete") // 更新post
	@ResponseBody
	public boolean changeComplete(Model model, HttpSession session,HttpServletRequest request,
			 HttpServletResponse response,
			@RequestParam(value = "old", required = false) String oldpwd) {
		
		boolean pp =false;
		System.out.println("確認更新===============");
		System.out.println("oldpwd"+oldpwd);
		MemberBean mb = (MemberBean) session.getAttribute("member");
		System.out.println("mb"+mb);
		oldpwd=Common.getMD5Endocing(oldpwd);
		System.out.println("oldpwd"+oldpwd);
		System.out.println("passowrd"+mb.getPassword());
		
		
		if(mb.getPassword().equals(oldpwd)) {
			
			return true;
		}else {
			return pp;
		}
	

	}
	
	
	
	



      @PostMapping("member/google")
     @ResponseBody
      public String googlelogin (@RequestParam(value = "googlename", required = false) String name ,
		 @RequestParam(value = "googlegender", required = false) String gender,
		 @RequestParam(value = "googleemail", required = false) String email)
		  {
    	  boolean res=memberService.emailcheck(email);
    	  if(res==false) 
    	  {MemberBean memberBean=new MemberBean(0, null, name, null, null, null, null, email, gender, null,null);
    	  
    		  memberService.insertregister(memberBean);
  
    	  }
    	  System.out.println(res);
	     return "index";
      }
      
      @GetMapping("/logout") // 登出
  	public String logout(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
  			HttpSession session, HttpServletRequest request) {
  		session.removeAttribute("member");
//  		System.out.println(member);
//  		MemberBean m2 = (MemberBean) request.getAttribute("member");
  //
//  		// System.out.println("m2:"+m2.getName());
//  		System.out.println("取得" + member.getAccount());

  		return "redirect:index";

  	}


      
      
}
	
