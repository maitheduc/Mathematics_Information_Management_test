<script setup>
defineProps({
    news: Array,
    titleMain: String,
    title: String,
    description: String,
    imageUrl: String,
    datetime: String,
    views: Number,
    comments: Number,
    id: Number,
    priority: Number,
});
</script>

<template>
    <div class="main-content" :id="`card-${priority}`">
        <div class="text-title">
            <h1 class="">{{ titleMain }}</h1>
            <v-icon>mdi-format-list-bulleted</v-icon>
        </div>

        <div class="text-content">
            <div class="description">
                <div class="description-left">
                    <router-link
                        v-for="(link, index) in news"
                        :key="index"
                        :to="{ name: 'news_details', params: { id: link.id } }"
                        class="item"
                    >
                        <v-icon class="mr-1">mdi-cursor-pointer</v-icon>
                        <p>{{ link.tieude }}</p>
                    </router-link>
                </div>

                <div class="description-right">
                    <div class="content-top">
                        <div class="content-img">
                            <v-img :src="imageUrl"></v-img>
                        </div>
                        <div>
                            <router-link
                                class="title"
                                :to="{ name: 'news_details', params: { id } }"
                            >
                                {{ title }}
                            </router-link>
                            <div class="description-date">
                                <v-icon class="mr-1"> mdi-calendar</v-icon>
                                <p class="mr-1">{{ datetime }}</p>
                            </div>
                        </div>
                    </div>

                    <p class="mt-1 description-text">{{ description }}</p>

                    <div class="description-icon">
                        <div>
                            <v-icon class="mr-1">mdi-eye</v-icon>
                            <p>: {{ views }}</p>
                        </div>
                        <div>
                            <v-icon class="mr-1">mdi-comment</v-icon>
                            <p>: {{ comments }} bình luận</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
.main-content {
    border: 1px solid var(--light-gray);
    margin-top: 20px;
}

.text-title {
    height: 49px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 18px;
    background-color: var(--light-gray);
    color: var(--black);
}

.text-title h1 {
    font-size: 18px;
    font-weight: lighter;
    text-transform: capitalize;
}

.description {
    display: flex;
}

/* left */
.description-left {
    display: flex;
    flex-direction: column;
    width: 35%;
    padding: 18px 0 18px 18px;
    cursor: pointer;
}

.description-left .item {
    display: flex;
    margin-bottom: 8px;
    color: #777373;
    text-decoration: none;
}

.description-left .item:hover {
    color: var(--primary);
}

.description-left .v-icon {
    rotate: 90deg;
}

.description-left .item p {
    height: 45px;
    overflow: hidden;
    text-overflow: ellipsis;
    line-clamp: 2;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    font-size: 14px;
    font-weight: lighter;
}

.description-left .item p:hover {
    text-decoration: underline;
}

/* right */

.description-right {
    width: 65%;
    display: flex;
    flex-direction: column;
    margin-left: 18px;
    padding: 11px 18px 18px 0;
}

.content-top {
    display: flex;
    align-items: center;
}

.content-img .v-img {
    width: 100px;
    height: 72px;
    margin-right: 18px;
    border: 1px solid var(--primary);
}

.title {
    font-size: 16px;
    font-weight: 700;
    color: var(--primary);
    text-transform: capitalize;
    cursor: pointer;
    overflow: hidden;
    text-overflow: ellipsis;
    line-clamp: 2;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}

.description-right h1:hover {
    text-decoration: underline;
}

.description p {
    font-size: 16px;
    font-weight: lighter;
    overflow: hidden;
    text-overflow: ellipsis;
    line-clamp: 2;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}

.description-date,
.description-icon {
    font-size: 12px;
    display: flex;
    align-items: center;
    margin-top: 5px;
    color: #777373;
}

.description-icon div {
    display: flex;
    align-items: center;
    margin-right: 15px;
}
</style>
