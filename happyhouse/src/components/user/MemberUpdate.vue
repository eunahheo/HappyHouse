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
                  v-model="user.userid"
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
                  type="password"
                  id="userpwd"
                  name="userpwd"
                  class="form-control mt-3 mb-4"
                  v-model="user.userpwd"
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
                  v-model="user.username"
                  value="user.username"
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
                  v-model="user.email"
                  class="form-control mt-3 mb-4"
                  required=""
                />
              </td>
            </tr>
            <tr>
              <td><h5>직장</h5></td>
              <td><label for="company" class="sr-only">주소</label></td>
              <td>
                <input
                  type="company"
                  id="company"
                  name="company"
                  v-model="this.company.buildingName"
                  class="form-control mt-3 mb-4"
                  required=""
                  @click="sample5_execDaumPostcode"
                />
              </td>
              <td>
                <br />
                <b-icon
                  icon="search"
                  class="btn-s"
                  @click="sample5_execDaumPostcode"
                  font-scale="1.5"
                ></b-icon>
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
const companyStore = "companyStore";
const memberStore = "memberStore";
export default {
  name: "MemberUpdate",
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapGetters(memberStore, ["checkUserInfo"]),
    ...mapState(companyStore, ["company"]),
  },
  props: {
    userid: String,
    username: String,
    userpwd: String,
    email: String,
    com: null,
  },
  data() {
    return {
      user: {},
    };
  },
  created() {
    http.get(`/user/${this.checkUserInfo.userid}`).then(({ data }) => {
      this.user = data;
    });
  },
  mounted() {
    console.log(this.company);

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
    userModify() {
      console.log(this.user);
      console.log(this.userInfo);
      // if (this.userpwd == this.user.userpwd) {
      http
        .put(`/user/`, {
          userid: this.user.userid,
          username: this.user.username,
          userpwd: this.user.userpwd,
          email: this.user.email,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            http
              .put(`/company`, {
                buildingName: this.company.buildingName,
                sido: this.company.sido,
                sigunGu: this.company.sigunGu,
                bName: this.company.bName,
                bCode: this.company.bCode,
                lat: this.company.lat,
                lng: this.company.lng,
                companyno: this.company.companyno,
                userid: this.userInfo.userid,
              })
              .then(({ data }) => {
                console.log(data);
              });

            msg = "수정이 완료되었습니다.";
          }
          this.moveList();
          alert(msg);
        });
      // } else {
      // alert("비밀번호를 확인하세요.");
      // }
    },
    moveList() {
      this.$router.push({ name: "MyPage" });
    },
    initMap() {
      this.geocoder = new kakao.maps.services.Geocoder();
    },
    sample5_execDaumPostcode() {
      // this.geocoder = new window.daum.maps.services.Geocoder();
      //주소-좌표 변환 객체를 생성
      // console.log(this.geocoder);

      new window.daum.Postcode({
        oncomplete: (data) => {
          this.company.buildingName = data.buildingName;
          this.company.sido = data.sido;
          this.company.sigunGu = data.sigungu;
          this.company.bName = data.bname;
          this.company.bCode = data.bcode;
          this.geocoder.addressSearch(data.address, (results, status) => {
            // 정상적으로 검색이 완료됐으면
            if (status === window.daum.maps.services.Status.OK) {
              var result = results[0]; //첫번째 결과의 값을 활용

              this.company.lat = result.y;
              this.company.lng = result.x;

              console.log(this.company);
            }
          });
        },
      }).open();
    },
  },
};
</script>

<style></style>
