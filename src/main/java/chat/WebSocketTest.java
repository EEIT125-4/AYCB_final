//package chat;
//
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.net.URLDecoder;
//import java.util.HashMap;
//import java.util.Set;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnError;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.server.ServerEndpoint;
//
//import org.hibernate.Session;
//
//
///**
// @ServerEndpoint 注解标识该类是websocket类
// */
//@ServerEndpoint("/websocket")
//public class WebSocketTest {
//
//   //将用户的名字和每个websocket连接存在map集合中，static修饰，其他类可以直接调用
//	private static HashMap<String, WebSocketTest> webSocketMap = new HashMap<String, WebSocketTest>();
//
//   //session保存用户请求过来的信息
//	
//
//	private javax.websocket.Session session;
//	private String userName;
//
//
//	@OnOpen
//	public void onOpen(javax.websocket.Session session) {
//		this.session = session;
//		try {
//			this.userName = URLDecoder.decode(session.getQueryString().substring(session.getQueryString().indexOf("=") + 1),"UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			
//			e.printStackTrace();
//		}
//		webSocketMap.put(this.userName, this); //加入用户姓名和此连接
//
//		
//	}
//
//	/**
//	 *与服务器连接关闭时调用
//	 *將此UserName移除
//	 */
//	@OnClose
//	public void onClose() {
//		webSocketMap.remove(this.userName);
//		
//	}
//
//	/**
//	 *
//	 * 
//	 * @param message 
//	 * @param session
//	 * 收到来自客户端的消息时调用，session保存发送消息的客户端信息
//	 */
//	@OnMessage
//	public void onMessage(String message, javax.websocket.Session session) {
//		String messageUser=null;
//		try {
//			messageUser = URLDecoder.decode(session.getQueryString().substring(session.getQueryString().indexOf("=") + 1), "UTF-8");
//		} catch (UnsupportedEncodingException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//	
//	
//		Set<String> keys = webSocketMap.keySet();
//		for (String key : keys) {
//			if (!key.equals(messageUser)) {
//				try {
//					webSocketMap.get(key).sendMessage(messageUser+"say："+message);
//				} catch (IOException e) {
//		
//					e.printStackTrace();
//					continue;
//				}
//			}
//		}
//
//	}
//
//	/**
//	 *发生错误时调用
//	 * 
//	 * @param session
//	 * @param error
//	 */
//	@OnError
//	public void onError(Session session, Throwable error) {
//	
//		error.printStackTrace();
//	}
//
//
//	public void sendMessage(String message) throws IOException {
//		this.session.getBasicRemote().sendText(message);
//		// this.session.getAsyncRemote().sendText(message);
//	}
//
//
//	public static synchronized Set<String> getUser() {
//		
//		return webSocketMap.keySet();
//
//	}
//
//}