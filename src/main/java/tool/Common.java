package tool;

import java.awt.FileDialog;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;
import javax.swing.JFrame;
import javax.xml.bind.DatatypeConverter;

import org.springframework.web.multipart.MultipartFile;


public  class Common 


{
	
	
	public void changeEnv(String env) {
		
		if(env.equals("Kevin")) {
			
			
		}
		
		
	}
	
	
	public static String UPLOAD_PATH="C:/Users/Student/git/AYCB_final/src/main/webapp/WEB-INF/images";
	
	public static String UPLOAD_VIDEO="C:/Users/user/git/AYCB_final/src/main/webapp/WEB-INF/video";
	//UPLOAD_PATH="C:/AYCB/AYCB2/src/main/webapp/upload/
	public static String IMAGE_REAL_PATH="C:\\Users\\Student\\git\\AYCB_final\\src\\main\\webapp\\WEB-INF\\images";
	
	public static String UPLOAD_DIALOG="上傳單一檔案";
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
		return "/AYCB/image/" + filename;

	}

	public static String getImgRealPath(String s) {

		String path = s.substring(s.lastIndexOf("/"));
		return Common.IMAGE_REAL_PATH + path;
	}
	
	
	 public static File showLoadDialog() {
		 	JFrame frame=new JFrame();
		 			
	        FileDialog dialog = new FileDialog(frame, UPLOAD_DIALOG, FileDialog.LOAD);
	        dialog.setVisible(true);
	        String dirpath = dialog.getDirectory();//獲取儲存檔案路徑並儲存到字串中。
	        String fileName = dialog.getFile();////獲取打儲存檔名稱並儲存到字串中
	        if (dirpath == null || fileName == null) //判斷路徑和檔案是否為空
	        {
	            return null;
	        }
	        return new File(dirpath, fileName);


	    }
	 /**
	  * MD5加密
	  * @param message
	  * @return 返回加密後文字
	  */
	 
	 public static String getMD5Endocing(String message) {
			final StringBuffer buffer = new StringBuffer();
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(message.getBytes());
				byte[] digest = md.digest();

				for (int i = 0; i < digest.length; ++i) {
					final byte b = digest[i];
					final int value = Byte.toUnsignedInt(b);
					buffer.append(value < 16 ? "0" : "");
					buffer.append(Integer.toHexString(value));
				}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				return null;
			}
			return buffer.toString();
		}
	 
	 /**
	  * SHA1加密
	  * @param message
	  * @return
	  */
	 
	 public static String getSHA1Endocing(String message) {
			final StringBuffer buffer = new StringBuffer();
			try {
				MessageDigest md = MessageDigest.getInstance("SHA1");
				md.update(message.getBytes());
				byte[] digest = md.digest();

				for (int i = 0; i < digest.length; ++i) {
					final byte b = digest[i];
					final int value = Byte.toUnsignedInt(b);
					buffer.append(value < 16 ? "0" : "");
					buffer.append(Integer.toHexString(value));
				}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				return null;
			}
			return buffer.toString();
		}
	 
	 /**
		 * 依MD5演算法將檔案file轉換為128位元(16個位元組)的資料。
		 * 
		 * @param message
		 *            : 要加密的字串
		 * @return : 128位元資料的16進位表示法所構成的字串
		 */
		public static String getMD5Endocing(File file) throws NoSuchAlgorithmException, IOException {
			MessageDigest md = MessageDigest.getInstance("MD5");
			try (FileInputStream fis = new FileInputStream(file);) {
				byte[] ba = new byte[1024];
				int len = 0;
				while ((len = fis.read(ba)) != -1) {
					md.update(ba, 0, len);
				}
			}
			byte[] digest = md.digest();
			final StringBuffer buffer = new StringBuffer();
			for (int i = 0; i < digest.length; ++i) {
				byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));

			}
			return buffer.toString();
		}
		
		
		public static String getSHA1Endocing(File file) throws NoSuchAlgorithmException, IOException {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			try (FileInputStream fis = new FileInputStream(file);) {
				byte[] ba = new byte[1024];
				int len = 0;
				while ((len = fis.read(ba)) != -1) {
					md.update(ba, 0, len);
				}
			}
			byte[] digest = md.digest();
			final StringBuffer buffer = new StringBuffer();
			for (int i = 0; i < digest.length; ++i) {
				byte b = digest[i];
//				int value = (b & 0x7F) + (b < 0 ? 128 : 0);
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));

			}
			return buffer.toString();
		}
		
		/**
		 * 本方法可對加密之字串(Ciphertext)解密，key為當初加密時的金鑰 傳回值為解密後的字串(Plaintext)
		 * 
		 */
		public static String decryptString(String key, String stringToDecrypt) {
			String decryptedString = "";
			try {
				Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
				SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
				cipher.init(Cipher.DECRYPT_MODE, secretKey);
				byte[] b = DatatypeConverter.parseBase64Binary(stringToDecrypt);
				decryptedString = new String(cipher.doFinal(b));
			} catch (InvalidKeyException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (NoSuchPaddingException e) {
				e.printStackTrace();
			} catch (IllegalBlockSizeException e) {
				e.printStackTrace();
			} catch (BadPaddingException e) {
				e.printStackTrace();
			}
			return decryptedString;
		}
		
		/**
		 * 將指定路徑檔案轉為Blob	
		 * @param imageFileName 圖片路徑
		 * @return	回傳Blob
		 * @throws IOException
		 * @throws SQLException
		 */
		
		public static Blob fileToBlob(String imageFileName) throws IOException, SQLException {
			File imageFile = new File(imageFileName);
			long size = imageFile.length();
			byte[] b = new byte[(int) size];
			SerialBlob sb = null;
			try (FileInputStream fis = new FileInputStream(imageFile);) {
				fis.read(b);
				sb = new SerialBlob(b);
			}
			return sb;
		}
		/**
		 * 將Blob轉回檔案
		 * @param is
		 * @param size
		 * @return
		 * @throws IOException
		 * @throws SQLException
		 */
		
		
		public static Blob fileToBlob(InputStream is, long size) throws IOException, SQLException {
			byte[] b = new byte[(int) size];
			SerialBlob sb = null;
			is.read(b);
			sb = new SerialBlob(b);
			return sb;
		}
		
		/**
		 * 將檔案轉為Clob
		 * @param textFileName
		 * @return
		 * @throws IOException
		 * @throws SQLException
		 */
	 
		public static Clob fileToClob(String textFileName) throws IOException, SQLException {
			Clob clob = null;
			try (InputStreamReader isr = new InputStreamReader(new FileInputStream(textFileName), "UTF-8");) {
				char[] c = new char[8192];
				StringBuffer buf = new StringBuffer();
				int len = 0;
				while ((len = isr.read(c)) != -1) {
					buf.append(new String(c, 0, len));
				}
				char[] ca = buf.toString().toCharArray();
				clob = new SerialClob(ca);
			}
			return clob;
		}
		/**
		 * Clob轉回檔案
		 * @param clob
		 * @param file
		 * @param encoding
		 * @throws IOException
		 * @throws SQLException
		 */
		
		public static void clobToFile(Clob clob, File file, String encoding) throws IOException, SQLException {
			try (Reader reader = clob.getCharacterStream();
					BufferedReader br = new BufferedReader(reader);
					FileOutputStream fos = new FileOutputStream(file);
					OutputStreamWriter osw = new OutputStreamWriter(fos, encoding);
					PrintWriter out = new PrintWriter(osw);) {
				String line = null;
				while ((line = br.readLine()) != null) {
					out.println(line);
				}
			}
		}
		/**
		 * 取得最後一個"/"後的文字
		 * @param pathName
		 * @return
		 * @throws IOException
		 * @throws SQLException
		 */
		
		public static String extractFileName(String pathName) throws IOException, SQLException {
			return pathName.substring(pathName.lastIndexOf("/") + 1);
		}
	 
}