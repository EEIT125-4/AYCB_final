package product.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import product.dao.ProductDao;
import product.model.CollectBean;
import product.model.ProductBean;
import product.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	SessionFactory factory;

	@Autowired
	ProductDao dao;
	
	@Override
	public void saveproduct(ProductBean pb) {
		dao.saveProduct(pb);
	}

	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Override
	public ProductBean getProduct(int no) {
		return dao.getProduct(no);
	}

	@Override
	public List<ProductBean> getBrandProduct(String brandname) {
		return dao.getBrandProduct(brandname);
	}

	@Override
	public List<ProductBean> getSeriesProduct(String series) {
		return dao.getSeriesProduct(series);
	}

	@Override
	public List<ProductBean> getCateProduct(String cate) {
		return dao.getCateProduct(cate);
	}

	@Override
	public List<ProductBean> getKeyword(String keyword) {
		return dao.getKeyword(keyword);
	}

	@Override
	public List<String> getBrand() {
		return dao.getBrand();
	}

	@Override
	public List<String> getSeries() {
		return dao.getSeries();
	}
	
	@Override
	public List<String> getSeriesByBrand(String brandname) {
		return dao.getSeriesByBrand(brandname);
	}

	@Override
	public List<String> getCate() {
		return dao.getCate();
	}
	
	@Override
	public List<String> getOneBrand(String brandname) {
		return dao.getOneBrand(brandname);
	}
	
	@Override
	public List<String> getOneSeries(String series) {
		return dao.getOneSeries(series);
	}
	
	@Override
	public List<String> getOneCate(String cate) {
		return dao.getOneCate(cate);
	}

	@Override
	public void deleteProduct(int no) {
		dao.deleteProduct(no);
	}

	@Override
	public void updateProduct(ProductBean pb) {
		dao.updateProduct(pb);
	}
	
	@Override
	public int getTotalPages() {
		return dao.getTotalPages();
	}
	
	@Override
	public int getBrandTotalPages(String brandname) {
		return dao.getBrandTotalPages(brandname);
	}
	
	@Override
	public int getSeriesTotalPages(String series) {
		return dao.getSeriesTotalPages(series);
	}
	
	@Override
	public int getCateTotalPages(String cate) {
		return dao.getCateTotalPages(cate);
	}
	
	@Override
	public int getKeywordTotalPages(String keyword) {
		return dao.getKeywordTotalPages(keyword);
	}
	
	@Override
	public long getCounts() {
		return dao.getCounts();
	}
	
	@Override
	public long getBrandCounts(String brandname) {
		return dao.getBrandCounts(brandname);
	}
	
	@Override
	public long getSeriesCounts(String series) {
		return dao.getSeriesCounts(series);
	}
	
	@Override
	public long getCateCounts(String cate) {
		return dao.getCateCounts(cate);
	}
	
	@Override
	public long getKeywordCounts(String keyword) {
		return dao.getKeywordCounts(keyword);
	}

	@Override
	public List<ProductBean> getPage(int pageNo) {
		return dao.getPage(pageNo);
	}
	
	@Override
	public List<ProductBean> getBrandPage(String brandname, int pageNo) {
		return dao.getBrandPage(brandname, pageNo);
	}
	
	@Override
	public List<ProductBean> getSeriesPage(String series, int pageNo) {
		return dao.getSeriesPage(series, pageNo);
	}
	
	@Override
	public List<ProductBean> getCatePage(String cate, int pageNo) {
		return dao.getCatePage(cate, pageNo);
	}
	
	@Override
	public List<ProductBean> getKeywordPage(String keyword, int pageNo) {
		return dao.getKeywordPage(keyword, pageNo);
	}
	
	@Override
	public List<ProductBean> getBHlist(String list) {
		return dao.getBHlist(list);
	}
	
	@Override
	public List<ProductBean> getBrandPage(int pageNo, String brandname) {
		return dao.getBrandPage(pageNo, brandname);
	}
	
	@Override
	public List<ProductBean> racate(String cate) {
		return dao.racate(cate);		
	}
	
	@Override
	public void addcollection(int mid, int pid) {
		dao.addcollection(mid, pid);
	}
	
	@Override
	public void delcollection(int no) {
		dao.delcollection(no);
	}
	
	@Override
	public List<CollectBean> collection(int mid) {
		return dao.collection(mid);
	}
	
	@Override
	public int pkcollection(int mid, int pid) {
		return dao.pkcollection(mid, pid);
	}
	
	@Override
	public List<Integer> findcollection(int mid) {
		return dao.findcollection(mid);
	}
	
	@Override
	public long getProductTotal() {
		return dao.getProductTotal();
	}
	
	@Override
	public long getBrandTotal() {
		return dao.getBrandTotal();
	}
	
	@Override
	public long getBrandCount(String brand) {
		return dao.getBrandCount(brand);
	}
	
	@Override
	public long getCateCount(String cate) {
		return dao.getCateCount(cate);
	}
	
	@Override
	public int getStatus(int no) {
		return dao.getStatus(no);
	}
	
	@Override
	public boolean updateStatus(int no, int status) {
		return dao.updateStatus(no, status);
	}
}