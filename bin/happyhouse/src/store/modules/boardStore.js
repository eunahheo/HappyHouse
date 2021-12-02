import http from "@/util/http-common";
const boardStore = {
  namespaced: true,
  state: {
    comments: [],
  },
  getters: {
    comments(state) {
      return state.comments;
    },
  },
  mutations: {
    SET_COMMENTS(state, payload) {
      state.comments = payload;
    },
  },
  actions: {
    getComments({ commit }, payload) {
      console.log("OK");
      http
        .get("/board/comment/" + payload)
        .then(({ data }) => {
          //context.commit("setBook",data);
          commit("SET_COMMENTS", data);
        })
        .catch(() => {
          alert("서평조회: 에러발생!");
        });
    },
  },
};

export default boardStore;
