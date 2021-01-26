package advertisement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import blog.model.Blog;
import member.MemberBean;
import video.model.Video;

@Repository
public class AdvertisementDao {

	@Autowired
	SessionFactory factory;

	public List<Advertisement> queryAll() {
		try {
			Session session = factory.getCurrentSession();

			String hql = "FROM Advertisement order by advid asc";

			@SuppressWarnings("unchecked")
			Query<Advertisement> query = session.createQuery(hql);

			return query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public Advertisement queryRandom() {//無其他條件限制s
		try {
			Session session = factory.getCurrentSession();

			String hql = "FROM Advertisement a where a.postTime<=GETDATE() and a.endTime>=GETDATE() and a.status='true' order by NEWID()";

			@SuppressWarnings("unchecked")
			Query<Advertisement> query = session.createQuery(hql);
			//隨機取一筆
			
			query.setMaxResults(1);

			return query.getSingleResult();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public void updateAdvertisement(Advertisement ad) {
		
		
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(ad);
		

	}

	public List<Advertisement> queryByTime() {

		try {
			Session session = factory.getCurrentSession();
			String sql = "select * from Advertisement where postTime<=GETDATE() and endTime>=GETDATE()";
			@SuppressWarnings("unchecked")
			Query<Advertisement> query = session.createNativeQuery(sql);

			return query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢失敗或沒有符合的項目");
			return null;

		}

	}

	public List<Advertisement> queryByCategory(String catogory) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT FROM Advertisement adv where adv.advcategory=:category";
		@SuppressWarnings("unchecked")
		Query<Advertisement> query = session.createQuery(hql);

		return query.setParameter("category", catogory).getResultList();

	}
	
	public void insertAdv(Advertisement adv) {
		
		Session session = factory.getCurrentSession();
		session.save(adv);
		
		
	}
	
public Advertisement getAdvertisement(Integer adsID) {
	
	Session session = factory.getCurrentSession();

	Advertisement ads = session.get(Advertisement.class, adsID);
	
	//debug
	System.out.println("ads="+ads.getAdvtitle());
	return ads;
			 
		
	}

	public void deleteAdvertisement(Integer adsID) {
		
		Session session=factory.getCurrentSession();
		Advertisement ads=session.get(Advertisement.class, adsID);
		session.delete(ads);
		
	}
	
	public Map getCategoryData() {
		

		
		try {

			Map<String, Integer> result = new LinkedHashMap<String, Integer>();
			Session session = factory.getCurrentSession();
			
			String hql = "FROM Advertisement";
				
			List<Video> list = session.createQuery(hql).getResultList();
			List<String>category=new ArrayList<String>();
			List<Integer>count=new ArrayList<Integer>();
			
			
			for (Video v : list) {

				if (!result.containsKey(v.getCategory())) {
					result.put(v.getCategory(), v.getViewCount());

				} else {
					int temp = result.get(v.getCategory());
					result.put(v.getCategory(), result.get(v.getCategory()) + v.getViewCount());

				}
			}
			
			

			// debug

			Iterator entries = result.entrySet().iterator();

			while (entries.hasNext()) {
				
				
				Map.Entry entry = (Map.Entry) entries.next();

				String key = (String) entry.getKey();
				category.add(key);

				Integer value = (Integer) entry.getValue();
				count.add(value);
				System.out.println("Key = " + key + ", Value = " + value);
				//
			
			}
			
			Map<String, List> resultMap=new LinkedHashMap<String, List>();
			resultMap.put("category",category);
			resultMap.put("count",count);

			return resultMap;

		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
//	public void modifyLength(Integer length) {
//		
//		Session session=factory.getCurrentSession();
//		Advertisement ads=session.get(Advertisement.class,adsID)
//		
//	}

}
