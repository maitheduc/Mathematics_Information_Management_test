import queryKeys from "@/constants/queryKey.constant";
import majorService from "@/services/major.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { isAxiosError } from "axios";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const useGetMajor = (params) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({ key: queryKeys.major.GET_ALL, ...params }),
            queryFn: () => majorService.get(params),
            keepPreviousData: true,
            staleTime: 5 * 1000,
        };
    });

    return useQuery(options);
};

export const useGetDetailMajor = ({ id, select, enabled = true }) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({ key: queryKeys.major.DETAILS, id }),
            queryFn: () => majorService.getById(id),
            enabled,
            select,
        };
    });

    return useQuery(options);
};

export const useMutationAddMajor = () => {
    return useMutation({
        mutationFn: (data) => majorService.post(data),
        onSuccess: () => {
            toast.success("Thêm chuyên ngành thành công!");
        },
        onError: (error) => {
            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            setTimeout(() => {
                                toast.error(e);
                            }, 200);
                        });
                    });
                } else {
                    toast.error(error.message);
                }
            }
        },
    });
};

export const useMutationEditMajor = () => {
    return useMutation({
        mutationFn: (data) => majorService.put(data.id, data),
        onSuccess: () => {
            toast.success("Cập nhật chuyên ngành thành công!");
        },
        onError: (error) => {
            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            setTimeout(() => {
                                toast.error(e);
                            }, 200);
                        });
                    });
                } else {
                    toast.error(error.message);
                }
            }
        },
    });
};

export const useMutationDeleteMajor = () => {
    return useMutation({
        mutationFn: (id) => majorService.delete(id),
        onSuccess: () => {
            toast.success("Xóa chuyên ngành thành công!");
        },
        onError: (error) => {
            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            setTimeout(() => {
                                toast.error(e);
                            }, 200);
                        });
                    });
                } else {
                    toast.error(error.message);
                }
            }
        },
    });
};
