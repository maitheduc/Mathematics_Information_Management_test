<script setup>
import { useGetAbout } from "@/hooks/about.hook";

const { data, isLoading } = useGetAbout();
</script>

<template>
    <div class="about">
        <v-skeleton-loader
            type="article,paragraph,paragraph,image,paragraph,paragraph,image,paragraph,paragraph"
            v-if="isLoading"
        />

        <figure
            v-else
            class="about-content"
            v-html="data?.metadata?.gioithieu"
        ></figure>
    </div>
</template>

<style lang="css" scoped>
.text-title {
    font-size: 20px;
    font-weight: 700;
}

.about-content {
    text-align: justify;
}

img {
    margin: 12px 0;
    display: block;
}
</style>
