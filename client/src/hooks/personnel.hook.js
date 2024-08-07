import queryKeys from "@/constants/queryKey.constant";
import personnelService from "@/services/personnel.service";
import { getQueryKeys } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const useGetPersonnel = (params = {}, select = undefined) => {
    const options = computed(() => {
        return {
            queryFn: () => personnelService.get(params),
            queryKey: getQueryKeys({ key: queryKeys.personnel.GET_ALL, ...params }),
            select,
            staleTime: 5 * 1000,
            keepPreviousData: true,
        };
    });

    return useQuery(options);
};

export const useGetPersonnelDetails = ({ id, params = {}, select = undefined }) => {
    const options = computed(() => {
        return {
            queryFn: () => personnelService.getById(id, params),
            queryKey: getQueryKeys({ key: queryKeys.personnel.DETAILS, id, ...params }),
            select,
            enabled: Boolean(id.value),
        };
    });

    return useQuery(options);
};

export const useMutationAddPersonnel = () => {
    return useMutation({
        mutationFn: (data) => {
            return personnelService.post(data);
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

export const useMutationEditPersonnel = () => {
    return useMutation({
        mutationFn: (data) => {
            return personnelService.put(data.id, data);
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

export const useMutationDeletePersonnel = () => {
    return useMutation({
        mutationFn: (id) => {
            return personnelService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
