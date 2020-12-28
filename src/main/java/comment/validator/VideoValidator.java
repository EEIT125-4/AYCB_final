package comment.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import comment.model.Video;


public class VideoValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = Video.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {

		Video video = (Video) target;
		if (video.getMember().getId().equals("")) {
			errors.rejectValue("memberid", "", "帳號欄不能空白");
		}
	}
}
