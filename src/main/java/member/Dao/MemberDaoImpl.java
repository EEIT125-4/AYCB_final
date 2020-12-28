package member.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao {
    @Autowired
	SessionFactory factory ;

	@SuppressWarnings("unchecked")
	public boolean isDup(String account) {
		boolean result = false;
		String hql = "FROM MemberBean m WHERE m.account = :account0";
		Session session = factory.getCurrentSession();

		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("account0", account).getResultList();
		if (list.size() > 0) {

			result = true;
		}

		return result;
	}

	public boolean identify(String account, String password) {

		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.account = :acc";

		Query<MemberBean> query = session.createQuery(hql);
		try {
		MemberBean mb = query.setParameter("acc", account).getSingleResult();
		System.out.println("====================================");
		System.out.println(mb);
		if (mb.getPassword().equals(password)) {
			return true;
		}

		else {
			return false;

		}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("can't find this acc");
			return false;
			
		}
		

	}

	@Override
	public int insertregister(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();

		session.save(mb);
		count++;

		return count;
	}

//	@Override
//	@SuppressWarnings("unchecked")
//	public List<MemberBean> getAllMembers() {
//		List<MemberBean> list = new ArrayList<>();
//		String hql = "FROM MemberBean";
//		Session session = factory.getCurrentSession();
//
//			Query<MemberBean> query = session.createQuery(hql);
//			list = query.getResultList();
////		
//		return list;
//	}

//	@Override
//	public MemberBean getMember(int account) {
//		MemberBean mb = null;
//		Session session = factory.getCurrentSession();
//
//			mb = session.get(MemberBean.class, account);
////		
//		return mb;
//	}

//	@Override
//	public int deleteMember(int account) {
//		int count = 0;
//		Session session = factory.getCurrentSession();
//
//			MemberBean mb = new MemberBean();
//			mb.setAccount(null);
//			session.delete(mb);
//			count++;
////		
//		return count;
//	}

	@Override
	public int update(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();

		session.saveOrUpdate(mb);
		count++;
		return count;
	}
	
	
	public MemberBean getMember(String account) {
		
		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.account = :account0";

		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb = query.setParameter("account0", account).getSingleResult();
		return mb;	
		
	}
}
