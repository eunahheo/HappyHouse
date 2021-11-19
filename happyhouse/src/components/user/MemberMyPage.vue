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
        <button
          class="btn btn-lg btn-danger btn-block float-left"
          id="delbtn"
          @click="deleteUser"
        >
          탈퇴
        </button>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapState, mapMutations } from "vuex";
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
    ...mapGetters(memberStore, ["checkUserInfo"]),
    ...mapState(memberStore, ["isLogin", "userInfo"]),
  },
  created() {
    http.get(`/user/${this.checkUserInfo.userid}`).then(({ data }) => {
      this.user = data;
    });
  },
  methods: {
    ...mapMutations(memberStore, ["SET_IS_LOGIN", "SET_USER_INFO"]),
    movePage() {
      this.$router.push({ name: "MemberUpdate" });
    },
    deleteUser() {
      http.delete(`/user/${this.checkUserInfo.userid}`).then(({ data }) => {
        let msg = "삭제 처리시 문제가 발생했습니다.";
        if (data === "success") {
          msg = "삭제가 완료되었습니다.";
        }
        alert(msg);
        this.userInfo = "";
        this.SET_IS_LOGIN(false);
        this.SET_USER_INFO(null);
        sessionStorage.removeItem("access-token");
        // 현재 route를 /list로 변경.
        this.$router.push({ name: "Home" });
      });
    },
  },
};
</script>

<style></style>
