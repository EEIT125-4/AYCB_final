package comment.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import comment.dao.BlogDao;
import comment.model.Blog;


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

//選擇一筆需要更新的部落格文章
	@Override
	public Blog selectUpdateBlog(Integer BlogId) {
			return dao.selectUpdateBlog(BlogId);
	}

	// 更新一筆部落格文章
	@Override
	public int updateBlog(Blog bg) {
			return dao.updateBlog(bg);
	}
}
