import queryKeys from "@/constants/queryKey.constant";
import newsTypesService from "@/services/newsTypes.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { isAxiosError } from "axios";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const useMutationAddNewsTypes = () => {
    return useMutation({
        mutationFn: (data) => newsTypesService.post(data),
        onSuccess: () => {
            toast.success("Thêm loại tin thành công");
        },
        onError: (error) => {
            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            toast.error(e, {
                                position: "bottom-center",
                            });
                        });
                    });
                } else {
                    toast.error(error.response.data?.message || error.message);
                }
            } else {
                toast.error("Thêm loại tin thất bại");
            }
        },
    });
};

export const useMutationEditNewsTypes = () => {
    return useMutation({
        mutationFn: (data) => newsTypesService.put(data.id, data),
        onSuccess: () => {
            toast.success("Cập nhật loại tin thành công");
        },
        onError: (error) => {
            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            toast.error(e, {
                                position: "bottom-center",
                            });
                        });
                    });
                } else {
                    toast.error(error.response.data?.message || error.message);
                }
            } else {
                toast.error("Thêm loại tin thất bại");
            }
        },
    });
};

export const useMutationDeleteNewsTypes = () => {
    return useMutation({
        mutationFn: (id) => newsTypesService.delete(id),
        onSuccess: () => {
            toast.success("Xóa loại tin thành công");
        },
        onError: (error) => {
            toast.error("Xóa loại tin thất bại");
        },
    });
};

export const useGetNewsTypes = (params = {}, enabled = true, parentId) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({
                key: queryKeys.newsTypes.GET_ALL,
                ...(parentId?.value && { "parent_id[eq]": parentId }),
                ...params,
            }),
            queryFn: () => newsTypesService.get(params),
            staleTime: 5 * 1000,
            keepPreviousData: true,
            enabled,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useGetNewsTypesById = (id, params = {}) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({ key: queryKeys.newsTypes.GET_BY_ID, ...params }),
            queryFn: () => newsTypesService.getById(id),
            enabled: Boolean(id.value),
            refetchOnWindowFocus: false,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};
