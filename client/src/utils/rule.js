export const rules = {
    // required: (value) => !!value || "Trường này bắt buộc.",
    email: (v) => /.+@.+\..+/.test(v) || "E-mail không hợp lệ",
    min: (min) => (v) => v.length >= min || `Ít nhất ${min} kí tự.`,
    max: (max) => (v) => v.length <= max || `Nhỏ nhất ${max} kí tự.`,
    number: (value) => {
        const pattern = /^[0-9]*$/;
        return pattern.test(value) || "Phải là số.";
    },
    phone: (value) => {
        const pattern = /((0[1|2|3|4|5|6|7|8|9])+([0-9]{8})\b)/g;
        return pattern.test(value) || "Số điện thoại không hợp lệ.";
    },
    match: (compare, message = "Passwords must match") => (value) => value === compare || message,
    time: (value) => {
        const pattern = /^\d{2}:\d{2}$/;
        return pattern.test(value) || "Giờ không hợp lệ.";
    },
    datetime: (value) => {
        const pattern = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/;
        return pattern.test(value) || "Ngày và giờ không hợp lệ.";
    },
    username: (value) => {
        const pattern = /^(?!.*__)[a-zA-Z0-9_]{3,16}$/;
        return pattern.test(value) || "Tài khoản không hợp lệ.";
    },
    description: (value) => {
        const pattern = /^[a-zA-Z0-9\s,'-]*$/;
        return pattern.test(value) || "Mô tả không hợp lệ.";
    },
    content: (value) => {
        const pattern = /^[a-zA-Z0-9\s,'-]*$/;
        return pattern.test(value) || "Nội dung không hợp lệ.";
    },
    title: (value) => {
        const pattern = /^[a-zA-Z0-9\s,'-]*$/;
        return pattern.test(value) || "Tiêu đề không hợp lệ.";
    },
    slug: (value) => {
        const pattern = /^[a-zA-Z0-9\s,'-]*$/;
        return pattern.test(value) || "Slug không hợp lệ.";
    },
};
