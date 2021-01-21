package event.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import event.model.Attendance;

@Component
public class AttendanceValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = Attendance.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {

		Attendance attendance = (Attendance) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "attendance.phone.not.empty", "請填寫電話號碼");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pax", "attendance.phone.not.empty", "請填寫報名人數");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mailaddress", "attendance.phone.not.empty", "請填寫email");


		if (attendance.getPhone() != null&& attendance.getPhone().length()<10||attendance.getPhone().length()>10) {
			errors.rejectValue("phone", "", "電話號碼格式錯誤");
	}
		if (attendance.getPax() != null&& attendance.getPax()<=0) {
			errors.rejectValue("pax", "", "參加人數須大於0");
	}
		if (attendance.getMailaddress()!=null && !EMAIL_REGEX.matcher(attendance.getMailaddress()).matches()) {
			errors.rejectValue("mailaddress", "mail格式錯誤");
		}
		
	}
	
	
	
}
