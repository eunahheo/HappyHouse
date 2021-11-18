<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

<main id="main"> <!-- ======= Breadcrumbs Section ======= -->
<section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h2>글보기</h2>
			<ol>
				<li><a href="index.html">Home</a></li>
				<li>글보기</li>
			</ol>
		</div>

	</div>
</section>
<!-- End Breadcrumbs Section -->

<section class="inner-page">
	<div class="container">
		<p>
		<div class="form-signin align-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="table-dark">작성자</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td class="table-dark">제목</td>
						<td>[필독] 사이트 이용안내</td>
					</tr>
					<tr>
						<td class="table-dark">내용</td>
						<td>안녕하세요! 사이트를 방문해주셔서 감사합니다! <br>
						<br> 간단한 회원가입 후 로그인을 하시면 마이페이지가 생깁니다. <br> 상단의 메뉴들을 누르시면
							각각에 해당하는 부분으로 이동합니다. <br>
						<br> 주택거래정보에서 주소를 입력하면 주택과 아파트 정보를 조회할 수 있습니다. <br> 주택
							관련 기사를 누르면 해당 기사 홈페이지로 이동합니다. <br> 공지사항에서 사이트 공지를 확인할 수 있으며
							새 글을 작성할 수 있습니다.
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="clearfix mt-5">
			<a button class="btn btn-lg btn-primary btn-block float-right"
				href="index.html">글목록</a>
		</div>
		</p>
	</div>
</section>

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
						<li><i class="bx bx-chevron-right"></i> <a href="#hero">Home</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#team">사이트
								소개</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#contact">주택거래정보</a></li>
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
<!-- Vendor JS Files -->
<script src="${root}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${root}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${root}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="${root}/resources/vendor/php-email-form/validate.js"></script>
<script src="${root}/resources/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="${root}/resources/vendor/counterup/counterup.min.js"></script>
<script src="${root}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${root}/resources/vendor/venobox/venobox.min.js"></script>
<script src="${root}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="${root}/resources/vendor/aos/aos.js"></script>

<!-- Template Main JS File -->
<script src="${root}/resources/js/main.js"></script>


</body>

</html>