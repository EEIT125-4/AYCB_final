package video.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberBean;
import video.dao.VideoDao;
import video.model.Video;

@Service
@Transactional
public class VideoServiceImpl implements VideoService {

	@Autowired
	VideoDao dao;
						
	// 新增一筆影片(save=insert)
	@Override
	public int insertVideo(Video vd) {
		return dao.insertVideo(vd);
	}

	// 查詢所有影片
	@Override
	public List<Video> selectAllVideo() {
		return dao.selectAllVideo();
	}

	// 刪除一筆影片
	@Override
	public int deleteVideo(Integer videoId) {		
		return dao.deleteVideo(videoId);
	}

//選擇一筆需要更新的影片
	@Override
	public Video selectUpdateVideo(Integer videoId) {
			return dao.selectUpdateVideo(videoId);
	}

	// 更新一筆影片
	@Override
	public int updateVideo(Video vd) {
			return dao.updateVideo(vd);
	}

	@Override
	public Video queryById(Integer videoID) {
		
		return dao.queryById(videoID);
	}

	@Override
	public List<Video> getRandomVideo(Integer num) {
		
		return dao.getRandomVideo(num);
	}

	@Override
	public List<Video> getVideoByMember(MemberBean mb) {
		
		return dao.getVideoByMember(mb);
	}

	@Override
	public List<String> getAllCategory() {
		
		return dao.getAllCategory();
	}

	@Override
	public List<Video> getMoreVideos(String condition, Integer index, Integer num) {
		
		return dao.getMoreVideos(condition, index, num);
	}

	@Override
	public List<Video> searchVideo(String search) {

		return dao.searchVideo(search);
	}
}
