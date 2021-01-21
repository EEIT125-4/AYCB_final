package event.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import event.model.Event;

@Component
public class EventValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = Event.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {

		Event event = (Event) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "eventname", "member.name.not.empty", "請填寫活動名稱");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "eventdate", "member.name.not.empty", "請填寫活動日期");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "eventlocation", "member.name.not.empty", "請填寫活動地點");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "host", "member.name.not.empty", "請填寫聯絡人");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hostphone", "member.name.not.empty", "請填寫聯絡人電話");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "totalpax", "member.name.not.empty", "請填寫名額限制");
		
//
//		if (event.getEventname()!=null&& event.getEventname().contains(" ")) {
//			errors.rejectValue("eventname", "", "活動名稱不能含有空白");
//		}
		if(event.getEventcategory().contentEquals("NONE")) {
			errors.rejectValue("eventcategory", "", "請填寫活動類別");
		}		
		
		if (event.getHostphone()!=null&& event.getHostphone().length()<10||event.getHostphone().length()>10) {
			errors.rejectValue("hostphone", "", "電話號碼格式錯誤");
		}		
		if (event.getTotalpax()!=null && event.getTotalpax()<=0) {
			errors.rejectValue("totalpax", "", "名額須大於0");
		}
//		if (event.getFilename().isEmpty()) {
//			errors.rejectValue("filename", "", "必須挑選圖片");
//		}

	}

}
