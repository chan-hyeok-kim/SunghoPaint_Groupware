package com.ham.len.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

import com.ham.len.humanresource.HumanResourceService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Autowired
	private HumanResourceService humanResourceService;
	
	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		return web -> web
				.ignoring()
					.antMatchers("/css/**")
					.antMatchers("/fonts/**")
					.antMatchers("/images/**")
					.antMatchers("/js/**")
					.antMatchers("/scss/**")
					.antMatchers("/vendors/**");
	}
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity
			.cors()
			.and()
			.csrf()
			.disable()
			.authorizeHttpRequests()
				.and()
			.formLogin()
				.loginPage("/humanResource/login")
				.defaultSuccessUrl("/")
				.failureUrl("/humanResource/login")
				.usernameParameter("employeeID")
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/humanResource/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.and();
		
		return httpSecurity.build();
	}
}