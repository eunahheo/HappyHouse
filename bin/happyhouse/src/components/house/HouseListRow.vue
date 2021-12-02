<template>
  <!-- <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0"> -->
  <div class="pricing">
    <div class="box" style="width: 90%">
      <h3 style="color: #ff901c"><sup>✔️</sup>{{ house.recentPrice }}만원</h3>
      <div class="price">
        {{ house.aptName }}<br />
        <b-icon icon="shop" scale="1.4"></b-icon>
      </div>

      <ul>
        <br />
        <li><b>거래정보를 확인하세요.</b></li>
        <li>
          더 상세한 거래정보가<br />
          궁금하시다면<br />
          아래 상세보기 버튼을 눌러보세요.
        </li>
      </ul>
      <a class="btn-buy" @click="selectHouse">상세보기</a>
    </div>
  </div>
  <!-- <div
    cols="3"
    @click="selectHouse"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
    class="icon-box"
    data-aos="fade-up"
    data-aos-delay="100"
  >
    <b-img
      thumbnail
      src="https://picsum.photos/250/250/?image=37"
      alt="Image 1"
    ></b-img>
    <div class="icon"><i class="bx bx-file"></i></div>
    <h4 class="title">
      {{ house.aptName }}
    </h4>
    <p class="description">
      {{ house.dongName }}
      <br />
      {{ house.recentPrice }}만원
    </p>
  </div> -->
  <!-- </div> -->

  <!-- <b-col cols="2" class="text-center align-self-center">
      <b-img
        thumbnail
        src="https://picsum.photos/250/250/?image=58"
        alt="Image 1"
      ></b-img>
    </b-col>
    <b-col cols="10" class="align-self-center">
      [{{ house.aptCode }}] {{ house.aptName }}
        <button class="btn btn-primary" v-b-modal.modal-1>상세보기</button> -->
  <!-- </b-col>  -->
</template>

<script>
import { mapActions } from "vuex";

const houseStore = "houseStore";

export default {
  name: "HouseListRow",
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    house: Object,
  },
  methods: {
    ...mapActions(houseStore, ["detailHouse"]),
    selectHouse() {
      // console.log("listRow : ", this.house);
      // this.$store.dispatch("getHouse", this.house);
      this.detailHouse(this.house);
    },
    colorChange(flag) {
      this.isColor = flag;
    },
  },
};
</script>

<style scoped>
.apt {
  width: 50px;
}
.mouse-over-bgcolor {
  background-color: lightblue;
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
  font-size: 21px;
  margin-bottom: 15px;
}
.pricing .price {
  font-size: 32px;
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
