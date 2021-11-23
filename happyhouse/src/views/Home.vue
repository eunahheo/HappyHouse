<template>
  <main style="height: 1350px">
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
              <span class="featured">private</span>
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
              <router-link :to="{ name: 'House' }" class="btn-buy"
                >상권/거래정보</router-link
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- </slide> -->
    <!-- </hooper> -->
  </main>
</template>

<script>
// import { Hooper, Slide } from "hooper";
import "hooper/dist/hooper.css";

export default {
  name: "Main",
  // components: { Hooper, Slide },

  props: {
    msg: String,
  },
};
</script>

<style scoped>
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
