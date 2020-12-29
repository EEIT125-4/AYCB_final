package event;

import java.util.List;
import java.util.Scanner;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.event.spi.DeleteEvent;
import org.hibernate.query.Query;

import event.model.Event;
import event.model.Record;
import member.MemberBean;
import message.model.MessageBean;
import tool.HibernateUtils;

public class TestOfRecord {

	static SessionFactory factory;
	static Session session;
	static Transaction tx;

	public static void main(String[] args) {
		
		
		factory = HibernateUtils.getSessionFactory();

		session = factory.getCurrentSession();
		tx=session.beginTransaction();
		
		
//		delete();
//		deleteEvent();
//		 insertData();
//		 show();
		search();

		session.close();

	}
	static void search() {
		
		Event e1=session.get(Event.class,4);
		if(e1==null) {
			System.out.println("not found");
			return;
		}
		e1.getMembers().add(session.get(MemberBean.class,2));
		e1.getMembers().add(session.get(MemberBean.class,3));
		e1.getMembers().add(session.get(MemberBean.class,4));
		Set<MemberBean>members=e1.getMembers();
		System.out.println("e1:"+e1.getEventname()+"/"+members);
		tx.commit();
		System.out.println("end");
			
		
	}

	static void insertData() {

		try {
			tx = session.beginTransaction();
			Record r1 = new Record();

			String hql = "FROM MemberBean m WHERE m.account = :account0";

			Query<MemberBean> query = session.createQuery(hql);
			MemberBean member = query.setParameter("account0", "kkk").getSingleResult();

			System.out.println("member:" + member.getName());
			@SuppressWarnings("unchecked")
			Query<Event> query2 = session.createNativeQuery("select top 1 * from event order by NEWID() ")
					.addEntity(Event.class);

			Event event = (Event) query2.getSingleResult();

			System.out.println("event:" + event.getEventname());

			r1.setMember(member);
			r1.setEvent(event);
			r1.setDesc("testof2");
			session.save(r1);

			tx.commit();
			System.out.println("complete");

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
				System.out.println("err & rollback");

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

	static void show() {

		tx = session.beginTransaction();
		String hql = "FROM Record";

//		Record record=(Record)session.createQuery("FROM Record").getSingleResult();

		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(1);

		List<Record> records = query.list();
		for (Record r : records) {
			System.out.println(r);

		}
		tx.commit();

		System.out.println("complete");
	}

	/*static void deleteEvent() {

		tx = session.beginTransaction();
		System.out.println("input the event id");
		Scanner scanner = new Scanner(System.in);

		int index = scanner.nextInt();

		String hql = "FROM Event e where e.eventid = :id";

		Query<Event> query = session.createQuery(hql);
		List<Event> list = query.setParameter("id", index).getResultList();

		query.setFirstResult(0);
		query.setMaxResults(1);

		List<Event> events = query.list();
		for (Event e : events) {

			System.out.println("delete:" + e);
			e.setRecords(null);

			session.delete(e);

		}
		tx.commit();

		System.out.println("delete complete");

	}*/

	/*static void delete() {

		Scanner scanner = new Scanner(System.in);
		int index = scanner.nextInt();

		tx = session.beginTransaction();
		String hql = "FROM Record r where r.recordid = :id";

		Query<Record> query = session.createQuery(hql);
		List<Record> list = query.setParameter("id", index).getResultList();

		query.setFirstResult(0);
		query.setMaxResults(1);

		List<Record> records = query.list();
		for (Record r : records) {
			System.out.println("delete:" + r);

			session.delete(r);

		}
		tx.commit();

		System.out.println("delete complete");

	}*/
}
