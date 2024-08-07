import { useRoute } from "vue-router";

const useQueryString = () => {
    const route = useRoute();
    return route.query;
};

export default useQueryString;
