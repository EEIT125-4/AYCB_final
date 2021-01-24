 package event.dao.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.tools.classfile.Opcode.Set;

import event.dao.EventDAO;
import event.model.Event;
import net.bytebuddy.description.ModifierReviewable.OfAbstraction;


@Repository
public class EventDaoImpl implements EventDAO {

	
	//SessionFactory factory = HibernateUtils.getSessionFactory();
	
	@Autowired
	SessionFactory factory;
	
	

	@Override
	public void save(Event e) {
		Session session = factory.getCurrentSession();
		session.save(e);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getAllEvent() {
		List<Event> list = new ArrayList<>();
		String hql = "FROM Event ORDER BY eventdate";
		Session session = factory.getCurrentSession();

			Query<Event> query = session.createQuery(hql);
			list = query.getResultList();

		return list;
	}

	@Override
	public Event getEvent(int pk) {
		Event e = null;
		Session session = factory.getCurrentSession();
        String hql="From Event Where eventid=:pk";
		try {
			e =(Event)session.createQuery(hql)
					.setParameter("pk", pk)
					.getSingleResult();
		} catch (NoResultException ex) {
			
		}	
		return e;
	}

	

	@Override
	public void updateEvent(Event e) {
		
		Session session = factory.getCurrentSession();

		session.update(e);
			
	}

	@Override
	public void delete(Integer eventID) {
		Session session = factory.getCurrentSession();
		Event event =new Event();
		event.setEventid(eventID);
		session.delete(event);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventByCategory(String eventcategory) {
		String hql="FROM Event WHERE eventcategory=:category" ;
		Session session = factory.getCurrentSession();
		List<Event> list=session.createQuery(hql).
				setParameter("category",eventcategory).getResultList();
		
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getNumberOfCategory() {
		String hql="FROM Event WHERE eventcategory=:category" ;
		Session session = factory.getCurrentSession();
		Query<Event> query= session.createQuery(hql);
		
		Integer list1= query.setParameter("category", "體驗").getResultList().size();
		Integer list2= query.setParameter("category", "教學").getResultList().size();
		Integer list3= query.setParameter("category", "新品發表").getResultList().size();
		Integer list4= query.setParameter("category", "促銷").getResultList().size();
		Integer list5= query.setParameter("category", "其他").getResultList().size();
		
		List<Integer> list= new ArrayList<>();	
	
		list.add(list1);
		list.add(list2);
		list.add(list3);
		list.add(list4);
		list.add(list5);
		
		return list;
	}

//	@Override
//	public Map<String, Integer> getPaxOfCategory() {
//		
//		String hql="FROM Event" ;
//		Session session = factory.getCurrentSession();
//		Query<Event> query= session.createQuery(hql);
//		List<Event>list=query.getResultList();
//		
//		
//		
//		Map<String, List> result=new LinkedHashMap<String, List>();
//		
//		List<String>categorys=new ArrayList<String>();
//		
//		List<Integer>paxs=new ArrayList<Integer>();
//		
//		
//		
//		for(Event e:list) {
//			
//			if(!categorys.contains(e.getEventcategory())) {
//				
//			categorys.add(e.getEventcategory());	
//				
//			}else {
//				
//				paxs.add(e.getPax());
//				
//				
//			}
//			
//
//		}
//		
//		String temp="";
//		int tempNum=0;
//		
//		for(int i=0;i<categorys.size();i++) {
//			
//			
//			if(temp==null) {
//				temp=categorys.get(i);	
//			}
//			if(categorys.get(i).equals(temp)) {
//				
//				categorys.remove(i);
//				
//				
//			}
//			
//			
//			
//		}
//		
//		
//		
//		return result;
//	}
	

	
}
