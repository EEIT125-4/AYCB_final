package mail.controller;

import java.io.File;
import java.util.List;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberBean;
import member.Service.MemberService;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	MemberService ms;

	@GetMapping(value = "email")
	@ResponseBody
	public String sendEmail() {
		System.out.println("嘗試寄信");
		boolean sendOK = false;

		try {
			//一般文本或連結
//			SimpleMailMessage message = new SimpleMailMessage();
//
//			message.setFrom("2020AYCB@gmail.com");
//			message.setTo("armyant0920@gmail.com");
//
//			message.setSubject("影片連結");
//			message.setText("https://youtu.be/oILdgQ9e0IY");
//
//			mailSender.send(message);
			
			//html郵件
			
			
			
			
//			
			
			
//			MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true,"utf-8");//第二個參數表示含multipart
//			helper.setFrom("2020AYCB@gmail.com");
//			helper.setTo("armyant0920@gmail.com");
			
//			mimeMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("e033258440@yahoo.com.tw"));
			
			List<MemberBean>list=ms.getAllMembers();
			for(MemberBean m:list) {
				System.out.println("get member:"+m.getName());
				
				if(m.getName().contains("kevin")) {
					MimeMessage mimeMessage=mailSender.createMimeMessage();
					MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true,"utf-8");//第二個參數表示含multipart
					helper.setFrom("2020AYCB@gmail.com");
					String address=m.getEmail();
					helper.setTo(m.getEmail());
					
//					mimeMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(address));
					
					StringBuilder sb=new StringBuilder();
					
					mimeMessage.setSubject("dear "+m.getName()+"您好,請在收到信件後嘗試連線並Line回覆我");
					sb.append("<h1>Hi,"+m.getName()+"</h1><br />");
					sb.append("<h2 style='color:red'>會員帳號密碼</h2><br />");
					sb.append("<h3>帳號："+m.getAccount()+"<br/>用戶密碼："+m.getPassword()+"<br />");
					sb.append("<a href=\"");
					sb.append("http://http://localhost/AYCB_final/");
					sb.append("\">");
					sb.append("官網連結");
					sb.append("</a>");
					sb.append("</body></html>");
					
					MimeMultipart mimeMultipart=new MimeMultipart();
					
					
					BodyPart part=new MimeBodyPart();
					part.setContent(sb.toString(),"text/html");
					
					
					mimeMultipart.addBodyPart(part);
					
					

					mimeMessage.setContent(sb.toString(), "text/html;charset=utf-8");
//					helper.setText(context,true);//第二個參數表示是html內容
					
					
					mailSender.send(mimeMessage);
					
					
					
					  // Create a default MimeMessage object.
//			         Message message = mailSender.createMimeMessage();

			         // Set From: header field of the header.
//			         message.setFrom(new InternetAddress(from));

			         // Set To: header field of the header.
//			         message.setRecipients(Message.RecipientType.TO,
//			            InternetAddress.parse(to));

			         // Set Subject: header field
			         mimeMessage.setSubject("imageTest");

			         // This mail has 2 part, the BODY and the embedded image
			         MimeMultipart multipart = new MimeMultipart("related");

			         // first part (the html)
			         BodyPart messageBodyPart = new MimeBodyPart();
			         String htmlText = "<H1>Hello</H1><img src='cid:image'>";
			         messageBodyPart.setContent(htmlText, "text/html");
			         // add it
			         multipart.addBodyPart(messageBodyPart);

			         // second part (the image)
			         messageBodyPart = new MimeBodyPart();
			         DataSource fds = new FileDataSource(new File("C:\\Users\\user\\OneDrive\\桌面\\pics\\可愛動圖\\tedXr7Y.gif"));

			         messageBodyPart.setDataHandler(new DataHandler(fds));
			         messageBodyPart.setHeader("Content-ID", "<image>");

			         // add image to the multipart
			         multipart.addBodyPart(messageBodyPart);

			         // put everything together
			         mimeMessage.setContent(multipart);
			         // Send message
			         mailSender.send(mimeMessage);

			         System.out.println("Sent message successfully....");
			         sendOK = true;

						

			     
			   }
			}
			
			MimeMessage mimeMessage=mailSender.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true,"utf-8");//第二個參數表示含multipart
			helper.setFrom("2020AYCB@gmail.com");
			
			helper.setTo("f19352125@gmail.com");								
	        mimeMessage.setSubject("imageTest");
	      
	         MimeMultipart multipart = new MimeMultipart("related");
	        
	         BodyPart messageBodyPart = new MimeBodyPart();
	         String htmlText = "<H1>Hello</H1><img src='cid:image'>";
	         messageBodyPart.setContent(htmlText, "text/html");
	         // add it
	         multipart.addBodyPart(messageBodyPart);

	         // second part (the image)
	         messageBodyPart = new MimeBodyPart();
	         DataSource fds = new FileDataSource(new File("C:\\Users\\user\\OneDrive\\桌面\\pics\\可愛動圖\\YSmWA3g.gif"
	         		+ ""
	         		+ ""));

	         messageBodyPart.setDataHandler(new DataHandler(fds));
	         messageBodyPart.setHeader("Content-ID", "<image>");

	         // add image to the multipart
	         multipart.addBodyPart(messageBodyPart);

	         // put everything together
	         mimeMessage.setContent(multipart);
	         // Send message
	         mailSender.send(mimeMessage);

	         System.out.println("Sent message 貞");
	         sendOK = true;
			

			      } catch (MessagingException e) {
			         throw new RuntimeException(e);
			        
					
					
				}
		
         return "sendOK";
			
		
	}
	
	public String sendComplexEmail() {
		
		
		
		return "";
	}



}

//建立含特殊格式的mail

//MimeMessage mimeMessage=mailSender.createMimeMessage();
//MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true);//第二個參數表示含multipart
//helper.setFrom("2020AYCB@gmail.com");
//helper.setTo("armyant0920@gmail.com");
//String context=
//		"<html>\r\n"
//		+ "          <body>\r\n"
//		+ "            <h4>測試寄送廣告圖片</h4>\r\n"
//		+ "            <img src='cid:test01'/><br>\r\n"
//		+ "          </body>\r\n"
//		+ "         </html>";
//helper.setText(context,true);//第二個參數表示是html內容
//FileSystemResource file = new FileSystemResource(new File("C:\\Users\\user\\OneDrive\\桌面\\AYCB_combine\\AYCB_combine\\src\\main\\webapp\\WEB-INF\\views\\image"));
//helper.addInline("test01",file);
//mailSender.send(mimeMessage);

//MimeBodyPart textPart = new MimeBodyPart();
//StringBuffer html=new StringBuffer();
//html.append("<h1>this is your mail</h1><br>");
// html.append("<img src='cid:image'/><br>");
// textPart.setContent(html.toString(), "text/html; charset=UTF-8");
// //
//   MimeBodyPart picturePart = new MimeBodyPart();
//    FileDataSource fds = new FileDataSource("logo.png");
//    picturePart.setDataHandler(new DataHandler(fds));
//    picturePart.setFileName(fds.getName());
//    picturePart.setHeader("Content-ID", "<image>");
//
//    Multipart email = new MimeMultipart();
//    email.addBodyPart(textPart);
//    email.addBodyPart(picturePart);
//
//    message.setContent(email);
//    message.addRecipient(Message.RecipientType.TO, new InternetAddress(
//                         "youremail@address"));
//    transport.connect();
//    transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO))
//                          ;
//    transport.close();

//


// 段落
//StringBuilder sb=new StringBuilder();
//
//
//sb.append("<h1>Hi~</h1><br />");
//sb.append("<h2 style='color:red'>重置帳戶密碼：</h2><br />");
//sb.append("<h3>帳號：AAA<br />用戶密碼：123456<br />");
//sb.append("<a href=\"");
//sb.append("http://localhost:8080/AYCB/");
//sb.append("\">");
//sb.append("官網連結");
//sb.append("</a>");
//sb.append("</body></html>");
//
//MimeMultipart mimeMultipart=new MimeMultipart();
//
//
//BodyPart part=new MimeBodyPart();
//part.setContent(sb.toString(),"text/html");
//
//mimeMultipart.addBodyPart(part);
//
//
//
//mimeMessage.setContent(sb.toString(), "text/html;charset=utf-8");
////helper.setText(context,true);//第二個參數表示是html內容
//
//
//mailSender.send(mimeMessage);
//


