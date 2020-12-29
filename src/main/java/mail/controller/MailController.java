//package mail.controller;
//
//import java.io.File;
//
//import javax.mail.internet.MimeMessage;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.FileSystemResource;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//public class MailController {
//
//	@Autowired
//	private JavaMailSender mailSender;
//
//	@GetMapping(value = "email")
//	public String sendEmail() {
//		System.out.println("嘗試寄信");
//		boolean sendOK = false;
//
//		try {
//
//			SimpleMailMessage message = new SimpleMailMessage();
//
//			message.setFrom("2020AYCB@gmail.com");
//			message.setTo("armyant0920@gmail.com");
//
//			message.setSubject("test");
//			message.setText("ggggggg");
//
//			mailSender.send(message);
//
//			sendOK = true;
//
//			return "sendOK";
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "";
//
//	}
//
//}
//
////建立含特殊格式的mail
//
////MimeMessage mimeMessage=mailSender.createMimeMessage();
////MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true);//第二個參數表示含multipart
////helper.setFrom("2020AYCB@gmail.com");
////helper.setTo("armyant0920@gmail.com");
////String context=
////		"<html>\r\n"
////		+ "          <body>\r\n"
////		+ "            <h4>測試寄送廣告圖片</h4>\r\n"
////		+ "            <img src='cid:test01'/><br>\r\n"
////		+ "          </body>\r\n"
////		+ "         </html>";
////helper.setText(context,true);//第二個參數表示是html內容
////FileSystemResource file = new FileSystemResource(new File("C:\\Users\\user\\OneDrive\\桌面\\AYCB_combine\\AYCB_combine\\src\\main\\webapp\\WEB-INF\\views\\image"));
////helper.addInline("test01",file);
////mailSender.send(mimeMessage);
//
////MimeBodyPart textPart = new MimeBodyPart();
////StringBuffer html=new StringBuffer();
////html.append("<h1>this is your mail</h1><br>");
//// html.append("<img src='cid:image'/><br>");
//// textPart.setContent(html.toString(), "text/html; charset=UTF-8");
//// //
////   MimeBodyPart picturePart = new MimeBodyPart();
////    FileDataSource fds = new FileDataSource("logo.png");
////    picturePart.setDataHandler(new DataHandler(fds));
////    picturePart.setFileName(fds.getName());
////    picturePart.setHeader("Content-ID", "<image>");
////
////    Multipart email = new MimeMultipart();
////    email.addBodyPart(textPart);
////    email.addBodyPart(picturePart);
////
////    message.setContent(email);
////    message.addRecipient(Message.RecipientType.TO, new InternetAddress(
////                         "youremail@address"));
////    transport.connect();
////    transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO))
////                          ;
////    transport.close();
//
////
