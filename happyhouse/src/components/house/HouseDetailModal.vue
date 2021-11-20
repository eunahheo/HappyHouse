<template>
  <b-modal id="modal-center" centered title="BootstrapVue">
    <p class="my-4">{{ house.aptName }}</p>
  </b-modal>
</template>

<script>
export default {
  name: "HouseDetailModal",
  components: {
    HouseListRow,
  },
  computed: {
    ...mapState(houseStore, ["house"]),
    // house() {
    //   return this.$store.state.house;
    // },
  },
};
</script>

<style></style>
