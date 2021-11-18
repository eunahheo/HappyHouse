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
          <!-- <li><a href="#portfolio">Portfolio</a></li> -->
          <!-- <li>
            <router-link :to="{ name: 'Home' }" class="link"> Home</router-link>
          </li> -->

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
          <!-- <li>
            <router-link :to="{ name: 'Four' }" class="link"
              ><b-icon icon="calculator" font-scale="1"></b-icon> 주택거래정보
            </router-link>
          </li> -->
          <li>
            <a href="http://localhost:80/category"> 상권정보 </a>
            <!-- <router-link :to="{ name: 'Four' }" class="link"
              ><b-icon icon="calculator" font-scale="1"></b-icon> 주택거래정보
            </router-link> -->
          </li>
          <li>
            <router-link :to="{ name: 'Board' }" class="link"
              ><b-icon icon="card-heading" font-scale="1"></b-icon> QNA
            </router-link>
          </li>

          <!-- <c:if test="${!empty userinfo}">
            <c:if test="${userinfo.id eq 'ssafy'}">
              <li id="userList">
                <a href="${root}/user/userList">회원목록</a>
              </li>
            </c:if>
            <li id="myPage"><a href="${root}/user/user_info">마이페이지</a></li>
            <li id="logOut"><a href="${root}/user/logout">로그아웃</a></li>
          </c:if>
          <c:if test="${empty userinfo}">
            <li id="logIn">
              <a href="#loginModal" data-toggle="modal">로그인</a>
            </li>
          </c:if> -->
          <!-- <li>
            <router-link :to="{ name: 'Login' }" class="link"
              ><b-icon icon="calculator" font-scale="1"></b-icon> 로그인
            </router-link>
          </li>
          <li>
            <router-link :to="{ name: 'Sign' }" class="link"
              ><b-icon icon="calculator" font-scale="1"></b-icon> 회원가입
            </router-link>
          </li> -->
        </ul>
      </nav>
      <!-- .nav-menu -->
    </div>
  </header>
</template>

<script>
export default {
  name: "NaviBar",
};
</script>

<style></style>
