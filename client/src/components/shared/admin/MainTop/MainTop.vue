<script setup>

defineProps({
    icon: String,
    title: String,
    sub: String,
    parent: String
});
</script>

<template>
    <div class="main-top">
        <div class="main-top-left">
            <div>
                <v-icon>{{ icon }}</v-icon>
                <p class="text-title">{{ title }}</p>
            </div>
            <p class="text-sub">{{ sub }}</p>
        </div>
        <div class="main-top-right">
            <v-icon class="mr-1">mdi-home</v-icon>
            <p class="mx-2">/</p>
            <p class="ml-1" v-if="parent">{{ parent }}</p>
            <p class="mx-2" v-if="parent">/</p>
            <p class="ml-1 color-primary">{{ $route.meta.title }}</p>
        </div>
    </div>
</template>

<style lang="css" scoped>
.main-top {
    height: 90px;
    display: flex;
    justify-content: space-between;
    background-color: var(--white);
    margin-top: 27px;
    margin-bottom: 30px;
    padding: 0 30px;
    width: 100%;
}

.main-top-left {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.main-top-left div {
    display: flex;
    font-size: 20px;
    align-items: center;
    font-weight: lighter;
}

.main-top-left .text-sub {
    font-weight: lighter;
    font-style: italic;
    font-size: 12px;
    margin-top: 6px;
}

.main-top-right {
    display: flex;
    align-items: center;
    font-size: 18px;
}
</style>