<template>
  <div class="map_wrap" v-if="houses">
    <button @click="trafficMap" class="btn btn-primary">실시간 교통정보</button>
    {{ this.msg }}
    <div id="map" style="width: 100%; height: 640px; position: relative"></div>
  </div>
</template>

<script>
import { mapState } from "vuex";

const houseStore = "houseStore";

export default {
  name: "HouseDetail",

  computed: {
    ...mapState(houseStore, ["houses"]),
    // house() {
    //   return this.$store.state.house;
    // },
  },
  watch: {
    houses: function () {
      this.displayMarkers(this.houses);
    },
  },
  data() {
    return {
      trafficFlag: false,
      msg: "off",
      map: null, // 지도
      ps: null,
      infowindow: null, // 검색 결과 목록/마커 클릭 시 장소명 표출한 인포윈도우
      placeOverlay: null, // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
      geocoder: null, // 주소-좌표 변환 객체 생성

      markers: [], // 마커를 담을 배열입니다
      currCategory: "", // 현재 선택된 카테고리를 가지고 있을 변수입니다
      mapContainer: null, // 지도를 표시할 div
      mapOption: null,
      contentNode: "",
      place: null,
    };
  },

  mounted() {
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
    trafficMap() {
      if (!this.trafficFlag) {
        this.map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
        this.msg = "on";
      } else {
        this.map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
        this.msg = "off";
      }
      this.trafficFlag = !this.trafficFlag;
    },
    initMap() {
      console.log("initMap 호출");
      this.contentNode = document.createElement("div"); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
      this.mapContainer = document.getElementById("map");
      this.infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

      this.placeOverlay = new kakao.maps.CustomOverlay({
        zIndex: 1,
      });

      // 장소 검색 객체 생성
      this.ps = new kakao.maps.services.Places(this.map);
      this.mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 5,
        // 지도의 확대 레벨
      };

      this.map = new kakao.maps.Map(this.mapContainer, this.mapOption);
    },

    //검색 결과 목록과 마커를 표출하는 함수입니다
    displayMarkers(houses) {
      console.log("displayMarkers 호출");
      const fragment = document.createDocumentFragment();
      const bounds = new kakao.maps.LatLngBounds();

      // 지도에 표시되고 있는 마커를 제거합니다
      this.removeMarker();
      var i = 0;
      houses.forEach((house) => {
        var placePosition = new kakao.maps.LatLng(house.lat, house.lng);
        var marker = this.addMarker(placePosition, i);
        var itemEl = this.getListItem(i, house); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        // (function (marker, title, code, place) {

        kakao.maps.event.addListener(marker, "click", () => {
          this.displayInfowindow(marker, house.aptName, house);
          // console.log(title + " " + code);
        });

        // console.log(this.map);
        kakao.maps.event.addListener(this.map, "click", () => {
          // console.log("placeOverlay", this.placeOverlay);
          this.placeOverlay.setMap(null);
        });

        // itemEl.addEventListener(marker, "mouseover", () => {
        //   this.displayInfowindow(marker, house.aptName);
        // });
        itemEl.onmouseover = function () {
          this.displayInfowindow(marker, house.aptName);
        };

        // itemEl.addEventListener("mouseout", () => {
        //   this.placeOverlay.setMap(null);
        // });
        itemEl.onmouseout = function () {
          this.placeOverlay.setMap(null);
        };

        // })(marker, house.aptName, house.aptCode, house);

        fragment.appendChild(itemEl);
        i += 1;
      });
      // 마커를 생성하고 지도에 표시합니다

      // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
      this.map.setBounds(bounds);
    },

    //마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    addMarker(position, idx) {
      const imageSrc =
          "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
        imgOptions = {
          spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
          spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
          offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
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

    //검색결과 항목을 Element로 반환하는 함수입니다
    getListItem(index, place) {
      const el = document.createElement("li");
      const itemStr = `
		<span class="markerbg marker_${index + 1}></span>
		<div class="info"><h5>${place.aptName}</h5> <button>관심등록</button>
		<span>${place.sidoName} ${place.gugunName} ${place.dongName} ${
        place.jibun
      }</span>
	`;
      el.innerHTML = itemStr;
      el.className = "item";

      return el;
    },

    //검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    //인포윈도우에 장소명을 표시합니다
    displayInfowindow(marker, title, place) {
      console.log(title);
      const content = `
		<div class="overlaybox" style="text-align:left">
			<div class="boxtitle">${title}</div>
			<div class="first"></div>
			<ul>
				<li class="up">
					<span class="title">건축년도</span>
					<span class="count">${place.buildYear}</span>
				</li>
				<li>
					<span class="title">주소</span>
					<span class="count">${place.sidoName} ${place.gugunName} ${place.dongName} ${place.jibun}</span>
				</li>
				<li>
					<span class="title">최신거래금액</span>
					<span class="count">${place.recentPrice}</span>
				</li>
				<li>
					<span class="last" id="recenthistor" data-toggle="modal" data-target="#myModal">아파트정보 update</span>
				</li>
			</ul>
		</div>
	`;
      this.contentNode.innerHTML = content;
      console.log(this.contentNode);
      const position = new kakao.maps.LatLng(
        marker.getPosition().getLat() + 0.00033,
        marker.getPosition().getLng() - 0.00003
      );
      this.placeOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: this.contentNode,
        xAnchor: 0.3,
        yAnchor: 0.91,
      });
      this.placeOverlay.setMap(this.map);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.overlaybox {
  position: relative;
  width: 360px;
  height: 350px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png")
    no-repeat;
  padding: 15px 10px;
}
.overlaybox div,
ul {
  overflow: hidden;
  margin: 0;
  padding: 0;
}
.overlaybox li {
  list-style: none;
}
.overlaybox .first {
  position: relative;
  width: 247px;
  height: 136px;
  background: url("https://ifh.cc/g/wYV1Ox.png") no-repeat;
  /* background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png")
    no-repeat; */
  /* background: url("/Users/heoeunah/git/happyhouse/happyhouse/src/assets/apt.png"); */
  /* background-repeat: no-repeat; */
  margin-bottom: 8px;
}

.overlaybox .boxtitle {
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png")
    no-repeat right 120px center;
  margin-bottom: 8px;
}
.overlaybox .first {
  position: relative;
  width: 247px;
  height: 136px;
  margin-bottom: 8px;
}
.first .text {
  color: #fff;
  font-weight: bold;
}
.first .triangle {
  position: absolute;
  width: 48px;
  height: 48px;
  top: 0;
  left: 0;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png")
    no-repeat;
  padding: 6px;
  font-size: 18px;
}
.first .movietitle {
  position: absolute;
  width: 100%;
  bottom: 0;
  background: rgba(0, 0, 0, 0.4);
  padding: 7px 15px;
  font-size: 14px;
}
.overlaybox ul {
  width: 247px;
}
.overlaybox li {
  position: relative;
  margin-bottom: 2px;
  background: #2b2d36;
  padding: 5px 10px;
  color: #aaabaf;
  line-height: 1;
}
.overlaybox li span {
  display: inline-block;
}
.overlaybox li .number {
  font-size: 16px;
  font-weight: bold;
}
.overlaybox li .title {
  font-size: 13px;
  text-align: left;
}
.overlaybox li .last {
  font-size: 12px;
  margin-right: 15px;
}
.overlaybox ul .arrow {
  position: absolute;
  margin-top: 8px;
  right: 25px;
  width: 5px;
  height: 3px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png")
    no-repeat;
}
.overlaybox li .up {
  background-position: 0 -40px;
}
.overlaybox li .down {
  background-position: 0 -60px;
}
.overlaybox li .count {
  position: absolute;
  margin-top: 5px;
  right: 15px;
  font-size: 10px;
}
.overlaybox li:hover {
  color: #fff;
  background: #d24545;
}
.overlaybox li:hover .up {
  background-position: 0 0px;
}
.overlaybox li:hover .down {
  background-position: 0 -20px;
}
</style>
