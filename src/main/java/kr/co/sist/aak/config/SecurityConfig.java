package kr.co.sist.aak.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        dataSource.setUsername("aak");
        dataSource.setPassword("1015");
        return dataSource;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JdbcDaoImpl jdbcUserDetailsManager(DataSource dataSource) {
        JdbcDaoImpl jdbcUserDetailsManager = new JdbcDaoImpl();
        jdbcUserDetailsManager.setDataSource(dataSource);
        jdbcUserDetailsManager.setUsersByUsernameQuery("SELECT STD_ID as username, password, (CASE WHEN DEL_YN = 'N' THEN 1 ELSE 0 END) as enabled FROM STUDENT WHERE STD_ID = ?");
        jdbcUserDetailsManager.setAuthoritiesByUsernameQuery("SELECT STD_ID as username, 'ROLE_USER' as authority FROM STUDENT WHERE STD_ID = ?");
        return jdbcUserDetailsManager;
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/**/*.js", "/**/*.css", "/student/login.do", "/**").permitAll()
                .antMatchers("/admin", "/mypage/*").authenticated()
                .and()
                .formLogin()
                .loginPage("/student/login.do")
                .defaultSuccessUrl("/mypage/mypage_home.do", true)
                .failureUrl("/student/login-error.do?error=true")
                .loginProcessingUrl("/login")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/index.do")
                .and()
                .csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(jdbcUserDetailsManager(dataSource()))
                .passwordEncoder(passwordEncoder());
    }

}
