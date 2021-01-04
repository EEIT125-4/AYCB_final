package product.cartModel;
import java.io.Serializable;
import java.util.List;

public class ProductDB implements Serializable {
	
	
	//JavaBean
//	private static String[] productNames;	//陣列
//	private static Integer[] productPrices;
	
	private static List<String> productNames;	//陣列
	private static List<Double> productPrices;
	private static List<String> productImage;
	
	public static void setProductName(List<String> pproductNames) {
		productNames=pproductNames;
	}
	
	public static void setProductPrice(List<Double> pproductPrices) {
		productPrices=pproductPrices;
	}
	
	public static void setProductImage(List<String> pproductImage) {
		productImage = pproductImage;
	}

	public static int size() {
	       return productNames.size();
	}//陣列長度
	
	public static String getProductName(int productNo) {
	       return productNames.get(productNo);
	}
	
	public static Double getProductPrice(int productNo) {
	      //return productPrices[productNo-1].intValue();//intValue取值
		return productPrices.get(productNo);
	}
	
	public static String getProductImage(int productNo) {
		return productImage.get(productNo);
	}
	
}
