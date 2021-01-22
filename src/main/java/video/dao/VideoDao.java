package video.dao;

import java.util.List;

import org.hibernate.Session;

import member.MemberBean;
import video.model.Video;

public interface VideoDao {

	int insertVideo(Video vd);

	Session getSession();

	// 查詢所有影片
	List<Video> selectAllVideo();

	// commentBean 的 get(id)方法
	Video get(Integer VideoId);

	// 刪除一筆影片
	// commentBean 的 get(id)方法在下方(此id為videoId)
	int deleteVideo(int id);

	// 選擇一筆需要更新的影片
	Video selectUpdateVideo(Integer VideoId);

	// 更新一筆影片
	Integer updateVideo(Video vd);
	//by ID 查詢影片
	Video queryById(Integer videoID);
	
	
	List<Video> getRandomVideo(Integer num);
	
	List<Video> getVideoByMember(MemberBean mb);
}