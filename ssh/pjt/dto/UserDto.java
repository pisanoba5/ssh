package com.ssh.pjt.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class UserDto implements UserDetails{
	
	private String ID;
	private String PASSWORD;
	private String NAME;
	private String AUTHORITY;
	private boolean ENABLED;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}
	
	@Override
	public String getPassword() {
		return PASSWORD;
	}
	
	public void setPassword(String password) {
		this.PASSWORD = password;
	}

	@Override
	public String getUsername() {
		return ID;
	}
	
	public void setUsername(String id) {
		this.ID = id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}

	public String getName() {
		return NAME;
	}

	public void setName(String name) {
		NAME = name;
	}

	public String getId() {
		return ID;
	}

	public void setId(String id) {
		ID = id;
	}



}
