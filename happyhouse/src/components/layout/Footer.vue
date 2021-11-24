<template>
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="footer-info" data-aos="fade-up" data-aos-delay="50">
              <h3>Find Us</h3>
              <p>
                (SSAFY) 서울시 강남구 테헤란로 멀티스퀘어 <br />
                <br />
                <strong>Phone:</strong> 1544-9001<br />
                <strong>Email:</strong> admin@ssafy.com<br />
              </p>
              <div class="social-links mt-3">
                <a
                  href="https://www.ssafy.com/ksp/jsp/swp/swpMain.jsp"
                  target="_blank"
                  class="linkedin"
                  ><b-icon icon="link" font-scale="1.2"></b-icon
                ></a>
                <a
                  href="https://www.facebook.com/hellossafy/"
                  target="_blank"
                  class="facebook"
                  ><b-icon icon="facebook" font-scale="1.2"></b-icon
                ></a>
                <a
                  href="https://www.instagram.com/hellossafy/?hl=ko"
                  target="_blank"
                  class="instagram"
                  ><b-icon icon="instagram" font-scale="1.2"></b-icon
                ></a>
              </div>
            </div>
          </div>

          <div
            class="col-lg-6 col-md-6 footer-links"
            data-aos="fade-up"
            data-aos-delay="150"
          >
            <h4>사이트 맵</h4>
            <ul>
              <li>
                <i class="bx bx-chevron-right"></i>
                <router-link :to="{ name: 'Home' }">Home</router-link>
                <!-- <a href="http://localhost:80/#hero">Home</a> -->
              </li>
              <li>
                <i class="bx bx-chevron-right"></i>
                <router-link :to="{ name: 'House' }">주택거래정보</router-link>
                <!-- <a href="http://localhost:80/#team">사이트 소개</a> -->
              </li>
              <li>
                <i class="bx bx-chevron-right"></i>
                <router-link :to="{ name: 'Board' }">게시판</router-link>
                <!-- <a href="http://localhost:80/map">주택거래정보</a> -->
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Squadfree</span></strong
        >. All Rights Reserved
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
</template>

<script>
export default {};
</script>

<style></style>
