<script setup>
import CKEditor from "@/components/shared/admin/CKeditorCustom";
import MainTop from "@/components/shared/admin/MainTop";
import queryKeys from "@/constants/queryKey.constant";
import {
    useGetAbout,
    useMutationAddAbout,
    useMutationEditAbout,
} from "@/hooks/about.hook";
import { getQueryKeys } from "@/utils";
import { useQueryClient } from "@tanstack/vue-query";
import { getQuarter } from "date-fns";
import { ref, watchEffect } from "vue";
import { toast } from "vue-sonner";

const { data, isLoading } = useGetAbout();
const value = ref("");
const selected = ref(null);
const queryClient = useQueryClient();
const mutationAdd = useMutationAddAbout();
const mutationEdit = useMutationEditAbout();

watchEffect(() => {
    if (data.value?.metadata) {
        selected.value = data.value?.metadata;
        value.value = data.value?.metadata?.gioithieu;
    }
});

const onChangeEditor = (valueInput) => {
    value.value = valueInput;
};

const handleSubmit = () => {
    if (!value.value) {
        toast.error("Vui lòng nhập giới thiệu");
        return;
    }

    const payload = {
        gioithieu: value.value,
    };

    if (!selected.value) {
        mutationAdd.mutate(payload, {
            onSuccess: () => {
                toast.success("Đã thêm giới thiệu thành công");
                queryClient.invalidateQueries({
                    queryKey: getQueryKeys({ key: queryKeys.about.GET }),
                    exact: true,
                });
            },
        });
        return;
    }

    payload.id = selected.value.id;

    mutationEdit.mutate(payload, {
        onSuccess: () => {
            toast.success("Đã thay đổi giới thiệu thành công");
            queryClient.invalidateQueries({
                queryKey: getQueryKeys({ key: queryKeys.about.GET }),
                exact: true,
            });
        },
    });
};
</script>

<template>
    <MainTop
        title="Giới thiệu"
        sub="Thay đổi nội dung giới thiệu"
        icon="mdi-home"
        parent="Trang chủ"
    />
    <v-card class="card-about">
        <v-card-title>Chỉnh sửa nội dung</v-card-title>

        <CKEditor :value="value" @update:value="onChangeEditor" />

        <v-btn class="card-about-btn ma-5" @click="handleSubmit"
            >Cập nhật</v-btn
        >
    </v-card>
</template>

<style lang="css" scoped>
.card-about {
    margin: 0 30px;
}

.v-card-title {
    font-size: 20px;
    font-weight: 700;
}

.card-about-btn {
    background-color: var(--primary);
    box-shadow: #0006 0px 4px 8px 0px;
    color: #fff;
    font-family: Lato;
    font-size: 14px;
    font-weight: 700;
    text-transform: initial;
}
</style>
