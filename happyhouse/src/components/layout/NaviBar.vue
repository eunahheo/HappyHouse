<template>
  <header
    id="header"
    class="header-transparent"
    style="background-color: rgba(40, 40, 40, 0.75)"
  >
    <div class="container d-flex align-items-center">
      <div class="logo mr-auto">
        <h1 class="text-light">
          <router-link :to="{ name: 'Home' }" class="link">
            HAPPYHOUSE</router-link
          >
        </h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <!-- 네비게이션바 -->
        <ul>
          <li>
            <router-link :to="{ name: 'House' }" class="link"
              ><b-icon icon="house-fill" font-scale="1"></b-icon>
              주택거래정보</router-link
            >
          </li>

          <li>
            <router-link :to="{ name: 'mapCategory' }" class="link"
              ><b-icon icon="map" font-scale="1"></b-icon> 상권정보
            </router-link>
          </li>
          <li>
            <router-link :to="{ name: 'Four' }" class="link"
              ><b-icon icon="card-heading" font-scale="1"></b-icon> 게시판
            </router-link>
          </li>

          <li v-if="userInfo" class="link" @click.prevent="onClickLogout">
            <router-link :to="{ name: 'Home' }" style="color: white"
              >로그아웃</router-link
            >
          </li>
          <li v-else>
            <router-link :to="{ name: 'SignIn' }" class="link"
              ><b-icon icon="key"></b-icon> 로그인</router-link
            >
          </li>
          <li v-if="userInfo">
            <router-link :to="{ name: 'MyPage' }" class="link align-self-center"
              >내정보보기</router-link
            >
          </li>
          <li v-else>
            <router-link :to="{ name: 'SignUp' }" class="link"
              ><b-icon icon="person-circle"></b-icon> 회원가입</router-link
            >
          </li>
        </ul>
      </nav>
      <!-- .nav-menu -->
    </div>
  </header>
</template>

<script>
import { mapState, mapMutations } from "vuex";

const memberStore = "memberStore";

export default {
  name: "NaviBar",
  computed: {
    ...mapState(memberStore, ["isLogin", "userInfo"]),
  },
  methods: {
    ...mapMutations(memberStore, ["SET_IS_LOGIN", "SET_USER_INFO"]),
    onClickLogout() {
      this.SET_IS_LOGIN(false);
      this.SET_USER_INFO(null);
      sessionStorage.removeItem("access-token");
      if (this.$route.path != "/") this.$router.push({ name: "Home" });
    },
  },
};
</script>
<style></style>
