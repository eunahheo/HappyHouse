package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "CommentBoardDto : 도서 상세정보에 작성하는 도서평에 대한 글정보")
public class CommentBoardDto {

	@ApiModelProperty(value = "댓글번호")
	private int commentno;
	@ApiModelProperty(value = "댓글작성자아이디")
	private String userid;
	@ApiModelProperty(value = "댓글")
	private String comment;
	@ApiModelProperty(value = "작성시각")
	private String commenttime;
	@ApiModelProperty(value = "게실글번호", example = "1")
	private String articleno;

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(String commenttime) {
		this.commenttime = commenttime;
	}

	public String getArticleno() {
		return articleno;
	}

	public void setArticleno(String articleno) {
		this.articleno = articleno;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentBoardDto [commentno=").append(commentno).append(", userid=").append(userid)
				.append(", comment=").append(comment).append(", commenttime=").append(commenttime)
				.append(", articleno=").append(articleno).append("]");
		return builder.toString();
	}

}
