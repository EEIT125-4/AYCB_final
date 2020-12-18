package member.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import member.MemberBean;
import member.Dao.MemberDaoImpl;

@Service
@Transactional

public class MemberServiceImpl implements MemberService    {

	@Autowired		
	MemberDaoImpl dao;
	
	@Override
	public boolean isDup(String account) {				
			return dao.isDup(account);					
	}

	@Override
	public int insertregester(MemberBean mb) {				
		return dao.insertregister(mb);
	}

	@Override
	public int updateregister(MemberBean mb) {	
		return dao.updateregister(mb);
	}

	@Override
	public boolean identify(String account, String password) {							
		return dao.identify(account, password);	
	
	}

	@Override
	public MemberBean getMember(String account) {		
		return dao.getMember(account);
	}
}
