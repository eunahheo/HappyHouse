<template>
  <b-container class="bv-example-row mt-3 text-center">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <br /><br />
      <h2>주택거래정보</h2>
      <p>아파트매매 실거래가 정보를 제공합니다.</p>
    </div>
    <b-row>
      <b-col>
        <house-search-bar></house-search-bar>
      </b-col>
    </b-row>

    <b-row style="width: 100%; height: 600px">
      <house-detail />
    </b-row>

    <b-row style="width: 100%; height: 800px"> <house-list /></b-row>
  </b-container>
</template>
<script>
import HouseSearchBar from "@/components/house/HouseSearchBar.vue";
import HouseList from "@/components/house/HouseList.vue";
import HouseDetail from "@/components/house/HouseDetail.vue";

export default {
  name: "House",
  components: {
    HouseSearchBar,
    HouseList,
    HouseDetail,
  },
};
</script>
<style scoped>
.underline-orange {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(231, 149, 27, 0.3) 30%
  );
}
</style>
