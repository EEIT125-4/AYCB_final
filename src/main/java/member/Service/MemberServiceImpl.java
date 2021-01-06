package member.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberBean;
import member.Dao.MemberDao;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

//	SessionFactory factory = HibernateUtils.getSessionFactory();
//	RegisterDaoImpl dao = new RegisterDaoImpl();

	@Override
	public List<MemberBean> checkDup() {
		

		return memberDao.checkDup();
	}
	
	
	@Override
	 public boolean isDup(String account) {
		  boolean result = false;
		  result = memberDao.isDup(account);

		  return result;
		 }
	
	
	@Override
	 public boolean emailcheck(String email) {
		  boolean result = false;
		  result = memberDao.emailcheck(email);

		  return result;
		 }
	
	

	@Override
	public int insertregister(MemberBean mb) {
		int count = 0;

		memberDao.insertregister(mb);
		count++;

		return count;
	}

	@Override
	public int update(MemberBean mb) {
		int count = 0;

		memberDao.update(mb);

		return count;
	}

	@Override
	public boolean identify(String account, String password) {

		boolean login = false;

		login = memberDao.identify(account, password);

		return login;

	}

	@Override
	public MemberBean getMember(String account) {

		MemberBean mb = null;

		mb = memberDao.getMember(account);

		return mb;
	}

	@Override
	public List<MemberBean> getAllMembers() {
		
		return memberDao.getAllMembers();
	}


	@Override
	public MemberBean getMember(Integer pk) {
		
		return memberDao.getMember(pk);
	}


	@Override
	public MemberBean getMemberByEmail(String email) {
		
		return memberDao.getMemberByEmail(email);
	}


	@Override
	public boolean emailDupCheck(String email) {
		
		return memberDao.emailDupCheck(email);
	}
	
	
}
