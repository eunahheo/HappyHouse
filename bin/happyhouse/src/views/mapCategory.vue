<template>
  <main class="bv-example-row mt-3 text-center">
    <div class="section-title" data-aos="fade-in" data-aos-delay="100">
      <br /><br />
      <h2>상권정보</h2>
      <p>관심 매물과 회사 주변의 상권을 카테고리 별로 살펴보세요.</p>
    </div>

    <div>
      <section style="text-left">
        <div
          class="map_wrap text-left"
          style="
            width: 40%;
            float: left;
            margin-left: 140px;
            margin-top: 10px;
            margin-bottom: 50px;
          "
        >
          <div
            id="map"
            style="
              width: 100%;
              height: 100%;
              position: relative;
              overflow: hidden;
            "
          ></div>
          <ul id="category">
            <li id="BK9" data-order="0" v-on:click="onClickCategory($event)">
              <span class="category_bg bank"></span>
              은행
            </li>
            <li id="MT1" data-order="1" @click="onClickCategory($event)">
              <span class="category_bg mart"></span> 마트
            </li>
            <!-- <li id="PM9" data-order="2" @click="onClickCategory">
            <span class="category_bg pharmacy"></span> 약국
          </li> -->
            <li id="AG2" data-order="2" @click="onClickCategory">
              <span class="category_bg"></span> 중개소
            </li>
            <!-- <li id="OL7" data-order="3" @click="onClickCategory">
            <span class="category_bg oil"></span> 주유소
          </li> -->
            <li id="CE7" data-order="4" @click="onClickCategory">
              <span class="category_bg cafe"></span> 카페
            </li>
            <li id="CS2" data-order="5" @click="onClickCategory">
              <span class="category_bg store"></span> 편의점
            </li>
            <li id="SW8" data-order="3" @click="onClickCategory">
              <span class="category_bg"></span> 지하철역
            </li>
          </ul>
        </div>
        <div style="width: 40%; float: right; margin-right: 140px">
          <h3 class="section-title">관심 지역들의 평균 매매가</h3>
          <div>
            <div
              class=""
              style="width: 400px; height: 500px"
              v-if="chartLoading"
            >
              <div indeterminate color="red"></div>
            </div>
            <line-chart
              :chartData="chartData"
              v-if="!chartLoading"
              style="height: 400px"
            />
          </div>
        </div>
      </section>

      <div style="width: 40%; float: right; margin-right: 140px">
        <br />
        <br />
        <br />
        <h3 class="section-title">회사 주변의 인기 매물</h3>
        <div>
          <div class="" style="width: 400px; height: 500px" v-if="chartLoading">
            <div indeterminate color="red"></div>
          </div>
          <bar-chart
            :chartData="chartData"
            v-if="!chartLoading"
            style="height: 400px"
          />
        </div>
      </div>
      <div
        class="sm-3"
        style="width: 40%; margin-left: 140px; margin-top: 50px"
      >
        <br />
        <!-- <h2 style="text-align: center">관심지역</h2> -->
        <a
          class="btn-buy"
          squared
          variant="info"
          @click="showCompany"
          size="sm"
          style="height: 40px; float: right"
        >
          회사
        </a>
        <br />
        <table style="width: 100%" class="table table-hover">
          <thead>
            <tr>
              <th>&nbsp;시</th>
              <th>&nbsp;구/군</th>
              <th>&nbsp;동</th>
              <th>&nbsp;아파트 이름</th>
            </tr>
          </thead>
        </table>
        <div style="height: 300px; overflow-y: auto; overflow-x: hidden">
          <table style="width: 100%" class="table table-hover">
            <tbody>
              <interest-list-row
                v-for="(interest, index) in interests"
                :key="index"
                v-bind="interest"
              />
            </tbody>
          </table>
        </div>
      </div>

      <div style="height: 100px"></div>
      <br />
      <br />
      <br />
      <br />
    </div>
  </main>
</template>

<script>
import InterestListRow from "@/views/InterestListRow";
import { mapState, mapMutations } from "vuex";
import http from "@/util/http-common";
import BarChart from "@/components/Charts/BarChart";
import LineChart from "@/components/Charts/LineChart";

const memberStore = "memberStore";
const houseStore = "houseStore";
const companyStore = "companyStore";

export default {
  name: "mapCategory",
  // props: {
  //   interest: Object,
  // },
  components: {
    InterestListRow,
    BarChart,
    LineChart,
  },
  watch: {
    list: function () {
      this.initMap();
    },
  },
  data() {
    return {
      chartLoading: false, // 데이터를 불러오기 전까지는 progress circle을 사용
      chartData: [],
      interesting: {},
      interest: null,
      inte: null,
      // 사용자의 현재 위치 정보
      clist: {},
      latitude: "",
      longitude: "",
      textContent: "",
      isIshow: false,
      isCshow: false,
      map: null,
      infowindow: null,
      // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
      placeOverlay: null,

      markers: [], // 마커를 담을 배열입니다
      currCategory: "", // 현재 선택된 카테고리를 가지고 있을 변수입니다
      // mapContainer: document.getElementById("map"), // 지도를 표시할 div
      mapOption: null,
      ps: null,
      contentNode: "",
      place: null,
    };
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapState(houseStore, ["interests", "list"]),
    ...mapState(companyStore, ["company"]),
  },
  created() {
    http.get(`/map/interest/all/${this.userInfo.userid}`).then(({ data }) => {
      // this.interests = data;
      this.interests = null;
      this.SET_INTEREST_LIST(data);
      console.log("결과: ", this.interests);
    });
    //console.log("결과:", interests);
  },
  mounted() {
    // this.first();
    this.userLocation();
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=64eac5c80b2c73c911146817941a78c0&libraries=services";
      document.head.appendChild(script);
    }
  },
  methods: {
    ...mapMutations(houseStore, ["SET_INTEREST_LIST"]),
    ...mapMutations(houseStore, ["SET_LAT_INFO"]),
    first() {
      let item =
        '{"labels":["01","02","03","04","05","06","07","08","09","10","11"],"chartData":[{"label":"다음","data":["65","13","22","125","41","142","156","121","24","29","151"]},{"label":"다우존스","data":["1","1","0","6","1","3","6","8","0","0","6"]},{"label":"네이버","data":["65","13","22","119","41","139","150","119","20","28","147"]},{"label":"뉴스원","data":["61","7","17","105","28","128","138","108","10","20","137"]},{"label":"다나와","data":["0","0","0","1","0","0","1","0","0","0","0"]}]}';
      let data = JSON.parse(item);
      this.chartData = { labels: data.labels, chartData: data.chartData }; // 차트 보이기 this.chartLoading = false
    },
    showCompany() {
      this.clist = {
        lat: this.company.lat,
        lng: this.company.lng,
      };
      this.SET_LAT_INFO(this.clist);
    },
    userLocation() {
      navigator.geolocation.getCurrentPosition((position) => {
        this.latitude = position.coords.latitude;
        this.longitude = position.coords.longitude;
      });
    },
    initMap() {
      this.contentNode = document.createElement("div"); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
      const mapContainer = document.getElementById("map");
      this.placeOverlay = new kakao.maps.CustomOverlay({
        zIndex: 1,
      });
      // 장소 검색 객체 생성
      this.ps = new kakao.maps.services.Places(this.map);
      this.mapOption = {
        center: new kakao.maps.LatLng(this.list.lat, this.list.lng), // 지도의 중심좌표
        level: 6,
        // 지도의 확대 레벨
      };
      var markerPosition = new kakao.maps.LatLng(this.list.lat, this.list.lng);
      this.map = new kakao.maps.Map(mapContainer, this.mapOption);
      this.marker = new kakao.maps.Marker({
        position: markerPosition,
      });
      this.marker.setMap(this.map);
    },

    displayMarker(markerPositions) {
      if (this.markers.length > 0) {
        this.markers.forEach((marker) => marker.setMap(null));
      }

      const positions = markerPositions.map(
        (position) => new kakao.maps.LatLng(...position)
      );

      if (positions.length > 0) {
        this.markers = positions.map(
          (position) =>
            new kakao.maps.Marker({
              map: this.map,
              position,
            })
        );

        const bounds = positions.reduce(
          (bounds, latlng) => bounds.extend(latlng),
          new kakao.maps.LatLngBounds()
        );

        this.map.setBounds(bounds);
      }
    },
    displayInfoWindow() {
      if (this.infowindow && this.infowindow.getMap()) {
        //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
        this.map.setCenter(this.infowindow.getPosition());
        return;
      }

      var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(this.list.lat, this.list.lng), //인포윈도우 표시 위치입니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

      this.infowindow = new kakao.maps.InfoWindow({
        map: this.map, // 인포윈도우가 표시될 지도
        position: iwPosition,
        content: iwContent,
        removable: iwRemoveable,
      });

      this.map.setCenter(iwPosition);
    },
    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
    addEventHandle(target, type, callback) {
      if (target.addEventListener) {
        target.addEventListener(type, () => {
          callback;
        });
        // target.addEventListener(type, callback);
      } else {
        target.attachEvent("on" + type, callback);
      }
    },
    // 카테고리 검색을 요청하는 함수입니다
    searchPlaces() {
      if (!this.currCategory) {
        return;
      }

      // 커스텀 오버레이를 숨깁니다
      this.placeOverlay.setMap(null);

      // 지도에 표시되고 있는 마커를 제거합니다
      this.removeMarker();
      this.ps.categorySearch(this.currCategory, this.placesSearchCB, {
        useMapBounds: true,
      });
    },

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    placesSearchCB(data, status) {
      if (status === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        console.log("OK");
        this.displayPlaces(data);
      } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
      } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
      }
    },

    // 지도에 마커를 표출하는 함수입니다
    displayPlaces(places) {
      // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
      // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
      // console.log(this.currCategory);
      var order = document
        .getElementById(this.currCategory)
        .getAttribute("data-order");
      // console.log(places);
      places.forEach((place) => {
        // console.log(place);
        var marker = this.addMarker(
          new kakao.maps.LatLng(place.y, place.x),
          order
        );
        // console.log(marker);
        // console.log(place);
        // console.log("this : ", this.place);
        kakao.maps.event.addListener(marker, "click", () => {
          this.displayPlaceInfo(place);
        });

        // 마커와 검색결과 항목을 클릭 했을 때
        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        // (function (marker, place) {
        //   // console.log(place);
        //   kakao.maps.event.addListener(marker, "click", () => {
        //     console.log("이거 클릭 : ", place);
        //     this.displayPlaceInfo(place);
        //   });
        // })(marker, places[i]);
      });

      // console.log("markers배열 : ", this.markers);
    },

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    addMarker(position, order) {
      var imageSrc =
          "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
        imgOptions = {
          spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
          spriteOrigin: new kakao.maps.Point(46, order * 36), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
          offset: new kakao.maps.Point(11, 28),
          // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(
          imageSrc,
          imageSize,
          imgOptions
        ),
        marker = new kakao.maps.Marker({
          position: position, // 마커의 위치
          image: markerImage,
        });
      // console.log("마커 : ", marker);

      marker.setMap(this.map); // 지도 위에 마커를 표출합니다
      this.markers.push(marker); // 배열에 생성된 마커를 추가합니다

      return marker;
    },

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    removeMarker() {
      for (var i = 0; i < this.markers.length; i++) {
        this.markers[i].setMap(null);
      }
      this.markers = [];
    },

    // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
    displayPlaceInfo(place) {
      console.log("함수 호출 당함: ", place);
      var content =
        '<div class="placeinfo">' +
        '   <a class="title" href="' +
        place.place_url +
        '" target="_blank" title="' +
        place.place_name +
        '">' +
        place.place_name +
        "</a>";

      if (place.road_address_name) {
        content +=
          '    <span title="' +
          place.road_address_name +
          '">' +
          place.road_address_name +
          "</span>" +
          '  <span class="jibun" title="' +
          place.address_name +
          '">(지번 : ' +
          place.address_name +
          ")</span>";
      } else {
        content +=
          '    <span title="' +
          place.address_name +
          '">' +
          place.address_name +
          "</span>";
      }

      content +=
        '    <span class="tel">' +
        place.phone +
        "</span>" +
        "</div>" +
        '<div class="after"></div>';

      this.contentNode.innerHTML = content;
      console.log(this.contentNode);

      this.placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
      this.placeOverlay.setMap(this.map);
    },

    // // 각 카테고리에 클릭 이벤트를 등록합니다
    // addCategoryClickEvent() {
    //   var category = document.getElementById("category"),
    //     children = category.children;
    //   for (var i = 0; i < children.length; i++) {
    //     // console.log(children[i].id);

    //     addEventListener("click", this.onClickCategory);
    //     // children[i].children[i].onclick = this.onClickCategory(children[i]);
    //     // console.log(children[i]);
    //   }
    // },

    // 카테고리를 클릭했을 때 호출되는 함수입니다
    onClickCategory(event) {
      // 지도에 idle 이벤트를 등록합니다
      kakao.maps.event.addListener(this.map, "idle", this.searchPlaces);

      // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
      this.contentNode.className = "placeinfo_wrap";

      // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
      // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
      this.addEventHandle(
        this.contentNode,
        "mousedown",
        kakao.maps.event.preventMap
      );
      this.addEventHandle(
        this.contentNode,
        "touchstart",
        kakao.maps.event.preventMap
      );

      // 커스텀 오버레이 컨텐츠를 설정합니다
      this.placeOverlay.setContent(this.contentNode);

      // 각 카테고리에 클릭 이벤트를 등록합니다
      // this.addCategoryClickEvent();

      var id = event.currentTarget.id;
      // console.log(id);
      // var id = event.id;
      var className = this.className;
      // console.log(className);
      this.placeOverlay.setMap(null);

      if (className === "on") {
        this.currCategory = id; //"";
        this.changeCategoryClass(this); //();
        this.searchPlaces(); //remove();
      } else {
        // console.log("여기 실행");
        this.currCategory = id;
        // console.log("this:" + this);
        this.changeCategoryClass(this);
        this.searchPlaces();
      }
    },

    // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
    changeCategoryClass(el) {
      var category = document.getElementById("category"),
        children = category.children,
        i;

      for (i = 0; i < children.length; i++) {
        children[i].className = "";
      }
      if (el) {
        el.className = "on";
      }
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
@import "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css";
.map_wrap,
.map_wrap * {
  margin: 0;
  padding: 0;
  font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
  font-size: 12px;
}

.map_wrap {
  position: relative;
  width: 100%;
  height: 470px;
}

#category {
  position: absolute;
  top: 10px;
  left: 10px;
  border-radius: 5px;
  border: 1px solid #909090;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
  background: #fff;
  overflow: hidden;
  z-index: 2;
}

#category li {
  float: left;
  list-style: none;
  width: 50px;
  border-right: 1px solid #acacac;
  padding: 6px 0;
  text-align: center;
  cursor: pointer;
}

#category li.on {
  background: #eee;
}

#category li:hover {
  background: #ffe6e6;
  border-left: 1px solid #acacac;
  margin-left: -1px;
}

#category li:last-child {
  margin-right: 0;
  border-right: 0;
}

#category li span {
  display: block;
  margin: 0 auto 3px;
  width: 27px;
  height: 28px;
}

#category li .category_bg {
  background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
    no-repeat;
}

#category li .bank {
  background-position: -10px 0;
}

#category li .mart {
  background-position: -10px -36px;
}

#category li .pharmacy {
  background-position: -10px -72px;
}

#category li .oil {
  background-position: -10px -108px;
}

#category li .cafe {
  background-position: -10px -144px;
}

#category li .store {
  background-position: -10px -180px;
}

#category li.on .category_bg {
  background-position-x: -46px;
}

.placeinfo_wrap {
  position: absolute;
  bottom: 28px;
  left: -150px;
  width: 300px;
}

.placeinfo {
  position: relative;
  width: 100%;
  border-radius: 6px;
  border: 1px solid #ccc;
  border-bottom: 2px solid #ddd;
  padding-bottom: 10px;
  background: #fff;
}

.placeinfo:nth-of-type(n) {
  border: 0;
  box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
  content: "";
  position: relative;
  margin-left: -12px;
  left: 50%;
  width: 22px;
  height: 12px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}

.placeinfo a,
.placeinfo a:hover,
.placeinfo a:active {
  color: #fff;
  text-decoration: none;
}

.placeinfo a,
.placeinfo span {
  display: block;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}

.placeinfo span {
  margin: 5px 5px 0 5px;
  cursor: default;
  font-size: 13px;
}

.placeinfo .title {
  font-weight: bold;
  font-size: 14px;
  border-radius: 6px 6px 0 0;
  margin: -1px -1px 0 -1px;
  padding: 10px;
  color: #fff;
  background: #d95050;
  background: #d95050
    url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
    no-repeat right 14px center;
}

.placeinfo .tel {
  color: #0f7833;
}

.placeinfo .jibun {
  color: #999;
  font-size: 11px;
  margin-top: 0;
}
</style>
