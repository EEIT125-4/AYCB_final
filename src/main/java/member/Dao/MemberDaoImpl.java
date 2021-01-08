package member.Dao;

import java.time.chrono.IsoChronology;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberBean;
import tool.Common;

@Repository
public class MemberDaoImpl implements MemberDao {
    @Autowired
	SessionFactory factory ;

    
    //判斷帳號重複
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

	public List<MemberBean> checkDup() {
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();

		Query<MemberBean> query = session.createQuery(hql);
		
		List<MemberBean> list = query.getResultList();
		if(list.isEmpty()) {
			return null;
		}else {
			return list;
		}
	}
	
	
	
	
	
	
	//帳號密碼登入
	public boolean identify(String account, String password) {
		
		Session session = factory.getCurrentSession();
		
		String hql = "FROM MemberBean m WHERE m.account = :acc";

		Query<MemberBean> query = session.createQuery(hql);
		try {
		MemberBean mb = query.setParameter("acc", account).getSingleResult();
		System.out.println("====================================");
		System.out.println(mb);
		System.out.println("輸入密碼:"+password);
		System.out.println("密碼轉換:"+Common.getMD5Endocing(password));
		if (Common.getMD5Endocing(password).equals(mb.getPassword())) {
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

	
	//新增
	@Override
	public int insertregister(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();

		session.save(mb);
		count++;

		return count;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<MemberBean> getAllMembers() {
		List<MemberBean> list = new ArrayList<>();
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();

			Query<MemberBean> query = session.createQuery(hql);
			list = query.getResultList();
//		
		return list;
	}
//取得信箱
	@Override
	@SuppressWarnings("unchecked")
	public MemberBean getemail(String email ) {
		Session session = factory.getCurrentSession();
		String hql="FROM MemberBean WHERE email=:email";
		Query<MemberBean> query=session.createQuery(hql);
		MemberBean mb = query.setParameter("email", email).getSingleResult();
					
		return mb;
		
	}	

//權限
	@Override
	@SuppressWarnings("unchecked")
	public MemberBean ckpower(String account ) {
		MemberBean mb = new MemberBean();
		String hql="FROM MemberBean m WHERE m.account =:acc ";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query=session.createQuery(hql);
		List<MemberBean> list =  query.setParameter("account0", account).getResultList();
		 if (list.size()>0) {
			 if(list.get(0).isCkpower()) {
				return list.get(0); 
			 }else {
				 mb.setId(0);
			}
			 
	}
		return mb;

	}
	
	
	//權限
	@Override
	@SuppressWarnings("unchecked")
	public void ckpower2(String account) {
		
		MemberBean mb = factory.getCurrentSession().get(MemberBean.class , account);
		mb.setCkpower(!mb.isCkpower());
		
	}
	
	

	
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
//更新
	@Override
	public int update(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();

		session.saveOrUpdate(mb);
		count++;
		return count;
	}
	
	//會員取得
	public MemberBean getMember(String account) {
		
		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.account = :account0";

		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb = query.setParameter("account0", account).getSingleResult();
		return mb;	
		
	}
	//信箱重複確認
	@Override
	public boolean emailcheck(String email) {
		boolean result = false;
		String hql = "FROM MemberBean m WHERE m.email = :email0";
		Session session = factory.getCurrentSession();

		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("email0", email).getResultList();
		if (list.size() > 0) {

			result = true;
		}

		return result;
	}

	@Override
	public MemberBean getMember(Integer pk) {
		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.id = :pk";

		@SuppressWarnings("unchecked")
		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb = query.setParameter("pk", pk).getSingleResult();
		return mb;
	}
//用會員抓信箱
	@Override
	public MemberBean getMemberByEmail(String email) {
		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.email = :email";

		@SuppressWarnings("unchecked")
		MemberBean mb=null;
		Query<MemberBean> query = session.createQuery(hql);
		try {
			 mb = query.setParameter("email", email).getSingleResult();
		} catch (Exception e) {
			System.out.println("email查詢會員發生錯誤");
			e.printStackTrace();
			
		}
		
		return mb;
	}

	@Override
	/**
	 * Kevin:不知道改成>1就跳出會不會比較有效率
	 */
	public boolean emailDupCheck(String email) {
		boolean result = false;
		String hql = "FROM MemberBean m WHERE m.email = :email";
		Session session = factory.getCurrentSession();

		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("email", email).getResultList();
		if (list.size() > 0) {

			result = true;
		}

		return result;
	}
	
	
		
	
	
}
