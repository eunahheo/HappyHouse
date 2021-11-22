<template>
  <b-col
    class="col"
    cols="4"
    @click="selectHouse"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <!-- <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0"> -->
    <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
      <b-img
        thumbnail
        src="https://picsum.photos/250/250/?image=5"
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
    </div>
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
  </b-col>
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
    key: Number,
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
</style>
