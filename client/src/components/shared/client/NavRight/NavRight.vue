<script setup>
import { useGetNews } from "@/hooks/news.hook";
import { ref } from "vue";
import { useGetNotification } from "@/hooks/notification.hook";
import { compareDateCurrent, fDate } from "@/utils";
import moment from "moment";

const page = ref(1);
const LIMIT = 5;

const { data: notification, isLoading: isLoadingNotification } =
    useGetNotification();

const { data, isLoading } = useGetNews({
    page: page,
    limit: LIMIT,
    sort: "created_at",
    order: "asc",
});
</script>

<template>
    <div
        class="mb-4"
        v-if="
            notification &&
            compareDateCurrent(notification.ngaybatdau, notification.ngayhethan)
        "
    >
        <div class="text-center text-title">Thông báo</div>

        <div class="content-nav">
            <div class="text-center pt-2">
                {{ notification?.tieude }}
            </div>

            <div class="content-nav-item">
                <div v-html="notification?.noidung" />
            </div>

            <div class="px-3 pb-2">
                {{ notification?.ghichu }}
            </div>

            <small class="px-3 pb-2 font-weight-bold">
                {{
                    `Cập nhật ngày ${fDate(
                        notification?.updated_at,
                        "DD/MM/YYYY HH:mm"
                    )}`
                }}
            </small>
        </div>
    </div>

    <v-container v-if="isLoading">
        <v-row>
            <v-col cols="12" md="12">
                <v-skeleton-loader type="heading"></v-skeleton-loader>
            </v-col>

            <v-col
                v-for="item in 5"
                :key="item"
                cols="12"
                md="12"
                class="border"
            >
                <v-row>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader
                            class="image"
                            type="image"
                        ></v-skeleton-loader>
                    </v-col>

                    <v-col cols="6" md="6">
                        <v-skeleton-loader type="article"></v-skeleton-loader>
                    </v-col>
                </v-row>
            </v-col>
        </v-row>
    </v-container>

    <div v-else>
        <div class="text-center text-title">Tin tức nổi bật</div>

        <div class="content-nav">
            <div class="content-nav-list">
                <router-link
                    class="content-nav-item"
                    v-for="(item, index) in data?.metadata"
                    :key="index"
                    :to="{ name: 'news_details', params: { id: item?.id } }"
                >
                    <div class="content-nav-img">
                        <v-img
                            :src="item?.hinhdaidien"
                            class="image"
                            aspect-ratio="16/9"
                        ></v-img>
                    </div>
                    <div class="content-nav-title">{{ item?.tieude }}</div>
                </router-link>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
/* Content */
.content-nav {
    border: 1px solid var(--primary);
    overflow: hidden;
}

.text-title {
    padding: 9.5px 0;
    background-color: var(--primary);
    color: var(--white);
    font-size: 16px;
    border-radius: 4px 4px 0 0;
}

.content-nav-list {
    color: var(--black);
    padding: 0;
    border-radius: 4px;
    height: 50vh;
    /* overflow: hidden; */
    position: relative;
    display: flex;
    flex-direction: column;
    animation: scroll 20s linear infinite;
}

.content-nav-list:hover {
    animation-play-state: paused;
}

@keyframes scroll {
    0% {
        transform: translateY(100%);
    }

    100% {
        transform: translateY(-100%);
    }
}

.content-nav-item {
    display: flex;
    align-items: center;
    padding: 15px;
    cursor: pointer;
    text-decoration: none;
}

.content-nav-item:hover {
    color: var(--primary);
}

.content-nav-img {
    width: 79px;
    height: 61px;
    overflow: hidden;
    border: 1px solid var(--primary);
    margin-right: 8px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.content-nav-title {
    font-size: 14px;
    width: 116px;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 20px;
    line-clamp: 3;
    -webkit-line-clamp: 3;
    height: 57px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}
</style>
