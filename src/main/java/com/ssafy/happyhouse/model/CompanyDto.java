package com.ssafy.happyhouse.model;

public class CompanyDto {
	private int companyno;
	private String buildingName;
	private String sido;
	private String sigunGu;
	private String bName;
	private String bCode;
	private String lat;
	private String lng;
	private String userid; // user 테이블의 pk를 company테이블의 fk로 사용

	public int getCompanyno() {
		return companyno;
	}

	public void setCompanyno(int companyno) {
		this.companyno = companyno;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigunGu() {
		return sigunGu;
	}

	public void setSigunGu(String sigunGu) {
		this.sigunGu = sigunGu;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
