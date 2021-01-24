package member.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import member.MemberBean;

@Repository
public interface MemberDao {

	int insertregister(MemberBean mb);

	int update(MemberBean mb);

	boolean identify(String account, String password);

	MemberBean getMember(String account);

	List<MemberBean> getAllMembers();

	List<MemberBean> checkDup();

	boolean isDup(String account);

	boolean emailcheck(String email);

	MemberBean getMember(Integer pk);

	MemberBean getMemberByEmail(String email);

	boolean emailDupCheck(String email);

	MemberBean getemail(String email);

	void ckpower2(Integer id);

	boolean ckpower(String account);

	int deleteMember(int account);

	List<Integer> gender();

	List<Integer> months();

	Integer totalmember();

	Integer monthbirth();

}