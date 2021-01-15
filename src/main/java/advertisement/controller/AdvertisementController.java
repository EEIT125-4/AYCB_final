package advertisement.controller;

import java.util.Date;
import java.util.List;

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
@SessionAttributes({"adv","advlist","member"})
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
			Gson gson=new Gson();
			
			List<Advertisement> advlist = advService.queryAll();// 訊息types
			String result = gson.toJson(advlist);
			

			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		

	}
	
	@GetMapping(value = "advertisement")
	public String advertisement() {
		
		return "advertisement/advBackstage";
	}
	
	//新增空白廣告
	@GetMapping(value="advertisement/edit")
	public String gotoEditPage(Model model) {
		Advertisement advertisement=new Advertisement();
		model.addAttribute("adv",advertisement);
		return "advertisement/editAdv";
	}
	
	// 新增一則廣告
		@PostMapping("advertisement/edit")
		public String insertNewAdvertisement(
				@ModelAttribute("adv") Advertisement adv,
				Model model,
				
				@RequestParam(value = "memberID",required = false) Integer mid,
				@RequestParam(value = "file",required = false) MultipartFile file,
				@RequestParam(value = "postDate",required = false) String postDate,
				@RequestParam(value = "endDate",required = false) String endDate,
				@RequestParam(value="sourcetype",required = false)String sourceType

		) {
			System.out.println("adv insert");
			
			System.out.println("postDate:"+postDate);
			System.out.println("endDate:"+endDate);
			System.out.println("title:"+adv.getAdvtitle());
			System.out.println("sourceType:"+adv.getAdvsourcetype());
			System.out.println("sourceType2:"+sourceType);
			try {
								
				// 上傳封面圖
				if (file != null && file.getSize() > 0) {
					System.out.println("adv 有收到檔案");
					System.out.println("類型為:"+sourceType);
					if(sourceType.equals("image")) {
						
						try {						
							adv.setSource(Common.saveImage(file));
							System.out.println("廣告圖片儲存完畢");
						} catch (Exception e) {
							e.printStackTrace();
							throw new RuntimeException("圖片上傳發生異常: " + e.getMessage());
						}
						
						
					}
					
					
					
					
				} else {
					System.out.println("沒有上傳檔案,取消編輯");
					return "advertisement/editAdv";
					
					
				}
				
				adv.setMember(ms.getMember(mid));
				adv.setAdvsourcetype(sourceType);
				adv.setPostTime(postDate);
				adv.setEndTime(endDate);
				
				advService.insertAdv(adv);
				
				System.out.println("廣告新增成功");
				
				return "redirect:/advertisement";
			} catch (Exception ex) {
				ex.printStackTrace();
				System.err.println("新增失敗");
				
				return "redirect:/advertisement";
			}

		}
	
	

	
	
	
	
	

}
