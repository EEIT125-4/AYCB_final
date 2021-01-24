package advertisement;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

import member.MemberBean;

@Entity
@Table
public class Advertisement {

	@Id
//	 當使用IDENTITY時，主要鍵的資料型態必須是整數或符點數，不可以為char或String
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer advid;

	@Column(columnDefinition = "NVARCHAR(MAX) NOT NULL")
	private String advtitle;

	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String advdesc;

	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String advcategory;// 分類

	@Column(columnDefinition = "int NOT NULL")
	private int advsourcetype;//
	/**
	 * 資源分類 image--圖片 video--影片 youtube--內嵌影片 url--純網址
	 */
	@Transient
	public static final String[] types = { "image", "video", "youtube", "url" };

	@Column(columnDefinition = "NVARCHAR(MAX) NOT NULL")
	private String source;// 資源位置

	@Column(columnDefinition = "datetime")
	private Timestamp postTime;// 開始播放廣告日期

	@Column(columnDefinition = "datetime")
	private Timestamp endTime;// 結束撥放廣告日期

	@Column(columnDefinition = "int default 0")
	private Integer width = 300;// 預設寬度

	@Column(columnDefinition = "int default 0")
	private Integer height = 300;// 預設高度

	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String owner;

	@Column(columnDefinition = "int default 0")
	private Integer advcount = 0;// 累積播放次數

	@Column(columnDefinition = "int default 0")
	private Integer advlength = 5;// 預設廣告時間(秒)

	@Column(columnDefinition = "int default 0")
	private Integer status = 0;// 狀態碼

	@ManyToOne
	@JoinColumn(name = "member")
	private MemberBean member;

	public Advertisement() {
	}

	public Integer getAdvid() {
		return advid;
	}

	public void setAdvid(Integer advid) {
		this.advid = advid;
	}

	public String getAdvtitle() {
		return advtitle;
	}

	public void setAdvtitle(String advtitle) {
		this.advtitle = advtitle;
	}

	public String getAdvdesc() {
		return advdesc;
	}

	public void setAdvdesc(String advdesc) {
		this.advdesc = advdesc;
	}

	public String getAdvcategory() {
		return advcategory;
	}
	
	

	public void setAdvcategory(String advcategory) {
		this.advcategory = advcategory;
	}

	public int getAdvsourcetype() {
		return advsourcetype;
	}

	public void setAdvsourcetype(int advsourcetype) {
		this.advsourcetype = advsourcetype;
	}

	public String getSource() {
		return source;
	}

//	public void setSource(MultipartFile file) {
//		
//		// 圖片
//				if (this.advsourcetype == 0) {
//					this.source = "<iframe src=" + source + " width=\"" + this.width + "px\" height=\"" + this.height
//							+ "px\"></iframe>";
//					return;
//				}
//
//				// 影片
//				if (this.advsourcetype == 1) {
//					this.source = "<iframe src=" + source + " width=\"" + this.width + "px\" height=\"" + this.height
//							+ "px\"></iframe>";
//					return;
//				}
//
//	}

	public void setSource(String source) {

	
		if (this.advsourcetype == 0 || this.advsourcetype == 1) {
			this.source = "<iframe src=" + source + " width=\"" + this.width + "px\" height=\"" + this.height
					+ "px\"></iframe>";
			return;
		}
		
		// youtube嵌入
		if (this.advsourcetype == 2) {

			// 更改youtube寬高、自動撥放設定
			this.source = saveYoutube(source);
			return;
		}
		// 網站連結
		if (this.advsourcetype == 3) {
			this.source = "<iframe src=\"" + source + "\" width=\"" + this.width + "px\" height=\"" + this.height
					+ "px\"></iframe>";
			return;
		}

	}

	public String saveYoutube(String s) {

		
		String mark = "?controls=0&mute=1&autoplay=1&rel=0&amp;showinfo=0";

		String params[] = s.split(" ");
		String result = "";
		System.out.println("length=" + params.length);
		for (int i = 0; i < params.length; i++) {
			if (i == 1) {
				params[i] = "width=\"" + this.width + "\"";
			}
			if (i == 2) {
				params[i] = "height=\"" + this.height + "\"";
			}
			if (i == 3) {
				params[i] = params[i].substring(0, params[i].length() - 1) + mark + "\"";
			}
//			
			result += params[i]+" ";
			
		}
		System.out.println(result);
		return result;

	}

	public Timestamp getPostTime() {
		return postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public void setPostTime(String postDate) {

		this.postTime = convertToTimeStamp(postDate);
	}

	private Timestamp convertToTimeStamp(String s) {

		String[] d = s.split("-");

		Date date = new Date(Integer.parseInt(d[0]) - 1900, Integer.parseInt(d[1]) - 1, Integer.parseInt(d[2]));

		return new Timestamp(date.getTime());

	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public void setEndTime(String endDate) {
		this.endTime = convertToTimeStamp(endDate);
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public Integer getAdvcount() {
		return advcount;
	}

	public void setAdvcount(Integer advcount) {
		this.advcount = advcount;
	}

	public Integer getAdvlength() {
		return advlength;
	}

	public void setAdvlength(Integer advlength) {
		this.advlength = advlength;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

}
