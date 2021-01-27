package video.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import blog.model.Blog;
import member.MemberBean;
import product.model.CollectBean;
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
	
	//取得隨機幾筆影片
	List<Video> getRandomVideo(Integer num);
	//取得會員上傳的影片
	List<Video> getVideoByMember(MemberBean mb);
	//取得所有類型
	List<String>getAllCategory();
	//載入符合特定條件的video,後兩個參數為起始值與最大筆數
	List<Video>getMoreVideos(String condition,Integer index,Integer num);
	//查詢符合條件的影片
	List<Video>searchVideo(String search);
	
	//查詢最近上傳的影片
	List<Video>recentVideo(Integer max);
	
	//查詢瀏覽次數最多的5部影片
	List<Video>mostViewVideo();
	//回傳各類別的統計數
	/**
	 * 
	 * @return 回傳鍵值=category,value=統計數
	 */
	Map<String,Integer> getViewsByCategory();
	
	//查詢年度上傳數量
	
	Map<String, Integer>getViewsByDate(Integer year);
	

	
	public List<Video> allcollection(int videoId);
	
	public List<Integer> findcollection(int mid);
	
	public int pkcollection(int mid, int vid);
	
	public List<CollectBean> collection(int mid);
	
	public void addcollection(int mid, int vid);
	
}