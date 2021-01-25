package blog.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import blog.model.Blog;
import product.model.CollectBean;
import video.model.Video;

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
	

	//查詢search bar
	@Override
	@SuppressWarnings("unchecked")
	public List<Blog>selectArticle(String title){
		Session session = getSession();
		String hql = "FROM Blog b where b.title like :title";
		System.out.println("title1");
		List<Blog> list= session.createQuery(hql).setParameter("title", "%"+title+"%").getResultList();
		
		System.out.println("title2");
		for(Blog b:list) {
			System.out.println("title"+b.getTitle());
		}
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
		
		return bg;
	}

	// 選擇一筆需要更新的部落格文章
	@Override
	public Blog selectBlog(Integer id) {

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
	
	public void getAnalysis() {
		Session session=factory.getCurrentSession();
		
	}
	@Override
	public void addcollection(int mid, int bid) {
		CollectBean cb = new CollectBean();
		cb.setMid(mid);
		cb.setBid(bid);
		Session session = factory.getCurrentSession();
		session.save(cb);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CollectBean> collection(int mid) {
		String hql = "FROM CollectBean c WHERE c.mid = :mid";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mid", mid).getResultList();
	}
	
	@Override
	public int pkcollection(int mid, int bid) {
		String hql = "SELECT c.cid FROM CollectBean c WHERE c.mid = :mid and c.bid = :bid";
		Session session = factory.getCurrentSession();
		return (int) session.createQuery(hql).setParameter("mid", mid).setParameter("bid", bid).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findcollection(int mid) {
		String hql = "SELECT c.bid FROM CollectBean c WHERE c.mid = :mid";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mid", mid).getResultList();
	}

	@Override
	public Map categoryAnalysis() {
		try {

			Map<String, Integer> tempMap = new LinkedHashMap<String, Integer>();
			Session session = factory.getCurrentSession();
			String hql = "FROM Blog";

			List<Blog> list = session.createQuery(hql).getResultList();
			for (Blog b : list) {
				//將每個種類的數量累加起來	
				if (!tempMap.containsKey(b.getBlogcategory())) {
					tempMap.put(b.getBlogcategory(), 1);

				} else {
					int temp = tempMap.get(b.getBlogcategory());
					tempMap.put(b.getBlogcategory(), tempMap.get(b.getBlogcategory()) +1);

				}
			}
			
			List<String>categorys=new ArrayList<String>();
			List<Integer>counts=new ArrayList<Integer>();
			
			Iterator entries = tempMap.entrySet().iterator();

			while (entries.hasNext()) {

				Map.Entry entry = (Map.Entry) entries.next();

				String key = (String) entry.getKey();
				categorys.add(key);

				Integer value = (Integer) entry.getValue();
				counts.add(value);
				System.out.println("Key = " + key + ", Value = " + value);
			}
			
			Map<String,List>result=new HashMap<String, List>();
			result.put("categorys", categorys);
			result.put("counts", counts);
			

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Map TopAnalysis() {
		
		try {
			Map<String, List>result=new LinkedHashMap<String, List>();
			Session session = factory.getCurrentSession();
			String hql = "FROM Blog order by views desc";

			List<Blog> list = session.createQuery(hql).setMaxResults(10).getResultList();
			
			List<String>titles=new ArrayList<String>();
			List<Integer>views=new ArrayList<Integer>();
			for(int i=0;i<list.size();i++) {
				titles.add(list.get(i).getTitle());
				views.add(list.get(i).getViews());
			}
			
			result.put("titles", titles);
			result.put("views", views);
			

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	

	
	
}
