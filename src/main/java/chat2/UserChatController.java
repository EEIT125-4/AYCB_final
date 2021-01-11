package chat2;
//package chat;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URLDecoder;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.messaging.handler.annotation.DestinationVariable;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.simp.SimpMessagingTemplate;
//import org.springframework.messaging.simp.annotation.SubscribeMapping;
//import org.springframework.stereotype.Controller;
//
//@Controller
//public class UserChatController {
//        //每個聊天室快取最大聊天資訊條數，該值由SpringMVC的配置檔案注入，超過該值將清理出快取
//	private int MAX_CHAT_HISTORY;
//
//	public void setMAX_CHAT_HISTORY(int MAX_CHAT_HISTORY) {
//		this.MAX_CHAT_HISTORY = MAX_CHAT_HISTORY;
//	}
//
//	@Resource
//	private GenericService genericService;
//	// 用於轉發資料 sendTo
//	private SimpMessagingTemplate template;
//        //訊息快取列表
//        private Map<String, Object> msgCache = new HashMap<String, Object>();
//
//	@Autowired
//	public UserChatController(SimpMessagingTemplate t) {
//		template = t;
//	}
//
//
//	/**
//	 * WebSocket聊天的相應接收方法和轉發方法
//	 * 客戶端通過app/userChat呼叫該方法，並將處理的訊息傳送客戶端訂閱的地址
//	 * @param userChat     關於使用者聊天的各個資訊
//	 */
//	@MessageMapping("/userChat")
//	public void userChat(ChatMessage chatMessage) {
//		// 找到需要傳送的地址(客戶端訂閱地址)
//		String dest = "/userChat/chat" + chatMessage.getRoomid();
//		// 獲取快取，並將使用者最新的聊天記錄儲存到快取中
//		Object cache = msgCache.get(chatMessage.getRoomid());
//		try {
//			chatMessage.setRoomid(URLDecoder.decode(chatMessage.getRoomid(),"utf-8"));
//			chatMessage.setUserName(URLDecoder.decode(chatMessage.getUserName(), "utf-8"));
//			chatMessage.setDeptName(URLDecoder.decode(chatMessage.getDeptName(), "utf-8"));
//			chatMessage.setChatContent(URLDecoder.decode(chatMessage.getChatContent(), "utf-8"));
//			chatMessage.setIsSysMsg(URLDecoder.decode(chatMessage.getIsSysMsg(),"utf-8"));
//			chatMessage.setCurTime(DateUtil.format(new Date(),DateUtil.formatStr_yyyyMMddHHmmss));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace(); 
//		}
//		// 傳送使用者的聊天記錄
//		this.template.convertAndSend(dest, chatMessage);
//                ((LimitQueue<ChatMessage>) cache).offer(chatMessage);
//	}
//
//	
//	@SubscribeMapping("/initChat/{roomid}")
//	public LimitQueue<ChatMessage> initChatRoom(@DestinationVariable String roomid) {
//		System.out.print("-------新使用者進入聊天室------");
//		LimitQueue<ChatMessage> chatlist = new LimitQueue<ChatMessage>(MAX_CHAT_HISTORY);
//		// 傳送使用者的聊天記錄
//		if (!msgCache.containsKey(roomid)) {
//			// 從來沒有人進入聊天空間
//			msgCache.put(roomid, chatlist);
//		} else {
//			chatlist = (LimitQueue<ChatMessage>) msgCache.get(roomid);
//		}
//		return chatlist;
//	}
//	
//}