package event.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import event.model.Attendance;



@Repository
public interface AttendanceDAO {
	
			//boolean isDup(String id);
			
			
	        //新增
		    void save(Attendance a);
		    
		    //刪除
	        void deleteAttendance(Integer aid);
	        
	        Attendance getAttendance(Integer Aid);
	        //修改
	        void updateAttendance(Attendance a);
			
	        List<Attendance> getAllAttendance();
	        
	        List<Attendance> getAllAttendancebyID(Integer id);

			List<Attendance> getAllAttendancebyEvent(Integer eventid);

			boolean isDup(Integer id, Integer eventid);
			
			Integer getPaxOfAttendance();
	   


		
	        
	      

	        
	        

			

		  
		


	


}
