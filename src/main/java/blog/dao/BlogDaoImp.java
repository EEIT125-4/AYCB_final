package blog.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comment.model.Blog;

@Repository
public class BlogDaoImp implements BlogDao {

	@Autowired
	SessionFactory factory;
	
	// 新增一筆部落格文章
	@Override
	public int insertBlog(Blog bg) {
		int count = 0;
		Session session = getSession();
		session.save(bg);
		count++;
		return count;
	}

	// getSession()方法--用getCurrentSession()來傳回值
	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢所有留言
	@Override
	@SuppressWarnings("unchecked")
	public List<Blog> selectAllBlog() {
		String hql = "FROM Blog order by commentTime asc";
		Session session = getSession();
		List<Blog> list = session.createQuery(hql).getResultList();
		return list;
	}

	// 刪除一筆部落格文章
	// commentBean 的 get(id)方法在下方(此id為blogId)
	@Override
	public int deleteBlog(int id) {
		int count = 0;
		Session session = getSession();
		Blog bg = get(id);

		session.delete(bg);
		count++;
		return count;
	}

	// commentBean 的 get(id)方法
	@Override
	public Blog get(Integer BlogId) {

		Blog bg = null;
		bg = getSession().get(Blog.class, BlogId);
		System.out.println("即將刪除" + bg.getMember().getName());
		return bg;
	}

	// 選擇一筆需要更新的部落格文章
	@Override
	public Blog selectUpdateBlog(Integer id) {

		Session session = getSession();
		return session.get(Blog.class, id);
	}
	
	// 更新一筆部落格文章
	@Override
	public Integer updateBlog(Blog bg) {
		Integer count = 0;
		Session session = getSession();
		session.saveOrUpdate(bg);
		count++;
		return count;

	}

	
	
}
