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

          <input type="text" id="sample5_address" placeholder="주소" />
          <input
            type="button"
            @click="sample5_execDaumPostcode"
            value="주소 검색"
          /><br />
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

      geocoder: null,
    };
  },
  mounted() {
    const script = document.createElement("script");
    script.src =
      "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";
    document.head.appendChild(script);

    //주소-좌표 변환 객체를 생성
    this.geocoder = new window.daum.maps.services.Geocoder();
  },

  methods: {
    sample5_execDaumPostcode() {
      new window.daum.Postcode({
        oncomplete: (data) => {
          var addr = data.address; // 최종 주소 변수

          // 주소 정보를 해당 필드에 넣는다.
          document.getElementById("sample5_address").value = addr;
          // 주소로 상세 정보를 검색
          this.geocoder.addressSearch(data.address, (results, status) => {
            // 정상적으로 검색이 완료됐으면
            if (status === window.daum.maps.services.Status.OK) {
              var result = results[0]; //첫번째 결과의 값을 활용

              // 해당 주소에 대한 좌표를 받아서
              var coords = new window.daum.maps.LatLng(result.y, result.x);
              console.log(coords);
            }
          });
        },
      }).open();
    },
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
