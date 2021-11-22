package com.ssafy.happyhouse.model.service;

import java.io.*;
import java.util.List;

import com.ssafy.happyhouse.model.InterestDto;

public interface InterestService {
	public int register(InterestDto iDto) throws Exception;
	public List<InterestDto> allList() throws Exception;
	public InterestDto listOne(int interestno) throws Exception;
	public int updateInterest(InterestDto interestDto) throws Exception;
	public int deleteInterest(int interestno) throws Exception;
}
