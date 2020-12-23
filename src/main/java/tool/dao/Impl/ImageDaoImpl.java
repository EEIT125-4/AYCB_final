package tool.dao.Impl;

import java.sql.Blob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tool.dao.ImageDao;
import tool.model.Image;

@Repository
public class ImageDaoImpl implements ImageDao {

	@Autowired
	SessionFactory factory;

	/**
	 * 取單獨一筆
	 */
	@Override
	public Image getImage(Integer id) {
		Image img = null;
		Session session = factory.getCurrentSession();

		img = session.get(Image.class, id);

		return img;
	}

	/**
	 * 
	 */

	@Override
	public Image setImage(Blob blob) {

		return null;
	}

	@Override
	public void saveImage(Image img) {
		if(img.getImgid()!=null) {
			System.out.println("saveImage ID:"+img.getImgid());
		}
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(img);
		

	}

	@Override
	public void deleteImage(Integer id) {
		Session session=factory.getCurrentSession();
		Image img = session.get(Image.class, id);
		session.delete(img);
		
	}
	
	

}
