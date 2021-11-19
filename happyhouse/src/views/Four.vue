<template>
  <!-- ======= Contact Section ======= -->
  <section id="contact" class="contact section-bg">
    <div class="container">
      <div class="section-title" data-aos="fade-in" data-aos-delay="100">
        <h2>주택거래정보</h2>
        <p>
          아파트/다세대, 주택 별 거래정보와 아파트 정보를 조회할 수 있습니다.
        </p>
      </div>

      <div class="row" data-aos="fade-up" data-aos-delay="100">
        <div class="col-lg-6">
          <div
            id="map"
            style="width: 100%; height: 400px; margin: auto"
            class="mb-3"
          ></div>
        </div>
        <div class="col-lg-6">
          <div class="info-box mb-4">
            <i class="bx bx-spreadsheet"></i>
            <h3>공지사항</h3>
            <table class="table table-hover">
              <thead class="thead-dark">
                <tr>
                  <th class="w-10">#</th>
                  <th class="w-50">제목</th>
                  <th class="w-25">작성자</th>
                </tr>
              </thead>
              <tbody class="table table-hover">
                <tr>
                  <td>1</td>
                  <td><a href="view.jsp">[필독] 사이트 이용안내</a></td>
                  <td>관리자</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td><a href="view.jsp">주택 거래 시 주의할 점</a></td>
                  <td>오지영</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td><a href="view.jsp">주택 거래 정보 조회 방법</a></td>
                  <td>허은아</td>
                </tr>
              </tbody>
            </table>
            <div class="clearfix">
              <router-link :to="{ name: 'Board' }" class="link"
                ><b-icon icon="card-heading" font-scale="1"></b-icon> QnA
              </router-link>
            </div>
          </div>
        </div>
      </div>

      <div class="row" data-aos="fade-up" data-aos-delay="200">
        <div class="col-lg-6">
          <div class="info-box mb-4">
            <i class="bx bx-map"></i>
            <h3>주소 입력</h3>
            <div class="dropdown">
              <div class="btn-group">
                <button
                  type="button"
                  id="areaBtn"
                  class="btn btn-warning dropdown-toggle dropdown-toggle-split"
                  data-toggle="dropdown"
                >
                  지역선택
                </button>
                <div class="dropdown-menu">
                  <label class="dropdown-item cafe_area">서울</label>
                  <label class="dropdown-item cafe_area">대전</label>
                  <label class="dropdown-item cafe_area">구미</label>
                  <label class="dropdown-item cafe_area">광주</label>
                  <label class="dropdown-item cafe_area">부울경</label>
                </div>
              </div>
              <div class="btn-group">
                <button
                  type="button"
                  id="officeBtn"
                  class="btn btn-warning dropdown-toggle dropdown-toggle-split"
                  data-toggle="dropdown"
                >
                  지점선택
                </button>
                <div id="office_div" class="dropdown-menu"></div>
              </div>
              <button
                type="button"
                id="detailBtn"
                class="btn btn-outline-secondary"
              >
                <a href="${root}/map">상세보기</a>
              </button>
            </div>
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
      </div>
    </div>
  </section>
</template>

<script>
// import AOS from "aos";
// import "aos/dist/aos.css";
export default {
  name: "Main",
  props: {
    msg: String,
  },
  // created() {
  //   AOS.init();
  // },
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
