package comment.service;

import java.util.List;

import comment.model.CommentBean;

public interface CommentService {

	// DiscussionBean變數名稱

	List<CommentBean> selectAll();

	int deleteComment(int id);

	int updateComment(CommentBean cb);

	CommentBean selectUpdateitem(Integer commentId);

	int insertComment(CommentBean cb);

	CommentBean selectInsertitem(Integer commentId);

}