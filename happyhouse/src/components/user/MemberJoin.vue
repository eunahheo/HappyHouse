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
        <div class="form-group has-feedback row">
          <label
            for="company"
            class="col-md-3 control-label text-md-right col-form-label"
            >직장
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-7">
            <input
              type="text"
              class="form-control"
              v-model="buildingname"
              id="company"
              name="company"
              placeholder="회사"
              @click="sample5_execDaumPostcode"
            />

            <i class="fa fa-envelope form-control-feedback pr-4"></i>
          </div>
          <div>
            <input
              type="button"
              class="btn btn-primary"
              style="width: 110%; height: 38px"
              @click="sample5_execDaumPostcode"
              value="검색"
            />
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

import { mapState } from "vuex";
const companyStore = "companyStore";

export default {
  name: "MemberJoin",
  data() {
    return {
      userid: "",
      username: "",
      userpwd: "",
      email: "",

      buildingname: "",
      sido: "",
      sigungu: "",
      bname: "",
      bcode: 0,
      lat: "",
      lng: "",

      geocoder: null,
    };
  },
  computed: { ...mapState(companyStore, ["company"]) },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      const script = document.createElement("script");
      script.src =
        "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";
      document.head.appendChild(script);
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=64eac5c80b2c73c911146817941a78c0&libraries=services";
      document.head.appendChild(script);
    }

    this.initMap();
  },

  methods: {
    // ...mapActions(companyStore, ["getCompanyInfo"]),
    initMap() {
      this.geocoder = new kakao.maps.services.Geocoder();
    },
    sample5_execDaumPostcode() {
      // this.geocoder = new window.daum.maps.services.Geocoder();
      //주소-좌표 변환 객체를 생성
      // console.log(this.geocoder);

      new window.daum.Postcode({
        oncomplete: (data) => {
          this.buildingname = data.buildingName;
          console.log(this.buildingname);
          this.sido = data.sido;
          this.sigungu = data.sigungu;
          this.bname = data.bname;
          this.bcode = data.bcode;
          this.geocoder.addressSearch(data.address, (results, status) => {
            // 정상적으로 검색이 완료됐으면
            if (status === window.daum.maps.services.Status.OK) {
              var result = results[0]; //첫번째 결과의 값을 활용

              this.lat = result.y;
              this.lng = result.x;
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
          // let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            //   msg = "등록이 완료되었습니다.";
            console.log("회원 등록 완료");
            http
              .post(`/company`, {
                buildingName: this.buildingname,
                sido: this.sido,
                sigunGu: this.sigungu,
                bName: this.bname,
                bCode: this.bcode,
                lat: this.lat,
                lng: this.lng,

                userid: this.userid,
              })
              .then(({ data }) => {
                let msg = "등록 처리시 문제가 발생했습니다.";
                if (data === "success") {
                  msg = "등록이 완료되었습니다.";
                }
                alert(msg);
                this.moveList();
              });
          }
          // alert(msg);
          // this.moveList();
        });
    },
    moveList() {
      this.$router.push({ name: "Home" });
    },
  },
};
</script>

<style></style>
