package com.ssh.pjt.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ssh.pjt.dto.UserDto;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        
        String username = (String) authentication.getName();
        String password = (String)  authentication.getCredentials();
        
        UserDto user = (UserDto) userDetailsService.loadUserByUsername(username);
        
        if(!bcryptPasswordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
   
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }

}
