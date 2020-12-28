package comment;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import comment.model.CommentBean;
import tool.HibernateUtils;

public class InsertData {


	public static void main( String[] args) {

		SessionFactory factory = HibernateUtils.getSessionFactory();

		Session session = factory.getCurrentSession();

		Transaction tx = null;

		try {
			
			tx = session.beginTransaction();
			Timestamp time=new Timestamp(new Date().getTime());
			CommentBean cb = new CommentBean();
//			cb.setName("ccc");
			cb.setCommentTime(time);

//			Calendar calendar = Calendar.getInstance();
//			calendar.setTimeInMillis(date.getTime());v 
//			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");
//			try {
//				time = new Timestamp(
//						new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse("").getTime());
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
//			sqlDate.setTime("2020-12-23 09:11:23");
//			cb.setCommentTime(date.getTime());
			session.save(cb);
			
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		}

		finally {
			if (session != null)
				session.close();
		}
		HibernateUtils.shutdown();
		System.out.println("==================");
	}

}
