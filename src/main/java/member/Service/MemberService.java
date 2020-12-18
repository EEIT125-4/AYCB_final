package member.Service;

import member.MemberBean;

public interface MemberService {
	boolean isDup(String acc);

	

	int update(MemberBean mb);

	boolean identify(String account, String password);

	MemberBean getMember(String account);

	int insertregister(MemberBean mb);
}