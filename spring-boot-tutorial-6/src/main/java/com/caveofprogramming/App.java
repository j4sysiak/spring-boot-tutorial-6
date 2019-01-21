package com.caveofprogramming;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.context.request.RequestContextListener;



@SpringBootApplication
public class App extends SpringBootServletInitializer {

	  public static void main(String[] args) throws Exception {
		    SpringApplication.run(App.class, args);
		  }
	  
	  
		@Override
		protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
			return application.sources(App.class);
	    }

		@Bean
		public RequestContextListener requestContextListener() {
			return new RequestContextListener();
		}
 
}


 