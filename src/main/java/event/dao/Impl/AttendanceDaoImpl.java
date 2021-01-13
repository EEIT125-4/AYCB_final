package event.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import event.dao.AttendanceDAO;
import event.model.Attendance;



@Repository
public class AttendanceDaoImpl implements AttendanceDAO {

	@Autowired
	SessionFactory factory;

//	@SuppressWarnings("unchecked")
//	@Override
//	public boolean isDup(String id) {
//		boolean result = false;
//		String hql = "FROM Attendance a WHERE a.MemberID = :id0";
//		Session session = factory.getCurrentSession();
//
//			Query<Attendance> query = session.createQuery(hql);
//			List<Attendance> list = query.setParameter("id0", id).getResultList();
//			if ( list.size() > 0) {
//				result = true;
//			}
//			
//		return result;
//	}

	@Override
	public void save(Attendance a) {
		Session session = factory.getCurrentSession();
		session.save(a);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Attendance> getAllAttendance() {
//		List<Attendance> list = new ArrayList<>();
		
		String hql = "FROM Attendance ";
		Session session = factory.getCurrentSession();

//		Query<Attendance> query = session.createQuery(hql);
//		list = query.getResultList();
		List<Attendance> list = session.createQuery(hql).getResultList();
     
		return list;
	}

	
	
	@Override
	public Attendance getAttendance(Integer Aid) {
		Attendance a = null;
		Session session = factory.getCurrentSession();

		a = session.get(Attendance.class, Aid);

		return a;
	}
	
	
	@Override
	public void deleteAttendance(Integer aid) {
		Session session = factory.getCurrentSession();
		Attendance a = new Attendance();
		a.setAid(aid);
		session.delete(a);

	}

	@Override
	public void updateAttendance(Attendance a) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(a);

	}
    @SuppressWarnings("unchecked")
	@Override
	public  List<Attendance> getAllAttendancebyID(Integer id) {		
    	
		String hql = "FROM Attendance WHERE member_id=:id";
		Session session = factory.getCurrentSession();
		List<Attendance> list = session.createQuery(hql)
				.setParameter("id", id)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Attendance> getAllAttendancebyEvent(Integer eventid) {
		String hql="FROM Attendance WHERE event_eventid=:id";
		Session session = factory.getCurrentSession();
		List<Attendance> list = session.createQuery(hql).setParameter("id", eventid).getResultList();
		
		return list;
	}

}
