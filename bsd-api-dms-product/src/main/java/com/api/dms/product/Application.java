package com.api.dms.product;

import java.util.List;

import org.apache.catalina.connector.Connector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.EventListener;

import com.api.dms.product.db.entity.TbUser;
import com.api.dms.product.db.repository.TbUserRepository;
import com.api.dms.product.util.TokenUtil;

@SpringBootApplication
public class Application extends SpringBootServletInitializer {
	private Logger log = LoggerFactory.getLogger(Application.class);
	
	// HTTP port
	@Value("${http.port}")
	private int httpPort;
	
	@Autowired
	private TbUserRepository tbUserRepository;

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
	@Bean
	public ServletWebServerFactory servletContainer() {
		TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
		tomcat.addAdditionalTomcatConnectors(createStandardConnector());
		return tomcat;
	}

	private Connector createStandardConnector() {
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
		connector.setPort(httpPort);
		return connector;
	}
	
	@EventListener(ApplicationReadyEvent.class)
	public void init() {
		log.info("trying to set salt");
		
		List<TbUser> lstTbUser = tbUserRepository.findAll();
		
		for (TbUser tbUser : lstTbUser) {
			log.info("set salt for : " + tbUser.getTbuEmail());
			TokenUtil.keyMap.put(tbUser.getTbuEmail(), tbUser.getTbuTokenSalt());
		}
		
		log.info("set salt done");
	}
}
