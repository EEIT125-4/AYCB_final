package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({
	"config",
	"advertisement",
	"blog",
	"event",
	"member",
	"message",
	"product",
	"tool",
	"chat",
	"comment",
	"mail",
	"thumbs"

	})
public class WebAppConfig implements WebMvcConfigurer {
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	// 為了處理靜態檔案必須加入下列敘述：只要是 /css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
	// 為了處理靜態檔案必須加入下列敘述：只要是 /image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**")
				.addResourceLocations("/WEB-INF/views/css/");
		registry.addResourceHandler("/image/**")
				.addResourceLocations("/WEB-INF/views/image/");
		
		registry.addResourceHandler("/js/**")
		.addResourceLocations("/WEB-INF/views/js/");
		
		registry.addResourceHandler("/video/**")
		.addResourceLocations("/video/");
		registry.addResourceHandler("/upload/**")
		.addResourceLocations("/upload/");
		
		registry.addResourceHandler("/fonts/**")
		.addResourceLocations("/WEB-INF/views/fonts/");
		
//		registry.addResourceHandler("/local/**")
//		.addResourceLocations("/public/images");
		
	}
}
