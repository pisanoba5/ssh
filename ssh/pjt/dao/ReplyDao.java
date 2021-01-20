package com.ssh.pjt.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.ReplyDto;

@Repository
public class ReplyDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public int reply_insert(ReplyDto replyDto) throws Exception {

			return sqlSession.insert(NAMESPACE + ".reply_insert", replyDto);
	 }
	 
	 public List<ReplyDto> reply_list(int seq) throws Exception{
		 
		 	return sqlSession.selectList(NAMESPACE + ".reply_list", seq);
		 
	 }
	 
	 public int reply_modify(ReplyDto replyDto) throws Exception{
		 
		 	return sqlSession.update(NAMESPACE + ".reply_modify", replyDto);
		 
	 }
	 
	 public int reply_delete(int seq) throws Exception{
		 
		 	return sqlSession.delete(NAMESPACE + ".reply_delete", seq);
		 
	 }
	
}
