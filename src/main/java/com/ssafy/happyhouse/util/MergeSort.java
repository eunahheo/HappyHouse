package com.ssafy.happyhouse.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssafy.happyhouse.controller.HappyHouseMapController;
import com.ssafy.happyhouse.model.HouseInfoDto;

public class MergeSort {
//	public static HouseInfoDto[] sorted;
	private static final Logger log = LoggerFactory.getLogger(HappyHouseMapController.class);
	public void mergeSort(List<HouseInfoDto> info) {
//        sorted = new HouseInfoDto[info.size()];
		sort(info, 0, info.size());
//		sorted = null;
    }
	
	private void sort(List<HouseInfoDto> arr, int left, int right) {
        if(right-left<2)
        	return;
        if(left==right)return;
        int mid = (left + right) / 2;
        sort(arr, 0, mid);
        sort(arr, mid, right);
        merge(arr, left, mid, right);
    }

    private void merge(List<HouseInfoDto> arr, int left, int mid, int right) {
    	HouseInfoDto[] sorted = new HouseInfoDto[right-left];
    	int l = left;
        int r = mid;
        int idx = 0;

        while (l < mid && r < right) {
        	boolean flag = arr.get(l).getAptName().compareTo(arr.get(r).getAptName())>0?true:false;
            if (!flag) {
                sorted[idx++] = arr.get(l++);
            } else {
                sorted[idx++] = arr.get(r++);
            }
        }

        while (l < mid) {
        	sorted[idx++] = arr.get(l++);
        }

        while (r < right) {
        	sorted[idx++] = arr.get(r++);
        }

        for (int i = left; i < right; i++) {
            arr.set(i, sorted[i - left]);
        }
    }
}
