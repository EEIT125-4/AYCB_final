package member.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import member.MemberBean;
import member.Service.MemberService;

@Controller

@SessionAttributes("memberBean")

public class MemberController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberService memberService;

	@GetMapping(value = { "/member/login" })
	public String login() {

		return "member/login"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}

	@GetMapping("/register")  //註冊頁
	public String getregister(Model model) {
		MemberBean memberbean = new MemberBean();
	
		model.addAttribute("member", memberbean);

		System.out.println("member" + memberbean.getName());
		
		return "member/register";
	}

	@PostMapping("/memberConfirm")//確認頁
	public String register(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
			HttpServletRequest request) {

		member.setId(null);

		member.setPhone("0");

		model.addAttribute("member", member);

		if (memberService.isDup(member.getAccount())) {
			return "member/register";

		} else {
			return "member/memberConfirm";
		}

	}

	@PostMapping("/insert")//新增 
	public String insert(@ModelAttribute("member") MemberBean member, BindingResult result, Model model
	// HttpServletRequest request

	) {
		System.out.println("取得" + member.getAccount());
		memberService.insertregister(member);

		return "member/login";

	}

	@PostMapping("/login1")//登入
	public String checklogin(@RequestParam String user, @RequestParam String pwd, Model model, HttpSession session) {
		memberService.identify(user, pwd);

		MemberBean member = memberService.getMember(user);
		session.setAttribute("member", member);

		return "Home";

	}

	@GetMapping("/logout")//登出
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

	@GetMapping("member/update")//更新Get
	public String update(Model model) {

		return "member/update";

	}

	@PostMapping("/member/updateComplete")//更新post
	public String updateComplete(Model model, HttpSession session,
			@RequestParam(value = "username", required = false) String name,
			@RequestParam(value = "useraddress", required = false) String address,
			@RequestParam(value = "userphone", required = false) String phone,
			@RequestParam(value = "useremail", required = false) String email,
			@RequestParam(value = "pwd", required = false) String pwd) {
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

}
