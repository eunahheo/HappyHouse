<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

<main id="main"> <!-- ======= Breadcrumbs Section ======= -->
<section class="breadcrumbs">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h2>글보기</h2>
			<ol>
				<li><a href="/">Home</a></li>
				<li>글보기</li>
			</ol>
		</div>

	</div>
</section>
<!-- End Breadcrumbs Section -->

<section class="inner-page">
	<c:if test="${!empty msg}">
	<script>
	alert("${msg}");
	</script>
	</c:if>
    <script type="text/javascript">
        $(document).ready(function () {
        	
        	if("${key}")
        		$("#skey").val("${key}").prop("selected", true);

        	$("#mvRegisterBtn").click(function () {
                location.href = "${root}/guestbook/register";
            });
        	
        	$("#searchBtn").click(function () {
                var word = $("#sword").val();
                if(word == "") {
                	alert("모든 목록 조회!!!");
                }
                $("#searchform").attr("action", "${root}/guestbook/list").submit();
            });
        	
        	$(".page-item").click(function() {
				$("#pg").val(($(this).attr("data-pg")));
				$("#pageform").attr("action", "${root}/guestbook/list").submit();
			});
        	
        	//file download
            $('.filedown').click(function() {
        		// alert("원본 :  " + $(this).attr('ofile') + "      실제 :  " + $(this).attr('sfile'));
        		$(document).find('[name="sfolder"]').val($(this).attr('sfolder'));
        		$(document).find('[name="ofile"]').val($(this).attr('ofile'));
        		$(document).find('[name="sfile"]').val($(this).attr('sfile'));
        		$('#downform').attr('action', '${root}/guestbook/download').attr('method', 'get').submit();
        	});
        });
    </script>
    <form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<form id="downform">
		<input type="hidden" name="sfolder">
		<input type="hidden" name="ofile">
		<input type="hidden" name="sfile">
	</form>
    <div class="container text-center mt-3"> 
        <div class="col-lg-8 mx-auto">
        	<%@ include file="/WEB-INF/views/include/confirm.jsp" %>
            <h2 class="p-3 mb-3 shadow bg-light"><mark class="sky">글목록</mark></h2>
            <div class="m-3 text-right">
                <button type="button" id="mvRegisterBtn" class="btn btn-link">글작성</button>
            </div>
            <div class="m-3 row justify-content-end">
            	<form id="searchform" class="form-inline" method="get">
            		<input type="hidden" name="pg" value="1">
	            	<select id="skey" name="key" class="form-control">
	            		<option value="id"> 아이디
	            		<option value="articleno"> 글번호
	            		<option value="subject"> 제목
	            	</select>
	            	<input type="text" class="ml-1 form-control" id="sword" name="word" value="${word}">
	            	<button type="button" id="searchBtn" class="ml-1 btn btn-outline-primary">검색</button>
            	</form>
            </div>
		<c:if test="${!empty articles}">
			<c:forEach var="article" items="${articles}">
			<table class="table table-active text-left">
				<tbody>
					<tr class="table-info">
						<td>작성자 : ${article.name}</td>
						<td class="text-right">작성일 : ${article.regTime}</td>
					</tr>
					<tr>
						<td colspan="2" class="table-danger">
							<strong>${article.articleNo}. ${article.subject}</strong>
						</td>
					</tr>
					<tr>
						<td class="p-4" colspan="2">
							${article.content}
						</td>
					</tr>
					<c:if test="${!empty article.fileInfos}">
					<tr>
						<td colspan="2">
							<ul>
								<c:forEach var="file" items="${article.fileInfos}">
									<li>${file.originFile} <a href="#" class="filedown" sfolder="${file.saveFolder}" sfile="${file.saveFile}" ofile="${file.originFile}">[다운로드]</a>
								</c:forEach>
							</ul>
						</td>
					</tr>
					</c:if>
					<c:if test="${userinfo.id eq article.id}">
					<tr>
						<td colspan="2" class="text-right">
							<a href="${root}/guestbook/modify?articleno=${article.articleNo}">수정</a>
							<a href="${root}/guestbook/delete?articleno=${article.articleNo}">삭제</a>
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			</c:forEach>
			<div class="m-3 row justify-content-center">${navigation.navigator}</div>
		</c:if>
		<c:if test="${empty articles}">
			<table class="table table-active text-center">
				<tr class="table-info">
					<td>작성한 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		</div>
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