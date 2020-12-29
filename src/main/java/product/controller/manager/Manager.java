package product.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import product.model.ProductBean;
import product.service.ProductService;


//@WebServlet("/Manager")
public class Manager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext sc = getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
		ProductService ps = ctx.getBean(ProductService.class);
		List<ProductBean> list = ps.getAllProducts();
		List<String> brand = ps.getBrand();
		List<String> series = ps.getSeries();
		List<String> cate = ps.getCate();
		
		request.setAttribute("Products", list);
		request.setAttribute("Brands", brand);
		request.setAttribute("series", series);
		request.setAttribute("cates", cate);
		request.getRequestDispatcher("manager.jsp").forward(request, response);
	}

}
