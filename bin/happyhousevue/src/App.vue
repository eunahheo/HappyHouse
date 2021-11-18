<template>
  <div id="app">
    <navi-bar />
    <router-view />
    <br /><br /><br /><br /><br />
    <Footer />
  </div>
</template>

<script>
import NaviBar from "./components/layout/NaviBar.vue";
import Footer from "./components/layout/Footer.vue";
import "@/assets/css/innerstyle.css";
import "@/assets/css/style.css";

export default {
  name: "App",
  components: {
    NaviBar,
    Footer,
  },
};
</script>

<style>
a:hover {
  text-decoration: none;
  font-weight: bold;
}

a.router-link-exact-active {
  color: skyblue;
}
</style>
