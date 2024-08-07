import BaseService from "@/services/base.service";

class CategoryService extends BaseService {
    sortPriority(payload) {
        return this.http.post("/categories/sort/priority", payload);
    }

    changeDisplay(payload) {
        return this.http.post("/categories/change/display", payload);
    }
}

export default new CategoryService("/categories");
