<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

<main id="main"> <!-- ======= Breadcrumbs Section ======= -->
<section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h2>작성 완료</h2>
			<ol>
				<li><a href="/">Home</a></li>
				<li>작성 완료</li>
			</ol>
		</div>

	</div>
</section>
<!-- End Breadcrumbs Section -->

    <script type="text/javascript">
        $(document).ready(function () {
            $("#modifyBtn").click(function () {
                if (!$("#subject").val()) {
                    alert("제목 입력!!!!");
                    return;
                } else if (!$("#content").val()) {
                    alert("내용 입력!!!!");
                    return;
                } else {
                    $("#writeform").attr("action", "${root}/guestbook/modify").submit();
                }
            });
        });
    </script>

    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="sky">글수정</mark></h2>
            <form id="writeform" class="text-left mb-3" method="post" action="">
            	<input type="hidden" name="articleNo" value="${article.articleNo}">
                <!-- <div class="form-group">
                    <label for="userid">작성자ID:</label>
                    <input type="text" class="form-control" id="userid" name="userid" placeholder="작성자ID...">
                </div> -->
                <div class="form-group">
                    <label for="subject">제목:</label>
                    <input type="text" class="form-control" id="subject" name="subject" value="${article.subject}">
                </div>
                <div class="form-group">
                    <label for="content">내용:</label>
                    <textarea class="form-control" rows="15" id="content" name="content">${article.content}</textarea>
                </div>
                <div class="text-center">
                    <button type="button" id="modifyBtn" class="btn btn-outline-primary">글수정</button>
                    <button type="reset" class="btn btn-outline-danger">초기화</button>
                </div>
            </form>
        </div>
    </div>
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