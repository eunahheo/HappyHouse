<template>
  <!-- ======= Team Section ======= -->
  <section id="team" class="team">
    <div class="container">
      <div class="section-title" data-aos="fade-in" data-aos-delay="100">
        <h2>사이트 소개</h2>
        <p>
          Web Front-End 기술인 <b>HTML / JSP / CSS / JavaScript</b> 등을 활용한
          스프링부트 웹 사이트로<br />
          <b>jQuery 와 Bootstrap 등 Library</b> 를 활용해, 더욱 향상된 디자인 및
          기능을 구현하였습니다.<br />
          또한, <b>Ajax</b>를 활용해 동적인 데이터 처리를 했습니다.
        </p>
        <p>
          <b>이미지, Kakao Map, Form</b> 등을 활용해, 시각적인 효과를 내 사용자
          입장에서 편리하고 직관적으로 사용할 수 있도록 설계했습니다.
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
