package comment.dao;

import java.util.ArrayList;
//專責與Comment Table之新增,修改,刪除與查詢
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comment.model.CommentBean;
import member.MemberBean;
import message.model.MessageBean;

@Repository
public class CommentDaoImp implements CommentDao {

	@Autowired
	SessionFactory factory;

	// 新增一筆留言
	public int insertComment(CommentBean cb) {
		int count = 0;
		Session session = getSession();
		session.save(cb);
		count++;
		return count;
	}

	// getSession()方法--用getCurrentSession()來傳回值
	public Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢所有留言
	@SuppressWarnings("unchecked")
	@Override
	public List<CommentBean> selectAll() {
//		List<CommentBean> list = new ArrayList<>();
		String hql = "FROM CommentBean order by commentTime asc";
//		Session session = factory.getCurrentSession();
//		Query<CommentBean> query = session.createQuery(hql);
//		list = query.getResultList();
//		System.out.println("dao impl list:" + list);
		Session session = getSession();
		List<CommentBean> list = session.createQuery(hql).getResultList();
		System.out.println("查所有留言"+list);
		return list;
	}

	// 刪除一筆留言
	@Override
	public int deleteComment(int id) {
		System.out.println("in delete");
		int count = 0;
		Session session = getSession();
		CommentBean commentBean = get(id);
		
		session.delete(commentBean);
		System.out.println("delete complte");
		count++;
		return count;
	}

	// commentBean 的 get(id)方法
	public CommentBean get(Integer commentId) {
		
		CommentBean cb=null;
		cb=getSession().get(CommentBean.class, commentId);
		System.out.println("即將刪除"+cb.getMember().getName());
		
		return cb;
	}

//選擇一筆需要更新的留言
	@Override
	public CommentBean selectUpdateitem(Integer id) {

		
		Session session = getSession();
		return session.get(CommentBean.class, id);
	}
	// 更新留言

	@Override
	public void updateComment(CommentBean cb) {
		Integer count = 0;
		Session session = getSession();
		session.saveOrUpdate(cb);
		System.out.println("finish updatecomment");

	}

	@Override
	public List<CommentBean> queryComment(String type, String key) {
		Session session=getSession();
		String hql="FROM CommentBean cb Where cb.type = :type and cb.keynumber=:key order by commentTime asc";
		//List<CommentBean> list = new ArrayList<>();
		@SuppressWarnings("unchecked")
		
		Query<CommentBean> query=session.createQuery(hql );
		query.setParameter("type", type);
		query.setParameter("key", key);
		List<CommentBean> list = query.getResultList();
		//list = query.getResultList();	
		
		return list;
	}

	@Override
	public List<CommentBean> queryByMember(MemberBean member) {
		Session session=getSession();
		String hql="From CommentBean cb where cb.member=:member ";
		@SuppressWarnings("unchecked")
		Query<CommentBean> query=session.createQuery(hql );
		query.setParameter("member", member);
		
		
		return query.getResultList();
	}



}
