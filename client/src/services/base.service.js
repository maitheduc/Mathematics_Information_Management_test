import http from "@/libs/http.lib";
import { mapParamsToQuery, mapParamsToValues } from "@/utils";

class BaseService {
    constructor(endpoint) {
        this.endpoint = endpoint;
    }

    get(params = {}) {
        return http.get(this.endpoint, { params: mapParamsToQuery(params) });
    }

    getById(id, params = {}) {
        return http.get(`${this.endpoint}/${mapParamsToValues(id)}`, {
            params: mapParamsToQuery(params),
        });
    }

    post(data) {
        return http.post(this.endpoint, data);
    }

    put(id, data) {
        return http.put(`${this.endpoint}/${mapParamsToValues(id)}`, data);
    }

    delete(id) {
        return http.delete(`${this.endpoint}/${mapParamsToValues(id)}`);
    }

    patch(id, data) {
        return http.patch(`${this.endpoint}/${mapParamsToValues(id)}`, data);
    }

    get http() {
        return http;
    }
}

export default BaseService;
