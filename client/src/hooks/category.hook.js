import queryKeys from "@/constants/queryKey.constant";
import categoryService from "@/services/category.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { toast } from "vue-sonner";

export const queryKeyCategory = (params = {}) => {
    return getQueryKeys({ key: queryKeys.category.GET_ALL, ...params });
};

const useGetCategory = (params = {}, select = undefined) => {
    const { data, isPending, isLoading } = useQuery({
        queryKey: queryKeyCategory(params),
        queryFn: () => categoryService.get(params),
        keepPreviousData: true,
        staleTime: 5 * 1000,
        select,
    });

    return { data, isPending, isLoading };
};

export const useMutationSortPriority = () => {
    return useMutation({
        mutationFn: (data) => {
            return categoryService.sortPriority(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useMutationChangeDisplayCategory = () => {
    return useMutation({
        mutationFn: (data) => {
            return categoryService.changeDisplay(data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export default useGetCategory;
