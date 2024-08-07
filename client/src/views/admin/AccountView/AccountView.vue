<script setup>
import { computed, ref } from "vue";
import MainTop from "@/components/shared/admin/MainTop";
import Search from "@/components/ui/Search";
import {
    queryKeysGetAllUsers,
    useGetUsers,
    useMutationDeleteUser,
} from "@/hooks/user.hook";
import { useRoute, useRouter } from "vue-router";
import { fDate } from "@/utils";
import DeleteConfirmDialog from "@/components/shared/dialog/DeleteConfirmDialog.vue";
import { PERMISSIONS } from "@/constants";
import { useQueryClient } from "@tanstack/vue-query";
import { toast } from "vue-sonner";

const route = useRoute();
const router = useRouter();
const page = computed(() => parseInt(route.query?.page) || 1);
const search = computed(() => route.query?.q || "");
const checkIsSearching = computed(() => search.value.length > 0);
const openDeleteDialog = ref(false);
const selectedDelete = ref(null);
const { mutate, isPending } = useMutationDeleteUser();

const options = computed(() => {
    return {
        page,
        limit: 10,
        ...(checkIsSearching && { "name[like]": search }),
    };
});

const queryClient = useQueryClient();

const { data, isLoading } = useGetUsers(options.value);

const headers = [
    { title: "ID", align: "start", key: "id" },
    { title: "Tài khoản", align: "start", key: "name" },
    { title: "Email", align: "start", key: "email" },
    {
        title: "Ngày cập nhật",
        align: "start",
        key: "updated_at",
        value: (item) =>
            item.updated_at
                ? fDate(item.updated_at, "DD-MM-YYYY HH:mm:ss")
                : "N/A",
    },
    { title: "Quyền", align: "start", key: "permission" },
    { title: "Action", key: "actions", sortable: false },
];

const getColor = (role) => {
    if (role === "Admin") return "red";
    else if (role === "SinhVien") return "orange";
    else return "green";
};

const deleteItem = (item) => {
    console.log(`item:::`, item);
    selectedDelete.value = item;
    openDeleteDialog.value = true;
};

const handleClose = (value) => {
    openDeleteDialog.value = value;

    if (!value) selectedDelete.value = null;
};

const deleteItemConfirm = (callback) => {
    if (!selectedDelete.value) return;

    openDeleteDialog.value = false;

    mutate(selectedDelete.value.id, {
        onSuccess: () => {
            queryClient.invalidateQueries({
                queryKey: queryKeysGetAllUsers(options.value),
                exact: true,
            });

            toast.success("Xóa tài khoản thành công!");

            callback();
        },
    });
};

const onchangePage = (currentPage) => {
    router.push({
        path: route.path,
        query: { ...route.query, page: currentPage },
    });
};
</script>

<template>
    <MainTop
        title="Danh sách tài khoản"
        sub="Quản lí tài khoản"
        icon="mdi-pencil-box-outline"
    />

    <delete-confirm-dialog
        :open="openDeleteDialog"
        @update:open="handleClose"
        @confirm="deleteItemConfirm"
    />

    <v-card class="mx-30 pa-30">
        <div class="d-flex justify-space-between mb-5">
            <Search
                placeholder="Tìm kiếm tên tài khoản..."
                width="300px"
                height="45px"
                widthIcon="54px"
            />

            <router-link
                class="text-white text-decoration-none"
                :to="{ name: 'account_create' }"
            >
                <v-btn
                    color="success"
                    prepend-icon="mdi-plus-circle-outline"
                    class="action-icon-btn"
                >
                    Thêm mới
                </v-btn>
            </router-link>
        </div>

        <v-data-table
            :headers="headers"
            :items="data?.metadata"
            :loading="isLoading || isPending"
            :hide-default-footer="true"
            density="compact"
            item-key="name"
        >
            <template v-slot:loading>
                <v-skeleton-loader type="table-row@5"></v-skeleton-loader>
            </template>

            <template v-slot:item.permission="{ value }">
                <v-chip :color="getColor(value)" size="small">
                    {{ value }}
                </v-chip>
            </template>

            <template v-slot:item.actions="{ item }">
                <router-link
                    :to="{ name: 'account_edit', params: { id: item.id } }"
                >
                    <v-icon class="me-2" size="small" color="green">
                        mdi-pencil
                    </v-icon>
                </router-link>

                <v-icon
                    :disabled="item.permission === PERMISSIONS.ADMIN"
                    size="small"
                    color="red"
                    @click="deleteItem(item)"
                >
                    mdi-delete
                </v-icon>
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

<style lang="css" scoped>
.action-btn {
    display: flex;
    align-items: center;
    justify-content: center;
}

.custom-thead tr th {
    font-size: 1.2em;
    font-weight: bold;
    border-top: 2px solid #000;
}

thead.table-header {
    font-size: 14px !important;
}
</style>