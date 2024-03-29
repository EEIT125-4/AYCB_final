package blog.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blog.dao.BlogDao;
import blog.model.Blog;
import product.model.CollectBean;

@Service
@Transactional
public class BlogServiceImpl implements BlogService {

	@Autowired
	BlogDao dao;

	// 新增一筆部落格文章(save=insert)
	@Override
	public int insertBlog(Blog bg) {
		return dao.insertBlog(bg);
	}

	// 查詢所有部落格文章
	@Override
	public List<Blog> selectAllBlog() {
		return dao.selectAllBlog();
	}

	// 刪除一筆部落格文章
	@Override
	public int deleteBlog(Integer blogId) {
		return dao.deleteBlog(blogId);
	}

//選擇一筆部落格文章
	@Override
	public Blog selectBlog(Integer BlogId) {
		return dao.selectBlog(BlogId);
	}

	// search bar
	public List<Blog> selectArticle(String title) {
		return dao.selectArticle(title);
	}

	// 更新一筆部落格文章
	@Override
	public int updateBlog(Blog bg) {
		return dao.updateBlog(bg);
	}

	@Override
	public void addcollection(int mid, int bid) {
		dao.addcollection(mid, bid);
	}

	@Override
	public List<CollectBean> collection(int mid) {
		return dao.collection(mid);
	}

	@Override
	public int pkcollection(int mid, int bid) {
		return dao.pkcollection(mid, bid);
	}
	@Override
	public List<Integer> findcollection(int mid){
		return dao.findcollection(mid);
	}
	@Override
	public List<Blog> allcollection(int blogId){
		return dao.allcollection(blogId);
	}
	@Override
	public Blog getOneBlog(int blogId) {
		return dao.getOneBlog(blogId);
	}

	@Override
	public Map categoryAnalysis() {
		
		return dao.categoryAnalysis();
	}

	@Override
	public Map TopAnalysis() {
		
		return dao.TopAnalysis();
	}

}
