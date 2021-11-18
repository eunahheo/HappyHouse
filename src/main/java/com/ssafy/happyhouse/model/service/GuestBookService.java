package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.GuestBookDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface GuestBookService {

	void registerArticle(GuestBookDto guestBookDto) throws Exception;
	List<GuestBookDto> listArticle(Map<String, String> map) throws Exception;
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	GuestBookDto getArticle(int articleNo) throws Exception;
	void updateArticle(GuestBookDto guestBookDto) throws Exception;
	void deleteArticle(int articleNo, String path) throws Exception;
	
}
