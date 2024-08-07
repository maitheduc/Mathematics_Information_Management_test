import queryKeys from "@/constants/queryKey.constant";
import mailboxService from "@/services/mailbox.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { isAxiosError } from "axios";
import { computed } from "vue";
import { toast } from "vue-sonner";

const TAB_OPTIONS = {
    NORMAL: "NORMAL",
    ANONYMOUS: "ANONYMOUS",
    ALL: "ALL",
};

export const queryKeysGetAllMailbox = (params = {}) => {
    return getQueryKeys({ key: queryKeys.mailbox.GET_ALL, ...params });
};

export const useGetMailbox = (params = {}) => {
    const computedParams = computed(() => {
        return Object.entries(params).reduce((acc, [key, value]) => {
            if (key === "tab") {
                const conditions =
                    value.value?.toLowerCase() === TAB_OPTIONS.NORMAL.toLowerCase()
                        ? { "dadoc[eq]": 0, "andanh[eq]": 0 }
                        : value.value?.toLowerCase() === TAB_OPTIONS.ANONYMOUS.toLowerCase()
                        ? { "andanh[eq]": 1 }
                        : {
                              limit: 99999999,
                          };

                const entries = Object.entries(conditions);

                if (entries.length) {
                    entries.forEach(([_key, _value]) => {
                        acc[_key] = _value;
                    });
                }
            } else {
                acc[key] = value;
            }

            return acc;
        }, {});
    });

    const options = computed(() => {
        return {
            queryKey: queryKeysGetAllMailbox(computedParams.value),
            queryFn: () => mailboxService.get(computedParams.value),
            staleTime: 5 * 1000,
            keepPreviousData: true,
        };
    });

    const { isLoading, data } = useQuery(options);

    return { isLoading, data };
};

export const useMutationAddMailbox = () => {
    return useMutation({
        mutationFn: (data) => {
            return mailboxService.post(data);
        },
        onError: (error) => {
            console.log({ error });

            if (isAxiosError(error)) {
                if (error.response.data?.errors) {
                    console.log(error.response.data.errors);

                    Object.values(error.response.data.errors).forEach((err) => {
                        err?.forEach((e) => {
                            setTimeout(() => {
                                toast.error(e, {
                                    position: "bottom-center",
                                });
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

export const useMutationEditMailbox = () => {
    return useMutation({
        mutationFn: (data) => {
            return mailboxService.put(data.id, data);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};

export const useGetCountMailbox = () => {
    return useQuery({
        queryKey: getQueryKeys({ key: queryKeys.mailbox.COUNT }),
        queryFn: () => mailboxService.getCount(),
        staleTime: 5 * 1000,
        keepPreviousData: true,
        select: (data) => {
            if (!data?.metadata) return null;

            const { countAll, countAnonymous, countNormal } = data.metadata;

            return {
                NORMAL: countNormal,
                ANONYMOUS: countAnonymous,
                ALL: countAll,
            };
        },
    });
};
