package subscript;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import member.MemberBean;
import message.model.MessageBean;
import tool.HibernateUtils;

public class TestOfFollow {

	public static void main(String[] args) {
		
		SessionFactory factory = HibernateUtils.getSessionFactory();
		
		Session session=factory.getCurrentSession();
		
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			String hql = "FROM MemberBean m WHERE m.account = :account0";

			Query<MemberBean> query = session.createQuery(hql);
			MemberBean member = query.setParameter("account0", "jjj").getSingleResult();
			
			System.out.println("member:"+member.getName());
			@SuppressWarnings("unchecked")
			Query<MessageBean> query2=session.createNativeQuery("select top 1 * from message_table order by NEWID() ").addEntity(MessageBean.class);
			
			MessageBean message=(MessageBean)query2.getSingleResult();

			System.out.println("message:"+message.getMsg_id());
			
			
			
			
			
		
			tx.commit();
		}catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}
		
		finally{
			if (session != null)
			session.close();
		}
		HibernateUtils.shutdown();
			System.out.println("==================");
		}

		
	
	
		
//		MessageService ms2=new MessageServiceImpl();
//	
//		List<MessageBean>list=ms2.getRandomMessage(2);
//		
//		for(MessageBean m:list) {
//			System.out.println("message:"+m.getMsg_id());
//		}
//		System.out.println("===================");
		
		
//		subscript.model.FollowPK fPk=new subscript.model.FollowPK();
//		fPk.setMember(mBean);
//		fPk.setScriptType("girl");
		
		//Follow follow1=new Follow(fPk);
		
//		Follow follow1=new Follow();
//		follow1.setMember(member1);
//		follow1.setScriptType("type1");	
//		Follow follow2=new Follow();
//		
//		follow2.setMember(member2);
//		follow2.setScriptType("type2");
//		System.out.println("follow1:");
//		System.out.println(follow1);
//		System.out.println("follow2:");
//		System.out.println(follow2);
//		
//		System.out.println("==============");
//		
//		
//		SessionFactory factory = HibernateUtils.getSessionFactory();
//		Session session = factory.openSession();
//		Transaction tx = session.beginTransaction();
//		
//		
//		try{
//			session.save(follow1);
//			
//			System.out.println("----------------");
//			
//			tx.commit();
//		} catch(Exception e){
//			System.out.println(e);
//			if (tx != null) 
//				tx.rollback();
//		} finally{
//			if (session != null)
//			session.close();
//		}
//		HibernateUtils.shutdown();
//		
//		
	}


