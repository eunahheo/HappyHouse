package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.FileInfoDto;
import com.ssafy.happyhouse.model.GuestBookDto;

public interface GuestBookMapper {
	
	void registerArticle(GuestBookDto guestBookDto) throws Exception;
	void registerFile(GuestBookDto guestBookDto) throws Exception;
	List<GuestBookDto> listArticle(Map<String, Object> map) throws Exception;
	int getTotalCount(Map<String, String> map) throws Exception;
	GuestBookDto getArticle(int articleNo) throws Exception;
	void updateArticle(GuestBookDto guestBookDto) throws Exception;
	void deleteFile(int articleNo) throws Exception;
	void deleteArticle(int articleNo) throws Exception;
	List<FileInfoDto> fileInfoList(int articleNo) throws Exception;
	
}
