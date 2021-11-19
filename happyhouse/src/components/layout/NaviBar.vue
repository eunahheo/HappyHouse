<template>
  <header
    id="header"
    class="header-transparent"
    style="background-color: rgba(40, 40, 40, 0.8)"
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
            <router-link :to="{ name: 'Introduce' }" class="link"
              ><b-icon icon="emoji-wink" font-scale="1"></b-icon> 사이트
              소개</router-link
            >
          </li>
          <!-- <li><a href="#team">사이트 소개</a></li> -->
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
            <router-link :to="{ name: 'Board' }" class="link"
              ><b-icon icon="card-heading" font-scale="1"></b-icon> QNA
            </router-link>
          </li>

          <li>
            <b-navbar-nav class="ml-auto" v-if="userInfo">
              <b-nav-item-dropdown class="align-self-center">
                <template
                  #button-content
                  v-text="
                    userInfo ? userInfo.userid.charAt(0).toUpperCase() : ''
                  "
                >
                  <b-icon icon="people" font-scale="2"></b-icon>
                </template>
                {{ userInfo.username }}({{ userInfo.userid }})님 환영합니다.

                <b-item-dropdown class="align-self-center"
                  ><router-link
                    :to="{ name: 'MyPage' }"
                    class="link align-self-center"
                    >내정보보기</router-link
                  ></b-item-dropdown
                >
                <b-item-dropdown
                  class="link align-self-center"
                  @click.prevent="onClickLogout"
                  >로그아웃</b-item-dropdown
                >
              </b-nav-item-dropdown>
            </b-navbar-nav>

            <b-navbar-nav class="ml-auto" v-else>
              <b-nav-item-dropdown right>
                <template #button-content>
                  <b-icon icon="people" font-scale="2"></b-icon>
                </template>
                <b-dropdown-item href="#"
                  ><router-link :to="{ name: 'SignUp' }" class="link"
                    ><b-icon icon="person-circle"></b-icon>
                    회원가입</router-link
                  ></b-dropdown-item
                >
                <b-dropdown-item href="#"
                  ><router-link :to="{ name: 'SignIn' }" class="link"
                    ><b-icon icon="key"></b-icon> 로그인</router-link
                  ></b-dropdown-item
                >
              </b-nav-item-dropdown>
            </b-navbar-nav>
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
