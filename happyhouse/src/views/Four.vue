<template>
  <!-- ======= Contact Section ======= -->
  <section id="contact" class="contact section-bg">
    <div class="container">
      <div class="section-title" data-aos="fade-in" data-aos-delay="100">
        <h2>게시판</h2>
        <p>공지사항을 확인하고 QnA 게시판에 궁금한 점을 질문해보세요.</p>
      </div>

      <div class="row" data-aos="fade-up" data-aos-delay="100">
        <div class="col-lg-6">
          <div class="info-box mb-4">
            <b-icon icon="clipboard-check" font-scale="1.5"></b-icon>
            <h3>공지사항</h3>
            <table class="table table-hover">
              <thead class="thead-dark">
                <tr>
                  <th class="w-10">#</th>
                  <th class="w-51">제목</th>
                  <th class="w-25">작성자</th>
                  <th class="w-5">조회수</th>
                </tr>
              </thead>
              <tbody class="table table-hover">
                <tr
                  v-for="(notice, index) in notices"
                  :key="index"
                  v-bind="notice"
                >
                  <td>{{ index + 1 }}</td>
                  <td>{{ notice.subject }}</td>
                  <td>{{ notice.userid }}</td>
                  <td>{{ notice.hit }}</td>
                </tr>
              </tbody>
            </table>
            <div class="clearfix" style="text-align: right; margin-right: 5px">
              <router-link :to="{ name: 'Notice' }" class="link">
                <button class="btn btn-primary">글 목록</button>
              </router-link>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="info-box mb-4">
            <b-icon icon="clipboard" font-scale="1.5"></b-icon>
            <h3>QnA</h3>
            <table class="table table-hover">
              <thead class="thead-dark">
                <tr>
                  <th class="w-10">#</th>
                  <th class="w-50">제목</th>
                  <th class="w-25">작성자</th>
                  <th class="w-5">조회수</th>
                </tr>
              </thead>
              <tbody class="table table-hover">
                <tr
                  v-for="(board, index) in boards"
                  :key="index"
                  v-bind="board"
                >
                  <td>{{ index + 1 }}</td>
                  <td>
                    <router-link
                      :to="{
                        name: 'BoardView',
                        params: { articleno: board.boardno },
                      }"
                      >{{ board.subject }}</router-link
                    >
                  </td>
                  <td>{{ board.userid }}</td>
                  <td>{{ board.hit }}</td>
                </tr>
              </tbody>
            </table>
            <div class="clearfix" style="text-align: right; margin-right: 5px">
              <router-link :to="{ name: 'Board' }" class="link">
                <button class="btn btn-primary">글 목록</button>
              </router-link>
            </div>
          </div>
        </div>
      </div>

      <!-- <div class="row" data-aos="fade-up" data-aos-delay="200">
        <div class="col-lg-6">
          <div class="info-box mb-4" style="color: #2f4d5a">
            <b-icon icon="newspaper" font-scale="1.5"></b-icon>
            <h3>주택 관련 기사</h3>
            <li>
              <a
                href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=215&aid=0000982359"
                target="_blank"
                class="small margin-clear"
                title="KB국민은행, 주택담보·전세대출 변동금리 0.15%p 인상"
                >KB국민은행, 주택담보·전세대출 변동금리 0.15%p 인상</a
              >
            </li>
            <li>
              <a
                href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=243&aid=0000015899"
                class="small margin-clear"
                target="_blank"
                title="주택 공급 늘리는 신도시 개발이 집값 급등 부채질했나"
                >주택 공급 늘리는 신도시 개발이 집값 급등 부채질했나</a
              >
            </li>
          </div>
        </div>
        <div class="col-lg-6 col-md-6">
          <div class="info-box mb-4">
            <i class="bx bx-news"></i>
            <h3>주택 관련 기사</h3>
            <li>
              <a
                href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=215&aid=0000982359"
                target="_blank"
                class="small margin-clear"
                title="KB국민은행, 주택담보·전세대출 변동금리 0.15%p 인상"
                >KB국민은행, 주택담보·전세대출 변동금리 0.15%p 인상</a
              >
            </li>
            <li>
              <a
                href="https://news.naver.com/main/read.naver?mode=LSD&mid=sec&sid1=101&oid=243&aid=0000015899"
                class="small margin-clear"
                target="_blank"
                title="주택 공급 늘리는 신도시 개발이 집값 급등 부채질했나"
                >주택 공급 늘리는 신도시 개발이 집값 급등 부채질했나</a
              >
            </li>
          </div>
        </div>
      </div> -->
    </div>
  </section>
</template>

<script>
import http from "@/util/http-common";
// import AOS from "aos";
// import "aos/dist/aos.css";
export default {
  name: "Main",
  props: {
    msg: String,
  },
  data() {
    return {
      notices: [],
      boards: [],
      key: null,
      word: null,
      board: null,
    };
  },
  created() {
    http.get(`/notice`).then(({ data }) => {
      this.notices = data.slice(0, 3);
    });
    http.get(`/board`).then(({ data }) => {
      this.boards = data.slice(0, 3);
    });
  },
};
// import "@/assets/js/main.js";
</script>

<style scoped>
.underline-steelblue {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(72, 190, 233, 0.3) 30%
  );
}
</style>
