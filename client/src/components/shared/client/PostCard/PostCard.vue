<script setup>
import { useGetNews } from "@/hooks/news.hook";
import { fDate } from "@/utils";

const { data, isLoading } = useGetNews(
    {
        page: 1,
        order: "desc",
        limit: 999999,
        sort: "created_at",
        include_comment: "true",
    },
    (data) => {
        if (data?.metadata) return data?.metadata[0];
        return null;
    }
);
</script>

<template>
    <v-container v-if="isLoading">
        <v-row>
            <v-col cols="12" md="12">
                <v-skeleton-loader type="heading"></v-skeleton-loader>
            </v-col>

            <v-col
                v-for="item in 1"
                :key="item"
                cols="12"
                md="12"
                class="border"
            >
                <v-row>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader
                            class="h-100"
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

    <div class="main-content" v-else>
        <div class="text-title">
            <h1>Tin tức mới nhất</h1>
        </div>
        <div class="text-content py-3">
            <div class="content-img">
                <v-img :src="data?.hinhdaidien" class="image"></v-img>
            </div>
            <div class="description">
                <router-link
                    :to="{ name: 'news_details', params: { id: data?.id } }"
                    class="description-title"
                >
                    {{ data?.tieude }}
                </router-link>
                <div class="description-date">
                    <v-icon class="mr-1"> mdi-calendar</v-icon>
                    <p>{{ fDate(data?.created_at, "DD/MM/YYYY") }}</p>
                </div>
                <p class="mt-1">
                    {{ data?.mota }}
                </p>
                <div class="description-icon">
                    <div>
                        <v-icon class="mr-1">mdi-eye</v-icon>
                        <p>: {{ data?.luotxem }}</p>
                    </div>
                    <div>
                        <v-icon class="mr-1">mdi-comment</v-icon>
                        <p>: {{ data?.binhluan?.length }} bình luận</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
.main-content {
    border: 1px solid var(--light-gray);
}

.text-title {
    height: 49px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-left: 18px;
    background-color: var(--light-gray);
    color: var(--black);
}

.text-title h1 {
    font-size: 18px;
    font-weight: lighter;
    text-transform: capitalize;
}

.text-content {
    display: flex;
    align-items: center;
}

.content-img .v-img {
    width: 450px;
    height: 300px;
    border-radius: 4px;
    margin-left: 18px;
}

.description {
    padding: 14px 18px;
}

.description-title {
    text-decoration: none;
    font-size: 18px;
    font-weight: 700;
    color: var(--primary);
    text-shadow: var(--primary) 2px 2px 10px;
    text-transform: capitalize;
}

.description-title:hover {
    text-shadow: #3a33be 2px 2px 10px;
    cursor: pointer;
}

.description p {
    font-size: 16px;
    font-weight: lighter;
    overflow: hidden;
    text-overflow: ellipsis;
    line-clamp: 7;
    -webkit-line-clamp: 7;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}

.description-date,
.description-icon {
    font-size: 14px;
    display: flex;
    align-items: center;
    margin-top: 4px;
    color: #777373;
}

.description-icon div {
    display: flex;
    align-items: center;
    margin-right: 15px;
}
</style>
