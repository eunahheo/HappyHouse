<template>
  <main>
    <!-- <hooper :autoPlay="true" :playSpeed="2800">
    <slide>
     
    </slide> -->

    <section id="hero">
      <div class="hero-container" data-aos="fade-up">
        <h1>Welcome to HAPPYHOUSE</h1>
        <h2>
          주택의 아파트/다세대,주택 별 거래 정보와 아파트 정보를 조회할 수
          있습니다.
        </h2>

        <!-- <form action="" method="post">
              <input type="email" name="email" id="inputEmail"><input type="submit" value="검색" id="searchBtn">
            </form>
 -->
        <!-- <router-link :to="{ name: 'Four' }" class="link"
        ><b-icon icon="house" font-scale="1"></b-icon>
      </router-link> -->

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
    <section id="pricing" class="pricing">
      <div class="container" data-aos="fade-up">
        <header class="section-header">
          <h2>HappyHouse의 다양한 서비스를 경험해보세요!</h2>
          <p>회원/비회원이 이용 가능한 서비스가 다릅니다.</p>
        </header>

        <div class="row gy-4" data-aos="fade-left">
          <!-- <div
              class="col-lg-3 col-md-6"
              data-aos="zoom-in"
              data-aos-delay="100"
            >
              <div class="box">
                <h3 style="color: #07d5c0">Free Plan</h3>
                <div class="price"><sup>$</sup>0<span> / mo</span></div>
                <img
                  src="assets/img/pricing-free.png"
                  class="img-fluid"
                  alt=""
                />
                <ul>
                  <li>Aida dere</li>
                  <li>Nec feugiat nisl</li>
                  <li>Nulla at volutpat dola</li>
                  <li class="na">Pharetra massa</li>
                  <li class="na">Massa ultricies mi</li>
                </ul>
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div> -->

          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="200"
          >
            <div class="box">
              <h3 style="color: #65c600">Starter Plan</h3>
              <div class="price"><sup>$</sup>19<span> / mo</span></div>
              <img
                src="assets/img/pricing-starter.png"
                class="img-fluid"
                alt=""
              />
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul>
              <a href="#" class="btn-buy">SingUp Now</a>
            </div>
          </div>

          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="300"
          >
            <div class="box">
              <span class="featured">오직 회원만</span>
              <h3 style="color: #ff901c">주택거래 정보</h3>
              <div class="price"><sup>$</sup>29<span> / mo</span></div>
              <img
                src="assets/img/pricing-business.png"
                class="img-fluid"
                alt=""
              />
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <a href="#" class="btn-buy">SingUp Now</a>
            </div>
          </div>

          <div
            class="col-lg-4 col-md-6"
            data-aos="zoom-in"
            data-aos-delay="400"
          >
            <div class="box">
              <span class="featured">오직 회원만</span>
              <h3 style="color: #ff0071">직장인들을 위한 서비스</h3>
              <div class="price"><sup>$</sup>49<span> / mo</span></div>
              <img
                src="assets/img/pricing-ultimate.png"
                class="img-fluid"
                alt=""
              />
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <a href="#" class="btn-buy">SingUp Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- <slide>
     
    </slide>
    <navigation slot="hooper-addons"></navigation> -->
    <!-- </hooper>
   -->
  </main>
</template>

<script>
// import { Hooper, Slide, Navigation } from "hooper";
// import "hopper/dist/hooper.css";

export default {
  name: "Main",
  // components: { Hooper, Slide, Navigation },
  data() {
    return {
      slides: [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }, { id: 5 }],
    };
  },
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
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
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
