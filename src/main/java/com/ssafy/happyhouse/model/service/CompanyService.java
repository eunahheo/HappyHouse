package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.CompanyDto;

public interface CompanyService {
	// 등록 수정 삭제 조회
	public boolean registerCompany(CompanyDto companyDto) throws Exception;
	public boolean modifyCompany(CompanyDto companyDto) throws Exception;
	public boolean deleteCompany(int companyno) throws Exception;
//	public CompanyDto getCompany(int companyno) throws Exception;
	public CompanyDto getCompany(String userid) throws Exception;
	
}
