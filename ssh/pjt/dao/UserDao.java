package com.ssh.pjt.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.UserDto;

@Repository
public class UserDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	
	public UserDto getUserById(String username) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".getUserById", username);
	}
	
	public int id_chk(String username) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".id_chk" , username);
	 
	 }
	
	
	 public int register(UserDto userDto) throws Exception {

			return sqlSession.insert(NAMESPACE + ".register", userDto);
	 }
	 
	 public int mypageModify(UserDto userDto) throws Exception{
		 
		 	return sqlSession.update(NAMESPACE + ".mypageModify", userDto);
		 
	 }
	 
	 public void clickGameScoreReset(String id) throws Exception{
	 		sqlSession.insert(NAMESPACE + ".clickGameScoreReset" , id);
	}
	
	public void piheabammaScoreReset(String id) throws Exception{
				sqlSession.insert(NAMESPACE + ".piheabammaScoreReset" , id);
	}
}
