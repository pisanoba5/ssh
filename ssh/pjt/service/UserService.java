package com.ssh.pjt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.ssh.pjt.dao.UserDao;
import com.ssh.pjt.dto.UserDto;

@Service
public class UserService implements UserDetailsService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	@Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto user = null;
		try {
			user = userDao.getUserById(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }
        return user;
    }
	
	@Transactional
	public int RegisterUser(UserDto userDto) throws Exception{			
		System.out.println("Befor Encoder : " + userDto.getPassword());
		String endcodedPassword = bcryptPasswordEncoder.encode(userDto.getPassword());
		System.out.println("After Encoder : " + endcodedPassword);
		System.out.println("Resister User Info : " + userDto);
		userDao.clickGameScoreReset(userDto.getId()); // 게임점수 초기화
		userDao.piheabammaScoreReset(userDto.getId()); // 게임점수 초기화
		userDto.setPassword(endcodedPassword);	
		return userDao.register(userDto);
	}
	
	@Transactional
	public int mypageModify(UserDto userDto) throws Exception{
		String endcodedPassword = bcryptPasswordEncoder.encode(userDto.getPassword());
		userDto.setPassword(endcodedPassword);
		return userDao.mypageModify(userDto);
		
	}
	
	@Transactional
	public int id_chk(String username) throws Exception{
		return userDao.id_chk(username);
	}

}
