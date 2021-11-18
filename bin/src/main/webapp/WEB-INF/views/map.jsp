<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>

<main id="main">
   <!-- ======= Breadcrumbs Section ======= -->
   <section class="breadcrumbs">
      <div class="container">
      
      
         <div class="section-title" >
         <br>
				<h2><b>주택거래정보</b></h2>
				<p>아파트/다세대, 주택 별 거래정보와 아파트 정보를 조회할 수 있습니다.</p>
			</div>

      </div>
   </section>

   <section id="index_section">
      <div class="card col-sm-12 mt-1" style="min-height: 850px;">
         <div class="card-body" style="text-align: center;">
            시도 : <select id="sido">
               <option value="0">선택</option>
            </select> 구군 : <select id="gugun">
               <option value="0">선택</option>
            </select> 읍면동 : <select id="dong">
               <option value="0">선택</option>
            </select> 아파트명 : <input type="text" id="aptname">
            <button role="button" class="btn btn-primary" id="aptSearchBtn">검색</button>
            <br>
            <div id="listDiv" style="color: black; font-weight: bold"; ></div>
            <div style="width: 100%; max-height: 500px; overflow: auto">
               <table class="table table-striped">
                  <colgroup>
                     <col width="100">
                     <col width="150">
                     <col width="*">
                     <col width="120">
                     <col width="120">
                  </colgroup>
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>아파트이름</th>
                        <th class="text-center">주소</th>
                        <th>건축연도</th>
                        <th>최근거래금액</th>
                     </tr>
                  </thead>
                  <tbody id="searchResult"></tbody>
               </table>
            </div>
            <div id="map" style="width: 100%; height: 500px;"></div>
            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64eac5c80b2c73c911146817941a78c0&libraries=services"></script>
            <script type="text/javascript" src="js/map.js"></script>
            
            <script type="text/javascript">
               let colorArr = [ 'table-primary', 'table-success', 'table-danger' ];
               
               
               $(document).ready(
                       
                       
                       
                  function() {
                     $.get(root + "/map/sido",
                     function(data, status) {
                        $.each(data, function(index, vo) {
                           $("#sido").append("<option value='"+vo.sidoCode+"'>"+ vo.sidoName+ "</option>");});
                        }
                     , "json");
                  });
               $(document).on("change","#sido",function() {
                  $.get(root + "/map/gugun", {
                     sido : $("#sido").val()
                        }, function(data, status) {
                           $("#gugun").empty();
                           $("#gugun").append(
                                 '<option value="0">선택</option>');
                           $.each(data, function(index, vo) {
                              $("#gugun").append(
                                    "<option value='"+vo.gugunCode+"'>"
                                          + vo.gugunName
                                          + "</option>");
                           });
                        }, "json");
                     });
               $(document).on(
                     "change",
                     "#gugun",
                     function() {
                        $.get(root + "/map/dong", {
                           gugun : $("#gugun").val()
                        }, function(data, status) {
                           $("#dong").empty();
                           $("#dong").append(
                                 '<option value="0">선택</option>');
                           $.each(data, function(index, vo) {
                              $("#dong").append(
                                    "<option value='"+vo.dongCode+"'>"
                                          + vo.dongName
                                          + "</option>");
                           });
                        }, "json");
                     });
               $(document).on(
                     "change",
                     "#dong",
                     function() {
                        $.get(root + "/map/apt", {
                           dong : $("#dong").val(),
                           lat : lat,
                           lng : lng
                        }, function(data, status) {
                           $("#searchResult").empty();
                           $("#listDiv").html("<span>현재 접속한 사용자의 위치에서 최적의 아파트 동선 순으로 제공됩니다. (아파트명 검색 제외)</span>");
                           
                           $.each(data, function(index, vo) {
                              $("tbody").append(
                                    "<tr class="
                                          + colorArr[index % 3]
                                          + ">").append(
                                    "<td>" + vo.aptCode + "</td>")
                                    .append(
                                          "<td>" + vo.aptName
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.sidoName
                                                + " "
                                                + vo.gugunName
                                                + " "
                                                + vo.dongName
                                                + " "
                                                + vo.jibun
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.buildYear
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.recentPrice
                                                + "</td>")
                                    .append("</tr>");
                           });
                           displayMarkers(data);
                        }, "json");
                     });

               $(document).on(
                     "click",
                     "#aptSearchBtn",
                     function() {
                        $.get(root + "/map/aptname", {
                           aptname : $("#aptname").val()
                        }, function(data, status) {
                           $("#searchResult").empty();
                           $.each(data, function(index, vo) {
                              $("tbody").append(
                                    "<tr class="
                                          + colorArr[index % 3]
                                          + ">").append(
                                    "<td>" + vo.aptCode + "</td>")
                                    .append(
                                          "<td>" + vo.aptName
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.sidoName
                                                + " "
                                                + vo.gugunName
                                                + " "
                                                + vo.dongName
                                                + " "
                                                + vo.jibun
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.buildYear
                                                + "</td>")
                                    .append(
                                          "<td>" + vo.recentPrice
                                                + "</td>")
                                    .append("</tr>");
                           });
                           displayMarkers(data);
                        }, "json");

                     });
               $(document)
                     .on(
                           "click",
                           "#aptSearchBtn",
                           function() {
                              var param = {
                                 serviceKey : 'oe7OTbBkAde50WbBoRyFG/WfDB6ekTwQu1XJllixXgeyhgOlJho9c2mIcuYrmN+Xg4g0l0eshTzlH7GHPQlC1A==',
                                 pageNo : encodeURIComponent('1'),
                                 numOfRows : encodeURIComponent('10'),
                                 LAWD_CD : encodeURIComponent($(
                                       "#gugun").val()),
                                 DEAL_YMD : encodeURIComponent('202110')
                              };
                              $
                                    .get(
                                          'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev',
                                          param,
                                          function(data, status) {
                                             var items = $(data)
                                                   .find(
                                                         'item');
                                             var jsonArray = new Array();
                                             items
                                                   .each(function() {
                                                      var jsonObj = new Object();
                                                      jsonObj.aptCode = $(
                                                            this)
                                                            .find(
                                                                  '일련번호')
                                                            .text();
                                                      jsonObj.aptName = $(
                                                            this)
                                                            .find(
                                                                  '아파트')
                                                            .text();
                                                      jsonObj.dongCode = $(
                                                            this)
                                                            .find(
                                                                  '법정동읍면동코드')
                                                            .text();
                                                      //jsonObj.dongName = $(this).find('').text();
                                                      //jsonObj.sidoName = $(this).find('').text();
                                                      //jsonObj.gugunName = $(this).find('').text();
                                                      jsonObj.buildYear = $(
                                                            this)
                                                            .find(
                                                                  '건축년도')
                                                            .text();
                                                      jsonObj.jibun = $(
                                                            this)
                                                            .find(
                                                                  '지번')
                                                            .text();
                                                      jsonObj.recentPirce = $(
                                                            this)
                                                            .find(
                                                                  '거래금액')
                                                            .text();

                                                      jsonObj = JSON
                                                            .stringify(jsonObj);
                                                      //String 형태로 파싱한 객체를 다시 json으로 변환
                                                      jsonArray
                                                            .push(JSON
                                                                  .parse(jsonObj));
                                                   });
                                             console
                                                   .log(jsonArray);
                                             //displayMarkers(jsonArray);
                                          }, "xml");
                              /* var xhr = new XMLHttpRequest();
                              var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
                              var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent(' API KEY ');
                              queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
                              queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
                              queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
                              queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
                              xhr.open('GET', url + queryParams);
                              xhr.onreadystatechange = function () {
                              if (this.readyState == 4) {
                              console.log(this.responseXML);
                              alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
                              }
                              };

                              xhr.send(''); */
                           });
            </script>
         </div>
      </div>
   </section>
</main>
<!-- End #main -->

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
                  <li><i class="bx bx-chevron-right"></i> <a href="${root}/#hero">Home</a></li>
                  <li><i class="bx bx-chevron-right"></i> <a href="${root}/#team">사이트
                        소개</a></li>
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
<!-- Vendor JS Files -->
<script src="${root}/resources//vendor/jquery/jquery.min.js"></script>
<script
   src="${root}/resources//vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
   src="${root}/resources//vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="${root}/resources//vendor/php-email-form/validate.js"></script>
<script
   src="${root}/resources//vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="${root}/resources//vendor/counterup/counterup.min.js"></script>
<script
   src="${root}/resources//vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${root}/resources//vendor/venobox/venobox.min.js"></script>
<script src="${root}/resources//vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="${root}/resources//vendor/aos/aos.js"></script>

<!— Template Main JS File —>
<script src="${root}/resources/js/main.js"></script>
<script>
    $(function() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
              lat = pos.coords.latitude;     // 위도
              lng = pos.coords.longitude; // 경도
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    });
</script>

</body>

</html>