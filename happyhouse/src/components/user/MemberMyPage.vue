<template>
  <section class="inner-page">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <h2>마이페이지</h2>
      <p>회원정보를 조회하세요.</p>
    </div>
    <div class="container">
      <div class="form-signin align-center">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>아이디</th>
              <th id="infoid">{{ user.userid }}</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>이름</td>
              <td>{{ user.username }}</td>
            </tr>
            <tr>
              <td>이메일</td>
              <td>{{ user.email }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="clearfix mt-5">
        <a
          button
          class="btn btn-lg btn-primary btn-block float-right"
          @click="movePage"
          >수정하기</a
        >
        <button class="btn btn-lg btn-danger btn-block float-left" id="delbtn">
          탈퇴
        </button>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import http from "@/util/http-common";
const memberStore = "memberStore";

export default {
  name: "MemberMyPage",
  props: {
    userid: String,
    username: String,
    userpwd: String,
    email: String,
  },
  data() {
    return {
      user: {},
    };
  },
  components: {},
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapGetters(memberStore, ["checkUserInfo"]),
  },
  created() {
    http.get(`/user/${this.checkUserInfo.userid}`).then(({ data }) => {
      this.user = data;
    });
  },
  methods: {
    movePage() {
      this.$router.push({ name: "MemberUpdate" });
    },
  },
};
</script>

<style></style>
