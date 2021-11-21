<template>
  <div v-show="isShow" class="comment">
    <div class="head">
      {{ comment.userid }} ({{ getFormatDate(comment.commenttime) }})
    </div>
    <div class="content" v-html="enterToBr(comment.comment)"></div>
    <!-- 로그인 기능 구현 후 로그인한 자신의 글에만 보이게 한다. -->
    <div class="cbtn">
      <label @click="modifyCommentView">수정</label> |
      <label @click="deleteComment">삭제</label>
    </div>
  </div>
</template>

<script>
import http from "@/util/http-common.js";
import moment from "moment";

export default {
  props: {
    comment: Object,
  },
  data() {
    return {
      isShow: true,
    };
  },
  updated() {
    http.get(`/board/comment/${this.articleno}`).then(({ data }) => {
      this.comments = data;
    });
  },
  methods: {
    modifyCommentView() {
      this.$emit("modify-comment", {
        commentno: this.comment.commentno,
        userid: this.comment.userid,
        comment: this.comment.comment,
        articleno: this.comment.articleno,
      });
    },
    enterToBr(str) {
      // 문자열에 enter값을 <br />로 변경.(html상에서 줄바꿈 처리)
      return String(str).replace(/(?:\r\n|\r|\n)/g, "<br />");
    },
    deleteComment() {
      if (confirm("삭제할까요?")) {
        http
          .delete(`/board/comment/${this.comment.commentno}`)
          .then(({ data }) => {
            let msg = "삭제 처리시 문제가 발생했습니다.";
            if (data === "success") {
              msg = "삭제가 완료되었습니다.";
            }
            alert(msg);
          });
      }
    },
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format("YYYY-MM-DD HH:mm:ss");
    },
  },
};
</script>

<style scoped>
.comment {
  text-align: left;
  border-radius: 5px;
  background-color: #d6e7fa;
  padding: 10px 20px;
  margin: 10px;
}
.head {
  font-weight: bold;
  margin-bottom: 5px;
}
.content {
  padding: 5px;
}
.cbtn {
  text-align: right;
  color: steelblue;
  margin: 5px 0px;
}
</style>
