package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CompanyDto;

@Mapper
public interface CompanyMapper {

	public int registerCompany(CompanyDto companyDto) throws SQLException; // 등록
	public CompanyDto getCompany(int companyno) throws SQLException; // 조회
	public int modifyCompany(CompanyDto companyDto) throws SQLException; // 수정
	public int deleteCompany(int companyno) throws SQLException; // 삭제

}