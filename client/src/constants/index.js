export const SERVER_URL = import.meta.env.VITE_BASEURL_API;

export const PERMISSIONS = {
    ADMIN: "Admin",
    STUDENT: "SinhVien",
    TEACHER: "GiangVien",
};

export const keysOfDepartment = [
    {
        value: "default",
        label: "Mặc định",
    },
    {
        value: "math",
        label: "Toán học",
    },
    {
        value: "other",
        label: "Khác",
    },
];

export const KEY_OF_DEPARTMENT = {
    default: "default",
    math: "math",
    other: "other",
};

export const keysOfDepartmentLabel = {
    default: "Mặc định",
    math: "Toán học",
    other: "Khác",
};
