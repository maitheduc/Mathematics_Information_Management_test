<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import {
    useGetDepartmentDetails,
    useMutationAddDepartment,
    useMutationEditDepartment,
} from "@/hooks/department.hook";
import { rules } from "@/utils/rule";
import { computed, reactive, ref, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import UploadFileImage from "@/components/shared/form/UploadFileImage.vue";
import uploadService from "@/services/upload.service";
import { toast } from "vue-sonner";
import { filterValuesEmptyObject, urlImage } from "@/utils";
import { useGetFaculty } from "@/hooks/faculty.hook";
import { keysOfDepartment } from "@/constants";

const route = useRoute();
const router = useRouter();

const mutationAdd = useMutationAddDepartment();
const mutationEdit = useMutationEditDepartment();

const form = ref(null);
const isValid = ref(false);

const state = reactive({
    name: "",
    description: "",
    image: null,
    key: null,
    imageName: "",
    imageUrl: "",
    faculty_id: null,
});

const id = computed(() => route.params?.id);

const { data: department, isLoading } = useGetDepartmentDetails({
    id,
    select: (data) => (Boolean(id.value) ? data?.metadata : null),
});
const { data: faculties, isLoading: isLoadingFaculties } = useGetFaculty({
    all: 1,
});

watchEffect(() => {
    if (department.value?.id) {
        state.name = department.value?.name;
        state.description = department.value?.description;
        state.imageName = department.value?.image;
        state.faculty_id = department.value?.faculty_id;
        state.key = department.value?.key;
        state.imageUrl = department.value?.image
            ? urlImage(department.value?.image, "department")
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
        faculty_id: state.faculty_id,
        key: state.key || "default",
    };

    if (!Boolean(payload.image)) {
        toast.error("Vui lòng chọn hình ảnh");
        return;
    }

    if (Boolean(id.value)) {
        mutationEdit.mutate(
            { ...filterValuesEmptyObject(payload), id: id.value },
            {
                onSuccess: () => {
                    toast.success("Cập nhật bộ môn thành công");
                    router.push({ name: "department" });
                },
            }
        );
        return;
    }

    mutationAdd.mutate(filterValuesEmptyObject(payload), {
        onSuccess: () => {
            toast.success("Thêm bộ môn thành công");
            router.push({ name: "department" });
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
        .uploadFile(file, "user/images/department")
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
        title="Bộ môn"
        sub="Quản lý danh mục bộ môn"
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
                            Mỗi bộ môn chỉ có một tên duy nhất
                        </small>

                        <v-select
                            :loading="isLoadingFaculties"
                            v-model="state.faculty_id"
                            :items="faculties?.metadata"
                            :rules="[rules.required]"
                            item-title="name"
                            item-value="id"
                            label="Thuộc khoa"
                            required
                        ></v-select>

                        <v-select
                            :loading="isLoadingFaculties"
                            v-model="state.key"
                            :items="keysOfDepartment"
                            item-title="label"
                            item-value="value"
                            label="Thuộc lĩnh vực"
                            required
                        ></v-select>

                        <v-text-field
                            v-model="state.name"
                            :rules="[rules.required]"
                            label="Tên bộ môn"
                            placeholder="Nhập tên bộ môn"
                            required
                        ></v-text-field>

                        <v-textarea
                            v-model="state.description"
                            label="Mô tả"
                            placeholder="Viết mô tả bộ môn...  (không bắt buộc)"
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
