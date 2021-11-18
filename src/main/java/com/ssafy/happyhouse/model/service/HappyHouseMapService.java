package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HappyHouseMapService {

	List<SidoGugunCodeDto> getSido() throws Exception;	//모든시도
	List<SidoGugunCodeDto> getGugunInSido(String sido)throws Exception;	//시도를 가지고 얻어와야함
	List<HouseInfoDto> getDongInGugun(String gugun)throws Exception;
	List<HouseInfoDto> getAptInDong(String dong)throws Exception;
	List<HouseInfoDto> getAptName(String aptname) throws Exception;
	List<HouseInfoDto> allSearch()throws SQLException;
//	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
