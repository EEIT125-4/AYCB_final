package config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import init.SystemConstant;

/**
 * 
 * @author user
 * 
 * 為了避免混淆,只留mssql的組態設定
 *
 */

@Configuration
@EnableTransactionManagement
public class RootAppConfig {
	@Bean
	public DataSource msSQLDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		//ds.setUser("sa");
		//ds.setPassword("manager");
		ds.setUser("scott");
	     ds.setPassword("tiger");
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
//		ds.setJdbcUrl("jdbc:sqlserver://10.31.25.143:1433;DatabaseName=project");
		//如果跑本機,記得切換
		ds.setJdbcUrl("jdbc:sqlserver://127.0.0.1:1433;DatabaseName=project");
		//ds.setInitialPoolSize(4);
		ds.setMaxPoolSize(8);
		return ds;
	}
	
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setPackagesToScan(new String[] {
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
				"video",
				"exception"				
		});
		 if (SystemConstant.DB_TYPE == SystemConstant.SQL_SERVER) {
			factory.setDataSource(msSQLDataSource());
			factory.setHibernateProperties(additionalPropertiesMsSQL());	
		} 
		 System.out.println("產生LocalSessionFactory");
		return factory;
	}
	@Bean//(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }	
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	
	
	
	
	private Properties additionalPropertiesMsSQL() {
		Properties properties=new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.transaction.coordinator_class", "jdbc");
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.bytecode.use_reflection_optimizer", "false");
		
		
		return properties;
	}
	
	@Bean
	public 	JavaMailSender getJavaMailSender() {

		 JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	     mailSender.setHost("smtp.gmail.com");
	     mailSender.setPort(587);

	     mailSender.setUsername("2020aycb@gmail.com");
	     mailSender.setPassword("AYCB@2020");

	     Properties props = mailSender.getJavaMailProperties();
	     props.put("mail.transport.protocol", "smtp");
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.starttls.enable", "true");
	     props.put("mail.smtp.starttls.required", "true");
	     props.put("mail.debug", "true");
	     

	     return mailSender;


	}
	
	

}
