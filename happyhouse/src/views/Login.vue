<template>
  <div>
    <h2 style="text-align: center">로그인</h2>
    <div class="modal-body">
      <form
        id="loginform"
        class="form-signin w-50 mx-auto m-5"
        method="post"
        action=""
      >
        <input type="hidden" name="act" id="act" value="login" />
        <label for="userid" class="sr-only">아이디</label>
        <input
          type="text"
          id="userid"
          name="id"
          class="form-control"
          placeholder="아이디"
          required
          autofocus
        />
        <label for="userpass" class="sr-only">비밀번호</label>
        <input
          type="password"
          id="userpass"
          name="pass"
          class="form-control mt-2"
          placeholder="비밀번호"
          required
        />

        <div class="form-group form-check text-right">
          <!-- <label class="form-check-label">
            <input
              class="form-check-input"
              type="checkbox"
              id="idsave"
              name="idsave"
              value="saveok"
            />
            아이디저장
          </label> -->
        </div>

        <!-- <div class="text-danger mb-2">${msg}</div> -->
        <button
          class="btn btn-lg btn-primary btn-block"
          type="button"
          id="loginBtn"
        >
          로그인
        </button>
        <button
          class="btn btn-lg btn-danger btn-block"
          data-dismiss="modal"
          data-toggle="modal"
          href="#newModal"
        >
          회원가입
        </button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
      </form>
    </div>
  </div>
</template>

<script></script>

<style></style>
