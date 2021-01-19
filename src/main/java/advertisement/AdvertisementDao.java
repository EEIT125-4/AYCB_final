package advertisement;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import blog.model.Blog;

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

			String hql = "FROM Advertisement order by NEWID()";

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
		Query<Advertisement> query = session.createNativeQuery(hql);

		return query.setParameter("category", catogory).getResultList();

	}
	
	public void insertAdv(Advertisement adv) {
		
		Session session = factory.getCurrentSession();
		session.save(adv);
		
		
	}

}
