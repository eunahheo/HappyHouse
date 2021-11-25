<template>
  <b-container class="bv-example-row mt-3">
    <b-row class="mb-1">
      <b-col class="text-left">
        <form id="searchform" class="form-inline" method="get">
          <input type="hidden" name="pg" value="1" />
          <select id="skey" v-model="key" name="key" class="form-control">
            <option value="id">아이디</option>
            <option value="noticeno">글번호</option>
            <option value="subject" :selected="true">제목</option>
          </select>

          <input
            type="text"
            class="ml-1 form-control"
            id="sword"
            name="word"
            v-model="word"
          />
          <!-- <a variant="outline-primary" class="btn" @click="searchNotice()"> </a> -->
          <b-icon
            icon="search"
            class="btn-s"
            @click="searchNotice()"
            font-scale="1.5"
          ></b-icon>
        </form>
      </b-col>
      <b-col class="text-right" style="float: left">
        <a v-show="this.flag" class="btn-buy" @click="moveWrite()">글쓰기</a>
      </b-col>
    </b-row>
    <b-row>
      <b-col v-if="notices.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th>글번호</b-th>
              <b-th>제목</b-th>
              <b-th>조회수</b-th>
              <b-th>작성자</b-th>
              <b-th>작성일</b-th>
            </b-tr>
          </b-thead>
          <tbody>
            <!-- 하위 component인 ListRow에 데이터 전달(props) -->
            <notice-list-row
              v-for="notice in pageOfItems"
              :key="notice.noticeno"
              v-bind="notice"
            />
          </tbody>
        </b-table-simple>
        <jw-pagination
          :items="notices"
          @changePage="onChangePage"
        ></jw-pagination>
      </b-col>
      <!-- <b-col v-else class="text-center">도서 목록이 없습니다.</b-col> -->
    </b-row>
  </b-container>
</template>

<script>
import http from "@/util/http-common";
import NoticeListRow from "@/components/notice/child/NoticeListRow";

import { mapState } from "vuex";
const memberStore = "memberStore";

export default {
  name: "NoticeList",
  components: {
    NoticeListRow,
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  data() {
    return {
      notices: [],
      key: null,
      word: null,
      flag: false,
      pageOfItems: [],
    };
  },
  created() {
    http.get(`/notice`).then(({ data }) => {
      this.notices = data;
    });
    if (this.userInfo.userid == "ssafy" || this.userInfo.userid == "admin") {
      this.flag = true;
    } else {
      this.flag = false;
    }
  },
  methods: {
    onChangePage(pageOfItems) {
      console.log("확인", pageOfItems);
      // update page of items
      this.pageOfItems = pageOfItems;
    },
    moveWrite() {
      this.$router.push({ name: "NoticeWrite" });
    },
    searchNotice() {
      // console.log("click");
      if (this.key != null && this.word != null) {
        // console.log(this.key, this.word);
        http
          .get(`/notice`, {
            params: {
              noticeno: this.noticeno,
              key: this.key,
              word: this.word,
            },
          })
          .then(({ data }) => {
            this.notices = data;
          });
      }
    },
  },
};
</script>

<style>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
.btn-s {
  width: 50px;
  color: #4154f1;
  transition: none;
  font-size: 16px;
  font-weight: 400;
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  transition: 0.3s;
}
.btn-s:hover {
  background: #fff;
  color: rgb(0, 0, 0);
}
</style>
