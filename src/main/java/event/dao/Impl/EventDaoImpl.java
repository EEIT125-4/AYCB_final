 package event.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.dao.EventDAO;
import event.model.Event;


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

	
}
