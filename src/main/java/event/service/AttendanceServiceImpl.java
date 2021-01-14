package event.service;


import java.util.List;

import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import event.dao.AttendanceDAO;

import event.model.Attendance;





@Service
@Transactional
public class AttendanceServiceImpl implements AttendanceService  {
	//SessionFactory factory = HibernateUtils.getSessionFactory();
	
	@Autowired
    AttendanceDAO attendanceDAO;


	@Override
	public void save(Attendance a) {
		attendanceDAO.save(a);
		
	}

	@Override
	public List<Attendance> getAllAttendance() {
		return attendanceDAO.getAllAttendance();
	}

	@Override
	public void deleteAttendance(Integer MemberID) {
		attendanceDAO.deleteAttendance(MemberID);
		
	}

	@Override
	public void updateAttendance(Attendance a) {
		attendanceDAO.updateAttendance(a);
	}

	@Override
	public Attendance getAttendance(Integer MemberID) {
		return attendanceDAO.getAttendance(MemberID);
	}

	@Override
	public List<Attendance> getAllAttendancebyID(Integer id) {
		return attendanceDAO.getAllAttendancebyID(id);
	}

	@Override
	public List<Attendance> getAllAttendancebyEvent(Integer eventid) {
		return attendanceDAO.getAllAttendancebyEvent(eventid);
	}

	
	
	
	
//	@Override
//	public boolean isDup(String id) {
//		boolean result = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null; //留意選哪個Transaction
//		try {
//			tx = session.beginTransaction();
//			result = dao.isDup(id);			
//			tx.commit();
//		}catch (Exception e) {
//			if(tx != null) {
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}
//		return result;
//		
//		}
//		
		
	

	
}
