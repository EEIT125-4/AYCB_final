package tool.service.impl;

import java.sql.Blob;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tool.dao.ImageDao;
import tool.model.Image;
import tool.service.ImageService;

@Transactional
@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	SessionFactory factory;
	@Autowired
	ImageDao dao;

	@Override
	public Image getImage(Integer id) {
		return dao.getImage(id);

	}

	@Override
	public Image setImage(Blob blob) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveImage(Image img) {
		dao.saveImage(img);

	}

	@Override
	public void deleteImage(Integer id) {
		dao.deleteImage(id);
		
	}

}
