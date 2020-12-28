package comment;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateMain {

	public static void main(String[] args) {

		Date date=new Date();
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(date.getTime());
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
		
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
				
		System.out.println("time:"+sd.format(calendar.getTime()));
		
		
	}

}
