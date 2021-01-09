package comment.service;

import java.util.List;

import comment.model.CommentBean;
import member.MemberBean;

public interface CommentService {

	// DiscussionBean變數名稱

	List<CommentBean> selectAll();

	int deleteComment(int id);

	int updateComment(CommentBean cb);

	CommentBean selectUpdateitem(Integer commentId);

	int insertComment(CommentBean cb);

	CommentBean selectInsertitem(Integer commentId);

	// 依據類型與key值查詢留言
	List<CommentBean> queryComment(String type, String key);

	// 依會員ID查詢
	List<CommentBean> queryByMember(MemberBean member);

}