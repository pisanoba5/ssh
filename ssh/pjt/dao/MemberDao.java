package com.ssh.pjt.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.ssh.pjt.dto.MemberDto;

@Repository
public class MemberDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public int insertMember(MemberDto memberDto) throws Exception {

			return sqlSession.insert(NAMESPACE + ".insertMember", memberDto);
	 }
	 
	 public MemberDto login_chk(MemberDto memberDto) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".login_chk" , memberDto);
	 
	 }
	 
	 public int id_chk(String id) throws Exception{
		 
		 return sqlSession.selectOne(NAMESPACE + ".id_chk" , id);
	 
	 }
	 
	 public MemberDto mypageInformation(String Id) throws Exception{
		 return sqlSession.selectOne(NAMESPACE + ".mypageInformation" , Id);
	 }
	
	 public int mypageModify(MemberDto memberDto) throws Exception{
		 return sqlSession.update(NAMESPACE + ".mypageModify" , memberDto);
	 }
	 
	 
	 
}
