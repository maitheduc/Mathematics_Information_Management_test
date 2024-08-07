<script setup>
import { toast } from "vue-sonner";
import { ref, watch, watchEffect } from "vue";

const props = defineProps({
    btnTextSubmit: String,
    rows: Number,
    value: {
        type: String,
        default: "",
    },
    isLoading: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(["submit", "cancel"]);

const newComment = ref("");

watchEffect(() => {
    newComment.value = props.value;
});

const handleClickCancel = () => {
    newComment.value = "";
    emit("cancel");
};

const handleSubmitNewComment = () => {
    newComment.value = newComment.value.trim();

    if (!newComment.value) {
        toast.error("Vui lòng nhập binh luận!");
        return;
    }

    const callback = () => {
        newComment.value = "";
    };

    emit("submit", { comment: newComment.value, callback });
};
</script>

<template>
    <div class="pa-4">
        <v-textarea
            v-model="newComment"
            label="Viết bình luận..."
            auto-grow
            outlined
            :rows="rows || 3"
        ></v-textarea>

        <v-btn
            style="float: right"
            color="primary"
            size="small"
            @click="handleSubmitNewComment"
            :loading="isLoading"
            :disabled="isLoading"
        >
            {{ btnTextSubmit }}
        </v-btn>

        <v-btn
            v-if="value.length > 0"
            class="mr-2"
            style="float: right"
            color="error"
            size="small"
            @click="handleClickCancel"
            :loading="isLoading"
            :disabled="isLoading"
        >
            Hủy bỏ
        </v-btn>
    </div>
</template>

<style lang="css" scoped></style>
