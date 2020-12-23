package event.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
		List<Attendance> list = new ArrayList<>();
		String hql = "FROM Attendance";
		Session session = factory.getCurrentSession();

		Query<Attendance> query = session.createQuery(hql);
		list = query.getResultList();
     //System.out.println(list);  
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

}