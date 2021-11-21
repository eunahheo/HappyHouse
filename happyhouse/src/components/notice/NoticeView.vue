<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>글보기</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listNotice">목록</b-button>
      </b-col>
      <b-col
        v-if="userInfo.userid == 'ssafy' || userInfo.userid == 'admin'"
        class="text-right"
      >
        <b-button
          variant="outline-info"
          size="sm"
          @click="moveModifyNotice"
          class="mr-2"
          >글수정</b-button
        >
        <b-button variant="outline-danger" size="sm" @click="deleteNotice"
          >글삭제</b-button
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-card
          :header-html="`<h3>${notice.noticeno}.
          ${notice.subject} [${notice.hit}]</h3><div><h6>${notice.userid}</div><div>${notice.regtime}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
// import moment from "moment";
import http from "@/util/http-common";
import { mapState } from "vuex";
const memberStore = "memberStore";

export default {
  data() {
    return {
      notice: {},
    };
  },
  computed: {
    message() {
      if (this.notice.content)
        return this.notice.content.split("\n").join("<br>");
      return "";
    },
    // changeDateFormat() {
    //   return moment(new Date(this.notice.regtime)).format(
    //     "YYYY.MM.DD hh:mm:ss"
    //   );
    ...mapState(memberStore, ["userInfo"]),
  },
  created() {
    http.get(`/notice/${this.$route.params.noticeno}`).then(({ data }) => {
      this.notice = data;
    });
  },
  methods: {
    listNotice() {
      this.$router.push({ name: "NoticeList" });
    },
    moveModifyNotice() {
      this.$router.replace({
        name: "NoticeUpdate",
        params: { noticeno: this.notice.noticeno },
      });
      //   this.$router.push({ path: `/notice/modify/${this.notice.noticeno}` });
    },
    deleteNotice() {
      if (confirm("정말로 삭제?")) {
        this.$router.replace({
          name: "NoticeDelete",
          params: { noticeno: this.notice.noticeno },
        });
      }
    },
  },
};
</script>

<style></style>
