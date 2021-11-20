<template>
	<div class="regist">
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
	</div>
</template>

<script>
	import http from "@/util/http-common.js";
	export default {
		props: {
			isbn: String,
			modifyComment: Object,
		},
		data() {
			return {
				// 차후 작성자 이름은 로그인 구현후 로그인한 사용자로 바꾼다.
				user_name: "오싸피",
				comment: "",
			};
		},

		methods: {
			registComment() {
				http
					.post("/comment", {
						user_name: this.user_name,
						comment: this.comment,
						isbn: this.isbn,
					})
					.then(({ data }) => {
						let msg = "등록 처리시 문제가 발생했습니다.";
						if (data === "success") {
							msg = "등록이 완료되었습니다.";
						}
						alert(msg);
						this.comment = "";
						this.$store.dispatch("getComments", this.isbn);
					});
			},
			updateComment() {
				http
					.put(`/comment`, {
						comment_no: this.modifyComment.comment_no,
						comment: this.modifyComment.comment,
					})
					.then(({ data }) => {
						let msg = "수정 처리시 문제가 발생했습니다.";
						if (data === "success") {
							msg = "수정이 완료되었습니다.";
						}
						alert(msg);
						this.$store.dispatch("getComments", this.modifyComment.isbn);
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
	}
	button.small {
		width: 60px;
		font-size: small;
		font-weight: bold;
	}
</style>
