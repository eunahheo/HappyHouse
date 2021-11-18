<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

	<main id="main"> <!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h3>아파트 검색</h3>
				<ol>
					<li><a href="/">Home</a></li>
					<li>아파트 검색</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- Breadcrumbs Section --> <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64eac5c80b2c73c911146817941a78c0"></script>

	<div class="col-lg-12">
		<div class="info-box mt-6"
			style="width: 1000px; height: 900px; margin: auto;">
			<h3>거래정보</h3>
			<form align="right" action="${root}/info" method="get">
				<input type="hidden" name="action" value="list"> <select
					name="key">
					<option value="LIST">전체</option>
					<option value="DONG" <c:if test="${key == 'DONG'}">selected</c:if>>법정동</option>
					<option value="APTNAME"
						<c:if test="${key eq 'APTNAME'}">selected</c:if>>아파트명</option>
				</select> <input type="text" name="word" value=${word}><input
					type="submit" name="검색" value="검색">
			</form>
			<div style="width:100%; height:700px; overflow:auto">

			<table class="table table-striped" id ="aptListTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>아파트/주택</th>
						<th>동</th>
						<th>거래금액(만원)</th>
						<th>건축년도</th>
						<th>거래일자</th>
						<th>면적</th>
					</tr>
				</thead>
				<tbody onclick=a href="#infoModal" data-toggle="modal">
					<c:forEach var="apt" items="${apts}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${apt.aptName}</td>
							<td>${apt.dong}</td>
							<td>${apt.dealAmount}</td>
							<td>${apt.buildYear}</td>
							<td>${apt.dealDay}</td>
							<td>${apt.area}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>



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
	<script>
		function check() {
			if (!confirm("탈퇴하시겠습니까?")) {
				alert("취소하셨습니다.");
			} else {
				alert("탈퇴가 완료되었습니다.");
				location.href = "index.jsp";
			}
		}

		function logout() {
			if (!confirm("로그아웃 하시겠습니까?")) {
				alert("취소하셨습니다.");
			} else {
				alert("로그아웃이 완료되었습니다.");
				location.href = "index.jsp";
			}
		}
	</script>

	<div id="infoModal" class="modal fade">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">상세정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-signin w-85 mx-auto m-5">
						<img src="${root}/resources/img/apt.jpg" class="img-fluid mb-3">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td><b>건물이름</b></td>
									<td>e편한세상</td>
								</tr>
								<tr>
									<td><b>실구매가</b></td>
									<td>52,500만원</td>
								</tr>
								<tr>
									<td><b>전체면적</b></td>
									<td>44.5(평)</td>
								</tr>
								<tr>
									<td><b>거래구분</b></td>
									<td>아파트매매</td>
								</tr>
								<tr>
									<td><b>주소</b></td>
									<td>대전광역시 유성구 봉명동 대학로 60 e편한세상</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>

</html>