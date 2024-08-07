<script setup>
import queryKeys from "@/constants/queryKey.constant";
import { getAuth } from "@/hooks/auth.hook";
import { useMutationEditUser } from "@/hooks/user.hook";
import uploadService from "@/services/upload.service";
import { getQueryKeys, urlImage } from "@/utils";
import { rules } from "@/utils/rule";
import { useQueryClient } from "@tanstack/vue-query";
import { reactive, ref, watchEffect } from "vue";
import { toast } from "vue-sonner";

const mutationEdit = useMutationEditUser();

const { data: user, isLoading, userId } = getAuth();
const queryClient = useQueryClient();

const state = reactive({
    username: "",
    fullName: "",
    email: "",
    image: null,
    imageUrl: "",
    imageName: "",
});

const valid = ref(false);
const form = ref(null);

watchEffect(() => {
    if (user.value?.id) {
        state.username = user.value?.name;
        state.fullName = user.value?.viewname;
        state.email = user.value?.email;
        state.permission = user.value?.permission;
        state.imageUrl = urlImage(user.value?.image, "avatar");
        state.imageName = user.value?.image;
    }
});

const submit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    const payload = {
        name: state.username,
        viewname: state.fullName,
        email: state.email,
        image: state.imageName,
    };

    if (!payload.image) {
        toast.error("Vui lòng chọn ảnh đại diện");
        return;
    }

    mutationEdit.mutate(
        { ...payload, id: userId.value },
        {
            onSuccess: () => {
                toast.success("Cập nhật tài khoản thành công!");

                queryClient.invalidateQueries({
                    queryKey: getQueryKeys({
                        key: queryKeys.users.GET_ME,
                        userId,
                    }),
                    exact: true,
                });
            },
        }
    );

    return;
};

const onFileChange = (file) => {
    if (!file) {
        state.imageUrl = "";
        state.imageName = "";
        return;
    }

    state.image = file;

    uploadService
        .uploadFile(file, "user/images/avatar")
        .then(({ metadata }) => {
            state.imageUrl = metadata.url;
            state.imageName = metadata.name;
        })
        .catch((err) => {
            console.log(`upload err:::`, err);
        });
};
</script>

<template>
    <v-card class="mx-30 pa-30 cate-card">
        <v-form v-model="valid">
            <v-container>
                <v-form @submit="submit" ref="form" v-model="valid">
                    <v-card-title class="text-h5">
                        Thông tin cá nhân
                    </v-card-title>
                    <v-card-text>
                        <v-text-field
                            readonly
                            v-model="state.username"
                            :rules="[rules.required, rules.username]"
                            label="Tên tài khoản"
                            placeholder="Nhập tên tài khoản"
                            required
                            counter
                        ></v-text-field>

                        <v-text-field
                            readonly
                            v-model="state.email"
                            :rules="[rules.required, rules.email]"
                            label="Email"
                            placeholder="Nhập email"
                            required
                            counter
                        ></v-text-field>

                        <v-text-field
                            v-model="state.fullName"
                            :rules="[
                                rules.required,
                                rules.min(3),
                                rules.max(40),
                            ]"
                            label="Tên hiển thị"
                            placeholder="Nhập họ và tên"
                            required
                            counter
                            clearable
                        ></v-text-field>

                        <v-file-input
                            v-model="state.image"
                            label="Hình đại diện"
                            @update:modelValue="onFileChange"
                            required
                        ></v-file-input>

                        <v-img
                            v-if="state.imageUrl"
                            :src="state.imageUrl"
                            :width="200"
                            :height="200"
                            :alt="state.imageName"
                            cover
                        ></v-img>
                    </v-card-text>

                    <v-card-actions>
                        <v-btn
                            variant="tonal"
                            @click="submit"
                            :loading="mutationEdit.isPending.value"
                            :disabled="mutationEdit.isPending.value"
                            class="action-icon-btn"
                        >
                            Lưu thay đổi
                        </v-btn>
                    </v-card-actions>
                </v-form>
            </v-container>
        </v-form>
    </v-card>
</template>

<style lang="css" scoped></style>
