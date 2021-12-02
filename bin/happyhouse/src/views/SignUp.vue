<template>
  <!-- 회원가입 모달 만들기 -->
  <div style="margin-top: 100px">
    <h2 class="modal-title" style="text-align: center">회원가입</h2>

    <div class="modal-body">
      <form
        class="form-signin w-50 mx-auto m-5"
        name="memberform"
        id="memberform"
        method="post"
        action=""
      >
        <input type="hidden" name="act" id="act" value="register" />

        <div class="form-group has-feedback row">
          <label
            for="id"
            class="col-md-3 control-label text-md-right col-form-label"
            >아이디
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="id"
              name="id"
              placeholder=""
              required
              value="qweadzs"
            />
            <i class="fa fa-pencil form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="pass"
            class="col-md-3 control-label text-md-right col-form-label"
            >비밀번호
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="pass"
              placeholder="영문 숫자 포함 6자리 이상"
              required
              name="pass"
              value="ehfkdl7"
            />
            <i class="fa fa-pencil form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="name"
            class="col-md-3 control-label text-md-right col-form-label"
            >이름
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="name"
              name="name"
              placeholder="User Name"
              value="오지영"
            />
            <i class="fa fa-user form-control-feedback pr-4"></i>
          </div>
        </div>
        <div class="form-group has-feedback row">
          <label
            for="email"
            class="col-md-3 control-label text-md-right col-form-label"
            >이메일
            <span class="text-danger small">*</span>
          </label>
          <div class="col-md-8">
            <input
              type="text"
              class="form-control"
              id="email"
              name="email"
              placeholder="address"
              value="qweadzs@naver.com"
            />
            <i class="fa fa-envelope form-control-feedback pr-4"></i>
          </div>
        </div>

        <button
          type="button"
          id="registerBtn1"
          class="btn btn-lg btn-primary btn-block"
        >
          회원가입
        </button>
        <button class="btn btn-lg btn-secondary btn-block" data-dismiss="modal">
          취소
        </button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
      </form>
    </div>
  </div>

  <!-- <c:if test="${cookie.ssafy_id.value ne null}">
    <c:set var="idck" value=" checked" />
    <c:set var="saveid" value="${cookie.ssafy_id.value}" />
  </c:if> -->
</template>

<script></script>

<style></style>
