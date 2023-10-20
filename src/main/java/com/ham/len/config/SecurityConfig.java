package com.ham.len.config;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

import com.ham.len.humanResource.HumanResourceService;

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
				.loginPage("/login")
				.defaultSuccessUrl("/")
				.failureUrl("/login")
				.usernameParameter("employeeID")
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.and()
			.rememberMe()
				.tokenValiditySeconds(604800) // 일주일
				.key(UUID.randomUUID().toString())
				.userDetailsService(humanResourceService)
				.and();
		
		return httpSecurity.build();
	}
}