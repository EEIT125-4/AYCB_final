package event.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
//import org.springframework.validation.ValidationUtils;
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
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "member.account.not.empty", "帳號欄不能空白(預設值)");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "member.name.not.empty", "姓名欄不能空白(預設值)");
//
//		if (event.getEventname().length() ==0) {
//			errors.rejectValue("eventname", "", "活動名稱不能空白");
//		}
//
//		if (event.getEventdate().length() ==0) {
//			errors.rejectValue("eventdate", "", "請填寫活動日期");
//		}
//		if (event.getEventlocation().length() ==0) {
//			errors.rejectValue("eventlocation", "", "請填寫活動地點");
//		}
//		if (event.getPax().length() < 1) {
//			errors.rejectValue("pax", "", "參加人數須大於一");
//		}
//
	}

}
