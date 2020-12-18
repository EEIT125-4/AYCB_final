package event.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import event.model.Attendance;


@Repository
public interface AttendanceService {

//	boolean isDup(String id);

	void save(Attendance a);

	List<Attendance> getAllAttendance();

	void deleteAttendance(Integer MemberID);

	void updateAttendance(Attendance a);

	Attendance getAttendance(Integer MemberID);


}