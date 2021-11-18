<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

<!-- ======= Hero Section ======= -->
<section id="hero">
	<div class="hero-container" data-aos="fade-up">
		<h1>Welcome to HAPPYHOUSE</h1>
		<h2>주택의 아파트/다세대,주택 별 거래 정보와 아파트 정보를 조회할 수 있습니다.</h2>
		<!-- <form action="" method="post">
              <input type="email" name="email" id="inputEmail"><input type="submit" value="검색" id="searchBtn">
            </form>
 -->

		<a href="/map" class="btn-get-started scrollto"> <svg
				xmlns="http://www.w3.org/2000/svg" width="32" height="30"
				fill="white" class="bi bi-search" viewBox="0 0 16 16">
  <path
					d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg></a>
		<!-- <div class="d-grid gap-2">
  			<button class="btn btn-primary" style="width: 250px;font-size:30px" type="button" onclick="location.href='/map'"><b>GO HOUSE</b></button>
		</div> -->
	</div>
</section>
<!-- End Hero -->

<main id="main">
	<!-- ======= Team Section ======= -->
	<section id="team" class="team">
		<div class="container">

			<div class="section-title" data-aos="fade-in" data-aos-delay="100">
				<h2>사이트 소개</h2>
				<p>
					Web Front-End 기술인 <b>HTML / JSP / CSS / JavaScript</b> 등을 활용한 스프링부트
					웹 사이트로<br> <b>jQuery 와 Bootstrap 등 Library</b> 를 활용해, 더욱 향상된
					디자인 및 기능을 구현하였습니다.<br> 또한, <b>Ajax</b>를 활용해 동적인 데이터 처리를 했습니다.
				</p>
				<p>
					<b>이미지, Kakao Map, Form</b> 등을 활용해, 시각적인 효과를 내 사용자 입장에서 편리하고 직관적으로
					사용할 수 있도록 설계했습니다.
				</p>
			</div>

			<div class="row">

				<div class="col-lg-6 col-md-6">
					<div class="member" data-aos="fade-up">
						<div class="pic">
							<img src="${root}/resources/img/woman.jpg" class="img-fluid"
								alt="">
						</div>
						<div class="member-info">
							<h4>허은아</h4>
							<span>Developer</span>
							<div class="social">
								<a href=""><i class="icofont-twitter"></i></a> <a href=""><i
									class="icofont-facebook"></i></a> <a href=""><i
									class="icofont-instagram"></i></a> <a href=""><i
									class="icofont-linkedin"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="member" data-aos="fade-up" data-aos-delay="150">
						<div class="pic">
							<img src="${root}/resources/img/woman.jpg" class="img-fluid"
								alt="">
						</div>
						<div class="member-info">
							<h4>오지영</h4>
							<span>Developer</span>
							<div class="social">
								<a href=""><i class="icofont-twitter"></i></a> <a href=""><i
									class="icofont-facebook"></i></a> <a href=""><i
									class="icofont-instagram"></i></a> <a href=""><i
									class="icofont-linkedin"></i></a>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Team Section -->

	<!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container">

			<div class="row no-gutters">
				<div class="content col-xl-5 d-flex align-items-stretch"
					data-aos="fade-up">
					<div class="content">
						<h3>
							Happy House에서는 <br>4가지 기능을 제공합니다.
						</h3>
						<p>Happy House에서 주택 거래정보를 확인해보세요.</p>
						<a href="#" class="about-btn">About us <i
							class="bx bx-chevron-right"></i></a>
					</div>
				</div>
				<div class="col-xl-7 d-flex align-items-stretch">
					<div class="icon-boxes d-flex flex-column justify-content-center">
						<div class="row">
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="100">
								<i class="bx bx-receipt"></i>
								<h4>주택/아파트 실거래가 정보</h4>
								<p>공공데이터 API를 사용하여 주택/아파트 실거래가 정보를 제공합니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="200">
								<i class="bx bx-cube-alt"></i>
								<h4>카카오 지도</h4>
								<p>해당 주택/아파트의 위치를 카카오 지도에서 한눈에 보기 쉽게 제공합니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="300">
								<i class="bx bx-images"></i>
								<h4>게시판</h4>
								<p>회원들과 다양한 정보를 공유할 수 있도록 게시판을 제공합니다.</p>
							</div>
							<div class="col-md-6 icon-box" data-aos="fade-up"
								data-aos-delay="400">
								<i class="bx bx-shield"></i>
								<h4>주택 관련 기사</h4>
								<p>최근 주택 관련 기사를 제공합니다.</p>
							</div>
						</div>
					</div>
					<!-- End .content-->
				</div>
			</div>

		</div>
	</section>
	<!-- End About Section -->

	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact section-bg">
		<div class="container" style="margin: 0 auto">

			<div class="section-title" data-aos="fade-in" data-aos-delay="100">
			<br/>
				<h2>QNA / 게시판</h2>
				<p>QNA와 게시판을 이용하여 궁금한 점을 해결해보세요.</p>
			</div>

			<div class="row" data-aos="fade-up" data-aos-delay="100"
				style="margin: 0 auto">
				<div class="col-lg-9" style="margin: 0 auto">
					<div class="info-box mb-5">
						<i class="bx bx-spreadsheet"></i>
						<h3>QNA</h3>
						<table class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th class="w-10">#</th>
									<th class="w-50">제목</th>
									<th class="w-25">작성자</th>
								</tr>
							</thead>
							<tbody class="table table-hover">
								<tr>
									<td>1</td>
									<td><a href="view.jsp">[필독] 사이트 이용안내</a></td>
									<td>관리자</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a href="view.jsp">주택 거래 시 주의할 점</a></td>
									<td>오지영</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a href="view.jsp">주택 거래 정보 조회 방법</a></td>
									<td>허은아</td>
								</tr>
							</tbody>
						</table>
						<div class="clearfix">
							<a href="${root}/qna.html"
								class="btn btn-primary float-right" role="button">QNA</a>
						</div>
					</div>

				</div>
			</div>
			<div class="col-lg-9" style="margin: 0 auto">
				<div class="info-box  mb-4">
					<i class="bx bx-news"></i>
					<h3>주택 관련 기사</h3>
					<li><a
						href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=215&aid=0000982359"
						target="_blank" class="small margin-clear"
						title="KB국민은행, 주택담보·전세대출 변동금리 0.15%p 인상">KB국민은행, 주택담보·전세대출
							변동금리 0.15%p 인상</a></li>
					<li><a
						href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=243&aid=0000015899"
						class="small margin-clear" target="_blank"
						title="주택 공급 늘리는 신도시 개발이 집값 급등 부채질했나">주택 공급 늘리는 신도시 개발이 집값 급등
							부채질했나</a></li>
				</div>
			</div>
		</div>

		</div>
	</section>
	<!-- End Contact Section -->
	<!-- Login Section -->
	<section id="login" class="login section-bg"></section>
	<!-- End Login Section -->
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-6 col-md-6">
					<div class="footer-info" data-aos="fade-up" data-aos-delay="50">
						<h3>Find Us</h3>
						<p>
							(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 <br> <br> <strong>Phone:</strong>
							1544-9001<br> <strong>Email:</strong> admin@ssafy.com<br>
						</p>
						<div class="social-links mt-3">
							<a href="https://www.ssafy.com/ksp/jsp/swp/swpMain.jsp"
								target="_blank" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							<a href="https://www.facebook.com/hellossafy/" target="_blank"
								class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="https://www.instagram.com/hellossafy/?hl=ko"
								target="_blank" class="instagram"><i
								class="bx bxl-instagram"></i></a>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 footer-links" data-aos="fade-up"
					data-aos-delay="150">
					<h4>사이트 맵</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a
							href="${root}/#hero">Home</a></li>
						<li><i class="bx bx-chevron-right"></i> <a
							href="${root}/#team">사이트 소개</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="${root}/map">주택거래정보</a></li>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong><span>Squadfree</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</div>
</footer>
<!-- End Footer -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


<!-- 로그인 모달 만들기 -->



<!-- Vendor JS Files -->
<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="${root}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="${root}/resources/vendor/php-email-form/validate.js"></script>
<script src="${root}/resources/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="${root}/resources/vendor/counterup/counterup.min.js"></script>
<script
	src="${root}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${root}/resources/vendor/venobox/venobox.min.js"></script>
<script src="${root}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="${root}/resources/vendor/aos/aos.js"></script>



<script src="${root}/resources/js/main.js"></script>

</body>

</html>