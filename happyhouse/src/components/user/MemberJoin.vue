<template>
  <div style="margin-top: 70px">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <h2>회원가입</h2>
    </div>

    <div class="modal-body">
      <form
        class="form-signin w-50 mx-auto m-5"
        name="memberform"
        id="memberform"
        action="post"
        @submit="onSubmit"
        @reset="onReset"
      >
        <input type="hidden" name="act" id="act" value="register" />

        <div class="form-group has-feedback row">
          <label
            for="userid"
            class="col-md-3 control-label text-md-right col-form-label"
            >아이디
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="userid"
              v-model="userid"
              name="userid"
              placeholder=""
              required
              value="qweadzs"
            />
            <i class="fa fa-pencil form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="userpwd"
            class="col-md-3 control-label text-md-right col-form-label"
            >비밀번호
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="userpwd"
              v-model="userpwd"
              placeholder="영문 숫자 포함 6자리 이상"
              required
              name="userpwd"
              value="ehfkdl7"
            />
            <i class="fa fa-pencil form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="username"
            class="col-md-3 control-label text-md-right col-form-label"
            >이름
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="username"
              v-model="username"
              name="username"
              placeholder="User Name"
              value="오지영"
            />
            <i class="fa fa-user form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="email"
            class="col-md-3 control-label text-md-right col-form-label"
            >이메일
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              v-model="email"
              id="email"
              name="email"
              placeholder="address"
              value="qweadzs@naver.com"
            />
            <i class="fa fa-envelope form-control-feedback pr-4"></i>
          </div>
        </div>

        <button
          type="submit"
          id="registerBtn1"
          class="btn btn-lg btn-primary btn-block"
        >
          회원가입
        </button>
        <button
          type="reset"
          class="btn btn-lg btn-secondary btn-block"
          data-dismiss="modal"
        >
          취소
        </button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
      </form>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common";
export default {
  name: "MemberJoin",
  data() {
    return {
      userid: "",
      username: "",
      userpwd: "",
      email: "",
    };
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
      console.log(this.userid);
      this.submitForm();
    },
    onReset(event) {
      event.preventDefault();
      this.userid = "";
      this.username = "";
      this.userpwd = "";
      this.email = "";
    },
    submitForm() {
      http
        .post(`/user/signup`, {
          userid: this.userid,
          username: this.username,
          userpwd: this.userpwd,
          email: this.email,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    moveList() {
      this.$router.push({ name: "Home" });
    },
  },
  computed: {},
};
</script>

<style></style>
