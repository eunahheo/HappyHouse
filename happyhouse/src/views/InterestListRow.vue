<template>
  <tr @click="interestClick">
    <!-- <b-th class="text-left">
      <router-link
        :to="{ name: 'NoticeView', params: { noticeno: noticeno } }"
        >{{ subject }}</router-link
      >
    </b-th>   -->
    <td>{{ sidoname }}</td>
    <td>{{ gugunname }}</td>
    <td>{{ dongname }}</td>
    <td>{{ aptname }}</td>
    <td>
      <a class="btn-buy" :href="this.url">길찾기</a>
    </td>
  </tr>
</template>

<script>
// import moment from "moment";
import { mapState, mapMutations } from "vuex";
const houseStore = "houseStore";
const companyStore = "companyStore";
export default {
  name: "InterestListRow",
  data() {
    return {
      list: {},

      url: "https://map.kakao.com/link/to/",
    };
  },
  props: {
    interestno: Number,
    sidoname: String,
    gugunname: String,
    dongname: String,
    dongcode: String,
    lat: String,
    lng: String,
    userid: String,
    aptname: String,
    interest: Object,
  },
  computed: {
    ...mapState(companyStore, ["company"]),
    // changeDateFormat() {
    //   return moment(new Date(this.regtime)).format("YY.MM.DD hh:mm:ss");
    // },
  },
  mounted() {
    // this.url = this.url + this.aptname + "," + this.lat + "," + this.lng;
    // this.url="https://map.kakao.com/?map_type=TYPE+MAP&target=car&rt="+this.lat+","+this.lng+"&rt1=";
    this.url =
      "https://map.kakao.com/?sName=" +
      this.sidoname +
      " " +
      this.gugunname +
      " " +
      this.dongname +
      " " +
      this.aptname +
      // "," +
      // this.lat +
      // "," +
      // this.lng +
      "&eName=" +
      this.company.sido +
      " " +
      this.company.sigunGu +
      " " +
      this.company.bName +
      " " +
      this.company.buildingName;
    // "," +
    // this.company.lat +
    // "," +
    // this.company.lng;
  },
  methods: {
    ...mapMutations(houseStore, ["SET_LAT_INFO"]),
    interestClick() {
      this.list = {
        lat: this.lat,
        lng: this.lng,
      };
      this.SET_LAT_INFO(this.list);
    },
  },
};
</script>

<style>
@import "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css";
</style>
