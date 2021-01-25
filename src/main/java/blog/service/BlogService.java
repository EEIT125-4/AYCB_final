package blog.service;

import java.util.List;
import java.util.Map;

import blog.model.Blog;
import product.model.CollectBean;

public interface BlogService {

	// 新增一筆部落格文章(save=insert)
	int insertBlog(Blog bg);

	// 查詢所有部落格文章
	List<Blog> selectAllBlog();

	// 刪除一筆部落格文章
	int deleteBlog(Integer blogId);

	// 選擇一筆需要更新的部落格文章
	Blog selectBlog(Integer BlogId);

	// 更新一筆部落格文章
	int updateBlog(Blog bg);

	// search bar
	List<Blog> selectArticle(String title);

	void addcollection(int mid, int bid);

	List<CollectBean> collection(int mid);

	int pkcollection(int mid, int bid);

	List<Integer> findcollection(int mid);

//	回傳類別分析數據
	Map categoryAnalysis();

	// 取前10名
	Map TopAnalysis();
	
	List<Blog> allcollection(int blogId);
	
	Blog getOneBlog(int blogId);
}