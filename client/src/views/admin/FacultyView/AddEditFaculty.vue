<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import {
    useGetFacultyDetails,
    useMutationAddFaculty,
    useMutationEditFaculty,
} from "@/hooks/faculty.hook";
import { rules } from "@/utils/rule";
import { computed, reactive, ref, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import UploadFileImage from "@/components/shared/form/UploadFileImage.vue";
import uploadService from "@/services/upload.service";
import { toast } from "vue-sonner";
import { filterValuesEmptyObject, urlImage } from "@/utils";

const route = useRoute();
const router = useRouter();

const mutationAdd = useMutationAddFaculty();
const mutationEdit = useMutationEditFaculty();

const form = ref(null);
const isValid = ref(false);

const state = reactive({
    name: "",
    description: "",
    image: null,
    imageName: "",
    imageUrl: "",
});

const id = computed(() => route.params?.id);

const { data: faculty, isLoading } = useGetFacultyDetails({
    id,
    select: (data) => (Boolean(id.value) ? data?.metadata : null),
});

watchEffect(() => {
    if (faculty.value?.id) {
        state.name = faculty.value?.name;
        state.description = faculty.value?.description;
        state.imageName = faculty.value?.image;
        state.imageUrl = faculty.value?.image
            ? urlImage(faculty.value?.image, "faculty")
            : "";
    }
});

const onSubmit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) {
        isValid.value = false;
        return;
    }

    isValid.value = true;

    const payload = {
        name: state.name,
        description: state.description,
        image: state.imageName,
    };

    if (!Boolean(payload.image)) {
        toast.error("Vui lòng chọn hình đại diện!");
        return;
    }

    if (Boolean(id.value)) {
        mutationEdit.mutate(
            { ...filterValuesEmptyObject(payload), id: id.value },
            {
                onSuccess: () => {
                    toast.success("Cập nhật khoa thành công");
                    router.push({ name: "faculty" });
                },
            }
        );
        return;
    }

    mutationAdd.mutate(filterValuesEmptyObject(payload), {
        onSuccess: () => {
            toast.success("Thêm khoa thành công");
            router.push({ name: "faculty" });
        },
    });
};

const handleOnFileChange = (file) => {
    if (!file) {
        state.imageUrl = "";
        state.imageName = "";
        return;
    }

    uploadService
        .uploadFile(file, "user/images/faculty")
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
        title="Khoa"
        sub="Quản lý danh mục khoa"
        icon="mdi-pencil-box-outline"
        parent="Nhân sự"
    />

    <v-card class="mx-30 pa-30 cate-card">
        <v-container>
            <v-form @submit="onSubmit" ref="form" v-model="isValid">
                <v-card>
                    <v-card-title>
                        <h3>{{ $route.meta.title }}</h3>
                    </v-card-title>

                    <v-card-text>
                        <small class="text--secondary">
                            Mỗi khoa chỉ có một tên duy nhất
                        </small>

                        <v-text-field
                            v-model="state.name"
                            :rules="[rules.required]"
                            label="Tên khoa"
                            placeholder="Nhập tên khoa"
                            required
                        ></v-text-field>

                        <v-textarea
                            v-model="state.description"
                            label="Mô tả"
                            placeholder="Viết mô tả khoa...  (không bắt buộc)"
                            rows="2"
                            :rules="[rules.required]"
                        ></v-textarea>

                        <upload-file-image
                            v-model:value="state.image"
                            @onFileChange="handleOnFileChange"
                            :imageUrl="state.imageUrl"
                        />
                    </v-card-text>

                    <v-card-actions>
                        <v-btn
                            class="action-icon-btn"
                            variant="tonal"
                            :loading="
                                mutationAdd.isPending.value ||
                                mutationEdit.isPending.value
                            "
                            :disabled="
                                mutationAdd.isPending.value ||
                                mutationEdit.isPending.value
                            "
                            @click="onSubmit"
                        >
                            {{ id ? "Lưu thay đổi" : "Thêm mới" }}
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-form>
        </v-container>
    </v-card>
</template>

<style lang="css" scoped></style>
