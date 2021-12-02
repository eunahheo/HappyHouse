<template>
  <div>
    <h2 style="text-align: center">비밀번호 찾기</h2>
    <form
      class="form-signin mx-auto m-5"
      name="memberform"
      id="memberform"
      action="post"
      @submit="confirm"
      @reset="onReset"
    >
      <input type="hidden" name="act" id="act" value="register" />

      <div class="form-group has-feedback row">
        <label
          for="useridC"
          class="col-md-3 control-label text-md-right col-form-label"
          >아이디
          <span class="text-danger small">*</span>
        </label>
        <div class="col-md-8">
          <input
            type="text"
            class="form-control"
            id="useridC"
            v-model="useridC"
            name="useridC"
            placeholder=""
            required
            value="qweadzs"
            @keyup.enter="confirmIs"
          />
          <i class="fa fa-pencil form-control-feedback pr-4"></i>
        </div>
      </div>

      <div class="form-group has-feedback row">
        <label
          for="usernameC"
          class="col-md-3 control-label text-md-right col-form-label"
          >이름
          <span class="text-danger small">*</span>
        </label>
        <div class="col-md-8">
          <input
            type="text"
            class="form-control"
            id="usernameC"
            v-model="usernameC"
            name="usernameC"
            placeholder="User Name"
          />
          <i class="fa fa-user form-control-feedback pr-4"></i>
        </div>
      </div>
      <div class="form-group has-feedback row">
        <label
          for="emailC"
          class="col-md-3 control-label text-md-right col-form-label"
          >이메일
          <span class="text-danger small">*</span>
        </label>
        <div class="col-md-8">
          <input
            type="text"
            class="form-control"
            v-model="emailC"
            id="emailC"
            name="emailC"
            placeholder="address"
            value="qweadzs@naver.com"
          />
          <i class="fa fa-envelope form-control-feedback pr-4"></i>
        </div>
      </div>

      <b-button @click="confirmC" id="tempoBtn" variant="primary">
        임시 비밀번호 발급
      </b-button>

      <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
    </form>
  </div>
</template>

<script></script>

<style></style>
