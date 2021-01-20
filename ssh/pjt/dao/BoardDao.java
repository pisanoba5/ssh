package com.ssh.pjt.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssh.pjt.dto.BoardDto;

@Repository
public class BoardDao {

	@Resource(name = "sqlSession")
    private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.ssh.pjt.mainMapper";
	 
	 public int boardWrite_Action(BoardDto BoardDto) throws Exception {

			return sqlSession.insert(NAMESPACE + ".boardWrite_Action", BoardDto);
	 }
	 
	 public int getBoardCnt(BoardDto boardDto) throws Exception {
		 
		 return sqlSession.selectOne(NAMESPACE + ".getBoardCnt", boardDto);
		 
	 }
	 
	 public List<BoardDto> getBoardList(BoardDto boardDto) throws Exception {
		 
		 return sqlSession.selectList(NAMESPACE + ".getBoardList", boardDto);
		 
	 }
	 
	public BoardDto getBoard(BoardDto boardDto) throws Exception {
			 
		 return sqlSession.selectOne(NAMESPACE + ".getBoard", boardDto);
			 
	}
	
	public BoardDto getBoardDetail(int board_seq) throws Exception {
		 
		 return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", board_seq);
			 
	}
	
	public int boardModify_action(BoardDto boardDto) throws Exception{
		
		 return sqlSession.update(NAMESPACE + ".boardModify_action", boardDto);
		
	}
	
	public int boardDelete(int board_seq) throws Exception{
		
		return sqlSession.delete(NAMESPACE + ".boardDelete", board_seq);
	}
	
	public void boardHits(int board_seq) throws Exception{
			sqlSession.update(NAMESPACE + ".boardHits", board_seq);
	}
}
