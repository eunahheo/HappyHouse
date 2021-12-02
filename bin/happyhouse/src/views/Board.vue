<template>
  <b-container class="bv-example-row mt-3 text-center">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <br /><br />
      <h2>QNA 게시판</h2>
      <p>QNA 게시판입니다. 궁금한 점을 문의해보세요.</p>
    </div>
    <router-view></router-view>
  </b-container>
</template>
<script>
export default {
  name: "Board",
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
