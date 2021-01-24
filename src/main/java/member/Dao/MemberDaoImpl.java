package member.Dao;

import java.time.chrono.IsoChronology;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mchange.v2.c3p0.QueryConnectionTester;

import member.MemberBean;
import tool.Common;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SessionFactory factory;

	// 判斷帳號重複
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
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
	}

	// 帳號密碼登入
	public boolean identify(String account, String password) {

		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.account = :acc";

		Query<MemberBean> query = session.createQuery(hql);
		try {
			MemberBean mb = query.setParameter("acc", account).getSingleResult();
			System.out.println("====================================");
			System.out.println(mb);
			System.out.println("輸入密碼:" + password);
			System.out.println("密碼轉換:" + Common.getMD5Endocing(password));
			if (Common.getMD5Endocing(password).equals(mb.getPassword())) {
				return true;
			}

			else {
				return false;

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("can't find this acc");
			return false;

		}

	}

	// 新增
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
	public MemberBean getemail(String email) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE email=:email";
		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb = query.setParameter("email", email).getSingleResult();

		return mb;

	}

//權限
	@Override
	@SuppressWarnings("unchecked")
	public boolean ckpower(String account) {
		MemberBean mb = new MemberBean();
		String hql = "FROM MemberBean m WHERE m.account =:acc ";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.setParameter("acc", account).getResultList();
		if (list.size() == 1) {
			return list.get(0).isCkpower();
	
			} 

		 else {
			return false;
		}

	}

	// 權限
	@Override
	@SuppressWarnings("unchecked")
	public void ckpower2(Integer id) {

		MemberBean mb = factory.getCurrentSession().get(MemberBean.class, id);
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

	
	//刪除
	@Override
	public int deleteMember(int account) {
		int count = 0;
		Session session = factory.getCurrentSession();

			MemberBean mb = new MemberBean();
			mb.setAccount(null);
			session.delete(mb);
			count++;
		
		return count;
	}
//更新
	@Override
	public int update(MemberBean mb) {
		int count = 0;
		Session session = factory.getCurrentSession();

		session.saveOrUpdate(mb);
		count++;
		return count;
	}

	// 會員取得
	public MemberBean getMember(String account) {

		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.account = :account0";

		Query<MemberBean> query = session.createQuery(hql);
		MemberBean mb = query.setParameter("account0", account).getSingleResult();
		return mb;

	}

	// 信箱重複確認
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
	@SuppressWarnings("unchecked")
	public MemberBean getMember(Integer pk) {
		Session session = factory.getCurrentSession();

		String hql = "FROM MemberBean m WHERE m.id = :pk";

		
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
		MemberBean mb = null;
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
	
	@Override
	public List<Integer> gender() {

		String hql = "FROM MemberBean m WHERE m.gender = :gender";
		Session session = factory.getCurrentSession();

		Query<MemberBean> query = session.createQuery(hql);
		Integer listB = query.setParameter("gender", "男").getResultList().size();
		Integer listG = query.setParameter("gender", "女").getResultList().size();
		
		List<Integer> list  =new ArrayList<>();
		list.add(listB);
		list.add(listG);
	
		return list;
	
		
		
	}
	@Override
	public List<Integer> months(){
		String hql = "FROM MemberBean WHERE MONTH(registertime) = MONTH(:m)";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		List<Integer> list = new ArrayList<>();
		for(int i =1 ;i<13;i++
				){
			String date;
			if (i<10) {
				date="2021-0"+String.valueOf(i)+"-22";
			}else {
				date="2021-"+String.valueOf(i)+"-22";
			}
			list.add(query.setParameter("m", date).getResultList().size());
		}
		
//  		Integer list1 = query.setParameter("m", "2021-01-22").getResultList().size();  		
//  		Integer list2 = query.setParameter("m", "2021-02-22").getResultList().size();  		
//  		Integer list3 = query.setParameter("m", "2021-03-22").getResultList().size();  		
//  		Integer list4 = query.setParameter("m", "2021-04-22").getResultList().size();  		
//  		Integer list5 = query.setParameter("m", "2021-05-22").getResultList().size();  		
//  		Integer list6 = query.setParameter("m", "2021-06-22").getResultList().size();  		
//  		Integer list7 = query.setParameter("m", "2021-07-22").getResultList().size();  		
//  		Integer list8 = query.setParameter("m", "2021-08-22").getResultList().size();  		
//  		Integer list9 = query.setParameter("m", "2021-09-22").getResultList().size();  		
//  		Integer list10 = query.setParameter("m", "2021-10-22").getResultList().size();  		
//  		Integer list11 = query.setParameter("m", "2021-11-22").getResultList().size();  		
//  		Integer list12 = query.setParameter("m", "2021-12-22").getResultList().size();  	
//  		
//  		list.add(list1);
//  		list.add(list2);
//  		list.add(list3);
//  		list.add(list4);
//  		list.add(list5);
//  		list.add(list6);
//  		list.add(list7);
//  		list.add(list8);
//  		list.add(list9);
//  		list.add(list10);
//  		list.add(list11);
//  		list.add(list12);
  		
//  		System.out.println(list1);
//  		System.out.println(list2);

		return list;	
		
	}
	@Override
	public Integer totalmember(){
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
	
		return query.getResultList().size();

		}
	

	@Override
	public Integer monthbirth(){
	
		
		String hql = "FROM MemberBean WHERE MONTH(birth) = MONTH(:m)";
		Session session = factory.getCurrentSession();
		Query<MemberBean> query = session.createQuery(hql);
		Date bb =new Date();
		System.out.println("bb"+bb);
		return query.setParameter("m", bb).getResultList().size();

}
	
}
