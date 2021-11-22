<template>
  <b-tr @click="interestClick">
    <b-td>{{ interestno }}</b-td>
    <!-- <b-th class="text-left">
      <router-link
        :to="{ name: 'NoticeView', params: { noticeno: noticeno } }"
        >{{ subject }}</router-link
      >
    </b-th>   -->
    <b-td>{{ sidoname }}</b-td>
    <b-td>{{ gugunname }}</b-td>
    <b-td>{{ dongname }}</b-td>
    <b-td>{{ dongcode }}</b-td>
    <b-td>{{ lat }}</b-td>
    <b-td>{{ lng }}</b-td>
    <b-td>{{ userid }}</b-td>
  </b-tr>
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

<style></style>
