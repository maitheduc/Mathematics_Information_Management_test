<script setup>
import NewItem from "@/components/shared/client/NewItem/NewItem.vue";
import { useGetNews } from "@/hooks/news.hook";
import { fDate } from "@/utils";
import { computed, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";

const route = useRoute();
const router = useRouter();
const LIMIT = 10;

const page = computed(() => {
    return parseInt(route.query?.page) || 1;
});

const id = computed(() => route.query?.id);

// Cập nhật tiêu đề dựa trên id
const titleMap = {
    '1': 'Chung',
    '2': 'Tin giáo vụ',
    '3': 'Tin Nghiên cứu',
    '4': 'Sự Kiện Khoa',
    // Thêm các loại tin khác ở đây
};

const currentTitle = computed(() => {
    return id.value ? titleMap[id.value] || 'Danh sách bài viết' : 'Danh sách bài viết';
});

const { data, isLoading } = useGetNews({
    page: page,
    limit: LIMIT,
    ...(id && { "id_loaitin[eq]": id }),
});

const onchangePage = (currentPage) => {
    router.push({
        path: route.path,
        query: { ...route.query, page: currentPage },
    });
};

// Theo dõi sự thay đổi của id để cập nhật tiêu đề nếu cần
watch(id, () => {
    // Có thể thêm logic bổ sung ở đây nếu cần
});
</script>

<template>
    <v-container v-if="isLoading">
        <v-row>
            <v-col cols="12" md="12">
                <v-skeleton-loader type="heading"></v-skeleton-loader>
            </v-col>

            <v-col
                v-for="item in 5"
                :key="item"
                cols="12"
                md="12"
                class="border"
            >
                <v-row>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader type="image"></v-skeleton-loader>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader type="article"></v-skeleton-loader>
                    </v-col>
                </v-row>
            </v-col>
        </v-row>
    </v-container>

    <div class="main-content" v-else>
        <div class="text-title">
            <v-icon class="mr-2">mdi-format-list-bulleted</v-icon>
            <h1>{{ `Sự kiện &amp Tin tức / ${currentTitle}` }}</h1>
        </div>

        <template v-if="data?.metadata?.length">
            <new-item
                v-for="item in data?.metadata"
                :key="item?.id"
                :title="item?.tieude"
                :description="item?.mota"
                :imageUrl="item?.hinhdaidien"
                :datetime="fDate(item?.created_at, 'DD-MM-YYYY HH:mm:ss')"
                :id="item?.id"
                :views="5"
                :comments="0"
            />

            <v-pagination
                class="mt-4"
                :length="data?.options?.total_pages"
                v-model="page"
                @update:modelValue="onchangePage"
                :total-visible="5"
            ></v-pagination>
        </template>

        <p v-else class="text-center mt-5 text-h6 text-grey">
            Không tìm thấy bài viết
        </p>
    </div>
</template>

<style lang="css" scoped>
.text-title {
    height: 49px;
    display: flex;
    align-items: center;
    padding: 0 18px;
    background-color: var(--primary);
    color: var(--white);
    border-radius: 4px;
}

.text-title h1 {
    font-size: 18px;
    font-weight: lighter;
    text-transform: capitalize;
}
</style>
