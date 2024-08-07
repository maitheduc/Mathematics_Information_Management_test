import BaseService from "@/services/base.service";

class MailboxService extends BaseService {
    getCount() {
        return this.http.get(`${this.endpoint}/get/count`);
    }
}

export default new MailboxService("/mailbox");
