package event.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
//import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import event.model.Attendance;

@Component
public class AttendanceValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = Attendance.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {

		Attendance attendance = (Attendance) target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "account", "member.account.not.empty", "帳號欄不能空白(預設值)");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "member.name.not.empty", "姓名欄不能空白(預設值)");


		if (attendance.getMemberid().isEmpty()) {
			errors.rejectValue("memberid", "", "帳號欄不能空白");
		}

//		if (attendance.getMemberid().isEmpty()) {
//			errors.rejectValue("MemberID", "", "帳號欄不能空白");
//		}

//
//		if (attendance.getEventid().length() == 0) {
//			errors.rejectValue("EventID", "", "請填寫活動欄");
//		}
//		if (attendance.getPax().length() < 1) {
//			errors.rejectValue("Pax", "", "參加人數須大於一");
//		}
//
	}

}
