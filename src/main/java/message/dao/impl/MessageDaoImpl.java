package message.dao.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import message.dao.MessageDao;
import message.model.MessageBean;

@Repository

public class MessageDaoImpl implements MessageDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean isDup(String id) {
		boolean result = false;
		String hql = "FROM MessageBean m WHERE m.id = :id0";
		Session session = factory.getCurrentSession();

		Query<MessageBean> query = session.createQuery(hql);
		List<MessageBean> list = query.setParameter("id0", id).getResultList();
		if (list.size() > 0) {
			result = true;
		}

		return result;
	}

	/**
	 * 自訂編號方法
	 */
	@SuppressWarnings("unchecked")
	@Override
	public String getNewId(Date date) {

		String hql = "FROM MessageBean m WHERE m.date = :today order by m.id";
		Session session = factory.getCurrentSession();

		Query<MessageBean> query = session.createQuery(hql);
		List<MessageBean> list = query.setParameter("today", date).getResultList();

		SimpleDateFormat f = new SimpleDateFormat("yyyyMMdd");
		String tempID = f.format(date);

		if (list.size() > 0) {// 如果今天已經有資料
			Integer index = Integer.parseInt(list.get(list.size() - 1).getId().substring(8));
			System.out.println("current index="+index);
			index+=1;
			tempID += String.format("%03d", index);
			System.out.println("tempID:" + tempID);

		} else {
			tempID += "001";
			System.out.println("tempID:" + tempID);
		}
		System.out.println("result:" + tempID);
		return tempID;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MessageBean> getAllMessages() {
		List<MessageBean> list = new ArrayList<>();
		String hql = "FROM MessageBean order by id desc";
			Session session = factory.getCurrentSession();

		Query<MessageBean> query = session.createQuery(hql);
		list = query.getResultList();

		return list;
	}

	@Override
	public int save(MessageBean mb) {
		Date d = mb.getDate();
		String newID = this.getNewId(d);
		mb.setId(newID);
		int count = 0;
		Session session = factory.getCurrentSession();
//
		session.save(mb);
		//
		count++;

		return count;
	}

	@Override
	public MessageBean getMessage(String pk) {

		MessageBean mb = null;
		Session session = factory.getCurrentSession();

		mb = session.get(MessageBean.class, pk);

		return mb;

	}

	@Override
	public int deleteMessage(String id) {
		int count = 0;
		Session session = factory.getCurrentSession();
		MessageBean mb = new MessageBean();
		mb.setId(id);
		session.delete(mb);
		count++;

		return count;

	}

	@Override
	public int updateMessage(MessageBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(mb);
		count++;

		return count;
	}

	@Override
	public List<MessageBean> queryMessage(String sql) {
		List<MessageBean> list = new ArrayList<>();
		//String hql = "FROM MessageBean";
		Session session = factory.getCurrentSession();

		@SuppressWarnings("unchecked")
		Query<MessageBean> query = session.createNativeQuery(sql,MessageBean.class);
		list = query.getResultList();
	
		return list;
	}
	
	public List<String> queryMessageType(){
		List<String> types=new ArrayList<>();
		Session session=factory.getCurrentSession();
		Query<String> query=session.createNativeQuery("select distinct type from message_table");
		types=query.getResultList();
		
		
		return types;
	}
	
	public List<MessageBean> getRandomMessage(int num) {
		
	
		String sql = "select top "+num+" from message_table order by NEWID()";
			Session session = factory.getCurrentSession();
		List<MessageBean> list=new ArrayList<MessageBean>();
		
		
		@SuppressWarnings("unchecked")
		
	
		Query<MessageBean> query=session.createNativeQuery(sql );
		list = query.getResultList();	
		

		

		return list;
		
		
	}
}
