<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import { useGetStatisticsCount } from "@/hooks/statistics.hook";
import { ref, watchEffect } from "vue";

const { data, isLoading } = useGetStatisticsCount();

const stats = ref([
    { icon: "mdi-account-group", title: "USERS", value: 5, color: "bg-teal" },
    { icon: "mdi-account-tie", title: "ADMIN", value: 25, color: "bg-cyan" },
    {
        icon: "mdi-file-document",
        title: "BÀI VIẾT",
        value: 10,
        color: "bg-yellow",
    },
    { icon: "mdi-comment", title: "BÌNH LUẬN", value: 500, color: "bg-red" },
]);

watchEffect(() => {
    if (data.value) {
        const { userAdminCounter, userCounter, postCounter, commentCounter } =
            data.value;

        stats.value = [
            {
                icon: "mdi-account-group",
                title: "USERS",
                value: userCounter,
                color: "bg-teal",
            },
            {
                icon: "mdi-account-tie",
                title: "ADMIN",
                value: userAdminCounter,
                color: "bg-cyan",
            },
            {
                icon: "mdi-file-document",
                title: "BÀI VIẾT",
                value: postCounter,
                color: "bg-yellow",
            },
            {
                icon: "mdi-comment",
                title: "BÌNH LUẬN",
                value: commentCounter,
                color: "bg-red",
            },
        ];
    }
});
</script>

<template>
    <MainTop
        title="Hệ thống"
        sub="Thống kê hệ thống quản trị Khoa Tin Học - ĐHQG TPHCM"
        icon="mdi-view-dashboard"
    />

    <v-row v-if="isLoading" class="mx-30 pa-0">
        <v-col cols="3">
            <v-skeleton-loader type="card"></v-skeleton-loader>
        </v-col>
        <v-col cols="3">
            <v-skeleton-loader type="card"></v-skeleton-loader>
        </v-col>
        <v-col cols="3">
            <v-skeleton-loader type="card"></v-skeleton-loader>
        </v-col>
        <v-col cols="3">
            <v-skeleton-loader type="card"></v-skeleton-loader>
        </v-col>
    </v-row>

    <v-row v-else class="mx-30 pa-0">
        <v-col cols="3" v-for="stat in stats" :key="stat.title">
            <v-card class="pa-0 das-card" outlined>
                <v-row class="flex align-center">
                    <v-col cols="4" :class="stat.color" class="pa-0">
                        <div class="das-btn">
                            <v-icon class="" size="48">{{ stat.icon }}</v-icon>
                        </div>
                    </v-col>
                    <v-col cols="8">
                        <div>{{ stat.title }}</div>
                        <strong>{{ stat.value }}</strong>
                    </v-col>
                </v-row>
            </v-card>
        </v-col>
    </v-row>
</template>

<style lang="css" scoped>
.bg-teal {
    background-color: var(--light-blue) !important;
}

.bg-cyan {
    background-color: var(--blue) !important;
}

.bg-yellow {
    background-color: var(--yellow) !important;
}

.bg-red {
    background-color: var(--primary) !important;
}

.das-card {
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.das-btn {
    display: flex;
    justify-content: center;
    align-items: center;
    color: var(--white);
    height: 80px;
    width: 85px;
}

.das-btn .v-icon {
    margin-left: 15px;
}
</style>