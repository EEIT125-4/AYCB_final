package event.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import event.dao.EventDAO;

import event.model.Event;




@Service
@Transactional
public class EventServiceImpl implements EventService  {

	@Autowired
	EventDAO eventDAO;

	@Override
	public void save(Event e) {
		eventDAO.save(e);
	}

	@Override
	public List<Event> getAllEvent() {
		return eventDAO.getAllEvent();
	}

	@Override
	public void delete(Integer EventID) {
		eventDAO.delete(EventID);
	}

	@Override
	public void updateEvent(Event e) {
		eventDAO.updateEvent(e);
		
	}

	@Override
	public Event getEvent(Integer EventID) {
	 return eventDAO.getEvent(EventID);
	}

	@Override
	public List<Event> getEventByCategory(String eventcategory) {
		return eventDAO.getEventByCategory(eventcategory);
	}

	@Override
	public Map<String, List> getNumberOfCategory() {
		return eventDAO.getNumberOfCategory();
	}

	@Override
	public List<Event> unexpiredEvent() {
		
		return eventDAO.unexpiredEvent();
	}
	
	

//	@Override
//	public Map<String,Integer> getPaxOfCategory() {
//		
//		return eventDAO.getPaxOfCategory();
//	}
	
	
	
}
