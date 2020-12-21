/**
 * 共用功能和一些常數暫時存在這個類裡面,
 * @author Kevin
 *
 */

package tool;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class Common {

	public void changeEnv(String env) {

		if (env.equals("Kevin")) {

		}

	}

	/**
	 * 上傳路徑改成自己電腦專案路徑
	 */

	public static String UPLOAD_PATH = "C:/AYCB_merge/AYCB_final/src/main/webapp/upload/";
	// UPLOAD_PATH="C:/AYCB/AYCB2/src/main/webapp/upload/
	// C:/iii/Java/JavaWebWorkspace/ProjectTest/WebContent/upload
	
	/**
	 * 這個參數是為了Debug知道存在這個專案下圖檔的真實位置,跟上面的路徑一致,只是斜線方向相反...
	 */
	public static String IMAGE_REAL_PATH = "C:\\AYCB_merge\\AYCB_final\\src\\main\\webapp\\upload";

	// "C:\\iii\\java\\src\\main\\webapp\\upload";
	// "C:\\AYCB\\AYCB2\\src\\main\\webapp\\upload"
	// public static String
	// uPLOAD_DIR="C:/iii/Java/JavaWebWorkspace/ProjectTest/WebContent/upload";

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

	// Kevin:儲存檔案的方式有變化,從Part->MultipartFile
	public static String saveImage(MultipartFile file) throws IOException {

		String filename = file.getOriginalFilename();

		filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(Calendar.getInstance().getTime()) + "_" + filename;
		File tempfile = new File(Common.UPLOAD_PATH, filename);
		file.transferTo(tempfile);// 寫入真實路徑// part.transferTo(file);// 寫入真實路徑
		System.out.printf("成功寫入圖片,路徑:%s\n", tempfile.getAbsoluteFile());
		return "/AYCB_final/upload/" + filename;

	}

	public static String getImgRealPath(String s) {

		String path = s.substring(s.lastIndexOf("/"));
		return Common.IMAGE_REAL_PATH + path;
	}

}