package advertisement.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import advertisement.Advertisement;
import advertisement.AdvertisementService;
import member.Service.MemberService;
import tool.Common;

@Controller
@SessionAttributes({ "adv", "advlist", "member" })
public class AdvertisementController {

	@Autowired
	AdvertisementService advService;

	@Autowired
	MemberService ms;

	@GetMapping(value = "getAds")
	@ResponseBody
	public String queryAll(Model model) {
		try {
			System.out.println("try to get all adv");
			Gson gson = new Gson();

			List<Advertisement> advlist = advService.queryAll();//
			for (Advertisement ad : advlist) {
				System.out.println("ad=" + ad.getAdvtitle());
			}
			String result = gson.toJson(advlist);

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@PostMapping(value = "switchAds")
	@ResponseBody
	public boolean switchAds(
			@RequestParam(value = "status") boolean status,
			@RequestParam(value = "adsID") Integer adsID
			) {
		
		try {
			System.out.println("switch boolean="+status);
			

			Advertisement ad = advService.getAdvertisement(adsID);
			ad.setStatus(status);
			advService.updateAdvertisement(ad);
			System.out.println("ad開啟狀態:" + ad.isStatus());
			

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@PostMapping(value = "deleteAds")
	@ResponseBody
	public boolean deleteAds(
			@RequestParam(value="adsID")Integer adsID
			) {
		try {
			System.out.println("try to delete one ad");
			
			Advertisement ad = advService.getAdvertisement(adsID);//
			System.out.println("delete ad=" + ad.getAdvtitle());
			advService.deleteAdvertisement(adsID);
						
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	//修改秒數
	@PostMapping(value = "modifyAdsLength")
	@ResponseBody
	public boolean deleteAds(
			@RequestParam(value="adsID")Integer adsID,
			@RequestParam(value="length")Integer length
			) {
		try {
			System.out.println("try to modify one ad");
			
			Advertisement ad = advService.getAdvertisement(adsID);//
			System.out.println("調整 ad=" + ad.getAdvtitle()+"時長為"+length+"秒");
			ad.setAdvlength(length);
			
			advService.updateAdvertisement(ad);
						
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
//	取得廣告類型資料
	@SuppressWarnings("rawtypes")
	@GetMapping(value = "getAdvCategory")
	@ResponseBody
	public Map queryCategoryData(Model model) {
		try {
			System.out.println("try to get category data");
			
			return advService.getCategoryData();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
//	取得廣告類型資料
	@SuppressWarnings("rawtypes")
	@GetMapping(value = "ads/getTopRate")
	@ResponseBody
	public List getTopRate(@RequestParam(value = "top",required = false)Integer top) {
		try {
			System.out.println("try to get top data");
			if(top==null) {
				top=5;
			}
			return advService.getTop(top);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	

	@GetMapping(value = "getOneAd")
	@ResponseBody
	public String querySAll(Model model) {
		try {
			System.out.println("try to get one ad");
			Gson gson = new Gson();

			Advertisement ad = advService.queryRandom();//
			ad.setAdvcount(ad.getAdvcount() + 1);
			advService.updateAdvertisement(ad);
			System.out.println("ad=" + ad.getAdvtitle());
			String result = gson.toJson(ad);

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@GetMapping(value = "advertisement")
	public String advertisement(Model model) {

		return "advertisement/advBackstage";
	}

	// 新增空白廣告
	@GetMapping(value = "advertisement/edit")
	public String gotoEditPage(Model model) {
		Advertisement advertisement = new Advertisement();
		model.addAttribute("adv", advertisement);
		return "advertisement/editAdv";
	}

	// 新增一則廣告
	@PostMapping("advertisement/edit")
	public void insertNewAdvertisement(@ModelAttribute("adv") Advertisement adv, Model model,

			@RequestParam(value = "memberID", required = false) Integer mid,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "video", required = false) MultipartFile video,
			@RequestParam(value = "postDate", required = false) String postDate,
			@RequestParam(value = "endDate", required = false) String endDate,
//				@RequestParam(value="sourcetype",required = false)String sourceType,
			@RequestParam(value = "link", required = false) String link,
			HttpServletResponse response) throws IOException 
	{
		
		response.setContentType("text/html;charset=utf-8");
//		ModelAndView mav=new ModelAndView();
		PrintWriter out = response.getWriter();
		System.out.println("adv insert");

		System.out.println("postDate:" + postDate);
		System.out.println("endDate:" + endDate);
		System.out.println("title:" + adv.getAdvtitle());
		System.out.println("sourceType:" + adv.getAdvsourcetype());
//			System.out.println("sourceType2:"+sourceType);
		System.out.println("link:" + link);
		try {

			// 如果type是圖片或影片
			if (adv.getAdvsourcetype() == 0 || adv.getAdvsourcetype() == 1) {

				if (adv.getAdvsourcetype() == 0) {

					// 上傳圖片
					adv.setSource(Common.saveImage(file));
					System.out.println("廣告圖片儲存完畢");
				}
				if (adv.getAdvsourcetype() == 1) {
					// 上傳影片
					adv.setSource(Common.saveVideo(video));
					System.out.println("廣告影片儲存完畢");

				}

				System.out.println("廣告檔案上傳OK");

			}

			// youtube內嵌或網址
			if (adv.getAdvsourcetype() == 2 || adv.getAdvsourcetype() == 3) {
				adv.setSource(link);

			}

			adv.setMember(ms.getMember(mid));

			adv.setPostTime(postDate);
			adv.setEndTime(endDate);

			advService.insertAdv(adv);

			System.out.println("廣告新增成功");

			out.print("<script language='javascript'>alert('廣告新增成功!');window.location.href='/AYCB_final/advertisement/'</script>");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.err.println("新增失敗");
			out.print("<script language='javascript'>alert('新增失敗!');window.location.href='/AYCB_final/advertisement/'</script>");
//			return "redirect:/advertisement";
		}

	}

}
