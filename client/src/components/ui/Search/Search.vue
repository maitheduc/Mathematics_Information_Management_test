<script setup>
import debounce from "lodash/debounce";
import { defineProps, ref, watch, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";

const props = defineProps({
    width: {
        type: String,
        default: "198px",
    },
    height: {
        type: String,
        default: "33px",
    },
    widthIcon: {
        type: String,
        default: "49px",
    },
    placeholder: {
        type: String,
        default: "Tìm kiếm...",
    },
    value: {
        type: String,
        default: "",
    },
});

const emits = defineEmits(["update:value"]);

const text = ref("");
const route = useRoute();
const router = useRouter();

watchEffect(() => {
    if (route.query?.q) {
        text.value = route.query?.q;
    }
});

const update = debounce(() => {
    router.push({
        path: route.path,
        query: {
            ...route.query,
            q: text.value,
        },
    });
}, 500);

watch(text, (newValue) => {
    update();
    emits("update:value", newValue);
});

watch(props.value, (newValue) => {
    text.value = newValue;
});
</script>

<template>
    <div class="search-field" :style="{ width: width, height: height }">
        <input
            type="text"
            class="search-text"
            :placeholder="placeholder"
            v-model="text"
        />
        <v-icon class="search-icon" :style="{ width: widthIcon }"
            >mdi-magnify</v-icon
        >
    </div>
</template>

<style lang="css" scoped>
/* search */
.search-field {
    background-color: var(--white);
    border: 1px solid var(--gray);
    border-radius: 4px;
    font-family: Arial;
    font-size: 13px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0;
    margin-right: 20px;
}

.search-text {
    width: 100%;
    padding-left: 15px;
    border: none;
    outline: none;
}

.search-icon {
    color: var(--white);
    height: 100%;
    background: var(--primary);
    border-radius: 0 4px 4px 0;
}
</style>
