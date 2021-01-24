package event.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


import event.model.Event;


@Repository
public interface EventService {

	void save(Event e);

    List<Event> getAllEvent();

	void delete(Integer EventID);

	void updateEvent(Event e);

	Event getEvent(Integer EventID);
	
	List<Event> getEventByCategory(String eventcategory);

	List<Integer> getNumberOfCategory();
	
//	Map<String,Integer> getPaxOfCategory();


}