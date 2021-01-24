package exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

//處理500錯誤
@ControllerAdvice
public class GetAllErrorController implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		ModelAndView mav = new ModelAndView("product/orderError");
		mav.addObject("reason", ex.getMessage() + "   ,500   日期: 01/28");
		mav.addObject("exception", ex);
		mav.addObject("url", request.getRequestURL()+"?" + request.getQueryString());
		mav.setViewName("product/orderError");
		return mav;
	}

}
