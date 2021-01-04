package tool;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import comment.model.Video;
import member.MemberBean;
import product.model.ProductBean;
import tool.model.Image;

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
//		uploadVideo();
//		resetpassword();

		uploadImage();
//		refreshPic();
//		testJson();

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

	static void uploadVideo() {
		try {

			JFrame frame = new JFrame();
			JFileChooser chooser = new JFileChooser();
			chooser.setDialogTitle("choose video to upload");
			FileNameExtensionFilter filter = new FileNameExtensionFilter("mp4,wmv,", "mp4", "wmv");
			chooser.setFileFilter(filter);
			chooser.setMultiSelectionEnabled(true);
			int returnVal = chooser.showOpenDialog(frame);
			if (returnVal == JFileChooser.APPROVE_OPTION) {

				File[] files = chooser.getSelectedFiles();
				for (File f : files) {
					System.out.println("You chose to open this file: " + f.getName());
					Video video = new Video();

					FileInputStream fis = new FileInputStream(f);

					byte[] b = new byte[fis.available()];
					fis.close();
					video.setVideo(new SerialBlob(b));

					session.save(video);
				}

				tx.commit();
				System.out.println("上傳影片成功");

			}
		} catch (Exception e) {
			tx.rollback();
			System.err.println("上傳圖片失敗");
			e.printStackTrace();

		}
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

//			    		 byte[] b = fis.readAllBytes();
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

}
