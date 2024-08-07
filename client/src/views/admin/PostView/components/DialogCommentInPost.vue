<script setup>
import CommentCard from "@/views/NewView/components/CommentCard.vue";

const props = defineProps({
    isLoading: {
        type: Boolean,
        default: false,
    },
    data: {
        type: Array,
        default: [],
    },
    open: {
        type: Boolean,
        default: false,
    },
    title: {
        type: String,
        default: "Danh sách bình luận bài viết",
    },
    isHidden: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits([
    "update:open",
    "toggleComment",
    "toggleReplyComment",
    "hideCommentInPost",
]);

const handleClose = () => {
    emit("update:open", false);
};
</script>

<template>
    <v-dialog
        :modelValue="open"
        @update:modelValue="emit('update:open', $event)"
        width="800"
    >
        <v-card
            max-width="800"
            class="pa-4"
            prepend-icon="mdi-comment"
            title="Danh sách bình luận bài viết"
            :text="title"
            v-if="open"
        >
            <comment-card
                v-for="comment in data"
                :key="comment.id"
                :comment="comment"
                :show-action="false"
                :is-admin="true"
                :is-loading="isLoading"
                @toggleComment="emit('toggleComment', $event)"
                @toggleReplyComment="emit('toggleReplyComment', $event)"
            />

            <template v-slot:actions>
                <v-btn
                    color="red"
                    variant="outline"
                    text="Đóng"
                    @click="handleClose"
                ></v-btn>

                <v-btn
                    :color="!isHidden ? 'red' : 'green'"
                    variant="tonal"
                    :text="
                        isHidden
                            ? 'Hiện tất cả bình luận của bài viết này'
                            : 'Ẩn tất cả bình luận của bài viết này'
                    "
                    @click="emit('hideCommentInPost')"
                ></v-btn>
            </template>
        </v-card>
    </v-dialog>
</template>