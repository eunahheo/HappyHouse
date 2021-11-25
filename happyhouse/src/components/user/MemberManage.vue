<template>
  <section class="inner-page">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <h2>마이페이지</h2>
      <p>회원정보를 조회하세요.</p>
    </div>
    <b-container class="bv-example-row mt-3">
      <b-row class="mb-1">
        <b-col class="text-left">
          <form id="searchform" class="form-inline" method="get">
            <input type="hidden" name="pg" value="1" />
            <select id="skey" v-model="key" name="key" class="form-control">
              <option value="userid">아이디</option>
              <option value="username">이름</option>
              <option value="email" :selected="true">이메일</option>
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
              @click="searchMember()"
              font-scale="1.5"
            ></b-icon>
          </form>
        </b-col>
      </b-row>
      <b-row>
        <b-col v-if="members.length">
          <b-table-simple hover responsive>
            <b-thead head-variant="dark">
              <b-tr>
                <b-th>회원아이디</b-th>
                <b-th>회원이름</b-th>
                <b-th>이메일</b-th>
                <b-th>가입날짜</b-th>
              </b-tr>
            </b-thead>
            <tbody>
              <!-- 하위 component인 ListRow에 데이터 전달(props) -->
              <member-list-row
                v-for="member in pageOfItems"
                :key="member.userid"
                v-bind="member"
              />
            </tbody>
          </b-table-simple>
          <jw-pagination
            :items="members"
            @changePage="onChangePage"
          ></jw-pagination>
        </b-col>
        <!-- <b-col v-else class="text-center">도서 목록이 없습니다.</b-col> -->
      </b-row>
    </b-container>
  </section>
</template>

<script>
import { mapState } from "vuex";
import http from "@/util/http-common";
import MemberListRow from "@/components/user/child/MemberListRow";
const memberStore = "memberStore";

export default {
  name: "MemberMenage",
  components: {
    MemberListRow,
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
  },
  data() {
    return {
      members: [],
      key: null,
      word: null,
      flag: false,
      pageOfItems: [],
    };
  },
  created() {
    http.get(`/user/`).then(({ data }) => {
      this.members = data;
    });
    console.log(this.members);
  },
  methods: {
    onChangePage(pageOfItems) {
      console.log("확인", pageOfItems);
      // update page of items
      this.pageOfItems = pageOfItems;
    },
    searchMember() {
      console.log("click");
      if (this.key != null && this.word != null) {
        // console.log(this.key, this.word);
        http
          .get(`/user/`, {
            params: {
              userid: this.userid,
              key: this.key,
              word: this.word,
            },
          })
          .then(({ data }) => {
            this.members = data;
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
