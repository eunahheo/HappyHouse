package com.weclusive.barrierfree.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.weclusive.barrierfree.dto.Email;
import com.weclusive.barrierfree.dto.Impairment;
import com.weclusive.barrierfree.dto.UserJoin;
import com.weclusive.barrierfree.dto.UserJoinKakao;
import com.weclusive.barrierfree.dto.UserLoginDto;
import com.weclusive.barrierfree.entity.Token;
import com.weclusive.barrierfree.entity.User;
import com.weclusive.barrierfree.entity.UserImpairment;
import com.weclusive.barrierfree.repository.TokenRepository;
import com.weclusive.barrierfree.repository.UserImpairmentRepository;
import com.weclusive.barrierfree.repository.UserRepository;
import com.weclusive.barrierfree.util.JwtUtil;
import com.weclusive.barrierfree.util.MailContentBuilder;
import com.weclusive.barrierfree.util.StringUtils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserImpairmentRepository userImpairmentRepository;

	@Autowired
	private TokenRepository tokenRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private MailServiceImpl mailService;

	@Autowired
	private MailContentBuilder mailContentBuilder;
 
	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private AuthenticationManager authenticationManager;


	// 회원 등록
	@Override
	public void registUser(UserJoin userJoin) {
		String now = now(); // 현재 시각
		userRepository.save(
				User.builder()
				.userId(userJoin.getUserId())
				.userNickname(userJoin.getUserNickname())
				.userEmail(userJoin.getUserEmail())
				.userPwd(passwordEncoder.encode(userJoin.getUserPwd())) // 비밀번호 암호화
				.regDt(now).regId(userJoin.getUserId())
				.modDt(now()).modId(userJoin.getUserId())
				.enabledYn('n')
				.certKey(mailService.generate_key()) // 사용자 메일 인증 키
				.build());

		User user = findByUserId(userJoin.getUserId());
		String userId = user.getUserId();
		int userSeq = user.getUserSeq();

		if (userJoin.getPhysical() == 1) { // 지체장애
			saveImpairment(userSeq, userId, "physical", now);
		}
		if (userJoin.getVisibility() == 1) { // 시각장애
			saveImpairment(userSeq, userId, "visibility", now);
		}
		if (userJoin.getDeaf() == 1) { // 청각장애
			saveImpairment(userSeq, userId, "deaf", now);
		}
		if (userJoin.getInfant() == 1) { // 영유아가족
			saveImpairment(userSeq, userId, "infant", now);
		}
		if (userJoin.getSenior() == 1) { // 고령자
			saveImpairment(userSeq, userId, "senior", now);
		}
	}

	// 카카오 회원 등록
	@Override
	public void registKakaoUser(UserJoinKakao userJoinKakao, String userEmail) {
		String now = now(); // 현재 시각

		userRepository.save(
				User.builder()
				.userId(userJoinKakao.getUserId())
				.userEmail(userEmail)
				.userNickname(userJoinKakao.getUserNickname())
				.userPwd(passwordEncoder.encode(userEmail)) // 비밀번호 암호화
				.regDt(now).regId(userJoinKakao.getUserId())
				.modDt(now()).modId(userJoinKakao.getUserId())
				.certKey(null)
				.enabledYn('y') // 카카오 회원의 경우 이메일 인증 패스
				.build());

		User user = findByUserId(userJoinKakao.getUserId());
		String userId = user.getUserId();
		int userSeq = user.getUserSeq();

		if (userJoinKakao.getPhysical() == 1) { // 지체장애
			saveImpairment(userSeq, userId, "physical", now);
		}
		if (userJoinKakao.getVisibility() == 1) { // 시각장애
			saveImpairment(userSeq, userId, "visibility", now);
		}
		if (userJoinKakao.getDeaf() == 1) { // 청각장애
			saveImpairment(userSeq, userId, "deaf", now);
		}
		if (userJoinKakao.getInfant() == 1) { // 영유아가족
			saveImpairment(userSeq, userId, "infant", now);
		}
		if (userJoinKakao.getSenior() == 1) { // 고령자
			saveImpairment(userSeq, userId, "senior", now);
		}

	}

	// 사용자 certKey를 를 포함한 링크를 이메일로 보낸다.
	@Override
	public void sendEmailwithUserKey(String email, String id) {
		User user = userRepository.findByUserId(id);
		String link = "http://localhost:8080/user/email/certified?userNickname=" + user.getUserNickname()
				+ "&certified=" + user.getCertKey();
		String message = mailContentBuilder.build(link);
		try {
			mailService.sendMail(new Email(email, id, "[BarrierFree] 이메일 인증", message));
		} catch (MailException e) {
			e.printStackTrace();
		}
	}

	// 사용자 닉네임으로 찾기
	@Override
	public User email_cert_check(String userNickname) {
		User user = userRepository.findByUserNickname(userNickname);
		return user;
	}

	// 이메일 인증이 되면, 사용자 유효 여부를 'n' -> 'y' 업데이트 하기
	@Override
	public void email_certified_update(User user) {
		user.setEnabledYn('y');
		userRepository.save(user);
	}

	// 사용자 로그인 시 비밀번호가 암호화 한 비밀번호와
	// 일치하면 true 리턴
	// 불일치하면 false 리턴
	@Override
	public boolean encodePassword(UserLoginDto loginUser) {
		User user = userRepository.findByUserId(loginUser.getUserId());

		if (!passwordEncoder.matches(loginUser.getUserPwd(), user.getUserPwd()))
			return false;

		return true;
	}

	// refresh token 생성 후 DB에 저장
	@Override
	public void createRefreshToken(User user) {
		String ref_token = jwtUtil.generateRefreshToken((user.getUserId()));
		tokenRepository.save(Token.builder().userSeq(user.getUserSeq()).tokenRefTK(ref_token).build());
	}

	// AccessToken 생성
	@Override
	public String createAccessToken(User user) {
		try {
			authenticationManager.authenticate(
			new UsernamePasswordAuthenticationToken(user.getUserId(), user.getUserPwd()));
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}
		return jwtUtil.generateAccessToken(user.getUserId());		
	}

	// refreshToken 재발급
	@Transactional
	public User refreshToken(String token, String refreshToken) {
		// 아직 만료되지 않은 토큰으로는 refresh 할 수 없음
		return null;
	}

	// 카카오 코드로 access token 받기
	@Override
	public String getKakaoAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=fa3c898eec92948b420f6f03b934acd1"); // TODO REST_API_KEY 입력
			sb.append("&redirect_uri=http://localhost:8080/user/login/kakao"); // TODO 인가코드 받은 redirect_uri 입력
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 토큰으로 사용자 정보 받기
	@Override
	public String getKakaoEmail(String token) throws Exception {

		String reqURL = "https://kapi.kakao.com/v2/user/me";

		// access_token을 이용하여 사용자 정보 조회
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + token); // 전송할 header 작성, access_token전송

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리로 JSON파싱
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

//			int id = element.getAsJsonObject().get("id").getAsInt();
			boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email")
					.getAsBoolean();
			String email = "";
			if (hasEmail) {
				email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
			}
//			System.out.println("id : " + id);
//			System.out.printlsn("email : " + email);

			br.close();

			return email;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 현재 시간
	public String now() {
		// 현재 날짜와 시간
		LocalDate date = LocalDate.now(); // yyyy-mm-dd
		LocalTime time = LocalTime.now(); // HH:mm:ss.sssss

		// 포맷 정의하기
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		// 포맷 적용하기
		String now = date + " " + time.format(formatter);

		return now;
	}

	// 아이디로 회원 찾기 - 중복 확인
	@Override
	public User findByUserId(String userId) {
		User user = userRepository.findByUserId(userId);
		return user;
	}

	// 닉네임으로 회원 찾기 - 중복 확인
	@Override
	public User findByUserNickname(String userNickname) {
		User user = userRepository.findByUserNickname(userNickname);
		return user;

	}

	// 이메일로 회원 찾기 - kakao
	@Override
	public User findByUserEmail(String userEmail) {
		User user = userRepository.findByUserEmail(userEmail);
		return user;
	}

//	// 회원가입 시 장애정보 등록
//	@Override
//	public void registImpairment(String userId, UserJoin impairment) {
//		User user = userRepository.findByUserId(userId);
//		String now = now();
//		
//
//	}

	public void saveImpairment(int userSeq, String userId, String code, String now) {
		userImpairmentRepository.save(UserImpairment.builder().userSeq(userSeq).code(code).delYn('n').regDt(now)
				.regId(userId).modDt(now).modId(userId).build());
	}

	// 임시 비밀번호 발급, 이메일 전송
	@Override
	public void sendEmailwithTemp(String userEmail, String userId) {
		String tempPass = StringUtils.getRamdomPassword(10);
		String mail = mailContentBuilder.passBuild(tempPass);
		System.out.println("호출");
		try {
			mailService.sendMail(new Email(userEmail, userId, "[BarrierFree] 임시 비밀번호 발급", mail));
			User user = userRepository.findByUserId(userId);
			user.setUserPwd(passwordEncoder.encode(tempPass));
			userRepository.save(user);
		} catch (MailException e) {
			e.printStackTrace();
		}

	}

	// 회원의 장애 정보 가져오기
	@Override
	public Impairment readUserImpairment(int userSeq) {
		int returnUserSeq = userRepository.countByDelYnAndUserSeq('n', userSeq);

		if (returnUserSeq != 0) {

			Impairment ui = new Impairment();
			List<String> st = userImpairmentRepository.findImpairment(userSeq);

			for (int i = 0; i < st.size(); i++) { // 장애 정보 수 만큼 반복
				String im = st.get(i);

				switch (im) {
				case "physical":
					ui.setPhysical(1);
					break;
				case "visibility":
					ui.setVisibility(1);
					break;
				case "deaf":
					ui.setDeaf(1);
					break;
				case "infant":
					ui.setInfant(1);
					break;
				case "senior":
					ui.setSenior(1);
					break;
				}
			}
			return ui;
		}
		return null;
	}

	@Override
	public User findByUserSeq(int userSeq) {
		User user = userRepository.findByUserSeq(userSeq);
		return user;
	}
}