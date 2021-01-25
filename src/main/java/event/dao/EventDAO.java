 package event.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import event.model.Event;


@Repository
public interface EventDAO {
			
        //新增
	    void save(Event e);	    
	    //刪除
        void delete(Integer eventID);
        //修改
        void updateEvent(Event e);		
        
        List<Event> getAllEvent();
		
        Event getEvent(int pk);
        
		List<Event> getEventByCategory(String eventcategory);

		List<Integer>getNumberOfCategory();
		
//		Map<String,Integer> getPaxOfCategory();
		
		


}
