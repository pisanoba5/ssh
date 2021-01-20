package com.ssh.pjt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssh.pjt.dao.ClickGameDao;
import com.ssh.pjt.dao.MemberDao;
import com.ssh.pjt.dao.PiheabammaDao;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.dto.MemberDto;

@Service
public class MemberService {

	protected final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	ClickGameDao clickGameDao;
	@Autowired
	PiheabammaDao piheabammaDao;
	
//	@Transactional
//	public int insertMember (MemberDto memberDto) throws Exception  {
//		
//		logger.debug("==================== insertMember START ====================");
//		
//		int count = 0;
//		
//		count = memberDao.insertMember(memberDto);
//		memberDao.clickGameScoreReset(memberDto.getMember_id());
//		memberDao.piheabammaScoreReset(memberDto.getMember_id());
//		
//		logger.debug("==================== insertMember END ====================");
//		System.out.println("dao 실행 완료");
//		return count;
//	}
	
	@Transactional
	public MemberDto login_chk(MemberDto memberDto) throws Exception{
		return memberDao.login_chk(memberDto);
	}
	
	@Transactional
	public int id_chk(String id) throws Exception{
		return memberDao.id_chk(id);
	}
	
	@Transactional
	public MemberDto mypageInformation(String Id) throws Exception{
		return memberDao.mypageInformation(Id);
	}
	
	@Transactional
	public int mypageModify(MemberDto memberDto) throws Exception{
		int count = 0;
		
		logger.debug("==================== mypageModify START ====================");
		
		count = memberDao.mypageModify(memberDto);
		
		logger.debug("==================== mypageModify END ====================");
		return count;
	}

}
