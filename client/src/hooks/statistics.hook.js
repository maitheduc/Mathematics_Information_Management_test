import queryKeys from "@/constants/queryKey.constant";
import statisticsService from "@/services/statistics.service";
import { getQueryKeys } from "@/utils";
import { useQuery } from "@tanstack/vue-query";

export const useGetStatisticsCount = () => {
    return useQuery({
        queryKey: getQueryKeys({ key: queryKeys.statistics.COUNT }),
        queryFn: () => {
            return statisticsService.count();
        },
        staleTime: 5 * 1000,
        keepPreviousData: true,
        select: (data) => data?.metadata,
    });
};
