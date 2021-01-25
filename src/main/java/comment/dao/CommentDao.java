package comment.dao;

import java.util.List;

import comment.model.CommentBean;
import member.MemberBean;
import member.Service.MemberService;

public interface CommentDao {

	//新增一筆留言
	int insertComment(CommentBean cb);

	//查詢所有留言
	List<CommentBean> selectAll();
	//依據類型與key值查詢留言
	List<CommentBean>queryComment(String type,String key);
	
	//依會員查詢
	List<CommentBean>queryByMember(MemberBean member);
	
	
	

	// 刪除一筆留言
	int deleteComment(int id);

	//選擇一筆需要更新的留言
	CommentBean selectUpdateitem(Integer id);

	//更新留言
	void updateComment(CommentBean cb);


}