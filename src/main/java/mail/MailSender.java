package mail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import member.MemberBean;

public class MailSender {
	
	public static final String SEND_FROM="2020AYCB@gmail.com";
	
	
	private static JavaMailSender mailSender;
	private static MimeMessage mimeMessage=mailSender.createMimeMessage();
	private static MimeMessageHelper helper;//第二個參數表示含multipart;
	
	
	public static String generateFindPasswordMail(MemberBean mb,String password) throws MessagingException {
	StringBuilder sb=new StringBuilder();
	mimeMessage.setSubject("dear "+mb.getName()+"您好,您的登入密碼已重置,請盡快登入並修改密碼");
	sb.append("<h1>Hi,"+mb.getName()+"</h1><br />");
	sb.append("<h2 style='color:red'>會員帳號密碼</h2><br />");
	sb.append("<h3>帳號："+mb.getAccount()+"<br/>重置密碼："+password+"<br />");
	sb.append("<a href=\"");
	sb.append("http://http://localhost/AYCB_final/");
	sb.append("\">");
	sb.append("官網連結");
	sb.append("</a>");
	sb.append("</body></html>");
	return sb.toString();
	
	}
	
	public static void sendEmail() throws MessagingException {
		
		
		helper=new MimeMessageHelper(mimeMessage,true,"utf-8");
		
		
	}
	
	
	

}
