package video.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberBean;
import video.model.Video;

@Repository
public class VideoDaoImpl implements VideoDao {

	@Autowired
	SessionFactory factory;

	// 新增一筆影片

	@Override
	public int insertVideo(Video vd) {
		int count = 0;
		Session session = getSession();
		session.save(vd);
		count++;
		return count;
	}

	// getSession()方法--用getCurrentSession()來傳回值

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢所有影片
	@Override
	@SuppressWarnings("unchecked")
	public List<Video> selectAllVideo() {
		String hql = "FROM Video order by commentTime desc";
		Session session = getSession();
		List<Video> list = session.createQuery(hql).getResultList();
		return list;
	}

	// commentBean 的 get(id)方法
	@Override
	public Video get(Integer VideoId) {
		Video vd = null;
		vd = getSession().get(Video.class, VideoId);
		System.out.println("即將刪除" + vd.getMember().getName());
		return vd;
	}

	// 刪除一筆影片
	// commentBean 的 get(id)方法在下方(此id為videoId)
	@Override
	public int deleteVideo(int id) {
		int count = 0;
		Session session = getSession();
		Video vd = get(id);
		session.delete(vd);
		count++;
		return count;
	}

	// 選擇一筆需要更新的影片
	@Override
	public Video selectUpdateVideo(Integer VideoId) {

		Session session = getSession();
		return session.get(Video.class, VideoId);
	}

	// 更新一筆影片
	@Override
	public Integer updateVideo(Video vd) {
		Integer count = 0;
		Session session = getSession();
		session.saveOrUpdate(vd);
		count++;
		return count;

	}

	@Override
	// by ID 查詢影片
	public Video queryById(Integer videoID) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM Video v WHERE v.videoId = :videoID";

			@SuppressWarnings("unchecked")
			Query<Video> query = session.createQuery(hql);
			Video video = query.setParameter("videoID", videoID).getSingleResult();
			return video;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Video> getRandomVideo(Integer num) {

		try {

			Session session = factory.getCurrentSession();
			String sql = "select  top " + num + " *  from video order by NEWID()";

			@SuppressWarnings("unchecked")

			Query<Video> query = session.createNativeQuery(sql).addEntity(Video.class);
			return query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Video> getVideoByMember(MemberBean mb) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "From Video v where v.member=:member";
			@SuppressWarnings("unchecked")
			Query<Video> query = session.createQuery(hql);
			// debug

			return query.setParameter("member", mb).getResultList();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<String> getAllCategory() {

		try {
			Session session = factory.getCurrentSession();
			String hql = "select distinct v.category from Video v";
			@SuppressWarnings("unchecked")
			Query<String> query = session.createQuery(hql);

			// debug

			return query.getResultList();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Video> getMoreVideos(String keyword, Integer index, Integer num) {
		try {

			Session session = factory.getCurrentSession();

			List<Video> list = new LinkedList<Video>();

			String hql = "FROM Video v WHERE v.title like :keyword or v.category like :keyword";

			Query<Video> query = session.createQuery(hql);

			if (keyword == null) {
				keyword = " ";
			}
			if (index == null) {
				index = 1;
			}
			if (num == null) {
				num = 6;
			}
			list = query.setParameter("keyword", "%" + keyword + "%").setFirstResult(index).setMaxResults(num)
					.getResultList();
			// debug

			for (Video v : list) {
				System.out.println("v:" + v.getVideoId());

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Video> searchVideo(String search) {
		try {

			Session session = factory.getCurrentSession();

			List<Video> list = new LinkedList<Video>();

			String hql = "FROM Video v WHERE v.title like :keyword or v.category like :keyword";

			@SuppressWarnings("unchecked")
			Query<Video> query = session.createQuery(hql);

			list = query.setParameter("keyword", "%" + search + "%").getResultList();
			// debug

			for (Video v : list) {
				System.out.println("v:" + v.getVideoId());

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Video> recentVideo(Integer max) {
		try {

			Session session = factory.getCurrentSession();

			List<Video> list = new ArrayList<Video>();

			String hql = "FROM Video order by commentTime desc";

			@SuppressWarnings("unchecked")
			Query<Video> query = session.createQuery(hql);
			if (max == null) {
				max = 6;
			}
			list = query.setMaxResults(max).getResultList();

			// debug

			for (Video v : list) {
				System.out.println("v:" + v.getVideoId());

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Video> mostViewVideo() {

		try {

			Session session = factory.getCurrentSession();

			List<Video> list = new ArrayList<Video>();

			String hql = "FROM Video order by viewCount desc";

			@SuppressWarnings("unchecked")
			Query<Video> query = session.createQuery(hql);
			// 預設抓5筆
			list = query.setMaxResults(5).getResultList();

			// debug

			for (Video v : list) {
				System.out.println("v:" + v.getVideoId());

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public Map<String, Integer> getViewsByCategory() {
		try {

			Map<String, Integer> result = new LinkedHashMap<String, Integer>();
			Session session = factory.getCurrentSession();
			String hql = "FROM Video";

			List<Video> list = session.createQuery(hql).getResultList();
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

				Integer value = (Integer) entry.getValue();

				System.out.println("Key = " + key + ", Value = " + value);
			}

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public Map<String, Integer> getViewsByDate(Integer year) {
		try {

			Map<String, Integer> result = new LinkedHashMap<String, Integer>();
			Session session = factory.getCurrentSession();
			String hql = "FROM Video v where datepart(year,v.commentTime)=:year";
				
			List<Video> list = session.createQuery(hql).setParameter("year", year).getResultList();
			
//			for(int i=1;i<=12;i++) {
//				
//				for(Video v:list) {
//					
//					if((v.getCommentTime().getMonth()+1)==i) {
//						
//						
//					}
//					
//				}
//			}
			for (Video v : list) {

				if (!result.containsKey(v.getCategory())) {
					result.put(v.getCategory(), v.getViewCount());

				} else {
					int temp = result.get(v.getCategory());
					result.put(v.getCategory(), result.get(v.getCategory()) + v.getViewCount());

				}
			}

			// debug

//			Iterator entries = result.entrySet().iterator();
//
//			while (entries.hasNext()) {
//
//				Map.Entry entry = (Map.Entry) entries.next();
//
//				String key = (String) entry.getKey();
//
//				Integer value = (Integer) entry.getValue();
//
//				System.out.println("Key = " + key + ", Value = " + value);
//			}

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
