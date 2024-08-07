<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import SecureInput from "@/components/shared/form/SecureInput.vue";
import { PERMISSIONS } from "@/constants";
import {
    useGetUserDetails,
    useMutationAddUser,
    useMutationEditUser,
} from "@/hooks/user.hook";
import uploadService from "@/services/upload.service";
import { urlImage } from "@/utils";
import { rules } from "@/utils/rule";
import { computed, reactive, ref, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";

const router = useRouter();
const route = useRoute();
const id = computed(() => route.params?.id);

const mutationAdd = useMutationAddUser();
const mutationEdit = useMutationEditUser();

const enable = computed(() => Boolean(id.value));

const { data: user, isLoading } = useGetUserDetails({
    userId: id,
    enable: enable.value,
});

const permissionOptions = [
    {
        key: "Quản trị",
        value: PERMISSIONS.ADMIN,
    },
    {
        key: "Sinh viên",
        value: PERMISSIONS.STUDENT,
    },
    {
        key: "Giang viên",
        value: PERMISSIONS.TEACHER,
    },
];

const state = reactive({
    username: "",
    fullName: "",
    email: "",
    password: "",
    rePassword: "",
    permission: PERMISSIONS.STUDENT,
    image: null,
    imageUrl: "",
    imageName: "",
});
const valid = ref(false);
const form = ref(null);

watchEffect(() => {
    if (user.value?.metadata) {
        state.username = user.value?.metadata?.name;
        state.fullName = user.value?.metadata?.viewname;
        state.email = user.value?.metadata?.email;
        state.permission = user.value?.metadata?.permission;
        state.imageUrl = urlImage(user.value?.metadata?.image, "avatar");
        state.imageName = user.value?.metadata?.image;
    }
});

const submit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    const payload = {
        name: state.username,
        viewname: state.fullName,
        email: state.email,
        password: state.password,
        permission: state.permission,
        image: state.imageName,
    };

    console.log(payload);

    if (!payload.image) {
        toast.error("Vui lý chọn ảnh đại diện");
        return;
    }

    if (Boolean(id.value)) {
        delete payload.password;

        mutationEdit.mutate(
            { ...payload, id: id.value },
            {
                onSuccess: () => {
                    toast.success("Cập nhật tài khoản thành công!");
                    router.push({ name: "account" });
                },
            }
        );

        return;
    }

    mutationAdd.mutate(payload, {
        onSuccess: () => {
            toast.success("Thêm tài khoản thành công!");
            router.push({ name: "account" });
        },
    });

    console.log(`payload:::`, payload);
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
    <main-top
        title="Danh sách tài khoản"
        sub="Quản lí tài khoản"
        icon="mdi-pencil-box-outline"
    />

    <v-card class="mx-30 pa-30 cate-card">
        <v-form v-model="valid">
            <v-container>
                <v-form @submit="submit" ref="form" v-model="valid">
                    <v-card>
                        <v-card-title>
                            <h3>{{ $route.meta.title }}</h3>
                        </v-card-title>

                        <v-card-text>
                            <v-select
                                v-model="state.permission"
                                :items="permissionOptions"
                                item-title="key"
                                item-value="value"
                                label="Quyền truy cập"
                                :rules="[rules.required]"
                                required
                            ></v-select>

                            <v-text-field
                                :disabled="id"
                                v-model="state.username"
                                :rules="[rules.required, rules.username]"
                                label="Tên tài khoản"
                                placeholder="Nhập tên tài khoản"
                                required
                                counter
                                clearable
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

                            <v-text-field
                                :disabled="id"
                                v-model="state.email"
                                :rules="[rules.required, rules.email]"
                                label="Email"
                                placeholder="Nhập email"
                                required
                                counter
                                clearable
                            ></v-text-field>

                            <secure-input
                                v-if="!id"
                                v-model="state.password"
                                label="Mật khẩu"
                                placeholder="Nhập mật khẩu"
                                :required="true"
                            />

                            <secure-input
                                v-if="!id"
                                v-model="state.rePassword"
                                label="Xác nhận mật khẩu"
                                placeholder="Nhập lại mật khẩu"
                                :required="true"
                                :rules="[
                                    rules.required,
                                    rules.min(3),
                                    rules.max(40),
                                    rules.match(
                                        state.password,
                                        'Nhập lại mật khẩu không trùng khớp!'
                                    ),
                                ]"
                            />

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
                                :loading="
                                    mutationAdd.isPending.value ||
                                    mutationEdit.isPending.value
                                "
                                :disabled="
                                    mutationAdd.isPending.value ||
                                    mutationEdit.isPending.value
                                "
                                class="action-icon-btn"
                            >
                                {{ id ? "Lưu thay đổi" : "Thêm mới" }}
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-form>
            </v-container>
        </v-form>
    </v-card>
</template>

<style lang="css" scoped></style>
