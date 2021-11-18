package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.HappyHouseMapService;
import com.ssafy.happyhouse.util.KMP;
import com.ssafy.happyhouse.util.MergeSort;

@RestController
@CrossOrigin("*")
@RequestMapping("/map")
public class HappyHouseMapController {

	private KMP KMP;
	private MergeSort sort;
	private static final Logger log = LoggerFactory.getLogger(HappyHouseMapController.class);

	private static List<HouseInfoDto> aptList;
	private static boolean[] v;
	private static int[] pick, resultPick;
	private static double result;
	private static HouseInfoDto user;

	@Autowired
	private HappyHouseMapService hService;

	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> sido() throws Exception {
		return new ResponseEntity<List<SidoGugunCodeDto>>(hService.getSido(), HttpStatus.OK);
	}

	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> gugun(@RequestParam("sido") String sido) throws Exception {
		return new ResponseEntity<List<SidoGugunCodeDto>>(hService.getGugunInSido(sido), HttpStatus.OK);
	}

	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfoDto>> dong(@RequestParam("gugun") String gugun) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(hService.getDongInGugun(gugun), HttpStatus.OK);
	}

	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfoDto>> apt(@RequestParam("dong") String dong,
			@RequestParam Map<String, String> map, @RequestParam("lat") double lat, @RequestParam("lng") double lng)
			throws Exception {
		ModelAndView mav = new ModelAndView();
//
//		String spp = map.get("spp"); // size per page (페이지당 글갯수)
//		map.put("spp", spp != null ? spp : "10");
//		List<HouseInfoDto> list = hService.getAptInDong(dong);
//		com.ssafy.happyhouse.util.PageNavigation pageNavigation = hService.makePageNavigation(map);
//		mav.addObject("articles", list);
//		mav.addObject("navigation", pageNavigation);
//		mav.addObject("key", map.get("key"));
//		mav.addObject("word", map.get("word"));
//		mav.setViewName("guestbook/list");
//		HouseInfoDto user = new HouseInfoDto();
//		user.setLat(lat + "");
//		user.setLng(lng + "");
//		aptList.add(0, user);
//		System.out.println("사용자 : " + user);
//		
//		System.out.println();
//		System.out.println("사용자의 현재 위도, 경도 : " + lat + "," + lng);
////		Dijkstra();
//		
//		
//		System.out.println("최단경로 후");
//		for (HouseInfoDto houseInfoDto : aptList) {
//			System.out.println(houseInfoDto);
//		}

		aptList = hService.getAptInDong(dong);

		user = new HouseInfoDto();
		user.setLat(lat + "");
		user.setLng(lng + "");

		System.out.println("최단경로 전");
		for (HouseInfoDto houseInfoDto : aptList) {
			System.out.println(houseInfoDto);
		}

		int N = aptList.size();
		pick = new int[N];
		resultPick = new int[N];
		result = Double.MAX_VALUE;
		v = new boolean[N];

		double[][] matrix = new double[N][N];
		for (int i = 0; i < N; ++i) {
			HouseInfoDto h1 = aptList.get(i);
			for (int j = 0; j < N; ++j) {
				HouseInfoDto h2 = aptList.get(j);
				double dist = distance(Double.parseDouble(h1.getLat()), Double.parseDouble(h1.getLng()),
						Double.parseDouble(h2.getLat()), Double.parseDouble(h2.getLng()));
				matrix[i][j] = dist;
				System.out.print(dist + " ");
			}
			System.out.println();
		}

		perm(0, N, 0, 0, matrix);
		List<HouseInfoDto> list = new ArrayList<HouseInfoDto>();
		for (int n : resultPick) {
			list.add(aptList.get(n));
		}

		return new ResponseEntity<List<HouseInfoDto>>(list, HttpStatus.OK);
	}

	// 아파트 이름을 검색하면 모든 시, 동에 있는 아파트가 나옴
	@GetMapping("/aptname")
	public ResponseEntity<List<HouseInfoDto>> aptname(@RequestParam("aptname") String aptname) throws Exception {
		List<HouseInfoDto> list = new ArrayList<>();
		KMP = new KMP();
		sort = new MergeSort();
		if ("".equals(aptname)) {
			list = hService.getAptName(aptname);
		} else {
			for (HouseInfoDto dto : hService.allSearch()) {
				if (KMP.KMP(dto.getAptName(), aptname)) {
					list.add(dto);
				}
			}
		}
		java.util.Collections.sort(list, new Comparator<HouseInfoDto>() {

			@Override
			public int compare(HouseInfoDto o1, HouseInfoDto o2) {
				return o1.getAptName().compareTo(o2.getAptName());
			}
		});
//		sort.mergeSort(list);
		return new ResponseEntity<List<HouseInfoDto>>(list, HttpStatus.OK);
	}

	/**
	 * @param cnt    = 뽑은 개수
	 * @param matrix
	 * @param start  = 시작 위치
	 */
	static void perm(int cnt, int R, int bf, double sum, double[][] matrix) {
		if (cnt == R) {
			if (sum < result) {
				for (int i = 0; i < pick.length; i++) {
					resultPick[i] = pick[i];
				}
				result = sum;
				System.out.println(Arrays.toString(resultPick));
			}
			return;
		}

		for (int i = 0; i < R; i++) {
			if (v[i])
				continue;
			double dist = 0;

			if (cnt == 0) {
				dist = distance(Double.parseDouble(user.getLat()), Double.parseDouble(user.getLng()),
						Double.parseDouble(aptList.get(i).getLat()), Double.parseDouble(aptList.get(i).getLng()));
			} else {
				dist = matrix[bf][i];
			}

			if (sum + dist < result) {
				pick[cnt] = i;
				v[i] = true;
				perm(cnt + 1, R, i, sum + dist, matrix);
				v[i] = false;
			} else {
				return;
			}

		}
	}

//	@GetMapping("/aptname")
//	public ResponseEntity<List<HouseInfoDto>> aptname(@RequestParam("aptname") String aptname) throws Exception{
//		return new ResponseEntity<List<HouseInfoDto>>(hService.getAptName(aptname),HttpStatus.OK);
//	}

//	static void Dijkstra() {
//		int V = aptList.size(); // 정점 갯수
//		int start = 0;
//		int end = V - 1; // 도착점 인덱스
//		final double INFINITY = Double.MAX_VALUE;
//
//		double[][] matrix = new double[V][V];
//		for (int i = 0; i < V; ++i) {
//			HouseInfoDto h1 = aptList.get(i);
//			for (int j = 0; j < V; ++j) {
//				HouseInfoDto h2 = aptList.get(j);
//				double dist = distance(Double.parseDouble(h1.getLat()), Double.parseDouble(h1.getLng()),
//						Double.parseDouble(h2.getLat()), Double.parseDouble(h2.getLng()));
//				matrix[i][j] = dist;
//				System.out.print(dist + " ");
//			}
//			System.out.println();
//		}
//		double[] distance = new double[V];
//		boolean[] visited = new boolean[V];
//
//		Arrays.fill(distance, INFINITY/2);
//		distance[start] = 0;
//
//		double min = 0;
//		int current = 0;
//		int[] saveRoute = new int[V];
//		saveRoute[start] = 0;
//		for (int i = 0; i < V; ++i) {
//			min = INFINITY;
//			// a단계 : 방문하지 않은 정점들 중 최소가중치의 정점 선택
//			for (int j = 0; j < V; ++j) {
//				if (!visited[j] && distance[j] < min) {
//					min = distance[j];
//					current = j;
//				}
//			}
//			System.out.println("current"+current);
//			visited[current] = true; // 선택 정점 방문 처리
//			if (current == end) { // 선택 정점이 도착정점이면 탈출.
//				break;
//			}
//
//			// b단계: current정점을 경유지로 하여 갈수 있는 다른 방문하지 않은 정점들에 대한 처리
//			for (int c = 0; c < V; ++c) {
//				if (!visited[c] && matrix[current][c] != 0 && distance[c] > min + matrix[current][c]) {
//					distance[c] = min + matrix[current][c];
//					saveRoute[c] = current;
//					System.out.println(c);
//					System.out.println(Arrays.toString(saveRoute));
//				}
//				
//			}
//		}
//		System.out.println("distance" + Arrays.toString(distance));
//		List<HouseInfoDto> list = new ArrayList<HouseInfoDto>();
//		System.out.println(Arrays.toString(saveRoute));
//		// 시작 꼭지점부터 특정 꼭지점까지의 경로 출력
//		Stack<Integer> stack = new Stack<>();
//		int endNode = V - 1;
//		int startNode = 0;
//		while (true) {
//			stack.push(endNode);
//			endNode = saveRoute[endNode];
//			if (endNode == startNode) {
//				stack.push(endNode);
//				break;
//			}
//		}
//		while (!stack.isEmpty()) {
//			list.add(aptList.get(stack.pop()));
//		}
//		aptList.clear();
//		for (int i = 1; i < list.size(); i++) {
//			aptList.add(list.get(i));
//		}
//
//	}

	/**
	 * 두 지점간의 거리 계산
	 *
	 * @param lat1 지점 1 위도
	 * @param lon1 지점 1 경도
	 * @param lat2 지점 2 위도
	 * @param lon2 지점 2 경도
	 * @param unit 거리 표출단위
	 * @return
	 */
	private static double distance(double lat1, double lng1, double lat2, double lng2) {

		double theta = lng1 - lng2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		dist = dist * 1.609344;
		if (Double.isNaN(dist)) {
			dist = 0.0;
		}
		return (dist);
	}

	// This function converts decimal degrees to radians
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	// This function converts radians to decimal degrees
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

}