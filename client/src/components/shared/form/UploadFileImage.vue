<script setup>
import { rules } from "@/utils/rule";
import { ref, watchEffect } from "vue";

const props = defineProps({
    value: {
        type: File,
        default: null,
    },
    imageUrl: {
        type: String,
        default: "",
    },
    label: {
        type: String,
        default: "Hình địa diện",
    },
});

const emits = defineEmits(["update:value", "onFileChange"]);

const image = ref(null);

watchEffect(() => {
    image.value = props.value;
});

const onFileChange = (file) => {
    emits("update:value", file);
    emits("onFileChange", file);
};
</script>

<template>
    <v-file-input
        v-model="image"
        :label="label"
        @update:modelValue="onFileChange"
    ></v-file-input>

    <v-img
        v-if="imageUrl"
        :src="imageUrl"
        :width="200"
        :height="200"
        :alt="imageUrl"
        cover
    ></v-img>
</template>

<style lang="css" scoped></style>
