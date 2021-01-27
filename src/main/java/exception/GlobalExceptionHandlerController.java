package exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandlerController {
	
	public GlobalExceptionHandlerController() {
	}
	//處理404錯誤
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handle(NoHandlerFoundException ex, Model model, HttpServletRequest request) {
		
		model.addAttribute("reason", ex.getMessage() + "   ,404   日期: 01/28");
		model.addAttribute("exception", ex);
		model.addAttribute("stackTrace", ex.getStackTrace());
		model.addAttribute("url", request.getRequestURL()+"?" + request.getQueryString());
		
	    return "product/orderError";
	}
}
