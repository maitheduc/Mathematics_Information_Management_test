<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import DeleteConfirmDialog from "@/components/shared/dialog/DeleteConfirmDialog.vue";
import Search from "@/components/ui/Search";
import queryKeys from "@/constants/queryKey.constant";
import { useGetFaculty, useMutationDeleteFaculty } from "@/hooks/faculty.hook";
import { getQueryKeys, urlImage } from "@/utils";
import { useQueryClient } from "@tanstack/vue-query";
import { computed, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";

const route = useRoute();
const router = useRouter();
const queryClient = useQueryClient();
const mutationDelete = useMutationDeleteFaculty();

const openDialog = ref(false);
const selectedDelete = ref(null);

const page = computed(() => parseInt(route.query?.page) || 1);
const querySearch = computed(() => route.query?.q || "");
const isSearching = computed(() => {
    return querySearch.value.length > 0;
});

const options = computed(() => {
    return {
        page,
        limit: 10,
        ...(isSearching && { "name[like]": querySearch }),
    };
});

const { data, isLoading } = useGetFaculty(options.value);

const headers = [
    { title: "ID", align: "start", key: "id", maxWidth: 50 },
    {
        title: "Tên khoa",
        align: "start",
        key: "name",
        maxWidth: 200,
    },
    {
        title: "Hình ảnh",
        align: "start",
        key: "image",
        sortable: false,
    },
    {
        title: "Mô tả",
        align: "start",
        key: "description",
        maxWidth: 200,
        nowrap: true,
    },
    { title: "Action", key: "actions", sortable: false },
];

const onchangePage = (currentPage) => {
    router.push({
        path: route.path,
        query: { ...route.query, page: currentPage },
    });
};

const deleteItem = (item) => {
    openDialog.value = true;
    selectedDelete.value = item;
};

const handleClose = (value) => {
    openDialog.value = value;
    if (!value) selectedDelete.value = null;
};

const handleConfirm = (callback) => {
    mutationDelete.mutate(selectedDelete.value.id, {
        onSuccess: () => {
            queryClient.invalidateQueries({
                queryKey: getQueryKeys({
                    key: queryKeys.faculty.GET_ALL,
                    ...options.value,
                }),
                exact: true,
            });
            toast.success("Đã xóa thành công!");
            handleClose();
            callback();
        },
    });
};
</script>

<template>
    <main-top
        title="Khoa"
        sub="Quản lý danh mục khoa"
        icon="mdi-pencil-box-outline"
        parent="Nhân sự"
    />

    <delete-confirm-dialog
        :open="openDialog"
        @update:open="handleClose"
        @confirm="handleConfirm"
    />

    <v-card class="mx-30 pa-30">
        <div class="d-flex justify-space-between mb-5">
            <search
                placeholder="Tìm kiếm khoa..."
                width="300px"
                height="45px"
                widthIcon="54px"
            />

            <!-- <router-link
                class="text-decoration-none text-white"
                :to="{ name: 'add_faculty' }"
            >
                <v-btn
                    color="success"
                    prepend-icon="mdi-plus-circle-outline"
                    class="action-icon-btn"
                    @click="addNew"
                >
                    Thêm mới
                </v-btn>
            </router-link> -->
        </div>

        <v-data-table
            :headers="headers"
            :items="data?.metadata"
            :loading="isLoading"
            :hide-default-footer="true"
            item-key="name"
            hover
        >
            <template v-slot:loading>
                <v-skeleton-loader type="table-row@5"></v-skeleton-loader>
            </template>

            <template v-slot:item.image="{ value }">
                <v-img :src="urlImage(value, 'faculty')"></v-img>
            </template>

            <template v-slot:item.actions="{ item }">
                <router-link
                    :to="{ name: 'edit_faculty', params: { id: item.id } }"
                >
                    <v-icon
                        class="me-2"
                        size="small"
                        color="green"
                        @click="editItem(item)"
                    >
                        mdi-pencil
                    </v-icon>
                </router-link>

                <!-- <v-icon size="small" color="red" @click="deleteItem(item)">
                    mdi-delete
                </v-icon> -->
            </template>
        </v-data-table>

        <v-pagination
            size="small"
            class="mt-4"
            :length="data?.options?.total_pages"
            v-model="page"
            @update:modelValue="onchangePage"
            :total-visible="5"
        ></v-pagination>
    </v-card>
</template>

<style lang="css" scoped></style>