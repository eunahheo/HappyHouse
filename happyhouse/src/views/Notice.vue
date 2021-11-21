<template>
  <b-container class="bv-example-row mt-3 text-center">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <br /><br />
      <h2>공지사항</h2>
      <p>공지사항 게시판입니다. 공지사항을 꼭 확인하세요.</p>
    </div>
    <router-view></router-view>
  </b-container>
</template>
<script>
export default {
  name: "Notice",
};
</script>
<style scoped>
.underline-hotpink {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(231, 27, 139, 0.3) 30%
  );
}
</style>
