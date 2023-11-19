package com.ham.len.config;

import java.util.UUID;

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
	private SecurityAccessDeniedHandler accessDeniedHandler;
	
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
				/*
 					antMatchers 메서드 위치가 위에 있을수록 우선순위가 높다.
 					즉, antMatchers("/**").hasAnyRole("USER") 이처럼 모든 경로에 대해 USER 권한이 필요하다 하더라도,
 					"/humanresource/updatePassword" 경로에 대한 요청은
 					antMatchers("/humanresource/updatePassword").authenticated() 설정에 먼저 매칭되므로
 					USER 권한이 없더라도 인증된 사용자 == 로그인한 사용자(authenticated)이기만 하면 접근이 가능하다.
 					
 					.antMatchers("/**").hasAnyRole("USER")
 					.antMatchers("/attendance/**").hasAnyRole("ADMIN")
 					.antMatchers("/humanresource/updatePassword").authenticated()
 					
 					실제로 위처럼 antMatchers("/humanresource/updatePassword").authenticated() 설정과
 					antMatchers("/**").hasAnyRole("USER") 설정의 순서를 맞바꾸면 다음과 같은 상황 때문에 무한 리다이렉션 현상에 빠지게 된다.
 					※"/attendance/**" 경로 또한 ADMIN 권한 없이 USER 권한만 존재해도 접근이 가능해진다. 
 					
 					1. 먼저 최초로 로그인 페이지로 리다이렉트된다.(어찌 됐든 간에 사용자의 권한을 확인하려면 사용자가 로그인을 해야, 즉 인증을 해야 확인할 수 있기 때문인 것 같다.)
 					2. 인증 완료 시 "/" 경로로 리다이렉트되도록 설정을 해놨지만(defaultSuccessUrl("/")), antMatchers("/attendance/**").hasAnyRole("USER") 설정에 의해
						USER 권한이 없으므로 accessDeniedHandler(accessDeniedHandler) 설정에 의해 "/humanresource/updatePassword" 경로로 리다이렉트된다.
 					3. 하지만 "/humanresource/updatePassword" 경로 역시 USER 권한이 없으므로 accessDeniedHandler에 의해 다시 "/humanresource/updatePassword" 경로로 리다이렉트된다.
 					4. 이렇게 3번 과정이 무한 반복되면서 무한 리다이렉션 현상에 빠지게 된다.
				*/
				.antMatchers("/humanresource/checkEmployeeID").permitAll()
				.antMatchers("/humanresource/findPw").permitAll()
				.antMatchers("/humanresource/updatePassword").permitAll()
				// .antMatchers("/attendance/**").hasAnyRole("ADMIN")
				.antMatchers("/**").hasAnyRole("USER")
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
			.exceptionHandling()
				.accessDeniedHandler(accessDeniedHandler)
				.and()
			.rememberMe()
				.tokenValiditySeconds(604800) // 일주일
				.key(UUID.randomUUID().toString())
				.userDetailsService(humanResourceService)
				.useSecureCookie(false) // true : 쿠키는 HTTPS를 통해서만 전송되어야 함, false : HTTP에서도 전송될 수 있음 
				.and()
			.headers()
			    .frameOptions()
			    .sameOrigin();
		
		return httpSecurity.build();
	}
}