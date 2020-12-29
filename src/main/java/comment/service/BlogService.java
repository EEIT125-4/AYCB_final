package comment.service;

import java.util.List;

import comment.model.Blog;

public interface BlogService {

	// 新增一筆部落格文章(save=insert)
	int insertBlog(Blog bg);

	// 查詢所有部落格文章
	List<Blog> selectAllBlog();

	// 刪除一筆部落格文章
	int deleteBlog(Integer blogId);

	//選擇一筆需要更新的部落格文章
	Blog selectUpdateBlog(Integer BlogId);

	// 更新一筆部落格文章
	int updateBlog(Blog bg);

}