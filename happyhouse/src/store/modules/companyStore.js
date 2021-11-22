// import http from "@/util/http-common";
const companyStore = {
  namespaced: true,
  state: {
    company: null,
  },
  getters: {
    getCompany(state) {
      return state.company;
    },
  },

  mutations: {
    SET_COMPANY_INFO: (state, company) => {
      state.company = company;
    },
  },

  // methods: {
  //   unLoadEvent: function (event) {
  //     if (this.canLeaveSite) return;

  //     event.preventDefault();
  //     event.returnValue = "";
  //   },
  // },
  actions: {
    getCompanyInfo({ commit }, companyno) {
      const params = {
        companyno: companyno,
      };
      getCompany(
        params,
        ({ data }) => {
          console.log(data);
          commit("GET_COMPANY", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
};

export default companyStore;
