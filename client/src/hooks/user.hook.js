import queryKeys from "@/constants/queryKey.constant";
import userService from "@/services/user.service";
import { getQueryKeys, paramsToArrString } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const queryKeysGetAllUsers = (params = {}) => {
    return [queryKeys.users.GET_ALL, ...paramsToArrString(params)];
};

export const useGetUserDetails = ({ userId, params = {}, enable = true }) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({ key: queryKeys.users.DETAILS, userId, ...params }),
            queryFn: () => userService.getById(userId, params),
            enable,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useGetUsers = (params = {}) => {
    const options = computed(() => {
        return {
            queryKey: queryKeysGetAllUsers(params),
            queryFn: () => userService.get(params),
            staleTime: 5 * 1000,
            keepPreviousData: true,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useMutationAddUser = () => {
    return useMutation({
        mutationFn: (data) => {
            return userService.post(data);
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

export const useMutationEditUser = () => {
    return useMutation({
        mutationFn: (data) => {
            return userService.put(data.id, data);
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

export const useMutationDeleteUser = () => {
    return useMutation({
        mutationFn: (id) => {
            return userService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
