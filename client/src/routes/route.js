import { PERMISSIONS } from "@/constants";
import { useGetMe } from "@/hooks/auth.hook";
import { AuthLocalStorageService } from "@/services/auth.service";
import NProgress from "nprogress";
import { createRouter, createWebHistory, RouterView } from "vue-router";
import { ROUTE_PATHS } from "../constants/route.constant";


// VIEW IMPORT LAYOUT
const AdminLayout = () => import("@/components/layouts/AdminLayout.vue");
const ClientLayout = () => import("@/components/layouts/ClientLayout.vue");

// VIEW IMPORT FOR CUSTOMER
const AboutView = () => import("@/views/AboutView");
const MathListView = () => import("@/views/MathView/MathListView.vue");
const MathTrainsView = () => import("@/views/MathView/MathTrainsView.vue");
const MathAfterView =() => import("@/views/MathView/MathAfterView.vue");
const CuNhanView = () => import("@/views/MathView/CuNhanView.vue");
const TaiNangView = () => import("@/views/MathView/TaiNangView.vue");
const MathDetailsView = () => import("@/views/MathView/MathDetailsView.vue");
const TSDaiHocView = () => import("@/views/TuyenSinhView/TSDaiHocView.vue");
const TSPhapViet =() => import("@/views/TuyenSinhView/TSPhapViet.vue");
const TSSauDaiHocView =() => import("@/views/TuyenSinhView/TSSauDaiHocView.vue");
const ResearchView = () => import("@/views/ResearchView");
const FieldView = () => import("@/views/ResearchView/FieldView.vue");
const FacultyDetailsView = () => import("@/views/FacultyDetailsView");
const DepartmentDetailsView = () => import("@/views/DepartmentDetailsView");
const PersonnelView = () => import("@/views/PersonnelView");
const PersonnelDetailView = () => import("@/views/PersonnelView/PersonnelDetailView.vue");
const HomeView = () => import("@/views/HomeView");
const NewView = () => import("@/views/NewView");
const NewDetailView = () => import("@/views/NewView/NewDetailView.vue");
const NotFoundView = () => import("@/views/NotFoundView");
const ProfileView = () => import("@/views/ProfileView");
const MathView = () => import("@/views/MathView");


// VIEW IMPORT FOR AUTH
const LoginView = () => import("@/views/auth/LoginView");

// VIEW IMPORT FOR ADMIN
const AdminHomeView = () => import("@/views/admin/HomeView");
const AdminAboutView = () => import("@/views/admin/AboutView");
const AdminDisplayView = () => import("@/views/admin/DisplayView");
const AdminCategoryView = () => import("@/views/admin/CategoryView");
const AdminPostView = () => import("@/views/admin/PostView");
const AddEditPost = () => import("@/views/admin/PostView/AddEditPost.vue");
const AdminAccountView = () => import("@/views/admin/AccountView");
const AddEditAccount = () => import("@/views/admin/AccountView/AddEditAccount.vue");
const AdminMessageView = () => import("@/views/admin/MessageView");
const AddEditCategory = () => import("@/views/admin/CategoryView/AddEditCategory.vue");
const AdminPersonnelView = () => import("@/views/admin/PersonalView");
const AdminFacultyView = () => import("@/views/admin/FacultyView");
const AdminDepartmentView = () => import("@/views/admin/DepartmentView");
const AdminAddEditDepartmentView = () =>
    import("@/views/admin/DepartmentView/AddEditDepartment.vue");
const AdminAddEditPersonnelView = () => import("@/views/admin/PersonalView/AddEditPersonnel.vue");
const AdminAddEditFacultyView = () => import("@/views/admin/FacultyView/AddEditFaculty.vue");
const AdminMajorView = () => import("@/views/admin/MajorView");
const AdminAddEditMajorView = () => import("@/views/admin/MajorView/AddEditMajor.vue");

/**
 * @type {import("vue-router").RouteRecordRaw}
 */
const routes = [
    {
        path: ROUTE_PATHS.Home,
        component: ClientLayout,
        children: [
            {
                path: ROUTE_PATHS.Home,
                component: HomeView,
                meta: { title: "Trang chủ" },
            },
            {
                path: ROUTE_PATHS.Profile,
                component: ProfileView,
                name: "profile",
                meta: {
                    title: "Trang cá nhân",
                    requiresAuth: true,
                    permissions: [PERMISSIONS.STUDENT, PERMISSIONS.TEACHER, PERMISSIONS.ADMIN],
                },
            },
            {
                path: ROUTE_PATHS.About,
                component: AboutView,
                meta: { title: "Giới thiệu" },
            },
            {
                path: ROUTE_PATHS.MathList,
                component: MathListView,
                meta: { title: "Syllabus toán học" },
            },
            {
                path: ROUTE_PATHS.MathTrains,
                component: MathTrainsView,
                meta: { title: "Đào tạo đại học" },
            },
            {
                path: ROUTE_PATHS.MathAfter,
                component: MathAfterView,
                meta: { title: "Đào tạo sau đại học" },
            },
            {
                path: ROUTE_PATHS.MathCuNhan,
                component: CuNhanView,
                meta: { title: "Đào tạo cử nhân" },
            },
            {
                path: ROUTE_PATHS.MathTaiNang,
                component: TaiNangView,
                meta: { title: "Đào tạo cử nhân tài năng" },
            },
            {
                path: ROUTE_PATHS.TSDaiHoc,
                component: TSDaiHocView,
                meta: { title: "Tuyển sinh đại học" },
            },
            {
                path: ROUTE_PATHS.TSPhapViet,
                component: TSPhapViet,
                meta: { title: "Tuyển sinh TUD Pháp Việt" },
            },
            {
                path: ROUTE_PATHS.TSSauDH,
                component: TSSauDaiHocView,
                meta: { title: "Tuyển sinh Sau đại học" },
            },
             
            {
                path: ROUTE_PATHS.Math,
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: MathView,
                        meta: { title: "Trang toán học" },
                    },
                 
                    {
                        path: ":id",
                        name: "math_details",
                        component: MathDetailsView,
                        meta: { title: "Chi tiết toán học" },
                    },

                ],
            },
            {
                path: ROUTE_PATHS.Research,
                component: ResearchView,
                meta: { title: "Nghiên cứu" },
            },
            {
                path: ROUTE_PATHS.Field,
                component: FieldView,
                meta: { title: "Lĩnh vực" },
            },
            {
                path: ROUTE_PATHS.FacultyPage + "/:id",
                name: "faculty_details",
                component: FacultyDetailsView,
                meta: { title: "Chi tiết khoa" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.DepartmentPage + "/:id",
                name: "department_details",
                component: DepartmentDetailsView,
                meta: { title: "Chi tiết bộ môn" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.Personnel,
                component: PersonnelView,
                meta: { title: "Nhân sự" },
            },
            {
                path: ROUTE_PATHS.Personnel + "/detail/:id",
                name: "person_details",
                component: PersonnelDetailView,
                meta: { title: "Nhân sự chi tiết" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.News,
                component: NewView,
                meta: { title: "Tin Tức" },
            },
            {
                path: ROUTE_PATHS.News + "/detail/:id",
                name: "news_details",
                component: NewDetailView,
                meta: { title: "Tin Tức chi tiết" },
                sensitive: true,
            },
        ],
    },
    {
        path: "/auth",
        children: [
            {
                path: "login",
                component: LoginView,
                name: "login",
                meta: { title: "Đăng nhập" },
            },
        ],
    },
    {
        path: ROUTE_PATHS.AdminHome,
        component: AdminLayout,
        meta: {
            requiresAuth: true,
            permissions: [PERMISSIONS.ADMIN],
        },
        children: [
            {
                path: ROUTE_PATHS.AdminHome,
                component: AdminHomeView,
                name: "dashboard",
                meta: { title: "Dashboard" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.AdminAbout(),
                component: AdminAboutView,
                meta: { title: "Giới thiệu" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.AdminDisplay(),
                component: AdminDisplayView,
                meta: { title: "Hiển thị" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.AdminCategory(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminCategoryView,
                        name: "category",
                        meta: { title: "Loại tin" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AddEditCategory,
                        name: "category_create",
                        meta: { title: "Thêm loại tin" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AddEditCategory,
                        name: "category_edit",
                        meta: { title: "Cập nhật loại tin" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminMajor(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminMajorView,
                        name: "major",
                        meta: { title: "Chuyên ngành" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AdminAddEditMajorView,
                        name: "major_create",
                        meta: { title: "Thêm chuyên ngành" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AdminAddEditMajorView,
                        name: "major_edit",
                        meta: { title: "Cập nhật chuyên ngành" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminPost(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminPostView,
                        name: "post",
                        meta: { title: "Bài viết" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AddEditPost,
                        name: "post_create",
                        meta: { title: "Thêm bài viết" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AddEditPost,
                        name: "post_edit",
                        meta: { title: "Sửa bài viết" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminAccount(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminAccountView,
                        name: "account",
                        meta: { title: "Tài khoản" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AddEditAccount,
                        name: "account_create",
                        meta: { title: "Thêm tài khoản" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AddEditAccount,
                        name: "account_edit",
                        meta: { title: "Cập nhật tài khoản" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminMessage(),
                component: AdminMessageView,
                meta: { title: "Hộp thư" },
                sensitive: true,
            },
            {
                path: ROUTE_PATHS.AdminPersonnel(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminPersonnelView,
                        name: "personnel",
                        meta: { title: "Nhân sự" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AdminAddEditPersonnelView,
                        name: "add_personnel",
                        meta: { title: "Thêm nhân sự" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AdminAddEditPersonnelView,
                        name: "edit_personnel",
                        meta: { title: "Cập nhật nhân sự" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminDepartment(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminDepartmentView,
                        name: "department",
                        meta: { title: "Bộ môn" },
                        sensitive: true,
                    },
                    {
                        path: "add",
                        component: AdminAddEditDepartmentView,
                        name: "add_department",
                        meta: { title: "Thêm bộ môn" },
                        sensitive: true,
                    },
                    {
                        path: "edit/:id",
                        component: AdminAddEditDepartmentView,
                        name: "edit_department",
                        meta: { title: "Cập nhật bộ môn" },
                        sensitive: true,
                    },
                ],
            },
            {
                path: ROUTE_PATHS.AdminFaculty(),
                component: RouterView,
                children: [
                    {
                        path: "",
                        component: AdminFacultyView,
                        name: "faculty",
                        meta: { title: "Khoa" },
                        sensitive: true,
                    },
                    // {
                    //     path: "add",
                    //     component: AdminAddEditFacultyView,
                    //     name: "add_faculty",
                    //     meta: { title: "Thêm khoa" },
                    //     sensitive: true,
                    // },
                    {
                        path: "edit/:id",
                        component: AdminAddEditFacultyView,
                        name: "edit_faculty",
                        meta: { title: "Cập nhật khoa" },
                        sensitive: true,
                    },
                ],
            },
        ],
    },
    { path: "/:pathMatch(.*)*", component: NotFoundView },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior: (to, from) => {
        if (to.hash) {
            return {
                el: to.hash,
                behavior: "smooth",
            };
        }
    },
});

router.beforeEach(async (to, from, next) => {
    NProgress.start();
    window.scrollTo(0, 0);

    const userId = AuthLocalStorageService.getAuth();

    const { data } = useGetMe({
        userId,
        enabled: Boolean(userId),
        select: (data) => data?.metadata,
    });

    // await sleep();

    if (from.name === "login") {
        return next();
    }

    if (to.name === "login") {
        if (userId) {
            if (data.value && data.value?.permission === PERMISSIONS.ADMIN)
                return next({ name: "dashboard" });
            else {
                return next({ path: "/" });
            }
        }

        return next();
    }

    if (to.meta?.requiresAuth) {
        if (!userId) {
            return next({ name: "login" });
        } else if (to.meta?.permissions) {
            if (to.meta?.permissions?.includes(data.value?.permission)) {
                return next();
            } else {
                return next({ path: "/" });
            }
        } else {
            return next();
        }
    }

    if (to.meta?.permissions) {
        if (to.meta?.permissions?.includes(data.value?.permission)) {
            return next();
        } else {
            return next({ path: "/" });
        }
    }

    next();
});

router.beforeEach((to, from, next) => {
    document.title = `${to.meta?.title || ""} | KhoaLuan`;

    next();
});

router.afterEach((to) => {
    NProgress.done();
});

export default router;
