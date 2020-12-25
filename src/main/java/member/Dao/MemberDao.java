package member.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import member.MemberBean;
@Repository
public interface MemberDao {

	int insertregister(MemberBean mb);

	int update(MemberBean mb);
	
	boolean identify(String account ,String password);
	
	MemberBean getMember(String account);

	List<MemberBean> getAllMembers();

	 List<MemberBean> checkDup();
	 boolean isDup(String account);

	

	

}