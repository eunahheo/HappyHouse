<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h3>상세조회</h3>
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li>상세조회</li>
          </ol>
        </div>

      </div>
    </section><!-- Breadcrumbs Section -->

    <!-- ======= Portfolio Details Section ======= -->
     <!--<section class="portfolio-details">
       <div class="container">

        <div class="portfolio-details-container">

          <div class="owl-carousel portfolio-details-carousel">
            <img src="${root}/resources/img/portfolio/portfolio-details-1.jpg" class="img-fluid" alt="">
            <img src="${root}/resources/img/portfolio/portfolio-details-2.jpg" class="img-fluid" alt="">
            <img src="${root}/resources/img/portfolio/portfolio-details-3.jpg" class="img-fluid" alt="">
          </div>

          <div class="portfolio-info">
            <h3>Project information</h3>
            <ul>
              <li><strong>Category</strong>: Web design</li>
              <li><strong>Client</strong>: ASU Company</li>
              <li><strong>Project date</strong>: 01 March, 2020</li>
              <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
            </ul>
          </div>

        </div>

        <div class="portfolio-description">
          <h2>This is an example of portfolio detail</h2>
          <p>
            Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
          </p>
        </div>
      </div>
    </section>End Portfolio Details Section --> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64eac5c80b2c73c911146817941a78c0"></script>
    <script type="text/javascript">
        var map, marker;
        $(document).ready(function () {

            // 초기 kakao map 설정 start
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            // var lat = 37.5012743;
            // var lng = 127.039585;
            var locPosition = new kakao.maps.LatLng(37.5012743, 127.039585); // (멀티캠퍼스)
            var options = { //지도를 생성할 때 필요한 기본 옵션
                center: locPosition, //지도의 중심좌표. 
                level: 3 //지도의 레벨(확대, 축소 정도)
            };

            map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

            // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
            if (navigator.geolocation) {

                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function (position) {

                    var lat = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도

                    locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    var message = '<div style="padding:5px;">현재위치인가요?!</div>'; // 인포윈도우에 표시될 내용입니다

                    // 마커와 인포윈도우를 표시합니다
                    displayMarker(locPosition, message);

                });

            } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

                locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
                var message = 'geolocation을 사용할수 없어요..';

                displayMarker(locPosition, message);
            }
            // 초기 kakao map 설정 end

            var cafeArea = {
                "서울": ["e편한세상", "경남"],
                "대전": ["아이파크", "e편한세상"],
                "구미": ["삼성아파트", "궁전2", "금성"],
                "광주": ["역삼아파트", "싸피", "시몬스"],
            };

            var officePosition = {
                "e편한세상": { "lat": 37.500613, "lng": 127.036431 },
                "경남": { "lat": 37.504268, "lng": 127.048188 },
                "아이파크": { "lat": 36.355360, "lng": 127.298294 },
                "e편한세상": { "lat": 36.358843, "lng": 127.344192 },
                "삼성아파트": { "lat": 36.098594, "lng": 128.389770 },
                "궁전2": { "lat": 36.109553, "lng": 128.415011 },
                "금성": { "lat": 35.204279, "lng": 126.807198 },
                "역삼아파트": { "lat": 35.165476, "lng": 126.909216 },
                "싸피": { "lat": 35.095765, "lng": 128.856344 },
                "시몬스": { "lat": 35.093641, "lng": 128.855679 }
            };

            var officeAddress = {
                "e편한세상": "서울특별시+강남구+역삼동+테헤란로+212",
                "경남": "서울특별시 강남구 역삼동 테헤란로 334 LG 화재빌딩",
                "아이파크": "대전광역시 유성구 덕명동 124",
                "e편한세상": "대전광역시 유성구 봉명동 대학로 60 봉명가든 6층",
                "삼성아파트": "경상북도 구미시 공단동 259",
                "궁전2": "경상북도 구미시 임수동 94",
                "금성": "107 하남산단6번로 광산구 광주광역시",
                "역삼아파트": "광주광역시 북구 중흥동 611",
                "싸피": "부산광역시 강서구 송정동 녹산산업중로 삼성전기 부산사업장사",
                "시몬스": "부산광역시 강서구 송정동 삼성전기부속의원"
            };

            $(".dropdown-item.cafe_area").click(function () {
                var selArea = $(this).text();
                $("#areaBtn").text(selArea);
                $("#officeBtn").text('아파트 선택');
                var offices = cafeArea[selArea];
                $("#office_div").empty();
                $.each(offices, function (i, office) {
                    $("#office_div").append('<label class="dropdown-item cafe_office">' + office + '</label>');
                });
                
            });

            //officePosition의 lat, lng를 이용한 marker
            $(document).on("click", ".dropdown-item.cafe_office", function () {
                var selOffice = $(this).text();
                console.log(selOffice);
                $("#officeBtn").text(selOffice);
                var office = officePosition[selOffice];


                // 이동할 위도 경도 위치를 생성합니다 
                var moveLatLon = new kakao.maps.LatLng(office.lat, office.lng);
                var message = `<div style="padding:5px;">${selOffice}</div>`;

                // 지도 중심을 부드럽게 이동시킵니다
                // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
                map.panTo(moveLatLon);

                displayMarker(moveLatLon, message);
            });
        });

        function displayMarker(locPosition, message) {
            if (marker)
                marker.setMap(null); // 기존 maker 제거

            var imageSrc = '${root}/resources/img/my_position.png', // 마커이미지의 주소입니다    
                imageSize = new kakao.maps.Size(50, 70), // 마커이미지의 크기입니다
                imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

            // 마커를 생성합니다
            marker = new kakao.maps.Marker({
                map: map,
                position: locPosition,
                image: markerImage
            });

            var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = true;

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable: iwRemoveable
            });

            // 인포윈도우를 마커위에 표시합니다 
            infowindow.open(map, marker);

            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);
        }
    </script>
    <div class="row" data-aos="fade-up" data-aos-delay="200">
      <div class="col-lg-6">
        <div class="info-box mt-3"style="width: 500px; height: 1500px; margin: auto;">
          <h3>동 별 검색</h3>
          <div class="dropdown">
            <div class="btn-group">
                <button type="button" id="areaBtn"
                    class="btn btn-warning dropdown-toggle dropdown-toggle-split"
                    data-toggle="dropdown">시</button>
                <div class="dropdown-menu">
                    <label class="dropdown-item cafe_area">서울</label>
                    <label class="dropdown-item cafe_area">대전</label>
                    <label class="dropdown-item cafe_area">구미</label>
                    <label class="dropdown-item cafe_area">광주</label>
                </div>
            </div>
            <div class="btn-group">
                <button type="button" id="officeBtn"
                    class="btn btn-warning dropdown-toggle dropdown-toggle-split"
                    data-toggle="dropdown">아파트 선택</button>
                <div id="office_div" class="dropdown-menu"></div>
            </div>
            <div class="btn-group">
                <button type="button" id="officeBtn"
                    class="btn btn-warning dropdown-toggle dropdown-toggle-split"
                    data-toggle="dropdown">101동</button>
                <div id="office_div" class="dropdown-menu"></div>
            </div>
            <button type="button" id="detailBtn" class="btn btn-outline-secondary"><a href="map-details.jsp">아파트 별 검색</a></button>
            <div class="mt-3" id="map" style="width: 900px; height: 600px; margin: auto;" class="mb-3"></div>
        </div>
        </div>
      </div>   
      <div class="col-lg-6">
        <div class="info-box mt-3"style="width: 500px; height: 1500px; margin: auto;">
          <h3>거래정보</h3>
          <table class="table table-striped">
            <thead>
              <tr>
                <th>아파트 이름</th>
                <th>동</th>
                <th>전체면적</th>
                <th>거래구분</th>
                <th>실구매가</th>
              </tr>
            </thead>
              <tbody onclick=a href="#infoModal" data-toggle="modal">
                <tr>
                  <td>e편한세상</td>
                  <td>101동</td>
                  <td>44.5</td>
                  <td>아파트 매매</td>    
                  <td>52,500만원</td>            
                </tr>
                <tr>
                  <td>e편한세상</td>
                  <td>102동</td>
                  <td>43.5</td>
                  <td>전세</td>    
                  <td>35,500만원</td>            
                </tr>
            </tbody>
          </table>
          </div>
      </div>    
    </div>


     
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
              <li><i class="bx bx-chevron-right"></i> <a href="#hero">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#team">사이트 소개</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#contact">주택거래정보</a></li>
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
  <script src="${root}/resources//vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
        location.href="index.jsp";
      }
    }

    function logout() {
      if(!confirm("로그아웃 하시겠습니까?")) {
        alert("취소하셨습니다.");
      }
      else {
        alert("로그아웃이 완료되었습니다.");
        location.href="index.jsp";
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