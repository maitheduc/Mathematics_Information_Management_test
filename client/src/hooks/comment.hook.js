import queryKeys from "@/constants/queryKey.constant";
import commentService from "@/services/comment.service";
import replyCommentService from "@/services/replyComment.service";
import { getQueryKeys, sortByCreatedAt } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const queryKeysGetAllComment = (params) => {
    return getQueryKeys({ key: queryKeys.comment.GET_BY_NEWS, ...params });
};

export const useGetCommentByNews = (params = {}, enabled = true) => {
    const { ...others } = params;

    const options = computed(() => {
        return {
            queryKey: queryKeysGetAllComment({ ...others }),
            queryFn: () => commentService.get({ limit: 3, ...others }),
            staleTime: 5 * 1000,
            keepPreviousData: true,
            enabled,
            select: ({ metadata }) => {
                const results = metadata?.map((comment) => {
                    if (comment?.chitietbinhluan?.length > 0) {
                        return {
                            ...comment,
                            chitietbinhluan: sortByCreatedAt(comment.chitietbinhluan),
                        };
                    }

                    return comment;
                });

                return results;
            },
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useMutationAddComment = () => {
    return useMutation({
        mutationFn: (data) => {
            return commentService.post(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationEditComment = () => {
    return useMutation({
        mutationFn: (data) => {
            return commentService.put(data.id, data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationDeleteComment = () => {
    return useMutation({
        mutationFn: (id) => {
            return commentService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationReplyComment = () => {
    return useMutation({
        mutationFn: (data) => {
            return replyCommentService.post(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationEditReplyComment = () => {
    return useMutation({
        mutationFn: (data) => {
            return replyCommentService.put(data.id, data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationDeleteReplyComment = () => {
    return useMutation({
        mutationFn: (id) => {
            return replyCommentService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
