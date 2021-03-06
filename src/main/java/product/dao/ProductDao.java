package product.dao;

import java.util.List;

import product.cartModel.OrderItemBean;
import product.model.CollectBean;
import product.model.ProductBean;


public interface ProductDao {

	void saveProduct(ProductBean pb);

	List<ProductBean> getAllProducts();
	
	ProductBean getProduct(int no);
	
	List<ProductBean> getBrandProduct(String brandname);
	
	List<ProductBean> getSeriesProduct(String series);

	List<ProductBean> getCateProduct(String cate);
	
	List<ProductBean> getKeyword(String keyword);
	
	List<String> getBrand();
	
	List<String> getSeries();
	
	List<String> getSeriesByBrand(String brandname);
	
	List<String> getCate();

	List<String> getOneBrand(String brandname);
	
	List<String> getOneSeries(String series);
	
	List<String> getOneCate(String cate);
	
	void deleteProduct(int no);

	void updateProduct(ProductBean pb);
	
	int getTotalPages();
	
	int getBrandTotalPages(String brandname);
	
	int getSeriesTotalPages(String series);
	
	int getCateTotalPages(String cate);
	
	int getKeywordTotalPages(String keyword);
	
	long getCounts();
	
	long getBrandCounts(String brandname);
	
	long getSeriesCounts(String series);
	
	long getCateCounts(String cate);
	
	long getKeywordCounts(String keyword);
	
	List<ProductBean> getPage(int pageNo);
	
	List<ProductBean> getBrandPage(String brandname, int pageNo);
	
	List<ProductBean> getSeriesPage(String series, int pageNo);
	
	List<ProductBean> getCatePage(String cate, int pageNo);

	List<ProductBean> getKeywordPage(String keyword, int pageNo);
	
	List<ProductBean> getBHlist(String list);
	
	List<ProductBean> getBrandPage(int pageNo, String brandname);
	
	List<ProductBean> racate(String cate);
	
	void addcollection(int mid, int pid);
	
	void delcollection(int no);
	
	List<CollectBean> collection(int mid);
	
	int pkcollection(int mid, int pid);
	
	List<Integer> findcollection(int mid);
	
	long getProductTotal();
	
	long getBrandTotal();
	
	long getBrandCount(String brand);
	
	long getCateCount(String cate);
	
	int getStatus(int no);
	
	boolean updateStatus(int no, int status);
	
	List<OrderItemBean> getTopfive();
}