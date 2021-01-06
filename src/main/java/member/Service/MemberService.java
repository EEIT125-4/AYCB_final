package member.Service;

import java.util.List;

import member.MemberBean;

public interface MemberService {
//	
	int update(MemberBean mb);

	boolean identify(String account, String password);

	MemberBean getMember(String account);

	int insertregister(MemberBean mb);

	List<MemberBean> getAllMembers();

	List<MemberBean> checkDup();

	boolean isDup(String account);
	boolean emailcheck(String email);
	MemberBean getMember(Integer pk);
	
	MemberBean getemail(String email );
}