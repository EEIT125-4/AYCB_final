package event.dao.Impl;

import java.util.ArrayList;
import java.util.Date;
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



import event.dao.EventDAO;
import event.model.Event;
import net.bytebuddy.description.ModifierReviewable.OfAbstraction;
import net.bytebuddy.dynamic.DynamicType.Builder.InnerTypeDefinition;


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
	public Map<String, List> getNumberOfCategory() {
		String hql="FROM Event" ;
		// WHERE eventcategory=:category
		Session session = factory.getCurrentSession();
		Map<String, List>result=new LinkedHashMap<String, List>();
		
		Query<Event> query= session.createQuery(hql);
		List<String> category=new ArrayList<String>();
		
		List<Integer>nums=new ArrayList<Integer>();
		List<Integer> list= new ArrayList<>();	
		category.add("體驗");
		category.add("教學");
		category.add("新品發表");
		category.add("促銷");
		category.add("其他");
		result.put("category", category);
		
		List<Event>temp=new ArrayList<Event>();
	
		
		
		for(String name:category) {
			int num=0;
			int count=0;
			temp=query.setParameter("category", name).getResultList();
			for(Event e:temp) {
				if(e.getEventcategory().equals(name)) {
					num++;
				}
				count+=e.getPax();
			}
			list.add(count);
			nums.add(num);
		
		}
		
//		Integer list1= query.setParameter("category", "體驗").getResultList().size();
//		Integer list2= query.setParameter("category", "教學").getResultList().size();
//		Integer list3= query.setParameter("category", "新品發表").getResultList().size();
//		Integer list4= query.setParameter("category", "促銷").getResultList().size();
//		Integer list5= query.setParameter("category", "其他").getResultList().size();
		
//		list.add(list1);
//		list.add(list2);
//		list.add(list3);
//		list.add(list4);
//		list.add(list5);
		
		result.put("count",list);
		result.put("nums", nums);
		
		
		
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> unexpiredEvent() {
		
		Session session=factory.getCurrentSession();
		
		List<Event>result=new ArrayList<Event>();
		
		String hql="FROM Event";
		
		Query<Event> query= session.createQuery(hql);
				
		List<Event> list=session.createQuery(hql).getResultList();
		
		Date today=new Date();
		
		for(Event e:list) {
			
			String dateString[]=e.getEventdate().split("-");
			
			Date date=new Date(Integer.parseInt(dateString[0]),Integer.parseInt(dateString[1]),Integer.parseInt(dateString[2]));
			System.out.println("date="+date.getYear()+"-"+date.getMonth()+"-"+date.getDay());
			
			//Kevin:只有日期>今天的是還沒過期的活動
			
			if(date.after(today)) {
				
				System.out.println("加入活動:"+e.getEventname());
				result.add(e);
			}	
			
		}
		
		
		 
		 
		 
		return result;
	}

}
