import BaseService from "@/services/base.service";

class StatisticsService extends BaseService {
    count() {
        return this.http.get(`${this.endpoint}/count`);
    }
}

export default new StatisticsService("/statistics");
