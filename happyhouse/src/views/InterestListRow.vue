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
import { mapState } from "vuex";
const houseStore = "houseStore";

export default {
  name: "InterestListRow",
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
    ...mapState(houseStore, ["it"]),
    // changeDateFormat() {
    //   return moment(new Date(this.regtime)).format("YY.MM.DD hh:mm:ss");
    // },
  },
  methods: {
    interestClick() {
      this.it = this.interest;
      console.log(this.interest);
      console.log(this.it);
      console.log("dongCode : ", this.dongcode);
    },
  },
};
</script>

<style></style>
