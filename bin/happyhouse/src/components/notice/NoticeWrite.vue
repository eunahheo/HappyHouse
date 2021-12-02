<template>
  <b-container class="bv-example-row mt-3">
    <notice-write-form type="register" />
  </b-container>
</template>

<script>
import NoticeWriteForm from "@/components/notice/child/NoticeWriteForm.vue";

export default {
  name: "NoticeWrite",
  components: {
    NoticeWriteForm,
  },
};
</script>

<style></style>
