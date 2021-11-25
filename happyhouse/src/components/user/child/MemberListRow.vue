<template>
  <b-tr>
    <b-td>{{ userid }}</b-td>
    <b-td>{{ username }}</b-td>
    <b-td>{{ email }}</b-td>
    <b-td>{{ joindate }}</b-td>
  </b-tr>
</template>

<script>
export default {
  name: "MemberListRow",
  props: {
    userid: String,
    username: String,
    email: String,
    joindate: String,
  },
  computed: {
    // changeDateFormat() {
    //   return moment(new Date(this.regtime)).format("YY.MM.DD hh:mm:ss");
    // },
  },
};
</script>

<style></style>

<style></style>
