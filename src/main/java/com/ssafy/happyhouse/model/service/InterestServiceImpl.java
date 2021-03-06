package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.InterestDto;
import com.ssafy.happyhouse.model.mapper.InterestMapper;
@Service
public class InterestServiceImpl implements InterestService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int register(InterestDto interestDto) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).register(interestDto);
	}

	@Override
	public List<InterestDto> allList(String userid) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).allList(userid);
	}

	@Override
	public InterestDto listOne(int interestno) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).listOne(interestno);
	}

	@Override
	public int updateInterest(InterestDto interestDto) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).updateInterest(interestDto);
	}

	@Override
	public int deleteInterest(int interestno) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).deleteInterest(interestno);
	}

	@Override
	public List<InterestDto> selectPopularity(String dongcode) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).selectPopularity(dongcode);
	}

}
