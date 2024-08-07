import queryKeys from "@/constants/queryKey.constant";
import notificationService from "@/services/notification.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { toast } from "vue-sonner";

export const useGetNotification = () => {
    return useQuery({
        queryKey: getQueryKeys({ key: queryKeys.notification.GET_ALL }),
        queryFn: () => {
            return notificationService.get();
        },
        staleTime: 5 * 1000,
        keepPreviousData: true,
        select: (data) => data?.metadata,
    });
};

export const useMutationAddNotification = () => {
    return useMutation({
        mutationFn: (data) => {
            return notificationService.post(data);
        },
        onError: (error) => {
            if (error?.response?.data?.errors) {
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
        },
    });
};

export const useMutationEditNotification = () => {
    return useMutation({
        mutationFn: (data) => {
            return notificationService.put(data.id, data);
        },
        onError: (error) => {
            if (error?.response?.data?.errors) {
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
        },
    });
};
