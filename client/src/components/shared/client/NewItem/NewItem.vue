<script setup>
defineProps({
    title: String,
    description: String,
    imageUrl: String,
    datetime: String,
    views: Number,
    comments: Number,
    id: Number,
});
</script>

<template>
    <div class="description">
        <div class="description-left">
            <div class="content-img">
                <v-img cover="cover" :src="imageUrl"></v-img>
            </div>
        </div>
        <div class="description-right">
            <h1>
                <router-link :to="{ name: 'news_details', params: { id } }">{{
                    title
                }}</router-link>
            </h1>

            <div class="description-sub">
                <v-icon class="mr-1"> mdi-calendar</v-icon>
                <p class="mr-1 text-8">{{ datetime }}</p>

                <div class="mx-4">
                    <v-icon class="mr-1">mdi-eye</v-icon>
                    <p class="text-8">{{ views }}</p>
                </div>
                <div>
                    <v-icon class="mr-1">mdi-comment</v-icon>
                    <p class="text-8">{{ comments }} bình luận</p>
                </div>
            </div>

            <p class="mt-1 description-text text-justify">{{ description }}</p>
        </div>
    </div>
</template>

<style lang="css" scoped>
.text-8 {
    font-size: 8px;
}

.description {
    display: flex;
    border-bottom: 1px dashed var(--black);
    padding: 18px 0;
}

/* left */

.description-left {
    text-align: start;
}

.content-img .v-img {
    width: 300px;
    height: 200px;
    border-radius: 4px;
}

.description-right {
    display: flex;
    flex-direction: column;
    margin: 0 18px;
}

.description-right h1 a {
    text-decoration: none;
    font-size: 16px;
    font-weight: 700;
    color: var(--primary);
    text-transform: capitalize;
    cursor: pointer;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}

.description-right h1 a:hover {
    text-decoration: underline;
}

.description p {
    font-size: 16px;
    font-weight: lighter;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 8;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}

.description-sub,
.description-sub div {
    font-size: 10px;
    display: flex;
    align-items: center;
    color: #777373;
}
</style>
