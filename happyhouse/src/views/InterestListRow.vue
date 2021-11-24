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
      <a
        class="btn-buy"
        href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212"
        >길찾기</a
      >
    </td>
  </tr>
</template>

<script>
// import moment from "moment";
import { mapMutations } from "vuex";
const houseStore = "houseStore";
export default {
  name: "InterestListRow",
  data() {
    return {
      list: {},
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
    // ...mapState(houseStore, ["list"]),
    // changeDateFormat() {
    //   return moment(new Date(this.regtime)).format("YY.MM.DD hh:mm:ss");
    // },
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
