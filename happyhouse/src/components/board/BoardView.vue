<template>
  <b-container class="bv-example-row mt-3">
    <b-row class="mb-1">
      <div class="text-left">
        <b-col>
          <a variant="outline-primary" class="btn-buy" @click="listArticle"
            >목록</a
          >
        </b-col>
      </div>
      <b-col class="text-right" v-show="userInfo.userid === article.userid">
        <a
          variant="outline-info"
          size="sm"
          @click="moveModifyArticle"
          class="btn-buy"
          >글수정</a
        >
        <a
          variant="outline-danger"
          class="btn-buy"
          size="sm"
          @click="deleteArticle"
          >글삭제</a
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th
                style="font-size: 27px"
                :header-html="`<h3>${article.articleno}.
          ${article.subject} [${article.hit}]</h3><div><h6>${article.userid}</div><div>${article.regtime}</h6></div>`"
                >{{ article.articleno }}. {{ article.subject }} [{{
                  article.hit
                }}] <br />
              </b-th> </b-tr
            ><b-tr style="text-align: right"
              >작성자 : {{ article.userid }} | 작성시간 :
              {{ article.regtime }}</b-tr
            >
            <hr />
            <b-tr v-html="message" style="font-size: 20px; text-align: left">
            </b-tr>
          </b-thead>
        </b-table-simple>
      </b-col>
    </b-row>

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
import { mapGetters, mapState } from "vuex";
import CommentWrite from "@/components/board/comment/CommentWrite.vue";
import Comment from "@/components/board/comment/Comment.vue";
import moment from "moment";
import http from "@/util/http-common";
const memberStore = "memberStore";

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
    ...mapGetters(memberStore, ["checkUserInfo", "userInfo"]),
    ...mapState(memberStore, ["userInfo"]),
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
  watch: {
    comments: function () {},
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
  border-color: black;
  background-color: #dce1e920;
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
