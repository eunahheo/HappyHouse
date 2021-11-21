<template>
  <!-- ======= Team Section ======= -->
  <div>
    <section id="team" class="team">
      <div class="container">
        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
          <h2>사이트 소개</h2>
          <p>
            Web Front-End 기술인 <b>HTML / JSP / CSS / JavaScript</b> 등을
            활용한 스프링부트 웹 사이트로<br />
            <b>jQuery 와 Bootstrap 등 Library</b> 를 활용해, 더욱 향상된 디자인
            및 기능을 구현하였습니다.<br />
            또한, <b>Ajax</b>를 활용해 동적인 데이터 처리를 했습니다.
          </p>
          <p>
            <b>이미지, Kakao Map, Form</b> 등을 활용해, 시각적인 효과를 내
            사용자 입장에서 편리하고 직관적으로 사용할 수 있도록 설계했습니다.
          </p>
        </div>

        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="member" data-aos="fade-up">
              <div class="pic">
                <img src="@/assets/img/woman.jpg" class="img-fluid" alt="" />
              </div>
              <div class="member-info">
                <h4>허은아</h4>
                <span>Developer</span>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 col-md-6">
            <div class="member" data-aos="fade-up" data-aos-delay="150">
              <div class="pic">
                <img src="@/assets/img/woman.jpg" class="img-fluid" alt="" />
              </div>
              <div class="member-info">
                <h4>오지영</h4>
                <span>Developer</span>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row no-gutters">
          <div
            class="content col-xl-5 d-flex align-items-stretch"
            data-aos="fade-up"
          >
            <div class="content">
              <h3>Happy House에서는 <br />4가지 기능을 제공합니다.</h3>
              <p>Happy House에서 주택 거래정보를 확인해보세요.</p>
              <a href="#" class="about-btn"
                >About us <i class="bx bx-chevron-right"></i
              ></a>
            </div>
          </div>
          <div class="col-xl-7 d-flex align-items-stretch">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div
                  class="col-md-6 icon-box"
                  data-aos="fade-up"
                  data-aos-delay="100"
                >
                  <i class="bx bx-receipt"></i>
                  <h4>주택/아파트 실거래가 정보</h4>
                  <p>
                    공공데이터 API를 사용하여 주택/아파트 실거래가 정보를
                    제공합니다.
                  </p>
                </div>
                <div
                  class="col-md-6 icon-box"
                  data-aos="fade-up"
                  data-aos-delay="200"
                >
                  <i class="bx bx-cube-alt"></i>
                  <h4>카카오 지도</h4>
                  <p>
                    해당 주택/아파트의 위치를 카카오 지도에서 한눈에 보기 쉽게
                    제공합니다.
                  </p>
                </div>
                <div
                  class="col-md-6 icon-box"
                  data-aos="fade-up"
                  data-aos-delay="300"
                >
                  <i class="bx bx-images"></i>
                  <h4>게시판</h4>
                  <p>
                    회원들과 다양한 정보를 공유할 수 있도록 게시판을 제공합니다.
                  </p>
                </div>
                <div
                  class="col-md-6 icon-box"
                  data-aos="fade-up"
                  data-aos-delay="400"
                >
                  <i class="bx bx-shield"></i>
                  <h4>상권정보</h4>
                  <p>
                    상권정보 탭을 이용해 주변 마트, 카페, 중개소, 지하철역 등의
                    정보를 제공합니다.
                  </p>
                </div>
              </div>
            </div>
            <!-- End .content-->
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- End About Section -->
  <!-- End Team Section -->
</template>

<script>
export default {
  name: "Instargram",
};
</script>

<style scoped>
.underline-green {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(56, 233, 40, 0.3) 30%
  );
}
</style>
