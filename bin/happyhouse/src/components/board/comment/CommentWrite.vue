<template>
  <div class="regist">
    <div
      v-if="modifyComment != null"
      class="regist_form"
      style="text-align: left"
    >
      <textarea
        name="comment"
        id="comment"
        v-model="modifyComment.comment"
        cols="30"
        rows="2"
      ></textarea>
      <a class="btn-buy" @click="updateCommentCancel"> 취소 </a>
      <a class="btn-buy" @click="updateComment">수정</a>
    </div>
    <div v-else class="regist_form" style="text-align: left">
      <textarea
        name="comment"
        id="comment"
        cols="30"
        v-model="comment"
        rows="2"
      ></textarea>
      <a class="btn-buy" @click="registComment">등록</a>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import http from "@/util/http-common.js";
const memberStore = "memberStore";
export default {
  props: {
    articleno: Number,
    modifyComment: Object,
  },
  computed: {
    ...mapGetters(memberStore, ["checkUserInfo"]),
  },
  data() {
    return {
      // 차후 작성자 이름은 로그인 구현후 로그인한 사용자로 바꾼다.
      userid: "",
      comment: "",
    };
  },
  methods: {
    registComment() {
      http
        .post("/board/comment", {
          userid: this.checkUserInfo.userid,
          comment: this.comment,
          commentno: this.commentno,
          articleno: this.articleno,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.comment = "";
          //this.$store.dispatch("getComments", this.commentno);
        });
    },
    updateComment() {
      http
        .put(`/board/comment`, {
          commentno: this.modifyComment.commentno,
          comment: this.modifyComment.comment,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          http.get(`/board/comment/${this.articleno}`).then(({ data }) => {
            this.comments = data;
          });
          this.updateCommentCancel();
        });
    },
    updateCommentCancel() {
      this.$emit("modify-comment-cancel", false);
    },
  },
};
</script>

<style scoped>
textarea {
  width: 90%;
  font-size: large;
}
button {
  float: right;
  width: 100px;
  height: 60px;
}
button.small {
  width: 50px;
  font-size: small;
  font-weight: bold;
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
