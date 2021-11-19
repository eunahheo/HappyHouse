<template>
  <div style="margin-top: 70px">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <h2>로그인</h2>
    </div>
    <div class="modal-body">
      <form
        id="loginform"
        class="form-signin w-50 mx-auto m-5"
        method="post"
        action=""
      >
        <b-alert show variant="danger" v-if="isLoginError"
          >아이디 또는 비밀번호를 확인하세요.</b-alert
        >
        <input type="hidden" name="act" id="act" value="login" />
        <label for="userid" class="sr-only">아이디</label>
        <input
          type="text"
          id="userid"
          name="id"
          class="form-control"
          v-model="user.userid"
          required
          placeholder="아이디 입력...."
          @keyup.enter="confirm"
          autofocus
        />
        <label for="userpwd" class="sr-only">비밀번호</label>
        <input
          type="password"
          id="userpwd"
          name="pass"
          class="form-control mt-2"
          v-model="user.userpwd"
          required
          placeholder="비밀번호 입력...."
          @keyup.enter="confirm"
        />

        <div class="form-group form-check text-right">
          <label class="form-check-label">
            <input
              class="form-check-input"
              type="checkbox"
              id="idsave"
              name="idsave"
              value="saveok"
            />
            아이디저장
          </label>
        </div>

        <!-- <div class="text-danger mb-2">${msg}</div> -->
        <button
          class="btn btn-lg btn-primary btn-block"
          type="button"
          variant="primary"
          @click="confirm"
        >
          로그인
        </button>
        <button
          class="btn btn-lg btn-danger btn-block"
          type="button"
          variant="success"
          @click="movePage"
        >
          회원가입
        </button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
      </form>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";

const memberStore = "memberStore";

export default {
  name: "MemberLogin",
  data() {
    return {
      user: {
        userid: null,
        userpwd: null,
      },
    };
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError"]),
  },
  methods: {
    ...mapActions(memberStore, ["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token);
        this.$router.push({ name: "Home" });
      }
    },
    movePage() {
      this.$router.push({ name: "SignUp" });
    },
  },
};
</script>

<style></style>
