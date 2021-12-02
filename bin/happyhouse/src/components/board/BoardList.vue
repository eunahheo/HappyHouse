<template>
  <b-container class="bv-example-row mt-3">
    <b-row class="mb-1">
      <b-col class="text-left">
        <form id="searchform" class="form-inline" method="get">
          <input type="hidden" name="pg" value="1" />
          <select id="skey" v-model="key" name="key" class="form-control">
            <option value="id" selected>아이디</option>
            <option value="articleno">글번호</option>
            <option value="subject">제목</option>
          </select>

          <input
            type="text"
            class="ml-1 form-control"
            id="sword"
            name="word"
            v-model="word"
          />
          <b-icon
            icon="search"
            class="btn-s"
            @click="searchBoard()"
            font-scale="1.5"
          ></b-icon>
        </form>
      </b-col>
      <b-col class="text-right" style="float: left">
        <router-link
          :to="{ name: 'BoardWrite' }"
          @click="moveWrite()"
          class="btn-buy"
          >글쓰기</router-link
        >
      </b-col>
    </b-row>

    <b-col v-if="articles.length">
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
          <board-list-row
            v-for="item in pageOfItems"
            :key="item.articleno"
            v-bind="item"
          />
        </tbody>
      </b-table-simple>
      <div>
        <jw-pagination
          :items="articles"
          @changePage="onChangePage"
        ></jw-pagination>
      </div>
    </b-col>
    <!-- <b-col v-else class="text-center">도서 목록이 없습니다.</b-col> -->
  </b-container>
</template>

<script>
import http from "@/util/http-common";
import BoardListRow from "@/components/board/child/BoardListRow";

export default {
  name: "BoardList",
  components: {
    BoardListRow,
  },
  data() {
    return {
      item: null,
      articles: [],
      key: null,
      word: null,

      pageOfItems: [],
    };
  },
  created() {
    http.get(`/board`).then(({ data }) => {
      this.articles = data;
    });
  },
  methods: {
    onChangePage(pageOfItems) {
      console.log("확인", pageOfItems);
      // update page of items
      this.pageOfItems = pageOfItems;
    },
    moveWrite() {
      this.$router.push({ name: "BoardWrite" });
    },
    searchBoard() {
      // console.log("click");
      if (this.key != null && this.word != null) {
        // console.log(this.key, this.word);
        http
          .get(`/board`, {
            params: {
              articleno: this.articleno,
              key: this.key,
              word: this.word,
            },
          })
          .then(({ data }) => {
            this.articles = data;
          });
      }
    },
  },
};
</script>

<style scope>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
</style>
