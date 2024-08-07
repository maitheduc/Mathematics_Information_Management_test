<script setup>
import { computed, inject, ref } from "vue";
import { ROUTE_PATHS } from "@/constants/route.constant";
import { AuthLocalStorageService } from "@/services/auth.service";
import { getAuth, useGetMe } from "@/hooks/auth.hook";
import { urlImage } from "@/utils";

const drawer = inject("drawer");

const { data, userId } = getAuth();

const links = [
    ["mdi-home", "Dashboard", ROUTE_PATHS.AdminHome],
    ["mdi-account", "Tài khoản", ROUTE_PATHS.AdminAccount(true)],
    ["mdi-email", "Hộp thư", ROUTE_PATHS.AdminMessage(true)],
];

const home = [
    [
        "mdi-checkbox-blank-circle-outline",
        "Giới thiệu",
        ROUTE_PATHS.AdminAbout(true),
    ],
    [
        "mdi-checkbox-blank-circle-outline",
        "Hiển thị",
        ROUTE_PATHS.AdminDisplay(true),
    ],
];

const news = [
    [
        "mdi-checkbox-blank-circle-outline",
        "Loại tin",
        ROUTE_PATHS.AdminCategory(true),
    ],
    [
        "mdi-checkbox-blank-circle-outline",
        "Bài viết",
        ROUTE_PATHS.AdminPost(true),
    ],
];

const personals = [
    [
        "mdi-checkbox-blank-circle-outline",
        "Khoa",
        ROUTE_PATHS.AdminFaculty(true),
    ],
    [
        "mdi-checkbox-blank-circle-outline",
        "Bộ môn",
        ROUTE_PATHS.AdminDepartment(true),
    ],
    [
        "mdi-checkbox-blank-circle-outline",
        "Chuyên ngành",
        ROUTE_PATHS.AdminMajor(true),
    ],
    [
        "mdi-checkbox-blank-circle-outline",
        "Nhân sự",
        ROUTE_PATHS.AdminPersonnel(true),
    ],
];
</script>

<template>
    <v-navigation-drawer class="mt-5 navigation" :rail="drawer">
        <v-sheet v-if="!drawer" class="nav-content pa-4">
            <v-avatar size="50" class="mr-4 ml-1">
                <v-img
                    :src="
                        data?.image
                            ? urlImage(data?.image, 'avatar')
                            : '/assets/avatar.jpg'
                    "
                ></v-img>
            </v-avatar>

            <div>
                <div>{{ data?.viewname }}</div>
                <div>Admin</div>
            </div>
        </v-sheet>

        <v-sheet v-else class="nav-content my-4">
            <v-avatar size="42" class="ml-2">
                <v-img
                    :src="
                        data?.image
                            ? urlImage(data?.image, 'avatar')
                            : '/assets/avatar.jpg'
                    "
                ></v-img>
            </v-avatar>
        </v-sheet>

        <v-divider></v-divider>

        <v-list density="compact" nav>
            <v-list-item
                v-for="[icon, text, to] in links"
                :key="icon"
                link
                :to="to"
                :prepend-icon="icon"
                :title="text"
                :value="to"
                exact
            ></v-list-item>

            <v-list-group value="home">
                <template v-slot:activator="{ props }">
                    <v-list-item
                        v-bind="props"
                        prepend-icon="mdi-laptop"
                        title="Trang chủ"
                        value="Trang chủ"
                    >
                    </v-list-item>
                </template>

                <v-list-item
                    class="fs-14"
                    v-for="([icon, title, to], i) in home"
                    :key="i"
                    :value="title"
                    :to="to"
                    :prepend-icon="icon"
                    :title="title"
                >
                </v-list-item>
            </v-list-group>

            <v-list-group value="news">
                <template v-slot:activator="{ props }">
                    <v-list-item
                        v-bind="props"
                        prepend-icon="mdi-pencil-box-outline"
                        title="Tin tức"
                        value="Tin tức"
                    >
                    </v-list-item>
                </template>

                <v-list-item
                    class="fs-14"
                    v-for="([icon, title, to], i) in news"
                    :key="i"
                    :value="title"
                    :to="to"
                    :prepend-icon="icon"
                    :title="title"
                >
                </v-list-item>
            </v-list-group>

            <v-list-group value="personals">
                <template v-slot:activator="{ props }">
                    <v-list-item
                        v-bind="props"
                        prepend-icon="mdi-account-group"
                        title="Nhân sự"
                        value="Nhân sự"
                    >
                    </v-list-item>
                </template>

                <v-list-item
                    class="fs-14"
                    v-for="([icon, title, to], i) in personals"
                    :key="i"
                    :value="title"
                    :to="to"
                    :prepend-icon="icon"
                    :title="title"
                >
                </v-list-item>
            </v-list-group>
        </v-list>
    </v-navigation-drawer>
</template>

<style lang="css" scoped>
.navigation {
    background-color: var(--primary);
    color: var(--white);
}

.nav-content {
    display: flex;
    flex-direction: row;
    align-items: center;
    background-color: var(--primary);
    color: var(--white);
    transition: all 0.3s ease;
}

.nav-content div {
    font-size: 14px;
}

.v-list-group__items .v-list-item {
    padding: 0 16px !important;
}

.v-list-item-title {
    font-size: 14px !important;
}
</style>
