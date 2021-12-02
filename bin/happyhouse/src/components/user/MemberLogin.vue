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
        <!-- <b-alert show variant="danger" v-if="isLoginError"
          >아이디 또는 비밀번호를 확인하세요.</b-alert
        > -->
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
          <a v-b-modal.modal-center>비밀번호 찾기</a>
        </div>

        <!-- <div class="text-danger mb-2">${msg}</div> -->
        <b-button class="btn btn-lg btn-block" type="button" @click="confirm">
          로그인
        </b-button>
        <b-button
          variant="primary"
          class="btn btn-lg btn-block"
          type="button"
          @click="movePage"
        >
          회원가입
        </b-button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
      </form>
    </div>
    <div>
      <!--모달-->
      <b-modal id="modal-center" centered title="비밀번호 찾기">
        <form
          class="form-signin mx-auto m-5"
          name="memberform"
          id="memberform"
          action="post"
        >
          <input type="hidden" name="act" id="act" value="register" />

          <div class="form-group has-feedback row">
            <label
              for="useridC"
              class="col-md-3 control-label text-md-right col-form-label"
              >아이디
              <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
              <input
                type="text"
                class="form-control"
                id="useridC"
                v-model="useridC"
                name="useridC"
                placeholder=""
                required
                value="qweadzs"
              />
              <i class="fa fa-pencil form-control-feedback pr-4"></i>
            </div>
          </div>

          <div class="form-group has-feedback row">
            <label
              for="usernameC"
              class="col-md-3 control-label text-md-right col-form-label"
              >이름
              <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
              <input
                type="text"
                class="form-control"
                id="usernameC"
                v-model="usernameC"
                name="usernameC"
                placeholder="User Name"
              />
              <i class="fa fa-user form-control-feedback pr-4"></i>
            </div>
          </div>
          <div class="form-group has-feedback row">
            <label
              for="emailC"
              class="col-md-3 control-label text-md-right col-form-label"
              >이메일
              <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
              <input
                type="text"
                class="form-control"
                v-model="emailC"
                id="emailC"
                name="emailC"
                placeholder="address"
                value="qweadzs@naver.com"
              />
            </div>
          </div>

          <b-button
            @click="confirmC"
            id="tempoBtn"
            variant="primary"
            style="margin-left: 240px"
          >
            임시 비밀번호 발급
          </b-button>

          <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
        </form>
      </b-modal>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import http from "@/util/http-common";
const memberStore = "memberStore";
const companyStore = "companyStore";

export default {
  name: "MemberLogin",
  data() {
    return {
      user: {
        userid: null,
        userpwd: null,
      },
      useridC: "",
      usernameC: "",
      emailC: "",
    };
  },
  computed: {
    ...mapState(memberStore, ["isLogin", "isLoginError"]),
    ...mapState(companyStore, ["company"]),
  },
  methods: {
    ...mapMutations(companyStore, ["SET_COMPANY_INFO"]),
    ...mapActions(memberStore, ["userConfirm", "getUserInfo"]),
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      if (this.isLogin) {
        await this.getUserInfo(token);
        console.log(this.user.userid);

        http.get(`/company/${this.user.userid}`).then(({ data }) => {
          if (data != null) {
            console.log(data);
            this.SET_COMPANY_INFO(data);
            console.log(this.company);
          }
          this.$router.push({ name: "Home" });
        });
      } else {
        alert("아이디와 비밀번호를 확인하세요");
      }
    },
    confirmC() {
      // console.log(this.useridC);
      http.get(`/user/${this.useridC}`).then(({ data }) => {
        if (data == null) {
          alert("해당하는 유저가 없습니다.");
        } else {
          if (
            data.userid == this.useridC &&
            data.username == this.usernameC &&
            data.email == this.emailC
          ) {
            http.get(`/user/temporary/${this.useridC}`).then(({ data }) => {
              console.log(data);
              alert("임시 비밀번호가 메일로 발송되었습니다.");
              this.$router.push({ name: "SignIn" });
            });
          }
        }
      });
    },

    movePage() {
      this.$router.push({ name: "SignUp" });
    },

    onSubmit(event) {
      event.preventDefault();
    },
  },
};
</script>

<style></style>
