import { apiInstance } from "./index.js";

const api = apiInstance();

function registerCompany(company, success, fail) {
  api.post(`/company`, JSON.stringify(company)).then(success).catch(fail);
}

function getCompany(companyno, success, fail) {
  api.get(`/company/${companyno}`).then(success).catch(fail);
}

function modifyCompany(company, success, fail) {
  api.put(`/company`, JSON.stringify(company)).then(success).catch(fail);
}

function deleteCompany(companyno, success, fail) {
  api.delete(`/company/${companyno}`).then(success).catch(fail);
}

export { registerCompany, getCompany, modifyCompany, deleteCompany };
