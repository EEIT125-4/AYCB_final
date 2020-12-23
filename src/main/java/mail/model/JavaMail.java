package mail.model;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import tool.Common;

public class JavaMail {
	
	private static JavaMail instance;
	private static Session session;
	
	public static JavaMail getInstance() {
		
		if(instance==null) {
			
			synchronized (JavaMail.class) {
				instance=new JavaMail();
				
				Properties prop = new Properties();
				prop.setProperty("mail.host", "smtp.qq.com");
		        // 使用的協議（JavaMail規範要求）
		        prop.setProperty("mail.transport.protocol", "smtp");
		        // 需要請求認證
		        prop.setProperty("mail.smtp.auth", "true");
//				session
				
				
				
			}
		}
		
		return instance;
		
	}
	
	
	
	
	/*public static void main(String[] args) {
        // 配置參數
        Properties prop = new Properties();
        // 發件人的郵箱的SMTP 服務器地址（不同的郵箱，服務器地址不同，如139和qq的郵箱服務器地址不同）
        prop.setProperty("mail.host", "smtp.qq.com");
        // 使用的協議（JavaMail規範要求）
        prop.setProperty("mail.transport.protocol", "smtp");
        // 需要請求認證
        prop.setProperty("mail.smtp.auth", "false");

        // 使用JavaMail發送郵件的5個步驟
        // 1、創建session
        Session session = Session.getInstance(prop);
        // 開啟Session的debug模式，這樣就可以查看到程序發送Email的運行狀態
        session.setDebug(true);
        Transport ts = null;
        try {
            // 2、通過session得到transport對象
            ts = session.getTransport();
            // 3、使用郵箱的用戶名和密碼連接郵件服務器（不同類型的郵箱不一樣，網易郵箱輸入的是用戶名和密碼，這裏我用的qq郵箱，輸入的是郵箱用戶名和smtp授權碼，smtp授權碼可登陸郵箱，進入設置啟動smtp服務後獲取）
            // 發送郵件時，發件人需要提交郵箱的用戶名和密碼給smtp服務器，用戶名和密碼都通過驗證之後才能夠正常發送郵件給收件人。
            ts.connect("smtp.qq.com", "你的郵箱號 如：***@qq.com", "smtp授權碼（登錄郵箱啟動smtp服務後可獲取）");
            // 4、創建郵件
//            Message message = createComplexMail(session);
            // 5、發送郵件
            ts.sendMessage(message, message.getAllRecipients());
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }finally {
            try {
                // 關閉transport對象
                ts.close();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
    }*/
	
	public static void  sendSimpleMail(MimeMessage message) {
		
		
		
		
		
		
	}
	

	
	public static MimeMessage createSimpleMail(Session session,String email,String title,String content)
            throws MessagingException {
        // 創建郵件對象
        MimeMessage message = new MimeMessage(session);
        // 指明發件人
        message.setFrom(Common.EMAIL_SENDER);
        // 指明收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        // 郵件的標題
        message.setSubject(title);
        // 郵件的文本內容
        message.setContent(content, "text/html;charset=UTF-8");
        return message;
    }

	 /**
     * 創建一封包含文本、圖片、文件的郵件
     *
     * @param session
     * @return
     * @throws MessagingException
     * @throws UnsupportedEncodingException
     */
    public static MimeMessage createComplexMail(Session session,String email,String title)
            throws MessagingException, UnsupportedEncodingException {
        // 創建郵件對象
        MimeMessage message = new MimeMessage(session);
        // 指明發件人
        message.setFrom(new InternetAddress(Common.EMAIL_SENDER));
        // 指明收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        // 郵件的標題
        message.setSubject(title);

        // 郵件內容：文件、圖片的添加步驟
        // 1. 創建圖片“節點”
        MimeBodyPart image = new MimeBodyPart();
        // 讀取本地文件
        DataHandler dh = new DataHandler(new FileDataSource("‪C:\\Users\\user\\OneDrive\\桌面\\pics\\gentleman.png"));
        // 將圖片數據添加到“節點”
        image.setDataHandler(dh);
        // 為“節點”設置一個唯一編號（在文本“節點”將引用該ID）
        image.setContentID("image_fairy_tail");

        // 2. 創建文本“節點”
        MimeBodyPart text = new MimeBodyPart();
        //    這裏添加圖片的方式是將整個圖片包含到郵件內容中, 實際上也可以以 http 鏈接的形式添加網絡圖片
        text.setContent("這是一條測試郵件</br>測試使用代碼發送圖片和文件<br/><img src=‘cid:image_fairy_tail‘/>", "text/html;charset=UTF-8");

        // 3. （文本+圖片）設置 文本 和 圖片 “節點”的關系（將 文本 和 圖片 “節點”合成一個混合“節點”）
        MimeMultipart mm_text_image = new MimeMultipart();
        mm_text_image.addBodyPart(text);
        mm_text_image.addBodyPart(image);
        // 關聯關系
        mm_text_image.setSubType("related");

        // 4. 將 文本+圖片 的混合“節點”封裝成一個普通“節點”
        //    最終添加到郵件的 Content 是由多個 BodyPart 組成的 Multipart, 所以我們需要的是 BodyPart,
        //    上面的 mm_text_image 並非 BodyPart, 所有要把 mm_text_image 封裝成一個 BodyPart
        MimeBodyPart text_image = new MimeBodyPart();
        text_image.setContent(mm_text_image);

        // 5. 創建附件“節點”
        MimeBodyPart attachment = new MimeBodyPart();
        // 讀取本地文件
        DataHandler dh2 = new DataHandler(new FileDataSource("‪C:\\Users\\user\\OneDrive\\桌面\\pics\\gentleman.png"));
        // 將附件數據添加到“節點”
        attachment.setDataHandler(dh2);
        // 設置附件的文件名（需要編碼）
        attachment.setFileName(MimeUtility.encodeText(dh2.getName()));

        // 6. 設置（文本+圖片）和 附件 的關系（合成一個大的混合“節點” / Multipart ）
        MimeMultipart mMultipart = new MimeMultipart();
        mMultipart.addBodyPart(text_image);
        // 如果有多個附件，可以創建多個多次添加
        mMultipart.addBodyPart(attachment);
        // 混合關系
        mMultipart.setSubType("mixed");
        // 7. 設置整個郵件的關系（將最終的混合“節點”作為郵件的內容添加到郵件對象）
        message.setContent(mMultipart);
        // 8. 設置發件時間
        message.setSentDate(new Date());
        // 9. 保存上面的所有設置
        message.saveChanges();
        return message;
    }
}
	


