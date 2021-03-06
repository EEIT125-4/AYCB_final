package advertisement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdvertisementService {
	@Autowired
	AdvertisementDao dao;
	
	public List<Advertisement> queryByTime() {
		
		return dao.queryByTime();
	}
	
	public List<Advertisement> queryAll(){
		
		return dao.queryAll();

	}
	
	public List<Advertisement> queryByCategory(String catogory)	{
		
		return dao.queryByCategory(catogory);
		
	}
	
	public void insertAdv(Advertisement adv) {
		dao.insertAdv(adv);
		
	}
	
	public Advertisement queryRandom() {
		return dao.queryRandom();
	}
	
	public void updateAdvertisement(Advertisement ad) {
		dao.updateAdvertisement(ad);
	};
	
	public Advertisement getAdvertisement(Integer adsID) {
		return dao.getAdvertisement(adsID);
		
	}
	
	public void deleteAdvertisement(Integer adsID) {
		
		dao.deleteAdvertisement(adsID);
	}
	
	public List getTop(Integer top) {
		
		return dao.getTop(top);
	}
	
	public Map getCategoryData() {
		
		return dao.getCategoryData();
	}
	

}
