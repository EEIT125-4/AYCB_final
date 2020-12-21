package comment.service;

//專責與Comment Table之新增,修改,刪除與查詢

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.dao.CommentDao;
import comment.model.CommentBean;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao dao;

	//選擇一筆需要insert的留言
		@Override
		public CommentBean selectInsertitem(Integer commentId) {
			return dao.selectUpdateitem(commentId);
		}	
						
	// 新增一筆留言(save=insert)
	@Override
	public int insertComment(CommentBean cb) {
//		int count = 0;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		return dao.insertComment(cb);
//		count++;
//			tx.commit();
//		} catch(Exception e) {
//			if (tx != null) {
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}
//		return count;
	}

	// 查詢所有留言
	@Override
	public List<CommentBean> selectAll() {
//		System.out.println("dao"+dao);
//		List<CommentBean> list = new ArrayList<>();
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		
//		try {
//			tx = session.beginTransaction();
		return dao.selectAll();
//			System.out.println("dao result"+list);
//			tx.commit();
//		} catch(Exception e) {
//			if (tx != null) {
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}	
//		return list;
	}

	// 刪除一筆留言
	@Override
	public int deleteComment(int id) {
		System.out.println("service :id="+id);
		
		return dao.deleteComment(id);
	}

//選擇一筆需要更新的留言
	@Override
	public CommentBean selectUpdateitem(Integer commentId) {
//
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		CommentBean cb = null;
//		try {
//			tx = session.beginTransaction();
			return dao.selectUpdateitem(commentId);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null) {
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}
//		return cb;
	}

	// 更新留言
	@Override
	public int updateComment(CommentBean cb) {
//		int count = 0;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			return dao.updateComment(cb);
//			count++;
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null) {
//				tx.rollback();
//			}
//			e.printStackTrace();
//		}
//		return count;
	}

}
