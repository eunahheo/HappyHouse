package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.MemberParameterDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		if(memberDto.getUserid() == null || memberDto.getUserpwd() == null)
			return null;
		return sqlSession.getMapper(MemberMapper.class).login(memberDto);
	}

	@Override
	public MemberDto userInfo(String userid) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).userInfo(userid);
	}
	@Override
	public int idCheck(String checkId) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).idCheck(checkId); // 0 or 1
	}

	@Override
	public void registerMember(MemberDto memberDto) throws Exception {
//		validation check
		sqlSession.getMapper(MemberMapper.class).registerMember(memberDto);
	}
	@Override
	public List<MemberDto> listMember(MemberParameterDto memberParameterDto) throws Exception {
		int start = memberParameterDto.getPg() == 0 ? 0 : (memberParameterDto.getPg() - 1) * memberParameterDto.getSpp();
		memberParameterDto.setStart(start);
		return sqlSession.getMapper(MemberMapper.class).listMember(memberParameterDto);
	}

	@Override
	public MemberDto getMember(String userId) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).getMember(userId);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		sqlSession.getMapper(MemberMapper.class).updateMember(memberDto);
	}

	@Override
	public void deleteMember(String userId) throws Exception {
		sqlSession.getMapper(MemberMapper.class).deleteMember(userId);
	}
	@Override
	public PageNavigation makePageNavigation(MemberParameterDto memberParameterDto) throws Exception {
		int naviSize = 5;
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(memberParameterDto.getPg());
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(MemberMapper.class).getTotalCount(memberParameterDto);//총글갯수  269
		pageNavigation.setTotalCount(totalCount);  
		int totalPageCount = (totalCount - 1) / memberParameterDto.getSpp() + 1;//27
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = memberParameterDto.getPg() <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < memberParameterDto.getPg();
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
