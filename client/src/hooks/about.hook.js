import queryKeys from "@/constants/queryKey.constant";
import aboutService from "@/services/about.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { toast } from "vue-sonner";

export const useGetAbout = () => {
    return useQuery({
        queryKey: getQueryKeys({ key: queryKeys.about.GET }),
        queryFn: () => {
            return aboutService.get();
        },
        staleTime: 5 * 1000,
        keepPreviousData: true,
    });
};

export const useMutationAddAbout = () => {
    return useMutation({
        mutationFn: (data) => {
            return aboutService.post(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationEditAbout = () => {
    return useMutation({
        mutationFn: (data) => {
            return aboutService.patch(data.id, data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
