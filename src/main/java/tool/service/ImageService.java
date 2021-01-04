package tool.service;

import java.sql.Blob;



import tool.model.Image;

public interface ImageService {
	
	
	Image getImage(Integer id);
	Image setImage(Blob blob);
	Integer saveImage(Image img);
	void deleteImage(Integer id);

}
