package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.mapper.HouseMapMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HappyHouseMapServiceImpl implements HappyHouseMapService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptInDong(dong);
	}
	@Override
	public List<HouseInfoDto> getAptName(String aptname) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptName(aptname);
	}
//
//	@Override
//	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
//		return sqlSession.getMapper(HouseMapMapper.class).makePageNavigation(map);
//	}

	@Override
	public List<HouseInfoDto> allSearch() throws SQLException {
		return sqlSession.getMapper(HouseMapMapper.class).allSearch();
	}

}
