package com.ssafy.happyhouse.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CompanyDto;
import com.ssafy.happyhouse.model.mapper.CompanyMapper;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean registerCompany(CompanyDto companyDto) throws Exception {
		 
		return sqlSession.getMapper(CompanyMapper.class).registerCompany(companyDto) ==1;
	}

	@Override
	public boolean modifyCompany(CompanyDto companyDto) throws Exception {
		return sqlSession.getMapper(CompanyMapper.class).modifyCompany(companyDto)==1;
	}

	@Override
	public boolean deleteCompany(int companyno) throws Exception {
		return sqlSession.getMapper(CompanyMapper.class).deleteCompany(companyno)==1;
	}

	@Override
	public CompanyDto getCompany(int companyno) throws Exception {
		return sqlSession.getMapper(CompanyMapper.class).getCompany(companyno);
	}

}
