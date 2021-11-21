package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.NoticeParameterDto;

@Mapper
public interface NoticeMapper {
	
	public int writeNotice(NoticeDto noticeDto) throws SQLException;
	public List<NoticeDto> listNotice(NoticeParameterDto noticeParameterDto) throws SQLException;
	public int getTotalCount(NoticeParameterDto noticeParameterDto) throws SQLException;
	public NoticeDto getNotice(int articleno) throws SQLException;
	public void updateHit(int articleno) throws SQLException;
	public int modifyNotice(NoticeDto noticeDto) throws SQLException;
//	public void deleteMemo(int articleno) throws SQLException;
	public int deleteNotice(int articleno) throws SQLException;
	
}