package com.ssh.pjt.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.MaxScoreDto;

@Repository
public class MaxScoreDao {
	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public MaxScoreDto maxScoreList(MaxScoreDto maxScoreDto) throws Exception {

			return sqlSession.selectOne(NAMESPACE + ".maxScoreList", maxScoreDto);
	 }
}
