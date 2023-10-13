package com.ham.len.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.SimpleSpringPreparerFactory;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig implements WebMvcConfigurer {

		@Bean
		public TilesConfigurer tilesConfigurer() {
			final TilesConfigurer configurer = new TilesConfigurer();
			
			configurer.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
			configurer.setCheckRefresh(true);
			configurer.setPreparerFactoryClass(SimpleSpringPreparerFactory.class);
			return configurer;
		}

		@Bean
		public TilesViewResolver tilesViewResolver() {
			final TilesViewResolver tilesViewResolver = new TilesViewResolver();
			tilesViewResolver.setViewClass(TilesView.class);
			tilesViewResolver.setOrder(1);
			
			return tilesViewResolver;
		}
		
		@Bean
		public UrlBasedViewResolver viewResolver() {
		    final UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		    resolver.setViewClass(TilesView.class);
		    resolver.setOrder(1);	      
		      
		    return resolver;
		 }
		 
}

