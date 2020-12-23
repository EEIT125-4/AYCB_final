package tool;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.web.multipart.MultipartFile;


public  class Common {
	
	
	public void changeEnv(String env) {
		
		if(env.equals("Kevin")) {
			
			
		}
		
		
	}
	
	
	public static String UPLOAD_PATH="C:/Users/Student/git/AYCB_final/src/main/webapp/WEB-INF/images";
	//UPLOAD_PATH="C:/AYCB/AYCB2/src/main/webapp/upload/
	public static String IMAGE_REAL_PATH="C:\\Users\\Student\\git\\AYCB_final\\src\\main\\webapp\\WEB-INF\\images";
	//"C:\\AYCB\\AYCB2\\src\\main\\webapp\\upload"
	//public static String uPLOAD_DIR="C:/iii/Java/JavaWebWorkspace/ProjectTest/WebContent/upload";
	public static String EMAIL_HOST="smtp.gmail.com";
	public static Integer EMAIL_PORT=587;
	public static String EMAIL_SENDER="2020AYCB@gmail.com";
	public static boolean deleteFile(String path) {
		File file = new File(path);
		if (file.exists()) {
			if (file.isFile()) {// 如果是一個標準檔案
				file.delete();
			} else {
				// 如果是一整個資料夾,把資料夾下所有的文件刪除,此案例雖然用不到,但之後可以做為其他專案參考
				File fileLists[] = file.listFiles();
				for (File f : fileLists) {
					f.delete();
				}
			}
		}
		return !file.exists();// 不知道有沒有可能碰到,刪不掉的情形
	}
	
	public static String saveImage(MultipartFile file) throws IOException {

		String filename = file.getOriginalFilename();
		
		try {
			byte[] b=file.getBytes();
			Blob blob=new SerialBlob(b);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(Calendar.getInstance().getTime()) + "_" + filename;
		File tempfile = new File(Common.UPLOAD_PATH, filename);
		file.transferTo(tempfile);// 寫入真實路徑// part.transferTo(file);// 寫入真實路徑
		System.out.printf("成功寫入圖片,路徑:%s\n", tempfile.getAbsoluteFile());
		return "/AYCB_final/images/" + filename;

	}

	public static String getImgRealPath(String s) {

		String path = s.substring(s.lastIndexOf("/"));
		return Common.IMAGE_REAL_PATH + path;
	}
}