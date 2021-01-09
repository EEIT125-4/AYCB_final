package comment.service;

//專責與Comment Table之新增,修改,刪除與查詢

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comment.dao.CommentDao;
import comment.model.CommentBean;
import member.MemberBean;

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

		return dao.insertComment(cb);

	}

	// 查詢所有留言
	@Override
	public List<CommentBean> selectAll() {

		return dao.selectAll();

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

			return dao.selectUpdateitem(commentId);

	}

	// 更新留言
	@Override
	public int updateComment(CommentBean cb) {

			return dao.updateComment(cb);

	}

	@Override
	public List<CommentBean> queryComment(String type, String key) {
		
		return dao.queryComment(type, key);
	}

	@Override
	public List<CommentBean> queryByMember(MemberBean member) {
		
		return dao.queryByMember(member);
	}

}
