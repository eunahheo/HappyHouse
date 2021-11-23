import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import Introduce from "@/views/Introduce.vue";
import Four from "@/views/Four.vue";
import Login from "@/views/Login.vue";
import Sign from "@/views/SignUp.vue";

import Member from "@/views/Member.vue";
import MemberLogin from "@/components/user/MemberLogin.vue";
import MemberJoin from "@/components/user/MemberJoin.vue";
import MemberMyPage from "@/components/user/MemberMyPage.vue";
import MemberUpdate from "@/components/user/MemberUpdate.vue";

import Board from "@/views/Board.vue";
import BoardList from "@/components/board/BoardList.vue";
import BoardWrite from "@/components/board/BoardWrite.vue";
import BoardView from "@/components/board/BoardView.vue";
import BoardUpdate from "@/components/board/BoardUpdate.vue";
import BoardDelete from "@/components/board/BoardDelete.vue";

import Notice from "@/views/Notice.vue";
import NoticeList from "@/components/notice/NoticeList.vue";
import NoticeWrite from "@/components/notice/NoticeWrite.vue";
import NoticeView from "@/components/notice/NoticeView.vue";
import NoticeUpdate from "@/components/notice/NoticeUpdate.vue";
import NoticeDelete from "@/components/notice/NoticeDelete.vue";

import mapCategory from "@/views/mapCategory.vue";

import House from "@/views/House.vue";

import store from "@/store/index.js";

Vue.use(VueRouter);

// https://router.vuejs.org/kr/guide/advanced/navigation-guards.html
const onlyAuthUser = async (to, from, next) => {
  // console.log(store);
  const checkUserInfo = store.getters["memberStore/checkUserInfo"];
  const getUserInfo = store._actions["memberStore/getUserInfo"];
  let token = sessionStorage.getItem("access-token");
  if (checkUserInfo == null && token) {
    await getUserInfo(token);
  }
  if (checkUserInfo === null) {
    alert("로그인 하시고 다양한 서비스를 이용해보세요.");
    // next({ name: "SignIn" });
    router.push({ name: "SignIn" });
  } else {
    console.log("로그인 성공");
    next();
  }
};

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/introduce",
    name: "Introduce",
    component: Introduce,
  },
  {
    path: "/four",
    name: "Four",
    component: Four,
  },
  {
    path: "/user",
    name: "Member",
    component: Member,
    children: [
      {
        path: "singin",
        name: "SignIn",
        component: MemberLogin,
      },
      {
        path: "singup",
        name: "SignUp",
        component: MemberJoin,
      },
      {
        path: "mypage",
        name: "MyPage",
        beforeEnter: onlyAuthUser,
        component: MemberMyPage,
      },
      {
        path: "MemberUpdate",
        name: "MemberUpdate",
        beforeEnter: onlyAuthUser,
        component: MemberUpdate,
      },
    ],
  },
  {
    path: "/board",
    name: "Board",
    component: Board,
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "BoardList",
        component: BoardList,
      },
      {
        path: "write",
        name: "BoardWrite",
        beforeEnter: onlyAuthUser,
        component: BoardWrite,
      },
      {
        path: "detail/:articleno",
        name: "BoardView",
        beforeEnter: onlyAuthUser,
        component: BoardView,
      },
      {
        path: "update/:articleno",
        name: "BoardUpdate",
        beforeEnter: onlyAuthUser,
        component: BoardUpdate,
      },
      {
        path: "delete/:articleno",
        name: "BoardDelete",
        beforeEnter: onlyAuthUser,
        component: BoardDelete,
      },
    ],
  },
  {
    path: "/notice",
    name: "Notice",
    component: Notice,
    redirect: "/notice/list",
    children: [
      {
        path: "list",
        name: "NoticeList",
        component: NoticeList,
      },
      {
        path: "write",
        name: "NoticeWrite",
        beforeEnter: onlyAuthUser,
        component: NoticeWrite,
      },
      {
        path: "detail/:noticeno",
        name: "NoticeView",
        beforeEnter: onlyAuthUser,
        component: NoticeView,
      },
      {
        path: "update/:noticeno",
        name: "NoticeUpdate",
        beforeEnter: onlyAuthUser,
        component: NoticeUpdate,
      },
      {
        path: "delete/:noticeno",
        name: "NoticeDelete",
        beforeEnter: onlyAuthUser,
        component: NoticeDelete,
      },
    ],
  },
  {
    path: "/house",
    name: "House",
    beforeEnter: onlyAuthUser,
    component: House,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/sign",
    name: "Sign",
    component: Sign,
  },
  {
    path: "/category",
    name: "mapCategory",
    component: mapCategory,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
