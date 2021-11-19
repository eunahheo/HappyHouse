<template>
  <section class="inner-page">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <h2>회원정보 수정</h2>
      <p>회원정보를 수정하세요.</p>
    </div>
    <div class="container">
      <div class="form-signin align-center">
        <div name="memberupdateform" id="memberupdateform">
          <table class="table" v-if="userInfo">
            <tr>
              <td><h5>아이디</h5></td>
              <td><label for="userid" class="sr-only">아이디</label></td>
              <td>
                <input
                  type="text"
                  id="userid"
                  class="form-control mt-3 mb-4"
                  required=""
                  name="userid"
                  v-model="userInfo.userid"
                  autofocus=""
                  readonly
                />
              </td>
            </tr>
            <tr>
              <td><h5>비밀번호</h5></td>
              <td><label for="userpwd" class="sr-only">비밀번호</label></td>
              <td>
                <input
                  type="text"
                  id="userpwd"
                  name="userpwd"
                  class="form-control mt-3 mb-4"
                  v-model="userInfo.userpwd"
                  placeholder=""
                  required=""
                />
              </td>
            </tr>
            <tr>
              <td><h5>이름</h5></td>
              <td><label for="username" class="sr-only">이름</label></td>
              <td>
                <input
                  type="text"
                  id="username"
                  name="username"
                  v-model="userInfo.username"
                  value="userInfo.username"
                  class="form-control mt-3 mb-4"
                  required=""
                  autofocus=""
                />
              </td>
            </tr>
            <tr>
              <td><h5>이메일</h5></td>
              <td><label for="email" class="sr-only">주소</label></td>
              <td>
                <input
                  type="email"
                  id="email"
                  name="email"
                  v-model="userInfo.email"
                  class="form-control mt-3 mb-4"
                  required=""
                />
              </td>
            </tr>
          </table>
          <div class="clearfix">
            <button
              class="btn btn-lg btn-primary btn-block float-right"
              id="modifyBtn"
              @click="userModify"
            >
              수정하기
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import http from "@/util/http-common";
import { mapGetters, mapState } from "vuex";

const memberStore = "memberStore";
export default {
  name: "MemberUpdate",
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapGetters(memberStore, ["checkUserInfo"]),
  },
  data() {
    return {
      userid: "",
      username: "",
      userpwd: "",
      email: "",
    };
  },
  methods: {
    userModify() {
      http
        .put(`/user/`, {
          userid: this.userid,
          username: this.username,
          userpwd: this.userpwd,
          email: this.email,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          this.moveList();
          alert(msg);
        });
    },
    moveList() {
      this.$router.push({ name: "MyPage" });
    },
  },
};
</script>

<style></style>
