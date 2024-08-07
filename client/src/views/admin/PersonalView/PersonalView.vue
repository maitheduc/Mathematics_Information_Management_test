<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import DeleteConfirmDialog from "@/components/shared/dialog/DeleteConfirmDialog.vue";
import Search from "@/components/ui/Search";
import queryKeys from "@/constants/queryKey.constant";
import {
    useGetPersonnel,
    useMutationDeletePersonnel,
} from "@/hooks/personnel.hook";
import { getQueryKeys, urlImage } from "@/utils";
import { useQueryClient } from "@tanstack/vue-query";
import { computed, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";
import DialogSeePersonnel from "@/views/admin/PersonalView/component/DialogSeePersonnel.vue";

const route = useRoute();
const router = useRouter();
const queryClient = useQueryClient();
const mutationDelete = useMutationDeletePersonnel();

const openDialog = ref(false);
const selectedDelete = ref(null);
const openDialogSeeDetail = ref(false);
const selectedSeeDetail = ref(null);

const page = computed(() => parseInt(route.query?.page) || 1);
const querySearch = computed(() => route.query?.q || "");

const options = computed(() => {
    return {
        page,
        limit: 10,
        include_faculty: "true",
        include_department: "true",
        ...(querySearch && {
            "email[like]": querySearch,
        }),
    };
});

const { data, isLoading } = useGetPersonnel(options.value);

const headers = [
    { title: "ID", align: "start", key: "id", maxWidth: 50 },
    {
        title: "Họ và tên",
        align: "start",
        key: "fullName",
        maxWidth: 200,
        value: (item) => item?.last_name + " " + item?.first_name || "N/A",
    },
    {
        title: "Avatar",
        align: "start",
        key: "avatar",
    },
    {
        title: "Email",
        align: "start",
        key: "email",
        maxWidth: 100,
        nowrap: true,
    },
    {
        title: "Thuộc Khoa",
        align: "start",
        key: "faculty",
        value: (item) => item?.department?.faculty?.name || "N/A",
    },
    {
        title: "Thuộc bộ phận",
        align: "start",
        key: "department",
        value: (item) => item?.department?.name || "N/A",
        maxWidth: 150,
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
                    key: queryKeys.personnel.GET_ALL,
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

const seeItem = (item) => {
    openDialogSeeDetail.value = true;
    selectedSeeDetail.value = item;
};
</script>

<template>
    <main-top
        title="Nhân sự"
        sub="Quản lý nhân sự"
        icon="mdi-pencil-box-outline"
    />

    <dialog-see-personnel
        v-model:open="openDialogSeeDetail"
        :data="selectedSeeDetail"
    />

    <delete-confirm-dialog
        :open="openDialog"
        @update:open="handleClose"
        @confirm="handleConfirm"
    />

    <v-card class="mx-30 pa-30">
        <div class="d-flex justify-space-between mb-5">
            <search
                placeholder="Tìm kiếm theo email..."
                width="300px"
                height="45px"
                widthIcon="54px"
            />

            <router-link
                class="text-decoration-none text-white"
                :to="{ name: 'add_personnel' }"
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
            :loading="isLoading"
            :hide-default-footer="true"
            item-key="name"
            hover
        >
            <template v-slot:loading>
                <v-skeleton-loader type="table-row@5"></v-skeleton-loader>
            </template>

            <template v-slot:item.avatar="{ value }">
                <v-avatar size="36px">
                    <v-img
                        alt="Avatar"
                        :src="urlImage(value, 'personnel')"
                    ></v-img>
                </v-avatar>
            </template>

            <template v-slot:item.actions="{ item }">
                <router-link
                    :to="{ name: 'edit_personnel', params: { id: item.id } }"
                >
                    <v-icon size="small" color="green" @click="editItem(item)">
                        mdi-pencil
                    </v-icon>
                </router-link>

                <v-icon
                    size="small"
                    class="mx-2"
                    color="red"
                    @click="deleteItem(item)"
                >
                    mdi-delete
                </v-icon>

                <v-icon size="small" color="red" @click="seeItem(item)">
                    mdi-eye-arrow-right-outline
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

<style lang="css" scoped></style>