package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

//import javax.rmi.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import member.Service.MemberService;
import member.Service.MemberServiceImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("register do post");

		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		// To prevent caching
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", -1); // Prevents caching at the proxy server

		if (request.getParameter("submit") != null)
			gotoSubmitProcess(request, response);
		else if (request.getParameter("confirm") != null) {
			System.out.println("confirm");
			gotoConfirmProcess(request, response);
		} else if (request.getParameter("update") != null) {
			System.out.println("go to update");
			gotoUpdateProcess(request, response);
		}

	}



	public void gotoSubmitProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in submit process");
		String name;
		String  birthday;
		String acc;
		String pwd;
		String address;
		String phone;
		String email;
		String gender;

		name = request.getParameter("name").trim();
//		birthyear = Integer.parseInt(request.getParameter("byear").trim());
//		birthmonth = Integer.parseInt(request.getParameter("bmonth").trim());
		birthday = request.getParameter("bday").trim();
		acc = request.getParameter("acc").trim();
		pwd = request.getParameter("pwd").trim();
		phone = "";
		email = request.getParameter("email").trim();
		gender = request.getParameter("gender").trim();
		address = "";
//		java.sql.Date date = new java.sql.Date(birthyear - 1900, birthmonth, birthday);
		MemberBean register_name = new MemberBean(null, acc, name, pwd, address, phone, birthday, email, gender);
		
		// System.out.println("!!!!!");
		System.out.println("name" + register_name.getName());
		MemberService ms = new MemberServiceImpl();

		if (ms.isDup(acc)) {
			System.out.println("帳號重複");
			RequestDispatcher rd = request.getRequestDispatcher("member/register.jsp");
			rd.forward(request, response);
			return;
		} else {
			request.getSession(true).setAttribute("register_name", register_name);
			System.out.println("帳號OK");
			RequestDispatcher rd = request.getRequestDispatcher("member/memberConfirm.jsp");
			rd.forward(request, response);
			return;
		}

	}

	public void gotoConfirmProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		MemberBean mb = (MemberBean) request.getSession(true).getAttribute("register_name");
		MemberService ms = new MemberServiceImpl();
		ms.insertregester(mb);
		System.out.println(".................");
		// request.getSession(true).invalidate();//
		request.getRequestDispatcher("Home.jsp").forward(request, response);

	}

	public void gotoUpdateProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("update action");

		MemberBean a = (MemberBean) request.getSession(true).getAttribute("member");

		System.out.println(a);

		
		MemberService ms = new MemberServiceImpl();
		

		String address, phone, pwd = null;

		pwd = request.getParameter("pwd");

		address = request.getParameter("useraddress");
		phone = request.getParameter("userphone");

		a.setPassword(pwd);
		a.setAddress(address);
		a.setPhone(phone);
		ms.updateregister(a);

		request.getRequestDispatcher("Home.jsp").forward(request, response);

	}



	
	
	
}