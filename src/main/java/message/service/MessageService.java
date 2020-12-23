package message.service;

import java.util.List;

import message.model.MessageBean;


public interface MessageService {
	boolean isDup(String id);

	int save(MessageBean mb);

	List<MessageBean> getAllMessages();

	MessageBean getMessage(String id);

	int deleteMessage(String id);

	int updateMessage(MessageBean mb);
	
	List<MessageBean>queryMessage(String sql);
	
	List<String> queryMessageType();
	
	List<MessageBean> getRandomMessage(int num);
	
	

}
