import { QueryClient } from "@tanstack/vue-query";

export const queryClient = new QueryClient({
    defaultOptions: {
        queries: {
            refetchOnWindowFocus: false,
        },
    },
});

const vueQueryPluginOptions = {
    queryClientConfig: {
        defaultOptions: {
            queries: {
                refetchOnWindowFocus: false,
            },
        },
    },
};

export default vueQueryPluginOptions;
