package tool.dao;

import java.sql.Blob;

import tool.model.Image;

public interface ImageDao {
	
	 Image getImage(Integer id);
	 Image setImage(Blob blob);
	 Integer saveImage(Image img);
	 void deleteImage(Integer id);

}
