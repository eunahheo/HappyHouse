<template>
  <main>
    <!-- <hooper :autoPlay="true" :playSpeed="2800" style="height: 1000px"> -->
    <!-- <slide> -->
    <section id="hero">
      <div class="hero-container" data-aos="fade-up">
        <h1>Welcome to HAPPYHOUSE</h1>
        <h2>
          주택의 아파트/다세대,주택 별 거래 정보와 아파트 정보를 조회할 수
          있습니다.
        </h2>
        <a class="btn-get-started scrollto"
          ><router-link :to="{ name: 'House' }" class="link"
            ><b-icon
              icon="search"
              font-scale="1"
              style="color: white"
            ></b-icon> </router-link
        ></a>
      </div>
    </section>
    <!-- </slide> -->

    <!-- <slide> -->
    <section id="pricing" class="pricing">
      <div class="container" data-aos="fade-up">
        <header class="section-header">
          <h1>HappyHouse의 다양한 서비스를 경험해보세요!</h1>
          <h4>직장인들을 위한 기능도 있습니다.</h4>
          <br />
        </header>

        <div class="row gy-4" data-aos="fade-left">
          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="200"
          >
            <div class="box">
              <span class="featured">private</span>
              <h3 style="color: #65c600"><sup>✔️</sup>아파트 별 상권</h3>
              <div class="price">
                상권정보<br />
                <b-icon icon="shop" scale="1.4"></b-icon>
              </div>

              <ul>
                <br />
                <li><b>아파트 별 상권정보를 제공합니다.</b></li>
                <li>
                  매물이 위치한 곳의<br />
                  상권 정보를 확인하세요.
                </li>
              </ul>
              <router-link :to="{ name: 'mapCategory' }" class="btn-buy"
                >상권정보</router-link
              >
              <!-- <a href="#" class="btn-buy">SingUp Now</a> -->
            </div>
          </div>

          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="300"
          >
            <div class="box">
              <h3 style="color: #ff901c"><sup>✔️</sup>실거래가</h3>
              <div class="price">
                주택거래 정보<br />
                <b-icon icon="house-fill" scale="1.4"></b-icon>
              </div>

              <ul>
                <br />
                <li><b>동 별 주택거래정보를 제공합니다.</b></li>
                <li>
                  주택거래정보를 확인하고 <br />카카오맵에서 위치를 확인하세요.
                </li>
              </ul>
              <router-link :to="{ name: 'House' }" class="btn-buy"
                >주택거래정보</router-link
              >
            </div>
          </div>

          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="400"
          >
            <div class="box">
              <span class="featured">private</span>
              <h3 style="color: #ff0071"><sup>✔️</sup>회사</h3>
              <div class="price">
                직장<br />
                <b-icon icon="building" scale="1.4"></b-icon>
              </div>

              <ul>
                <br />
                <li><b>직장을 고려한 매물과 관련된 기능을 제공합니다.</b></li>
                <li>
                  매물을 확인하실 때,<br />
                  직장 위치 또한 고려해보세요.
                </li>
              </ul>
              <router-link :to="{ name: 'mapCategory' }" class="btn-buy"
                >상권/거래정보</router-link
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- </slide> -->
    <!-- </hooper> -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">
        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
          <h2>단위 변환기</h2>
          <p>면적과 평수를 변환해보세요.</p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-6 align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up">
              <h4 class="title"><b-icon icon="house"></b-icon> 평수 - 면적</h4>
              <p class="description">1평은 3.305785㎡ 입니다.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-6 align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <h4 class="title"><b-icon icon="house"></b-icon> 면적 - 평수</h4>
              <p class="description">1㎡는 0.3025평입니다.</p>
            </div>
          </div>
        </div>
        <br />
        <div class="row">
          <div
            class="col-md-12 col-lg-12 align-items-stretch mb-5 mb-lg-0"
            style="margin: 0 auto"
          >
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bx bx-world"></i></div>

              <div class="form-group has-feedback row">
                <label
                  for="area"
                  class="col-md-3 control-label text-md-right col-form-label"
                  >면적
                </label>
                <div class="col-md-3">
                  <input
                    type="number"
                    class="form-control"
                    id="area"
                    v-model="area"
                    name="area"
                    placeholder="제곱미터"
                    required
                  />
                </div>
                <div class="col-md-5">{{ result1 + " 평" }}</div>
              </div>

              <div class="form-group has-feedback row">
                <label
                  for="py"
                  class="col-md-3 control-label text-md-right col-form-label"
                  >평
                </label>
                <div class="col-md-3">
                  <input
                    type="number"
                    class="form-control"
                    id="py"
                    v-model="py"
                    name="py"
                    placeholder="평"
                    required
                    style="float: right"
                  />
                </div>
                <div class="col-md-5">
                  {{ result2 + " ㎡" }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- <div style="text-align: center"> -->
    </section>
    <!-- End Services Section -->

    <!-- team  -->
    <section id="team" class="team">
      <div class="container">
        <div class="section-title">
          <h2>개발자 소개</h2>
          <h5>HappyHouse의 개발자를 소개합니다.<br /></h5>
          <p></p>
        </div>

        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="member" data-aos="fade-up">
              <div class="pic">
                <!-- <img
                  src="@/assets/img/ojy.jpeg"
                  style="scale: 0.7"
                  class="img-fluid"
                  alt=""
                /> -->
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

          <div class="col-lg-6 col-md-6">
            <div class="member" data-aos="fade-up" data-aos-delay="150">
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
        </div>
      </div>
    </section>
  </main>
</template>

<script>
// import { Hooper, Slide } from "hooper";
import "hooper/dist/hooper.css";

export default {
  name: "Main",
  // components: { Hooper, Slide },
  data() {
    return {
      area: "제곱미터",
      py: "평",
      result1: 0,
      result2: 0,
    };
  },
  watch: {
    area: function () {
      this.result1 = this.area * 0.3025;
    },
    py: function () {
      this.result2 = this.py * 3.305785;
    },
  },
  props: {
    msg: String,
  },
};
</script>

<style>
.underline-steelblue {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(3, 50, 67, 0.3) 30%
  );
}
/*--------------------------------------------------------------
# Pricing
--------------------------------------------------------------*/
.pricing .box {
  padding: 40px 20px;
  background: #fff;
  text-align: center;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  border-radius: 4px;
  position: relative;
  overflow: hidden;
  transition: 0.3s;
}
.pricing .box:hover {
  transform: scale(1.1);
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.4);
}
.pricing h3 {
  font-weight: 700;
  font-size: 18px;
  margin-bottom: 15px;
}
.pricing .price {
  font-size: 36px;
  color: #444444;
  font-weight: 600;
  font-family: "Poppins", sans-serif;
}
.pricing .price sup {
  font-size: 20px;
  top: -15px;
  left: -3px;
}
.pricing .price span {
  color: #bababa;
  font-size: 16px;
  font-weight: 300;
}
.pricing img {
  padding: 30px 40px;
}
.pricing ul {
  padding: 0;
  list-style: none;
  color: #444444;
  text-align: center;
  line-height: 26px;
  font-size: 16px;
  margin-bottom: 25px;
}
.pricing ul li {
  padding-bottom: 10px;
}
.pricing ul .na {
  color: #ccc;
  text-decoration: line-through;
}
.pricing .btn-buy {
  display: inline-block;
  padding: 8px 40px 10px 40px;
  border-radius: 50px;
  color: #4154f1;
  transition: none;
  font-size: 16px;
  font-weight: 400;
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  transition: 0.3s;
  border: 1px solid #4154f1;
}
.pricing .btn-buy:hover {
  background: #4154f1;
  color: #fff;
}
.pricing .featured {
  width: 200px;
  position: absolute;
  top: 18px;
  right: -68px;
  transform: rotate(45deg);
  z-index: 1;
  font-size: 14px;
  padding: 1px 0 3px 0;
  background: #4154f1;
  color: #fff;
}
</style>
