package message.service.impl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import message.dao.MessageDao;
import message.model.MessageBean;
import message.service.MessageService;



@Service
@Transactional

public class MessageServiceImpl implements MessageService {
	
	
	@Autowired
	MessageDao dao;
	
	
	@Override
	public boolean isDup(String id) {
		
		return dao.isDup(id);
			
	}


	@Override
	public int save(MessageBean mb) {
		int count=0;
		
		try {
			count=dao.save(mb);
			System.out.println("message儲存成功");
		}catch (Exception e) {
			
			System.out.println("message儲存異常");
			e.printStackTrace();
		}
		

		return	count;
	
	}
	
	@Override
	public List<MessageBean> getAllMessages() {
		
		return dao.getAllMessages();
			
	}


	@Override
	public MessageBean getMessage(String id) {
					
		return dao.getMessage(id);
	}


	@Override
	public int deleteMessage(String id) {
		
		return dao.deleteMessage(id);
	}


	@Override
	public int updateMessage(MessageBean mb) {		
						
		return dao.updateMessage(mb);
	}


	@Override
	public List<MessageBean> queryMessage(String sql) {
		
		return dao.queryMessage(sql);
	}
	
	public List<String> queryMessageType(){
		
		
		return dao.queryMessageType();
		
	}


	@Override
	public List<MessageBean> getRandomMessage(int num) {
		
		return dao.getRandomMessage(num);
	}

}
