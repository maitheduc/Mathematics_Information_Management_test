import queryKeys from "@/constants/queryKey.constant";
import facultyService from "@/services/faculty.service";
import { getQueryKeys, mapParamsToValues } from "@/utils";
import { useMutation, useQuery } from "@tanstack/vue-query";
import { computed } from "vue";
import { toast } from "vue-sonner";

export const useGetFaculty = (params = {}, select = undefined) => {
    const options = computed(() => {
        return {
            queryFn: () => facultyService.get(params),
            queryKey: getQueryKeys({ key: queryKeys.faculty.GET_ALL, ...params }),
            select,
            staleTime: 5 * 1000,
            keepPreviousData: true,
        };
    });

    return useQuery(options);
};

export const useGetFacultyDetails = ({ id, params = {}, select = undefined }) => {
    const options = computed(() => {
        return {
            queryFn: () => facultyService.getById(id, params),
            queryKey: getQueryKeys({ key: queryKeys.faculty.DETAILS, id, ...params }),
            select,
            enabled: Boolean(mapParamsToValues(id)),
        };
    });

    return useQuery(options);
};

export const useMutationAddFaculty = () => {
    return useMutation({
        mutationFn: (data) => {
            return facultyService.post(data);
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

export const useMutationEditFaculty = () => {
    return useMutation({
        mutationFn: (data) => {
            return facultyService.put(data.id, data);
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

export const useMutationDeleteFaculty = () => {
    return useMutation({
        mutationFn: (id) => {
            return facultyService.delete(id);
        },
        onError: (error) => {
            toast.error(error.message);
        },
    });
};
