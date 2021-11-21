<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>글보기</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listArticle">목록</b-button>
      </b-col>
      <b-col class="text-right">
        <b-button
          variant="outline-info"
          size="sm"
          @click="moveModifyArticle"
          class="mr-2"
          >글수정</b-button
        >
        <b-button variant="outline-danger" size="sm" @click="deleteArticle"
          >글삭제</b-button
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-card
          :header-html="`<h3>${article.articleno}.
          ${article.subject} [${article.hit}]</h3><div><h6>${article.userid}</div><div>${article.regtime}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
    <!-- <div class="regist">
      <div v-if="modifyComment != null" class="regist_form">
        <textarea
          name="comment"
          id="comment"
          v-model="modifyComment.comment"
          cols="35"
          rows="2"
        ></textarea>
        <button class="small" @click="updateCommentCancel">취소</button>
        <button class="small" @click="updateComment">수정</button>
      </div>
      <div v-else class="regist_form">
        <textarea
          name="comment"
          id="comment"
          cols="35"
          v-model="comment"
          rows="2"
        ></textarea>
        <button @click="registComment">등록</button>
      </div>
    </div> -->
    <comment-write :articleno="article.articleno" />
    <comment-write
      v-if="isModifyShow && modifyComment != null"
      :modifyComment="modifyComment"
      @modify-comment-cancel="onModifyCommentCancel"
    />
    <comment
      v-for="(comment, index) in comments"
      :key="index"
      :comment="comment"
      @modify-comment="onModifyComment"
    />
  </b-container>
</template>

<script>
// import moment from "moment";
import { mapGetters, mapActions } from "vuex";
import CommentWrite from "@/components/board/comment/CommentWrite.vue";
import Comment from "@/components/board/comment/Comment.vue";
import moment from "moment";
import http from "@/util/http-common";
const memberStore = "memberStore";
const boardStore = "boardStore";
export default {
  components: { CommentWrite, Comment },

  data() {
    return {
      article: {},
      commentno: 0,
      isModifyShow: false,
      modifyComment: Object,
      comments: {},
    };
  },
  computed: {
    ...mapGetters(memberStore, ["checkUserInfo"]),
    ...mapActions(boardStore, ["getComments"]),
    ...mapGetters(boardStore, ["comments"]),
    message() {
      if (this.article.content)
        return this.article.content.split("\n").join("<br>");
      return "";
    },
  },
  created() {
    http.get(`/board/${this.$route.params.articleno}`).then(({ data }) => {
      this.article = data;
    });
    this.articleno = this.$route.params.articleno;
    // this.getComments(this.articleno);
    http.get(`/board/comment/${this.articleno}`).then(({ data }) => {
      this.comments = data;
    });
    // this.$store.dispatch("getComments", this.articleno);
  },
  methods: {
    onModifyComment(comment) {
      this.isModifyShow = true;
      this.modifyComment = comment;
    },
    onModifyCommentCancel(isShow) {
      this.isModifyShow = isShow;
    },
    enterToBr(str) {
      // 문자열에 enter값을 <br />로 변경.(html상에서 줄바꿈 처리)
      return String(str).replace(/(?:\r\n|\r|\n)/g, "<br />");
    },
    listArticle() {
      this.$router.push({ name: "BoardList" });
    },
    moveModifyArticle() {
      this.$router.replace({
        name: "BoardUpdate",
        params: { articleno: this.article.articleno },
      });
      //   this.$router.push({ path: `/board/modify/${this.article.articleno}` });
    },
    deleteArticle() {
      if (confirm("정말로 삭제?")) {
        this.$router.replace({
          name: "BoardDelete",
          params: { articleno: this.article.articleno },
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
textarea {
  width: 90%;
  font-size: large;
}
button {
  float: right;
}
button.small {
  width: 60px;
  font-size: small;
  font-weight: bold;
}
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
