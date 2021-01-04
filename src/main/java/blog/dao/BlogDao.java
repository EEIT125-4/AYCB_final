package blog.dao;

import java.util.List;

import org.hibernate.Session;

import blog.model.Blog;

public interface BlogDao {
	
	// 新增一筆部落格文章
	int insertBlog(Blog bg);
	
	// getSession()方法--用getCurrentSession()來傳回值
	Session getSession();

	// 查詢所有留言
	List<Blog> selectAllBlog();

	// 刪除一筆部落格文章
	// commentBean 的 get(id)方法在下方(此id為commentId)
	int deleteBlog(int id);

	// commentBean 的 get(id)方法@Override
	
	Blog get(Integer BlogId);

	// 選擇一筆需要更新的部落格文章
	Blog selectBlog(Integer blogId);

	// 更新一筆部落格文章
	Integer updateBlog(Blog bg);
	

	

	
	

	

}