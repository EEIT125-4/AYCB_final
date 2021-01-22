package video.service;

import java.util.List;

import member.MemberBean;
import video.model.Video;

public interface VideoService {

	// 新增一筆影片(save=insert)
	int insertVideo(Video vd);

	// 查詢所有影片
	List<Video> selectAllVideo();

	// 刪除一筆影片
	int deleteVideo(Integer videoId);

	//選擇一筆需要更新的影片
	Video selectUpdateVideo(Integer videoId);

	// 更新一筆影片
	int updateVideo(Video vd);
	//by ID 查詢影片
	Video queryById(Integer videoID);
	
	List<Video> getRandomVideo(Integer num);
	
	List<Video> getVideoByMember(MemberBean mb);

}