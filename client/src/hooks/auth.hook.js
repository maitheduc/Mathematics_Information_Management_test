import queryKeys from "@/constants/queryKey.constant";
import authService, { AuthLocalStorageService } from "@/services/auth.service";
import userService from "@/services/user.service";
import { getQueryKeys, sleep } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const mutationLogin = () => {
    return useMutation({
        mutationFn: async (data) => {
            await sleep(500);

            return authService.login(data);
        },
        onError: (error) => {
            if (error?.response?.data?.message) {
                toast.error(error.response.data.message);
            } else {
                toast.error("Đăng nhập thất bại");
            }
        },
    });
};

export const useGetMe = ({ userId, params = {}, enabled = true, select = undefined }) => {
    const options = computed(() => {
        return {
            queryKey: getQueryKeys({ key: queryKeys.users.GET_ME, userId, ...params }),
            queryFn: () => userService.getById(userId, params),
            enabled,
            keepPreviousData: true,
            staleTime: 5 * 1000,
            select,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const getAuth = () => {
    const userId = computed(() => AuthLocalStorageService.getAuth());

    const { data, isLoading } = useGetMe({
        userId,
        enabled: Boolean(userId.value),
        select: (data) => data?.metadata,
    });

    return { userId, data, isLoading };
};
