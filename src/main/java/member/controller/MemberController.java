package member.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.utils.CaptchaUtil;

import member.MemberBean;
import member.Service.MemberService;
import tool.Common;
import tool.model.Image;
import tool.service.ImageService;

@Controller

@SessionAttributes("memberBean")


public class MemberController {

    @Autowired
	SessionFactory factory ;
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberService memberService;
	
	@Autowired
	ImageService imgService;

	@GetMapping(value = { "/member/login" })
	public String login() {

		return "member/login"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}
	
	@GetMapping(value="/member/changepassword")
	public String changePassword() {
		
		return "member/changePassword";
	}

	@GetMapping(value = { "/member/center" })
	public String center() {

		return "member/center"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}
	
	@GetMapping(value = { "/index" })
	public String index() {

		return "/index"; // 請視圖解析器由視圖的邏輯名稱index來找出真正的視圖
	}
	// 註冊頁
	@GetMapping("/register") 
	public String getregister(Model model) {
		MemberBean memberbean = new MemberBean();

		model.addAttribute("member", memberbean);

		System.out.println("member" + memberbean.getName());

		return "member/register";
	}
//帳號判斷
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

			System.out.println("acc:" + m.getEmail());
		}

		return list;// memberService.checkDup();

	}
	
	
	@GetMapping(value = "/member/Backstage")
	
	public String backstage() {
		
		return "member/memberBackstage";

	}
	
//	@GetMapping(value = "/member/refresh")
//	@ResponseBody
//	public boolean memberData(MemberBean mb) {
//		System.out.println("ajax request memberData");
//		
//		boolean update=false;
//		
//		
//		List<MemberBean> members = memberService.getAllMembers();// 訊息types
//	
//
//		return members;
//
//	}
	
	
	
	
	
	
	// 確認頁
	@PostMapping("/memberConfirm") 
	public String register(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
			HttpServletRequest request)
	{

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
	
	// 顯示圖形驗證碼
	@RequestMapping("/captcha") 
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {

		SpecCaptcha captcha = new SpecCaptcha(130, 48);

		CaptchaUtil.out(captcha, request, response);

	}

//驗證碼以及登入
	@PostMapping("/login") 
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
	
	// 更新
	@PostMapping("/member/updateComplete") 
	public String updateComplete(Model model, HttpSession session,
			@RequestParam(value = "username", required = false) String name,
			@RequestParam(value = "useraddress", required = false) String address,
			@RequestParam(value = "userphone", required = false) String phone,
			@RequestParam(value="introduce",required=false)String introduce,
			
			@RequestParam(value="file",required = false)MultipartFile file,		
			@RequestParam(value = "birth", required = false) Date birth) {
		
		System.out.println("確認更新===============");
		MemberBean mb = (MemberBean) session.getAttribute("member");
		mb.setName(name);
		mb.setAddress(address);
		mb.setPhone(phone);
		mb.setIntroduce(introduce);
		
		// 更新會員icon
		if (file != null && file.getSize() > 0) {
			System.out.println("有收到圖片");
			Image img = null;

			try {	
				if (mb.getIconid() != null && mb.getIconid()>0) {
					img = imgService.getImage(mb.getIconid());
					System.out.println("old圖片ID:" + img.getImgid());
				} else {
					System.out.println("沒有舊icon");
					img = new Image(file);
				}
				// 更新圖片名稱
				img.setImage(file);
				// 更新圖片內容
				imgService.saveImage(img);
				mb.setIconid(img.getImgid());
				System.out.println("圖片儲存完畢,id=" + img.getImgid()+",filename="+img.getFilename());

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
			}
		} else {
			System.out.println("沒有上傳icon");
		}
		
		memberService.update(mb);
		return "index";

	}
	

	//舊密碼更新
	@PostMapping("member/changeComplete") 
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
	
	
	//更改新密碼
	@PostMapping("member/newpassword") 
	@ResponseBody
	public boolean newpassword(Model model, HttpSession session,HttpServletRequest request,
			 HttpServletResponse response,
			@RequestParam(value = "new2", required = false) String pwd2,
			@RequestParam(value = "new3", required = false) String pwd3) {
				
		boolean kk = false;
		
	
		if(pwd2.equals(pwd3)&& pwd3!=""&&pwd2!="") {
			return true;
			
		}else {
			return kk;
		}
		
	
	}

		// 新密碼確認存取導向
	@PostMapping("/member/passwordgo") 
	public String passwordgo(Model model, HttpSession session,
			@RequestParam(value = "pwd3", required = false) String pwd3)
		 {
		System.out.println("確認更新===============");
		MemberBean mb = (MemberBean) session.getAttribute("member");
		pwd3=Common.getMD5Endocing(pwd3);
		mb.setPassword(pwd3);
		System.out.println(pwd3);
		System.out.println("目前名字是" + mb.getName());
		memberService.update(mb);
		session.removeAttribute("member");
		return "member/login";

	}
	

//	@GetMapping("member/forgotPassword")
//	@ResponseBody
//	public String forgotPassword(@RequestParam(value="email")String email) {
//		
//		if(email!=null && !email.equals("")) {
//			
//			if(memberService.emailcheck(email)) {
//				
//				//如果email存在,才重設密碼並寄出email
//				MemberBean mb=memberService.getMemberByEmail(email);
//				
//				
//				
//				
//				
//				
//			}else{
//				
//			}
//			
//			
//		}else {
//			return "email有誤";
//		}
//		
//		
//		return null;
//		
//		
//	}
	


//google第三方
      @PostMapping("member/google")
     @ResponseBody
      public boolean googlelogin (@RequestParam(value = "googlename", required = false) String name ,
		 @RequestParam(value = "googlegender", required = false) String gender,
		 HttpServletRequest request,
		 HttpServletResponse response,
		 HttpSession session,
	  @RequestParam(value = "googleemail", required = false) String email,
      @RequestParam(value = "googlebirth", required = false) String birth)
		  {
    	  System.out.println("birth"+birth);
    	  boolean res=memberService.emailcheck(email);
    	  MemberBean mb = new MemberBean();
    	  if(res==false){
    		  MemberBean memberBean=new MemberBean(0, null, name, null, null, null, null, email, gender, null,null);
    		  System.out.println("birth"+birth);
    	  
//    	  		Cookie[] cookies = request.getCookies();
//    	  		
//    	  		for(Cookie cookie: cookies) {
//    	  			System.out.println(cookie.getName());
//    	  			System.out.println(cookie.getValue());
//    	  		}
//    	  		Cookie cookie = new Cookie("abc", "123");
//    	  		cookie.setMaxAge(60*10);
//    	  		cookie.setPath("/AYCB");
//    	  		response.addCookie(cookie);
    	  		
    		  memberService.insertregister(memberBean);
    		  
//    		  MemberBean mb = (MemberBean) session.getAttribute("member");
//    		  
//  
//    	  }else {MemberBean mb = (MemberBean) session.getAttribute("member");
    	  }
    	  
    	  MemberBean mbb=memberService.getemail(email);
    	  
    	  session.setAttribute("member", mbb);
    	  
    	 
    	  
    	  return true;
		  }
     
      @GetMapping("/logout") // 登出
  	public String logout(@ModelAttribute("member") MemberBean member, BindingResult result, Model model,
  			HttpSession session, HttpServletRequest request) {
  		session.removeAttribute("member");

  		return "redirect:index";

  	}


      
      
      
}
	

