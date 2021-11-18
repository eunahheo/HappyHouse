<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>
<script>
$(document).ready(function() {
	
	//회원 목록
	$.ajax({
		url:'${root}/user/',  
		type:'GET',
		contentType:'application/json;charset=utf-8',
		dataType:'json',
		success:function(users) {
			makeList(users);
		},
		error:function(xhr, status, error){
			console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
		},
		statusCode: {
			500: function() {
				alert("서버에러.");
				// location.href = "/error/e500";
			},
			404: function() {
				alert("페이지없다.");
				// location.href = "/error/e404";
			}
		}	
	});
	function makeList(users) {
		$("#userlist").empty();
		$(users).each(function(index, user) {
			console.log(1);
			let str= `
	              		<tr>
	                  		<td>${'${user.id}'}</td>
	                  		<td>${'${user.name}'}</td>
	                  		<td>${'${user.email}'}</td>
	                  	</tr>
			`;
		$("#userlist").append(str);
		});
	}
});
</script>
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h3>회원목록</h3>
          <ol>
            <li><a href="${root}">Home</a></li>
            <li>회원정보 조회</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <p>
          <div class="form-signin align-center" >
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                </tr>
              </thead>
              <tbody id="userlist">
              	
              </tbody>
            </table>
          </div>
          <div class="clearfix mt-5">
            <a button class="btn btn-lg btn-primary btn-block float-right" href="/">HOME</a>
          </div>
        </p>
      </div>
    </section>
    
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="footer-info" data-aos="fade-up" data-aos-delay="50">
              <h3>Find Us</h3>
              <p>
                (SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 <br>
                <br>
                <strong>Phone:</strong> 1544-9001<br>
                <strong>Email:</strong> admin@ssafy.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="https://www.ssafy.com/ksp/jsp/swp/swpMain.jsp" target="_blank" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                <a href="https://www.facebook.com/hellossafy/"  target="_blank" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="https://www.instagram.com/hellossafy/?hl=ko"  target="_blank" class="instagram"><i class="bx bxl-instagram"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 footer-links" data-aos="fade-up" data-aos-delay="150">
            <h4>사이트 맵</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="${root}/#hero">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${root}/#team">사이트 소개</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${root}/map">주택거래정보</a></li>
            </ul>
          </div>


        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Squadfree</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->


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
      if(!confirm("탈퇴하시겠습니까?")) {
        alert("취소하셨습니다.");
      }
      else {
        alert("탈퇴가 완료되었습니다.");
    	location.href = "${root}/user/delete/${userinfo.id}";
      }
    }

    function logout() {
      if(!confirm("로그아웃 하시겠습니까?")) {
        alert("취소하셨습니다.");
      }
      else {
        alert("로그아웃이 완료되었습니다.");
        location.href="${root}";
      }
    }
  </script>
  <script>
  $(document).ready(function() {
		
		//회원 목록
		/* $.ajax({
			url:'${root}/admin/user',  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(users) {
				makeList(users);
			},
			error:function(xhr, status, error){
				console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
			},
			statusCode: {
				500: function() {
					alert("서버에러.");
					// location.href = "/error/e500";
				},
				404: function() {
					alert("페이지없다.");
					// location.href = "/error/e404";
				}
			}	
		}); */
		
	});
	</script>	  
  
</body>

</html>