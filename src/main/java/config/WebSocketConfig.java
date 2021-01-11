//package config;
//
//import java.util.List;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.messaging.converter.MessageConverter;
//import org.springframework.messaging.simp.config.ChannelRegistration;
//import org.springframework.messaging.simp.config.MessageBrokerRegistry;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
//
//@Configuration
//@EnableWebSocketMessageBroker
//	public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{
//	    @Override
//	    public void registerStompEndpoints(StompEndpointRegistry registry) {
//	        //新增這個Endpoint，這樣在網頁中就可以通過websocket連線上服務了
//	        registry.addEndpoint("/webchat").withSockJS();
//	    }
//	     
//	    @Override
//	    public void configureMessageBroker(MessageBrokerRegistry config) {
//	        System.out.println("伺服器啟動成功");
//	        //這裡設定的simple broker是指可以訂閱的地址，也就是伺服器可以傳送的地址
//	        config.enableSimpleBroker("/userChat","/initChat","/initFushionChart","/updateChart","/videoChat");  
//	        config.setApplicationDestinationPrefixes("/app");   
//	    }
//
//	    @Override
//	    public void configureClientInboundChannel(ChannelRegistration channelRegistration) {
//	    }
//
//	    @Override
//	    public void configureClientOutboundChannel(ChannelRegistration channelRegistration) {
//	    }
//
//		@Override
//		public void configureWebSocketTransport(
//				WebSocketTransportRegistration registry) {
//			// TODO Auto-generated method stub
//			System.out.println("registry:"+registry);
//		}
//
//		@Override
//		public boolean configureMessageConverters(
//				List<MessageConverter> messageConverters) {
//			// TODO Auto-generated method stub
//			System.out.println("messageConverters:"+messageConverters);
//			return true;
//		}
//	}
//
//
