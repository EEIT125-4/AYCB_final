package mail;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import tool.Common;

@Controller

public class MyMailSender {

	private static final String host = "smtp.gmail.com";
	private static final String SEND_FROM = "2020AYCB@gmail.com";
	private static final int port = 587;
	private static final String password = "AYCB@2020";

//	private static MimeMessage mimeMessage=mailSender.createMimeMessage();
//	private static MimeMessageHelper helper;//第二個參數表示含multipart;

//	public static String generateFindPasswordMail(MemberBean mb,String password) throws MessagingException {
//	StringBuilder sb=new StringBuilder();
//	mimeMessage.setSubject("dear "+mb.getName()+"您好,您的登入密碼已重置,請盡快登入並修改密碼");
//	sb.append("<h1>Hi,"+mb.getName()+"</h1><br />");
//	sb.append("<h2 style='color:red'>會員帳號密碼</h2><br />");
//	sb.append("<h3>帳號："+mb.getAccount()+"<br/>重置密碼："+password+"<br />");
//	sb.append("<a href=\"");
//	sb.append("http://http://localhost/AYCB_final/");
//	sb.append("\">");
//	sb.append("官網連結");
//	sb.append("</a>");
//	sb.append("</body></html>");
//	return sb.toString();
//	
//	}

	public static void sendverificationEmail(String mailTo, String name, String content, String sessionID)
			throws MessagingException {
		System.out.println("寄送驗證信");
		Properties props = new Properties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SEND_FROM, password);
			}
		});

		MimeMessage mimeMessage = new MimeMessage(session);

		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");

		helper.setTo(mailTo);
		StringBuilder sb = new StringBuilder();
		mimeMessage.setSubject("AYCB會員驗證");
		MimeMultipart multipart = new MimeMultipart("related");
		BodyPart messageBodyPart = new MimeBodyPart();
		sb.append(
				"<div style='background-image: url(cid:image);background-size: contain; width: 600px ;height: 600px;'>");
		sb.append("<div style=\"padding-left: 20%;padding-top: 20%;'>");
		sb.append("<h2>Hi," + name + "</h1><br />");
		sb.append("<p>" + content + "</p>");
		sb.append("<a href=\"");
		sb.append(Common.DOMAIN + "/AYCB_final/verification/" + sessionID);
		sb.append("\">");
		sb.append("<h3>點擊此連結啟用您的帳號</h3>");
		sb.append("</a>");
		sb.append(" </div>");
		sb.append(" </div>");
		sb.append("</body></html>");
			
		messageBodyPart.setContent(sb.toString(), "text/html;charset=utf-8");
		// add it
		multipart.addBodyPart(messageBodyPart);

		// second part (the image)
//		messageBodyPart = new MimeBodyPart();
//		DataSource fds = new FileDataSource(new File("C:\\Users\\user\\OneDrive\\桌面\\pics\\背景\\emailbackground.jfif"));
//
//		messageBodyPart.setDataHandler(new DataHandler(fds));
//		messageBodyPart.setHeader("Content-ID", "<image>");
//
//		multipart.addBodyPart(messageBodyPart);

		// put everything together 加入附件檔案
    					mimeMessage.setContent(multipart);

		Transport.send(mimeMessage);

		System.out.println("Done");

	}

	/**
	 * 
	 * @param mailTo  收件信箱
	 * @param name    收件人名
	 * @param content 主要內容
	 * @param others  如果有更多參數
	 * @throws MessagingException
	 */
	public static void sendEmail(String mailTo, String name, String content, String... others)
			throws MessagingException {
		System.out.println("發信工作");
		Properties props = new Properties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SEND_FROM, password);
			}
		});

		String orderID = others[0];
		MimeMessage mimeMessage = new MimeMessage(session);

		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");

		helper.setTo(mailTo);
		StringBuilder sb = new StringBuilder();
		mimeMessage.setSubject("交易成功");
		MimeMultipart multipart = new MimeMultipart("related");
		BodyPart messageBodyPart = new MimeBodyPart();
		sb.append(
				"<div style='background-image: url(cid:image);background-size: contain; width: 600px ;height: 600px;'>");
		sb.append("<div style='padding-top:  100px;'>");
		sb.append("<h2>Hi," + name + ",您的訂單已成立,訂單號碼為:" + orderID + "</h1><br />");
		sb.append("<p>" + content + "</p>");
		sb.append("<a href=\"");
		sb.append(Common.DOMAIN + "/AYCB_final/selectOrderItem?selectindex=" + orderID);
		sb.append("\">");
		sb.append("<h3>前往官網查看訂單資訊</h3>");
		sb.append("</a>");
		sb.append(" </div>");
		sb.append(" </div>");
		sb.append("</body></html>");

		messageBodyPart.setContent(sb.toString(), "text/html;charset=utf-8");
		// add it
		multipart.addBodyPart(messageBodyPart);

		// second part (the image)
		messageBodyPart = new MimeBodyPart();
		DataSource fds = new FileDataSource(new File("C:\\Users\\user\\OneDrive\\桌面\\pics\\背景\\emailbackground.jfif"));

		//
		messageBodyPart.setDataHandler(new DataHandler(fds));
		messageBodyPart.setHeader("Content-ID", "<image>");

		// add image to the multipart
		multipart.addBodyPart(messageBodyPart);

		// put everything together 加入附件檔案
    					mimeMessage.setContent(multipart);
		// Send message

		Transport.send(mimeMessage);

		System.out.println("Done");

		//

//		MimeMessage mimeMessage = mailSender.createMimeMessage();
//		MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true,"utf-8");
//				
//		helper.setTo(mailTo);
//		StringBuilder sb = new StringBuilder();
//		mimeMessage.setSubject("交易成功");
//		sb.append("<h2>Hi," + name + ",您的訂單已成立</h1><br />");
//		sb.append("<a href=\"");
//		sb.append("http://localhost:8080/AYCB_final/");
//		sb.append("\">");
//		sb.append("<h3>前往官網查看訂單資訊</h3>");			
//		sb.append("</a>");
//		sb.append("</body></html>");
//
//		MimeMultipart mimeMultipart = new MimeMultipart();
//
//		BodyPart part = new MimeBodyPart();
//		part.setContent(sb.toString(), "text/html");
//
//		mimeMultipart.addBodyPart(part);
//
//		mimeMessage.setContent(sb.toString(), "text/html;charset=utf-8");
//		mailSender.send(mimeMessage);		
	}

}
