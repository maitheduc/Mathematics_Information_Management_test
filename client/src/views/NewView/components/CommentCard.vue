<script setup>
import { getAuth } from "@/hooks/auth.hook";
import { fToNow, urlImage } from "@/utils";
import FormComment from "@/views/NewView/components/FormComment.vue";
import { ref } from "vue";

const props = defineProps({
    comment: Object,
    showAction: { type: Boolean, default: false },
    isLoading: { type: Boolean, default: false },
    isAdmin: { type: Boolean, default: false },
});

const { data: user, userId } = getAuth();

const showReply = ref(false);

const emit = defineEmits([
    "submitReply",
    "editComment",
    "deleteComment",
    "editCommentChild",
    "deleteCommentChild",
    "toggleComment",
    "toggleReplyComment",
]);

const handleSubmitReplyComment = ({ comment, callback }) => {
    emit("submitReply", { value: comment, comment: props.comment, callback });
};

const handleSelectComment = (key, comment) => {
    emit(key, comment);
};
</script>

<template>
    <div class="w-100" v-if="isAdmin || comment?.is_hidden_cmt === 0">
        <v-list-item class="comment-item">
            <div class="d-flex align-center">
                <v-avatar class="mr-4">
                    <v-img
                        :src="urlImage(comment?.user?.image, 'avatar')"
                    ></v-img>
                </v-avatar>

                <div class="comment-content">
                    <div class="w-100">
                        <v-list-item-title
                            class="d-flex justify-space-between align-center"
                        >
                            <div>
                                <strong>
                                    {{ comment.user?.viewname }}
                                </strong>

                                <small class="ml-2 font-weight-bold text-gray">
                                    <i>{{ fToNow(comment.created_at) }}</i>
                                </small>
                            </div>

                            <div v-if="!isAdmin && showAction">
                                <v-icon
                                    size="small"
                                    color="green"
                                    class="cursor-pointer icon mr-2"
                                    @click="
                                        handleSelectComment(
                                            'editComment',
                                            comment
                                        )
                                    "
                                >
                                    mdi-pencil-outline
                                </v-icon>

                                <v-icon
                                    size="small"
                                    color="red"
                                    class="cursor-pointer icon"
                                    @click="
                                        handleSelectComment(
                                            'deleteComment',
                                            comment
                                        )
                                    "
                                >
                                    mdi-delete-outline
                                </v-icon>
                            </div>

                            <div v-if="isAdmin">
                                <v-btn
                                    v-if="!comment?.is_hidden_cmt"
                                    size="small"
                                    color="red"
                                    @click="
                                        handleSelectComment(
                                            'toggleComment',
                                            comment
                                        )
                                    "
                                >
                                    Ẩn
                                </v-btn>

                                <v-btn
                                    v-else
                                    @click="
                                        handleSelectComment(
                                            'toggleComment',
                                            comment
                                        )
                                    "
                                    size="small"
                                    color="green"
                                >
                                    Hiện
                                </v-btn>
                            </div>
                        </v-list-item-title>

                        <v-list-item-subtitle>
                            <p>{{ comment.noidung }}</p>
                        </v-list-item-subtitle>

                        <div>
                            <v-icon
                                size="small"
                                color="green"
                                class="cursor-pointer"
                                @click="showReply = !showReply"
                            >
                                mdi-comment
                            </v-icon>

                            <span class="font-weight-bold font-size-14 ml-1">
                                {{ comment?.chitietbinhluan?.length }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-100">
                <div v-if="showReply">
                    <div v-if="comment?.chitietbinhluan?.length > 0">
                        <div
                            v-for="commentChild in comment.chitietbinhluan"
                            :key="commentChild.id"
                            class="d-flex align-center comment-item-reply"
                        >
                            <template
                                v-if="isAdmin || !commentChild?.is_hidden_cmt"
                            >
                                <v-avatar class="mr-4">
                                    <v-img
                                        :src="
                                            urlImage(
                                                commentChild?.user?.image,
                                                'avatar'
                                            )
                                        "
                                    ></v-img>
                                </v-avatar>

                                <div class="comment-content">
                                    <div class="w-100">
                                        <v-list-item-title
                                            class="d-flex justify-space-between align-center"
                                        >
                                            <div>
                                                <strong>
                                                    {{
                                                        commentChild?.user
                                                            ?.viewname
                                                    }}
                                                </strong>

                                                <small
                                                    class="font-weight-bold font-size-14 ml-1"
                                                >
                                                    {{
                                                        fToNow(
                                                            commentChild?.created_at
                                                        )
                                                    }}
                                                </small>
                                            </div>

                                            <div
                                                v-if="
                                                    !isAdmin &&
                                                    +commentChild?.user?.id ===
                                                        +userId
                                                "
                                            >
                                                <v-icon
                                                    size="small"
                                                    color="green"
                                                    class="cursor-pointer icon mr-2"
                                                    @click="
                                                        handleSelectComment(
                                                            'editCommentChild',
                                                            commentChild
                                                        )
                                                    "
                                                >
                                                    mdi-pencil-outline
                                                </v-icon>

                                                <v-icon
                                                    size="small"
                                                    color="red"
                                                    class="cursor-pointer icon"
                                                    @click="
                                                        handleSelectComment(
                                                            'deleteCommentChild',
                                                            commentChild
                                                        )
                                                    "
                                                >
                                                    mdi-delete-outline
                                                </v-icon>
                                            </div>

                                            <div v-if="isAdmin">
                                                <v-btn
                                                    v-if="
                                                        commentChild?.is_hidden_cmt ===
                                                        0
                                                    "
                                                    @click="
                                                        handleSelectComment(
                                                            'toggleReplyComment',
                                                            commentChild
                                                        )
                                                    "
                                                    size="small"
                                                    color="red"
                                                >
                                                    Ẩn
                                                </v-btn>

                                                <v-btn
                                                    v-else
                                                    @click="
                                                        handleSelectComment(
                                                            'toggleReplyComment',
                                                            commentChild
                                                        )
                                                    "
                                                    size="small"
                                                    color="green"
                                                >
                                                    Hiện
                                                </v-btn>
                                            </div>
                                        </v-list-item-title>

                                        <v-list-item-subtitle>
                                            <p>{{ commentChild?.noidung }}</p>
                                        </v-list-item-subtitle>
                                    </div>
                                </div>
                            </template>
                        </div>
                    </div>

                    <div class="ml-10">
                        <FormComment
                            v-if="!isAdmin"
                            :btnTextSubmit="'Trả lời'"
                            @submit="handleSubmitReplyComment"
                            :rows="1"
                            :isLoading="isLoading"
                        />
                    </div>
                </div>
            </div>
        </v-list-item>
    </div>
</template>

<style lang="css" scoped>
/* comment */

.comment-item {
    width: 100%;
    margin-top: 15px;
    padding: 10px;
    background-color: var(--white);
    box-shadow: #0006 0px 4px 8px 0px;
    transition: all 0.3s ease-in-out;
}

.comment-item:hover {
    background-color: #f5f5f5;
    transform: scale(1.01);
}

.comment-item-reply {
    --spacing: 50px;
    margin-top: calc(var(--spacing) / 3);
    margin-left: var(--spacing);
    width: calc(100% - var(--spacing));
}

.comment-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

.icon {
    transition: all 0.3s ease-in-out;
}

.icon:hover {
    font-size: 20px;
}
</style>
