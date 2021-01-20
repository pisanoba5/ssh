package com.ssh.pjt.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.ClickGameDto;



@Repository
public class ClickGameDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public int clickGame_insert(ClickGameDto clickGameDto) throws Exception {

			return sqlSession.insert(NAMESPACE + ".clickGame_insert", clickGameDto);
	 }
	 
	 public List<ClickGameDto> clickGame_select(ClickGameDto clickGameDto) throws Exception{
		 
		 return sqlSession.selectList(NAMESPACE + ".clickGame_select" , clickGameDto);
	 
	 }
	 
	 public boolean clickGame_scoreCheck(ClickGameDto clickGameDto) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".clickGame_scoreCheck" , clickGameDto);
	 
	 }
	 
	 public int clickGame_count(ClickGameDto clickGameDto) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".clickGame_count" , clickGameDto);
	 
	 }
	 
	 public void clickGmae_maxDelete() throws Exception{
		 
		 	sqlSession.delete(NAMESPACE + ".clickGmae_maxDelete");
	 
	 }

	 public ClickGameDto clickgame_myMaxScore(String id) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".clickgame_myMaxScore" , id);
		 
	 }
	 
	 public ClickGameDto clickgame_maxScore(ClickGameDto clickGameDto) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".clickgame_maxScore",clickGameDto);
	 }
	 
	 
}

