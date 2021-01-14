package product.dao.impl;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.dao.ProductDao;
import product.model.CollectBean;
import product.model.ProductBean;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory factory;

	private int recordsPerPage = 16;

	@Override
	public void saveProduct(ProductBean pb) {
		Session session = factory.getCurrentSession();
		session.save(pb);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public ProductBean getProduct(int no) {
		Session session = factory.getCurrentSession();
		return session.get(ProductBean.class, no);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getBrandProduct(String brandname) {
		String hql = "FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("brandname", brandname).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getSeriesProduct(String series) {
		String hql = "FROM ProductBean p WHERE p.productseries = :productseries";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productseries", series).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getCateProduct(String cate) {
		String hql = "FROM ProductBean p WHERE p.productcategory = :productcategory";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productcategory", cate).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getKeyword(String keyword) {
		String hql = "FROM ProductBean p WHERE p.productname like :keyword";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("keyword", "%" + keyword + "%").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getBrand() {
		String hql = "SELECT DISTINCT p.brandname FROM ProductBean p";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSeries() {
		String hql = "SELECT DISTINCT p.productseries FROM ProductBean p";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getSeriesByBrand(String brandname) {
		String hql = "SELECT DISTINCT p.productseries FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("brandname", brandname).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getCate() {
		String hql = "SELECT DISTINCT p.productcategory FROM ProductBean p";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getOneBrand(String brandname) {
		String hql = "SELECT DISTINCT p.brandname FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("brandname", brandname).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getOneSeries(String series) {
		String hql = "SELECT DISTINCT p.productseries FROM ProductBean p WHERE p.productseries = :productseries";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productseries", series).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getOneCate(String cate) {
		String hql = "SELECT DISTINCT p.productcategory FROM ProductBean p WHERE p.productcategory = :productcategory";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productcategory", cate).getResultList();
	}

	@Override
	public void deleteProduct(int no) {
		Session session = factory.getCurrentSession();
		ProductBean pb = new ProductBean();
		pb.setProductno(no);
		session.delete(pb);
	}

	@Override
	public void updateProduct(ProductBean pb) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(pb);
	}

	@Override
	public int getTotalPages() {
		return (int) (Math.ceil(getCounts() / (double) recordsPerPage));
	}

	@Override
	public int getBrandTotalPages(String brandname) {
		return (int) (Math.ceil(getBrandCounts(brandname) / (double) recordsPerPage));
	}

	@Override
	public int getSeriesTotalPages(String series) {
		return (int) (Math.ceil(getSeriesCounts(series) / (double) recordsPerPage));
	}

	@Override
	public int getCateTotalPages(String cate) {
		return (int) (Math.ceil(getCateCounts(cate) / (double) recordsPerPage));
	}

	@Override
	public int getKeywordTotalPages(String keyword) {
		return (int) (Math.ceil(getKeywordCounts(keyword) / (double) recordsPerPage));
	}

	@SuppressWarnings("rawtypes")
	@Override
	public long getCounts() {
		String hql = "SELECT count(*) FROM ProductBean";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		long count = (long) query.uniqueResult();
		return count;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public long getBrandCounts(String brandname) {
		String hql = "SELECT count(*) FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		long count = (long) query.setParameter("brandname", brandname).uniqueResult();
		return count;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public long getSeriesCounts(String series) {
		String hql = "SELECT count(*) FROM ProductBean p WHERE p.productseries = :productseries";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		long count = (long) query.setParameter("productseries", series).uniqueResult();
		return count;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public long getCateCounts(String cate) {
		String hql = "SELECT count(*) FROM ProductBean p WHERE p.productcategory = :productcategory";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		long count = (long) query.setParameter("productcategory", cate).uniqueResult();
		return count;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public long getKeywordCounts(String keyword) {
		String hql = "SELECT count(*) FROM ProductBean p WHERE p.productname like :keyword";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		long count = (long) query.setParameter("keyword", "%" + keyword + "%").uniqueResult();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getPage(int pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setFirstResult(startRecordNo).setMaxResults(recordsPerPage).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getBrandPage(String brandname, int pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setParameter("brandname", brandname).setFirstResult(startRecordNo).setMaxResults(recordsPerPage)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getSeriesPage(String series, int pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean p WHERE p.productseries = :productseries";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setParameter("productseries", series).setFirstResult(startRecordNo).setMaxResults(recordsPerPage)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getCatePage(String cate, int pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean p WHERE p.productcategory = :productcategory";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setParameter("productcategory", cate).setFirstResult(startRecordNo).setMaxResults(recordsPerPage)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getKeywordPage(String keyword, int pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean p WHERE p.productname like :keyword";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setParameter("keyword", "%" + keyword + "%").setFirstResult(startRecordNo).setMaxResults(recordsPerPage).getResultList();
		return list;
	}

	@Override
	public List<ProductBean> getBHlist(String list) {
		List<ProductBean> BHlist = new ArrayList<>();
		// 取五筆
		int count = 10;
		if (list != null && list.length() > 0) {
			String[] arr = list.split(",");
			// 大於五筆
			if (arr.length >= 5) {
				for (int i = arr.length - 1; i >= arr.length - count; i--) {
					BHlist.add(getProduct(Integer.parseInt(arr[i])));
				}
			} else {
				for (int i = arr.length - 1; i >= 0; i--) {
					BHlist.add(getProduct(Integer.parseInt(arr[i])));
				}
			}
			return BHlist;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getBrandPage(int pageNo, String brandname) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		// Linked
		List<ProductBean> list = new LinkedList<ProductBean>();
		String hql = "FROM ProductBean p WHERE p.brandname = :brandname";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		list = query.setFirstResult(startRecordNo).setMaxResults(10).setParameter("brandname", brandname).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> racate(String cate) {
		String hql = "FROM ProductBean p WHERE p.productcategory = :productcategory";
		Session session = factory.getCurrentSession();
		Query<ProductBean> query = session.createQuery(hql);
		int size=query.setParameter("productcategory", cate).list().size();
		Random r=new Random();
		if(size<=5) {
			return query.setMaxResults(size).getResultList();
		}
		return query.setFirstResult(r.nextInt(size-5)+1).setMaxResults(5).getResultList();
	}
	
	@Override
	public void addcollection(int mid, int pid) {
		CollectBean cb = new CollectBean();
		cb.setMid(mid);
		cb.setPid(pid);
		Session session = factory.getCurrentSession();
		session.save(cb);
	}
	
	@Override
	public void delcollection(int no) {
		Session session = factory.getCurrentSession();
		CollectBean cb = new CollectBean();
		cb.setCid(no);
		session.delete(cb);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CollectBean> collection(int mid) {
		String hql = "FROM CollectBean c WHERE c.mid = :mid";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mid", mid).getResultList();
	}
	
	@Override
	public int pkcollection(int mid, int pid) {
		String hql = "SELECT c.cid FROM CollectBean c WHERE c.mid = :mid and c.pid = :pid";
		Session session = factory.getCurrentSession();
		return (int) session.createQuery(hql).setParameter("mid", mid).setParameter("pid", pid).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findcollection(int mid) {
		String hql = "SELECT c.pid FROM CollectBean c WHERE c.mid = :mid";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("mid", mid).getResultList();
	}
}