package test.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import test.DAO.UserRepository;
import test.Entity.User;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserRepository userRepository;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(username -> {
            User user = userRepository.findByUsername(username);
            if (user != null) {
                return org.springframework.security.core.userdetails.User.withUsername(username)
                        .password(user.getPassword()).roles("USER").build();
            } else {
                throw new org.springframework.security.core.userdetails.UsernameNotFoundException("User not found");
            }
        });
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/login", "/register").permitAll()
                .antMatchers("/Students/index").authenticated() // Yêu cầu xác thực cho /Students/index
                .anyRequest().authenticated() // Yêu cầu xác thực cho tất cả các URL khác
                .and()
            .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/Students/index", true)
                .and()
            .logout()
                .logoutUrl("/logout")// đăng xuất
                .logoutSuccessUrl("/login?logout")
                .and()
            .csrf().disable();
    }



    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
