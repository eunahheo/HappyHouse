<template>
  <section id="hero">
    <div class="hero-container" data-aos="fade-up">
      <h1>Welcome to HAPPYHOUSE</h1>
      <h2>
        주택의 아파트/다세대,주택 별 거래 정보와 아파트 정보를 조회할 수
        있습니다.
      </h2>
      <!-- <form action="" method="post">
              <input type="email" name="email" id="inputEmail"><input type="submit" value="검색" id="searchBtn">
            </form>
 -->
      <!-- <router-link :to="{ name: 'Four' }" class="link"
        ><b-icon icon="house" font-scale="1"></b-icon>
      </router-link> -->

      <a class="btn-get-started scrollto"
        ><router-link :to="{ name: 'House' }" class="link"
          ><b-icon
            icon="search"
            font-scale="1"
            style="color: white"
          ></b-icon> </router-link
      ></a>
    </div>
  </section>
</template>

<script>
export default {
  name: "Main",
  props: {
    msg: String,
  },
};
</script>

<style scoped>
.underline-steelblue {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(3, 50, 67, 0.3) 30%
  );
}
</style>
