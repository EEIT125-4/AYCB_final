package tool;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.Date;
import java.time.Period;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.sql.rowset.serial.SerialBlob;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.filechooser.FileNameExtensionFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.MemberBean;
import product.model.ProductBean;
import tool.model.Image;
import video.model.Video;

public class TestOfProject {

	static SessionFactory factory;
	static Session session;
	static Transaction tx;

	public static void main(String[] args) {

//		testJson();

		/**
		 * 這個方法是初始化交易的,如果要進資料庫,記得一定要開
		 */
		initTransaction();
		messageTest();
//		videoSet();
		
//		Map<String, Map>result=new LinkedHashMap<String, Map>();
//		
//		result.put("test", getViewsByCategory());
//		
//		System.out.println(result.get("test"));
//		System.out.println("test"+result.get("test:").get("業配推廣"));
		
		
		
		
		
//		updateVideo();
		
//		resetpassword();

//		uploadImage();
//		refreshPic();
//		testJson();

	}
	
	static void messageTest() {
		
		message.model.Message message=new message.model.Message();
		
		message.setSenddate(new Date(new java.util.Date().getTime()));
		message.setContent("hello");
//		MemberBean from= session.get(MemberBean.class, 2);
//		MemberBean to= session.get(MemberBean.class, 4);
		message.setSendfrom(session.get(MemberBean.class, 2));
		message.setSendto(session.get(MemberBean.class, 4));
		message.setType("test");
		session.save(message);
		tx.commit();
		
	}

	static void updateVideo() {

		String hql = "FROM Video";

		Query<Video> query = session.createQuery(hql);
		List<Video> videolist = new ArrayList<Video>();
		videolist = query.getResultList();
//		for(Video v:videolist) {
//			
//			System.out.println("v:"+v);
//		}
		MemberBean mb = session.get(MemberBean.class, 1);
		System.out.println("mb:" + mb);

		for (Video v : videolist) {
			System.out.println("v:" + v);
			v.setMember(mb);

		}
		System.out.println("更新上傳者");
		tx.commit();

		System.out.println("process end");

	}

	static void resetpassword() {

		String hql = "FROM MemberBean";

		Query<MemberBean> query = session.createQuery(hql);
		List<MemberBean> members = new ArrayList<MemberBean>();
		members = query.getResultList();

		try {

			for (MemberBean m : members) {

				if (m.getPassword() != null && m.getPassword() != "NULL" && m.getPassword() != "") {

					String newpwd = Common.getMD5Endocing(m.getPassword());

					System.out.println("member:" + m.getName() + "--origin password:" + m.getPassword()
							+ "--new password=" + newpwd);
					m.setPassword(newpwd);
					System.out.println("reset ok");
					System.out.println("================================");

				}

			}
			tx.commit();
			System.out.println("all member reset password done");

		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			System.out.println("update password occur error");
		}
		System.out.println("process end");

	}

	static void testJson() {

		String str = "{\"resourceName\":\"people/108400300607956312980\",\"etag\":\"%Eg8BAj0HCAk+Cz8NDxBANy4aBAECBQc=\",\"names\":[{\"metadata\":{\"primary\":true,\"source\":{\"type\":\"PROFILE\",\"id\":\"108400300607956312980\"}},\"displayName\":\"我的姓我的名\",\"familyName\":\"我的姓\",\"givenName\":\"我的名\",\"displayNameLastFirst\":\"我的姓我的名\",\"unstructuredName\":\"我的姓我的名\"}],\"genders\":[{\"metadata\":{\"primary\":true,\"source\":{\"type\":\"PROFILE\",\"id\":\"108400300607956312980\"}},\"value\":\"male\",\"formattedValue\":\"男性\"}],\"birthdays\":[{\"metadata\":{\"primary\":true,\"source\":{\"type\":\"PROFILE\",\"id\":\"108400300607956312980\"}},\"date\":{\"year\":2000,\"month\":12,\"day\":9}}],\"residences\":[{\"metadata\":{\"primary\":true,\"source\":{\"type\":\"PROFILE\",\"id\":\"108400300607956312980\"}},\"value\":\"四川\"}],\"emailAddresses\":[{\"metadata\":{\"primary\":true,\"verified\":true,\"source\":{\"type\":\"ACCOUNT\",\"id\":\"108400300607956312980\"}},\"value\":\"2020aycb@gmail.com\"}],\"occupations\":[{\"metadata\":{\"primary\":true,\"source\":{\"type\":\"PROFILE\",\"id\":\"108400300607956312980\"}},\"value\":\"馬仔\"}]}";
		ObjectMapper objectMapper = new ObjectMapper();
//		TestBean testBean;
		try {
			Map data = objectMapper.readValue(str, Map.class);
			System.out.println("data:" + data);
			JsonNode data2 = objectMapper.readTree(str);
			System.out.println("data2:" + data2.path("names"));
			JsonNode data3 = data2.path("names");
			System.out.println("data3 size:" + data3.get(0));
			System.out.println("get birth:" + data2.path("birthdays").get(0).path("date"));
			System.out.println("get year:" + data2.path("birthdays").get(0).path("date").get("year"));

			System.out.println("get month" + data2.findPath("month "));
			System.out.println("showmyName");

//			testBean = objectMapper.readValue(str, TestBean.class);
//			System.out.println("testBean:"+testBean.toString());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			System.out.println("解析json失敗");

		}

	}

	/**
	 * 進行與資料庫交易有關的操作前初始化方法
	 */
	static void initTransaction() {
		factory = HibernateUtils.getSessionFactory();

		session = factory.getCurrentSession();
		tx = session.beginTransaction();

	}

//	static void uploadVideo() {
//		try {
//			
//			JFrame frame=new JFrame();
//			JFileChooser chooser=new JFileChooser();
//			chooser.setDialogTitle("choose video to upload");
//			FileNameExtensionFilter filter = new FileNameExtensionFilter(
//			        "mp4,wmv,", "mp4", "wmv");
//			    chooser.setFileFilter(filter);
//			    chooser.setMultiSelectionEnabled(true);
//			    int returnVal = chooser.showOpenDialog(frame);
//			    if(returnVal == JFileChooser.APPROVE_OPTION) {
//			    	
//			    	File[] files=chooser.getSelectedFiles();
//			    	for(File f:files) {
//			    		 System.out.println("You chose to open this file: " +
//			 		          f.getName());
//			    		 Video video =new Video();
//			    		
//			    		 FileInputStream fis=new FileInputStream(f);
//			    		 
//			    		 
//			    		 byte[] b=new byte[fis.available()];
//			    		 	fis.close();
//							video.setVideo(new SerialBlob(b));
//							
//							session.save(video);					
//			    	}
//			    	
//    	
//			    	tx.commit();
//			    	System.out.println("上傳影片成功");
//			    	
//			
//		} 
//			    }
//		catch (Exception e) {
//			tx.rollback();
//			System.err.println("上傳圖片失敗");
//			e.printStackTrace();
//			
//		}
//	}
	static void videoSet() {

		String hql = "FROM Video";

		Query<Video> query = session.createQuery(hql);
		List<Video> videoList = new ArrayList<Video>();
		videoList = query.getResultList();

		MemberBean mb1 = session.get(MemberBean.class, 2);
		MemberBean mb2 = session.get(MemberBean.class, 3);

		Random rnd = new Random();

		for (Video v : videoList) {

			if (rnd.nextBoolean()) {

				v.setMember(mb1);
			} else {
				v.setMember(mb2);

			}

		}
		tx.commit();
		System.out.println("all Video reset member");
		System.out.println("process end");

	}

	static void uploadImage() {
		try {
			JFrame frame = new JFrame();
			JFileChooser chooser = new JFileChooser();
			FileNameExtensionFilter filter = new FileNameExtensionFilter("\"jpg\", \"gif\",\"jfif\",\"jpeg\",\"png\"",
					"jpg", "gif", "jfif", "jpeg", "png");
			chooser.setFileFilter(filter);
			chooser.setMultiSelectionEnabled(true);
			int returnVal = chooser.showOpenDialog(frame);
			if (returnVal == JFileChooser.APPROVE_OPTION) {

				File[] files = chooser.getSelectedFiles();
				for (File f : files) {
					System.out.println("You chose to open this file: " + f.getName());
					Image img = new Image();

					byte[] b = new byte[(int) f.length()];

					try (DataInputStream dis = new DataInputStream(new FileInputStream(f));) {

						dis.readFully(b);
					}

					Blob blob = new SerialBlob(b);
					img.setImage(blob);
					img.setFilename(f.getName());
					session.save(img);
				}

				tx.commit();
				System.out.println("上傳圖片成功");

			}
		} catch (Exception e) {
			tx.rollback();
			System.err.println("上傳圖片失敗");
			e.printStackTrace();

		}
	}

	static void refreshPic() {

		// 執行圖檔更新
		System.out.println();
		List<ProductBean> products = new ArrayList<>();
		String hql = "FROM ProductBean order by id desc";
		Query<ProductBean> query = session.createQuery(hql);
		products = query.getResultList();
		String hql2 = "FROM Image";
		Query<Image> query2 = session.createQuery(hql2);
		List<Image> images = new ArrayList<Image>();
		images = query2.getResultList();
		for (ProductBean p : products) {
			System.out.println("productName:" + p.getProductname());
			for (Image img : images) {
				String imagePath = img.getFilename();
				imagePath = imagePath.substring(0, imagePath.lastIndexOf("."));
//				System.out.println("imagePath:"+imagePath);
				if (p.getProductname().equals(imagePath)) {
					p.setImagepath(String.valueOf(img.getImgid()));
					session.save(p);
					System.out.println("更新product:" + p.getProductname() + " path:" + p.getImagepath());

				}
			}
		}
		tx.commit();
	}
	
	static List getDataByDate(Date date) {
	
	Map<String, Integer> result = new LinkedHashMap<String, Integer>();

	String hql = "FROM Video v where v.commentTime >=:date";
	date.setDate(date.getDay()-180);	
	List<Video> list = session.createQuery(hql).setParameter("date",date ).getResultList();
	
	for(Video v:list) {
		
		System.out.println("v:"+v.getCommentTime());
	}
	return list;
	
	}
	
	//
	static Map<String, Integer> getViewsByCategory() {
		try {
			
			Map<String,Integer>result=new LinkedHashMap<String, Integer>();
			
			String hql="FROM Video";
			
			List<Video>list=session.createQuery(hql).getResultList();
			for(Video v:list) {
				
				if(!result.containsKey(v.getCategory())) {
					result.put(v.getCategory(), v.getViewCount());
					
				}else {
					int temp=result.get(v.getCategory());
					result.put(v.getCategory(),result.get(v.getCategory())+v.getViewCount() );

				}				
			}
			
			//debug
			
			Iterator entries=result.entrySet().iterator();

			while (entries.hasNext()) {
			 
			    Map.Entry entry = (Map.Entry) entries.next();
			 
			    String key = (String)entry.getKey();
			 
			    Integer value = (Integer)entry.getValue();
			 
			    System.out.println("Key = " + key + ", Value = " + value);
			}
			
			return result;
 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
//		java.util.Date today=new java.util.Date();
//		today.setMonth(today.getMonth()-2);
//		Date sqldate=new Date(new java.util.Date().getTime());
//		int month=today.getMonth()+1;
//		System.out.println("今天是"+month+"月");
		
//		System.out.println("year="+year);
//		Date date=new Date(new java.util.Date().getTime());
//		date.setDate(date.getDate()-180);
//		
//		
//		List<Video>list=getDataByDate(date);
//		
//		Map<String,Integer> period=new LinkedHashMap<String, Integer>();
//		
//		for(int i=0;i<6;i++) {
//			date.setDate(date.getDate()+30*i);
//			String tag=(date.getYear()+1900)+"-"+(date.getMonth()+1);
//			period.put(tag, 0);
//		}
		
//		Iterator entries=period.entrySet().iterator();
//
//		System.out.println("first time");
//		while (entries.hasNext()) {
//			
//			
//		 
//		    Map.Entry entry = (Map.Entry) entries.next();
//		 
//		    String key = (String)entry.getKey();
//		 
//		    Integer value = (Integer)entry.getValue();
//		 
//		    System.out.println("Key = " + key + ", Value = " + value);
//		}
//		
//				
//			for(Video v:list) {
//				String tag=(v.getCommentTime().getYear()+1900)+"-"+(v.getCommentTime().getMonth()+1);
//				if(!period.containsKey(tag)) {
//					period.put(tag, 1);
//				}else {
//					period.put(tag, period.get(tag)+1);
//				}
//				
//							
//			}			
//			System.out.println("second time");
//			entries=period.entrySet().iterator();
//			
//			while (entries.hasNext()) {
//				 
//			    Map.Entry entry = (Map.Entry) entries.next();
//			 
//			    String key = (String)entry.getKey();
//			 
//			    Integer value = (Integer)entry.getValue();
//			 
//			    System.out.println("Key = " + key + ", Value = " + value);
//			}
		
		//debug
		
	}

}