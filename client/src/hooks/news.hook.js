import queryKeys from "@/constants/queryKey.constant";
import newsService from "@/services/news.service";
import { getQueryKeys, paramsToArrString } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const queryKeysGetNewsDetails = (newId, params = {}) => {
    return [queryKeys.news.DETAILS, newId.value, ...paramsToArrString(params)];
};

export const queryKeysGetAllNews = (params) => {
    return getQueryKeys({ key: queryKeys.news.GET_ALL, ...params });
};

export const useGetNewsDetails = (newId, params = {}, enabled = true) => {
    const options = computed(() => {
        return {
            queryKey: queryKeysGetNewsDetails(newId, params),
            queryFn: () => newsService.getById(newId, params),
            enabled,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useGetNews = (params = {}, select = undefined) => {
    const options = computed(() => {
        return {
            queryKey: queryKeysGetAllNews(params),
            queryFn: () => newsService.get(params),
            staleTime: 5 * 1000,
            keepPreviousData: true,
            select,
        };
    });

    const { isLoading, data, isPlaceholderData } = useQuery(options);

    return { isLoading, data, isPlaceholderData };
};

export const useMutationAddPost = () => {
    return useMutation({
        mutationFn: (data) => {
            return newsService.post(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
        onSuccess: () => {
            toast.success("Thêm bài viết thành công");
        },
    });
};

export const useMutationEditPost = () => {
    return useMutation({
        mutationFn: (data) => {
            return newsService.put(data.id, data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
        onSuccess: () => {
            toast.success("Cập nhật bài viết thành công.");
        },
    });
};
