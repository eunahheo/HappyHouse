<template>
  <b-container class="bv-example-row mt-3">
    <b-row class="mb-1">
      <b-col class="text-left">
        <a variant="outline-primary" class="btn-buy" @click="listNotice"
          >목록</a
        >
      </b-col>

      <b-col
        v-if="userInfo.userid == 'ssafy' || userInfo.userid == 'admin'"
        class="text-right"
      >
        <a
          variant="outline-info"
          size="sm"
          @click="moveModifyNotice"
          class="btn-buy"
          >글수정</a
        >
        <a
          variant="outline-danger"
          class="btn-buy"
          size="sm"
          @click="deleteNotice"
          >글삭제</a
        >
      </b-col>
    </b-row>

    <b-row class="mb-1">
      <b-col>
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th
                style="font-size: 27px"
                :header-html="`<h3>${notice.noticeno}.
          ${notice.subject} [${notice.hit}]</h3><div><h6>${notice.userid}</div><div>${notice.regtime}</h6></div>`"
                >{{ notice.noticeno }}. {{ notice.subject }} [{{ notice.hit }}]
                <br />
              </b-th> </b-tr
            ><b-tr style="text-align: right"
              >작성자 : {{ notice.userid }} | 작성시간 :
              {{ notice.regtime }}</b-tr
            >
            <hr />
            <b-tr v-html="message" style="font-size: 20px; text-align: left">
            </b-tr>
          </b-thead>
        </b-table-simple>
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

<style>
.pricing .btn-buy:hover {
  background: #2f4d5a;
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
  background: #2f4d5a;
  color: #fff;
}
</style>
