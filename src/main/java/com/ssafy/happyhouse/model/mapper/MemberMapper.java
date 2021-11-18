package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.MemberDto;

@Mapper
public interface MemberMapper {

	public MemberDto login(MemberDto memberDto) throws SQLException;
	public MemberDto userInfo(String userid) throws SQLException;
	int idCheck(String checkId) throws Exception;

	void registerMember(MemberDto memberDto) throws Exception;

	List<MemberDto> listMember() throws Exception;

	MemberDto getMember(String userId) throws Exception;

	void updateMember(MemberDto memberDto) throws Exception;

	void deleteMember(String userId) throws Exception;
	
}
