package com.ssafy.happyhouse.util;

public class KMP {
	public int[] getPi(String pattern){
		int[] pi = new int[pattern.length()];
		int j = 0;
		for (int i = 1; i < pattern.length(); i++) {
			if( pattern.charAt(i) == pattern.charAt(j)) {
				pi[i] = ++j;
			}
			else {
				while(j>0 && pattern.charAt(i) != pattern.charAt(j)) 
					j = pi[j-1];
			}
		}
		return pi;
	}
	public boolean KMP(String origin, String pattern) {
		int[] pi = getPi(pattern);
		int j = 0;
		for (int i = 0; i < origin.length(); i++) {
			while(j>0 && origin.charAt(i) != pattern.charAt(j))
				j = pi[j-1];
			if(origin.charAt(i) == pattern.charAt(j)) {
				if(j==pattern.length() -1) {
					return true;
				}
				else 
					j++;
			}
		}
		return false;
	}
}
