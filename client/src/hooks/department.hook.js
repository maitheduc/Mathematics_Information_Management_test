import queryKeys from "@/constants/queryKey.constant";
import departmentService from "@/services/department.service";
import { getQueryKeys, mapParamsToValues } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const useGetDepartment = (params = {}, select = undefined, enabled = true) => {
    const options = computed(() => {
        return {
            queryFn: () => departmentService.get(params),
            queryKey: getQueryKeys({ key: queryKeys.department.GET_ALL, ...params }),
            select,
            staleTime: 5 * 1000,
            keepPreviousData: true,
            enabled: mapParamsToValues(enabled),
        };
    });

    return useQuery(options);
};

export const useGetDepartmentDetails = ({ id, params = {}, select = undefined }) => {
    const options = computed(() => {
        return {
            queryFn: () => departmentService.getById(id, params),
            queryKey: getQueryKeys({ key: queryKeys.department.DETAILS, id, ...params }),
            select,
            enabled: Boolean(id.value),
        };
    });

    return useQuery(options);
};

export const useMutationAddDepartment = () => {
    return useMutation({
        mutationFn: (data) => {
            return departmentService.post(data);
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

export const useMutationEditDepartment = () => {
    return useMutation({
        mutationFn: (data) => {
            return departmentService.put(data.id, data);
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

export const useMutationDeleteDepartment = () => {
    return useMutation({
        mutationFn: (id) => {
            return departmentService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
