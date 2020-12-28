package member.Dao;

import org.springframework.stereotype.Repository;

import member.MemberBean;
@Repository
public interface MemberDao {
	
	boolean isDup(String acc);

	int insertregister(MemberBean mb);

	int update(MemberBean mb);
	
	boolean identify(String account ,String password);
	
	MemberBean getMember(String account);

	
	

	

	

}