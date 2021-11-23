<template>
  <b-container v-if="houses && houses.length != 0" class="bv-example-row mt-3">
    <b-card no-body>
      <!-- <b-card-body
        id="scrollspy-nested"
        style="position: relative; height: 800px; overflow-y: scroll"
      > -->
      <carousel :autoplay="true" :nav="false" :autoplayTimeout="1900">
        <house-list-row
          v-for="(house, index) in houses"
          :key="index"
          :house="house"
          v-b-modal.modal-center
        ></house-list-row>
      </carousel>
      <!-- </b-card-body> -->
    </b-card>

    <b-modal id="modal-center" centered title="아파트 거래정보 상세">
      <b-container v-if="house" class="bv-example-row">
        <b-row>
          <b-col
            ><h3>{{ house.아파트 }}</h3></b-col
          >
        </b-row>
        <b-row class="mb-2 mt-1">
          <b-col
            ><b-img :src="require('@/assets/apt.png')" fluid-grow></b-img
          ></b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-alert show variant="secondary"
              >일련번호 : {{ house.aptCode }}</b-alert
            >
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-alert show variant="primary"
              >아파트 이름 : {{ house.aptName }}
            </b-alert>
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-alert show variant="info"
              >주소 : {{ house.sidoName }} {{ house.gugunName }}
              {{ house.dongName }}
            </b-alert>
          </b-col>
        </b-row>
        <!-- <b-row>
      <b-col>
        <b-alert show variant="warning">층수 : {{ house.층 }}층</b-alert>
      </b-col>
    </b-row> -->
        <b-row>
          <b-col>
            <b-alert show variant="danger"
              >거래금액 : {{ house.recentPrice }}만원</b-alert
            >
            <!-- <b-alert show variant="danger"
          >거래금액 :
          {{
            (parseInt(house.dealAmount.replace(",", "")) * 10000) | price
          }}원</b-alert
        > -->
          </b-col>
        </b-row>
        <b-row
          ><b-col>
            <b-button @click="registInterest">관심지역 추가</b-button></b-col
          >
        </b-row>
      </b-container>
    </b-modal>
  </b-container>
  <b-container v-else class="bv-example-row mt-3">
    <b-row>
      <b-col><b-alert show>주택 목록이 없습니다.</b-alert></b-col>
    </b-row>
  </b-container>
</template>

<script>
import carousel from "vue-owl-carousel";

import HouseListRow from "@/components/house/HouseListRow.vue";
import { mapState } from "vuex";

import http from "@/util/http-common";
const houseStore = "houseStore";
const memberStore = "memberStore";

export default {
  name: "HouseList",
  components: {
    HouseListRow,
    carousel,
  },

  data() {
    return {};
  },
  computed: {
    ...mapState(houseStore, ["houses", "house"]),
    ...mapState(memberStore, ["userInfo"]),
    // houses() {
    //   return this.$store.state.houses;
    // },
  },
  methods: {
    registInterest() {
      console.log("집: ", this.house.sidoName);
      http
        .post(`/map/interest/`, {
          sidoname: this.house.sidoName,
          gugunname: this.house.gugunName,
          dongname: this.house.dongName,
          dongcode: this.house.dongCode,
          lat: this.house.lat,
          lng: this.house.lng,
          userid: this.userInfo.userid,
          aptname: this.house.aptName,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
        });
    },
  },
};
</script>

<style></style>
