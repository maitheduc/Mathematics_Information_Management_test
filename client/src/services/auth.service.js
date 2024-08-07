import BaseService from "@/services/base.service";

class AuthService extends BaseService {
    login(payload) {
        return this.http.post(`${this.endpoint}/login`, payload);
    }
}

export class AuthLocalStorageService {
    static setAuth(userId) {
        localStorage.setItem("user_id", userId);
    }

    static getAuth() {
        const userId = localStorage.getItem("user_id");

        return userId ?? null;
    }

    static removeAuth() {
        localStorage.removeItem("user_id");
    }
}

export default new AuthService("/auth");
