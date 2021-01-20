package com.ssh.pjt.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.PiheabammaDto;

@Repository
public class PiheabammaDao {
	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public List<PiheabammaDto> piheabamma_select(PiheabammaDto piheabammaDto) throws Exception {

			return sqlSession.selectList(NAMESPACE + ".piheabamma_select", piheabammaDto);
	 }
	 
	 public void piheabamma_insert(PiheabammaDto piheabammaDto) throws Exception{
		 	  sqlSession.insert(NAMESPACE + ".piheabamma_insert", piheabammaDto);
	 }
	 
	 public PiheabammaDto piheabamma_myMaxScore(String id) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".piheabamma_myMaxScore" , id);
		 
	 }
	 
	 public PiheabammaDto piheabamma_maxScore(PiheabammaDto piheabammaDto) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".piheabamma_maxScore",piheabammaDto);
		 
	 }
}
