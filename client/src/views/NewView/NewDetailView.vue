<script setup>
import ShareFB from "@/components/shared/ShareFB.vue";
import { getAuth } from "@/hooks/auth.hook";
import {
    queryKeysGetAllComment,
    useGetCommentByNews,
    useMutationAddComment,
    useMutationDeleteComment,
    useMutationDeleteReplyComment,
    useMutationEditComment,
    useMutationEditReplyComment,
    useMutationReplyComment,
} from "@/hooks/comment.hook";
import { useGetNewsDetails } from "@/hooks/news.hook";
import { fDate } from "@/utils";
import CommentCard from "@/views/NewView/components/CommentCard.vue";
import FormComment from "@/views/NewView/components/FormComment.vue";
import { useQueryClient } from "@tanstack/vue-query";
import { computed, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";
import DeleteConfirmDialog from "@/components/shared/dialog/DeleteConfirmDialog.vue";

const route = useRoute();
const router = useRouter();
const newsId = computed(() => route.params.id);

const { data: user, userId } = getAuth();

const { data, isLoading } = useGetNewsDetails(newsId, {
    include_user: "true",
});

const options = computed(() => {
    return {
        page: 1,
        limit: 10,
        "id_tintuc[eq]": newsId,
        include_comment_detail: "true",
        include_user: "true",
    };
});

const { data: comments, isLoading: isLoadingComments } = useGetCommentByNews(
    options.value
);

const selectedModify = ref({
    open: false,
    key: "",
    data: null,
});

const mutationAddComment = useMutationAddComment();
const mutationReplyComment = useMutationReplyComment();
const mutationEditComment = useMutationEditComment();
const mutationEditReplyComment = useMutationEditReplyComment();
const mutationDeleteComment = useMutationDeleteComment();
const mutationDeleteReplyComment = useMutationDeleteReplyComment();
const queryClient = useQueryClient();

const handleSubmitNewComment = ({ comment, callback }) => {
    if (!userId.value) {
        toast.error("Vui lòng đăng nhập để bình luận");
        router.push({ name: "login" });
        return;
    }

    const payload = {
        noidung: comment,
        id_user: userId.value,
        id_tintuc: newsId.value,
    };

    if (selectedModify.value.data) {
        if (selectedModify.value.key === "editComment") {
            mutationEditComment.mutate(
                {
                    ...payload,
                    id: selectedModify.value.data.id,
                },
                {
                    onSuccess: () => {
                        toast.success("Chỉnh sửa bình luận thành công");
                        queryClient.invalidateQueries({
                            queryKey: queryKeysGetAllComment(options.value),
                            exact: true,
                        });
                        callback();
                        selectedModify.value = {
                            open: false,
                            key: "",
                            data: null,
                        };
                    },
                }
            );
        }

        if (selectedModify.value.key === "editCommentChild") {
            const payload = {
                noidung: comment,
                id: selectedModify.value.data.id,
            };

            mutationEditReplyComment.mutate(payload, {
                onSuccess: () => {
                    toast.success("Chỉnh sửa bình luận thành công");
                    queryClient.invalidateQueries({
                        queryKey: queryKeysGetAllComment(options.value),
                        exact: true,
                    });
                    callback();
                    selectedModify.value = {
                        open: false,
                        key: "",
                        data: null,
                    };
                },
            });
        }

        return;
    }

    mutationAddComment.mutate(payload, {
        onSuccess: () => {
            toast.success("Bình luận thành công.");
            queryClient.invalidateQueries({
                queryKey: queryKeysGetAllComment(options.value),
                exact: true,
            });
            callback();
        },
    });
};

const handleSubmitReplyComment = ({ comment, value, callback }) => {
    if (!userId.value) {
        toast.error("Vui lòng đăng nhập để bình luận");
        router.push({ name: "login" });
        return;
    }

    const payload = {
        noidung: value,
        id_user: userId.value,
        id_binhluan: comment.id,
    };

    mutationReplyComment.mutate(payload, {
        onSuccess: () => {
            toast.success("Đã reply thành công");
            queryClient.invalidateQueries({
                queryKey: queryKeysGetAllComment(options.value),
                exact: true,
            });
            callback();
        },
    });
};

const handleSelectedModify = (key, data) => {
    selectedModify.value = {
        open: true,
        key,
        data,
    };
};

const handleClose = (value) => {
    if (!value) {
        selectedModify.value = {
            open: false,
            key: "",
            data: null,
        };
    }
};

const handleConfirmDelete = (callback) => {
    if (!userId.value) {
        toast.error("Vui lòng đăng nhập để bình luận");
        router.push({ name: "login" });
        return;
    }

    if (!selectedModify.value.data) {
        return;
    }

    if (selectedModify.value.data?.id_binhluan) {
        // Delete reply comment
        mutationDeleteReplyComment.mutate(selectedModify.value.data?.id, {
            onSuccess: () => {
                toast.success("Đã xóa bình luận");
                queryClient.invalidateQueries({
                    queryKey: queryKeysGetAllComment(options.value),
                    exact: true,
                });
                callback();
                selectedModify.value = {
                    open: false,
                    key: "",
                    data: null,
                };
            },
        });
    } else {
        // Delete comment
        mutationDeleteComment.mutate(selectedModify.value.data?.id, {
            onSuccess: () => {
                toast.success("Đã xóa bình luận");
                queryClient.invalidateQueries({
                    queryKey: queryKeysGetAllComment(options.value),
                    exact: true,
                });
                callback();
                selectedModify.value = {
                    open: false,
                    key: "",
                    data: null,
                };
            },
        });
    }
};

const handleCancel = () => {
    selectedModify.value = {
        open: false,
        key: "",
        data: null,
    };
};
</script>

<template>
    <delete-confirm-dialog
        :open="selectedModify.open && selectedModify.key === 'delete'"
        @update:open="handleClose"
        @confirm="handleConfirmDelete"
        :is-loading="
            mutationDeleteReplyComment.isPending.value ||
            mutationDeleteComment.isPending.value
        "
    />

    <div class="news-detail" v-if="!isLoading">
        <div class="news-title mb-2 color-primary text-shadow">
            <h1>{{ data?.metadata?.tieude }}</h1>
        </div>

        <div class="news-info">
            <div class="mr-3 news-info-item">
                <v-icon class="color-primary mr-1">mdi-account</v-icon>
                {{ data?.metadata?.user?.viewname }}
            </div>
            <div class="mr-3 news-info-item">
                <v-icon class="color-primary mr-1">mdi-clock</v-icon>
                {{ fDate(data?.metadata?.created_at, "DD/MM/YYYY HH:mm:ss") }}
            </div>
            <div class="mr-3 news-info-item">
                <v-icon class="color-primary mr-1">mdi-tag-multiple</v-icon>
                <router-link
                    to="/news"
                    class="color-primary"
                    style="text-decoration: none"
                >
                    Tin tức
                </router-link>
            </div>

            <ShareFB />
        </div>

        <div class="news-content1">
            <strong>
                {{ data?.metadata?.mota }}
            </strong>
        </div>

        <div class="news-content2" v-html="data?.metadata?.noidung" />

        <div class="comment py-4" v-if="data?.metadata?.is_hidden_cmt === 0">
            <v-card>
                <h2 class="pl-4 pt-4">{{ comments?.length }} bình luận</h2>

                <FormComment
                    :btnTextSubmit="
                        selectedModify.key !== 'delete' &&
                        selectedModify?.data?.noidung
                            ? 'Lưu thay đổi'
                            : 'Gửi bình luận'
                    "
                    @submit="handleSubmitNewComment"
                    :value="
                        (selectedModify.key !== 'delete' &&
                            selectedModify?.data?.noidung) ||
                        ''
                    "
                    @cancel="handleCancel"
                    :is-loading="
                        mutationAddComment.isPending.value ||
                        mutationEditComment.isPending.value ||
                        mutationEditReplyComment.isPending.value
                    "
                />

                <v-list class="my-5 w-100 px-4">
                    <CommentCard
                        v-for="comment in comments"
                        :key="comment.id"
                        :comment="comment"
                        @submitReply="handleSubmitReplyComment"
                        :show-action="comment.id_user == userId"
                        @editComment="
                            ($event) =>
                                handleSelectedModify('editComment', $event)
                        "
                        @deleteComment="
                            ($event) => handleSelectedModify('delete', $event)
                        "
                        @editCommentChild="
                            ($event) =>
                                handleSelectedModify('editCommentChild', $event)
                        "
                        @deleteCommentChild="
                            ($event) => handleSelectedModify('delete', $event)
                        "
                        :is-loading="mutationReplyComment.isPending.value"
                    />
                </v-list>
            </v-card>
        </div>
    </div>

    <div v-else>
        <v-skeleton-loader
            type="article,article,article,article"
        ></v-skeleton-loader>
    </div>
</template>

<style lang="css" scoped>
.news-detail {
    font-family: Lato;
    padding: 20px;
}

.news-info {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.news-info-item {
    display: flex;
    align-items: center;
}

.news-content1 {
    margin-bottom: 20px;
    text-align: justify;
    font-style: italic;
}

.v-toolbar {
    background-color: #f5f5f5;
}

.v-chip {
    margin: 2px;
}
</style>
