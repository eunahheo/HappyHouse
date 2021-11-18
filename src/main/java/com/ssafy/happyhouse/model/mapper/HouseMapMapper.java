package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseMapMapper {
	
	List<SidoGugunCodeDto>getSido() throws SQLException;
	List<SidoGugunCodeDto> getGugunInSido(String sido)throws SQLException;
	List<HouseInfoDto> getDongInGugun(String gugun)throws SQLException;
	List<HouseInfoDto> getAptInDong(String dong)throws SQLException;
	List<HouseInfoDto> getAptName(String aptname)throws SQLException;
	List<HouseInfoDto> allSearch()throws SQLException;
//	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
