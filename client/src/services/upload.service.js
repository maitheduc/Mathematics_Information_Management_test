import BaseService from "@/services/base.service";

class UploadService extends BaseService {
    uploadFile(file, folder = "user/images/about") {
        const formData = new FormData();

        formData.append("file", file);
        formData.append("folder", folder);

        return this.http.post(`${this.endpoint}/file`, formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        });
    }

    uploadFiles(files) {
        const formData = new FormData();

        files.forEach((file) => {
            formData.append("files", file);
        });

        return this.http.post(`${this.endpoint}/files`, formData, {
            headers: {
                "Content-Type": "multipart/form-data",
            },
        });
    }
}

export default new UploadService("/upload");
