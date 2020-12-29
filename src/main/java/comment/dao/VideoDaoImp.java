package comment.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import comment.model.Video;

@Repository
public class VideoDaoImp implements VideoDao {

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
		String hql = "FROM Video order by commentTime asc";
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

	
}
