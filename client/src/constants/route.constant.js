

export const ROUTE_PATHS = {
    Home: "/",
    Profile: "/profile",
    News: "news",
    About: "/about",
    Research: "/research",
    Field: "/research/field",
    Personnel: "/personnel",
    Math: "/math",
    MathList: "/math/list",
    MathTrains: "/math/trains",
    MathAfter: "/math/after-graduate",
    MathCuNhan: "/math/cu-nhan",
    MathTaiNang: "/math/cu-nhan-tai-nang",
    TSDaiHoc: "/tuyensinh/daihoc",
    TSPhapViet:"/tuyensinh/tuyensinhtoanungdungphapviet",
    TSSauDH:"/tuuyensinh/saudaihoc",
    News: "/news",
    AdminHome: "/admin",
    FacultyPage: "/faculty",
    DepartmentPage: "/department",
    AdminCategory: (isRedirect) => (!isRedirect ? "category" : "/admin/category"),
    AdminMajor: (isRedirect) => (!isRedirect ? "major" : "/admin/major"),
    AdminPost: (isRedirect) => (!isRedirect ? "post" : "/admin/post"),
    AdminAbout: (isRedirect) => (!isRedirect ? "about" : "/admin/about"),
    AdminDisplay: (isRedirect) => (!isRedirect ? "display" : "/admin/display"),
    AdminAccount: (isRedirect) => (!isRedirect ? "account" : "/admin/account"),
    AdminMessage: (isRedirect) => (!isRedirect ? "message" : "/admin/message"),
    AdminDepartment: (isRedirect) => (!isRedirect ? "department" : "/admin/department"),
    AdminPersonnel: (isRedirect) => (!isRedirect ? "personnel" : "/admin/personnel"),
    AdminFaculty: (isRedirect) => (!isRedirect ? "faculty" : "/admin/faculty"),
};

export const routesNavigation = [
    {
        name: "Trang chủ",
        path: ROUTE_PATHS.Home,
    },
    {
        name: "Trang giới thiệu",
        path: ROUTE_PATHS.About,
    },
    {
        name: "Trang nhân sự",
        path: ROUTE_PATHS.Personnel,
    },
  
    {
        name: "Trang đào tạo",
        path: ROUTE_PATHS.Math,
    },
    {
        name: "Trang đào tạo đại học",
        path: ROUTE_PATHS.MathTrains,
    },
    {
        name: "Trang đào tạo sau đại học",
        path: ROUTE_PATHS.MathAfter,
    },
    {
        name: "Trang đào tạo cử nhân",
        path: ROUTE_PATHS.MathCuNhan,
    },
    {
        name: "Trang đào tạo cử nhân tài năng",
        path: ROUTE_PATHS.MathTaiNang,
    },
    
    {
        name: "Trang bộ môn",
        path: ROUTE_PATHS.DepartmentPage,
    },
    {
        name: "Trang tin tức",
        path: ROUTE_PATHS.News,
    },
    {
        name: "Trang nguyên cứu",
        path: ROUTE_PATHS.Research,
    },
    {
        name: "Trang lĩnh vự",
        path: ROUTE_PATHS.Field,
    },
    {
        name: "Trang tuyển sinh Đại học",
        path: ROUTE_PATHS.TSDaiHoc,
    },
    {
        name: "Trang tuyển sinh TUD Pháp Việt",
        path: ROUTE_PATHS.TSPhapViet,
    },
    {
        name: "Trang tuyển sinh sau Đại học",
        path: ROUTE_PATHS.TSSauDH,
    },
   
];

export const routeLabel = {
    [ROUTE_PATHS.Home]: "Trang chủ",
    [ROUTE_PATHS.About]: "Trang giờ thiệu",
    [ROUTE_PATHS.Personnel]: "Trang nhân sự",
    [ROUTE_PATHS.Math]: "Trang toán học",
    [ROUTE_PATHS.News]: "Trang tin tức",
    [ROUTE_PATHS.Research]: "Trang nguyên cứu",
    [ROUTE_PATHS.Field]: "Trang lịch về",
    
};
