<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import { useGetDepartment } from "@/hooks/department.hook";
import { rules } from "@/utils/rule";
import { computed, reactive, ref, watch, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import UploadFileImage from "@/components/shared/form/UploadFileImage.vue";
import uploadService from "@/services/upload.service";
import { toast } from "vue-sonner";
import { filterValuesEmptyObject, urlImage } from "@/utils";
import { useGetFaculty } from "@/hooks/faculty.hook";
import {
    useGetPersonnelDetails,
    useMutationAddPersonnel,
    useMutationEditPersonnel,
} from "@/hooks/personnel.hook";

const genders = [
    {
        key: "male",
        name: "Nam",
    },
    {
        key: "female",
        name: "Nữ",
    },
];

// học vị
const degrees = [
    {
        key: "DH",
        name: "Đại học",
    },
    {
        key: "PGS.TS",
        name: "PGS.TS",
    },
    {
        key: "Th.S",
        name: "Thạc sĩ",
    },
    {
        key: "TS",
        name: "Tiến sĩ",
    },
    {
        key: "Khac",
        name: "Khác",
    },
];

// học hàm
const academicRank = [
    {
        key: "Prof",
        name: "Phó giáo sư",
    },
    {
        key: "Professor",
        name: "Giáo sư",
    },
];

const route = useRoute();
const router = useRouter();

const mutationAdd = useMutationAddPersonnel();
const mutationEdit = useMutationEditPersonnel();

const form = ref(null);
const isValid = ref(false);

const state = reactive({
    first_name: "",
    last_name: "",
    email: "",
    phone: "",
    address: "",
    base_salary: 0,
    academic_level: null,
    description: "",
    degrees: null,
    gender: null,
    position: "",
    avatar: null,
    avatarName: "",
    avatarUrl: "",
    faculty_id: null,
    department_id: null,
});

const faculty_id = ref(null);

const id = computed(() => route.params?.id);

watch(state, (value) => {
    faculty_id.value = value.faculty_id;
});

const { data: personnel, isLoading } = useGetPersonnelDetails({
    id,
    params: {
        include_department: "true",
    },
    select: (data) => (Boolean(id.value) ? data?.metadata : null),
});

const enable = computed(() => Boolean(state.faculty_id));

const optionsGetDepartment = computed(() => {
    return {
        all: 1,
        ...(enable && { "faculty_id[eq]": faculty_id }),
    };
});

const { data: departments, isLoading: isLoadingDepartments } = useGetDepartment(
    optionsGetDepartment.value,
    undefined,
    enable
);

const { data: faculties, isLoading: isLoadingFaculties } = useGetFaculty({
    all: 1,
});

watch(departments, (department) => {
    if (!department?.metadata?.length) {
        state.department_id = null;
    }
});

watchEffect(() => {
    if (personnel.value?.id) {
        state.first_name = personnel.value?.first_name;
        state.last_name = personnel.value?.last_name;
        state.email = personnel.value?.email;
        state.phone = personnel.value?.phone;
        state.base_salary = personnel.value?.base_salary;
        state.academic_level = personnel.value?.academic_level;
        state.address = personnel.value?.address;
        state.degrees = personnel.value?.degrees;
        state.gender = personnel.value?.gender;
        state.description = personnel.value?.description;
        state.position = personnel.value?.position;
        state.department_id = personnel.value?.department_id;
        state.faculty_id = personnel.value?.department?.faculty_id;
        faculty_id.value = personnel.value?.department?.faculty_id;
        state.avatarName = personnel.value?.avatar;
        state.avatarUrl = personnel.value?.avatar
            ? urlImage(personnel.value?.avatar, "personnel")
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
        first_name: state.first_name,
        last_name: state.last_name,
        email: state.email,
        phone: state.phone,
        base_salary: state.base_salary,
        academic_level: state.academic_level,
        degrees: state.degrees,
        gender: state.gender,
        department_id: state.department_id,
        avatar: state.avatarName,
        position: state.position,
        description: state.description
    };

    if (!payload.avatar) {
        toast.error("Vui lòng upload ảnh!");
        return;
    }

    console.log(`payload:::`, payload);

    if (Boolean(id.value)) {
        mutationEdit.mutate(
            { ...filterValuesEmptyObject(payload), id: id.value },
            {
                onSuccess: () => {
                    toast.success("Cập nhật nhân sự thành công");
                    router.push({ name: "personnel" });
                },
            }
        );
        return;
    }

    mutationAdd.mutate(filterValuesEmptyObject(payload), {
        onSuccess: () => {
            toast.success("Thêm nhân sự thành công");
            router.push({ name: "personnel" });
        },
    });
};

const handleOnFileChange = (file) => {
    if (!file) {
        state.avatarUrl = "";
        state.avatarName = "";
        return;
    }

    uploadService
        .uploadFile(file, "user/images/personnel")
        .then(({ metadata }) => {
            state.avatarUrl = metadata.url;
            state.avatarName = metadata.name;
        })
        .catch((err) => {
            console.log(`upload err:::`, err);
        });
};
</script>

<template>
    <main-top
        title="Nhân sự"
        sub="Quản lý nhân sự"
        icon="mdi-pencil-box-outline"
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
                            Mỗi bộ nhân sự chỉ có email và số điện thoại duy
                            nhất
                        </small>

                        <v-row>
                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.last_name"
                                    :rules="[rules.required]"
                                    label="Họ và chữ lót"
                                    placeholder="Nhập họ và chữ lót"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.first_name"
                                    :rules="[rules.required]"
                                    label="Tên"
                                    placeholder="Nhập tên"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.email"
                                    :rules="[rules.required, rules.email]"
                                    label="Email"
                                    placeholder="Nhập email"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.phone"
                                    :rules="[rules.required, rules.phone]"
                                    label="Số điện thoại văn phòng"
                                    placeholder="Nhập số điện thoại"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.address"
                                    label="Văn Phòng"
                                    placeholder="Nhập địa chỉ văn phòng"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-text-field
                                    v-model="state.position"
                                    :rules="[rules.required]"
                                    label="Đảm nhiệm vị trí"
                                    placeholder="Nhập đảm nhiệm vị trí"
                                    required
                                ></v-text-field>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-textarea
                                    v-model="state.description"
                                    label="Mô tả"
                                    placeholder="Viết mô tả nhân sự...  (không bắt buộc)"
                                    rows="1"
                                    auto-grow
                                ></v-textarea>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-select
                                    v-model="state.gender"
                                    :items="genders"
                                    :rules="[rules.required]"
                                    item-title="name"
                                    item-value="key"
                                    label="Giới tính"
                                    required
                                ></v-select>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-select
                                    v-model="state.degrees"
                                    :items="degrees"
                                    :rules="[rules.required]"
                                    item-title="name"
                                    item-value="key"
                                    label="Học vị"
                                    required
                                ></v-select>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-select
                                    v-model="state.academic_level"
                                    :items="
                                        state.degrees === 'TS'
                                            ? academicRank
                                            : []
                                    "
                                    item-title="name"
                                    item-value="key"
                                    label="Học hàm"
                                ></v-select>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-select
                                    :loading="isLoadingFaculties"
                                    v-model="state.faculty_id"
                                    :items="faculties?.metadata"
                                    item-title="name"
                                    item-value="id"
                                    label="Thuộc khoa"
                                    required
                                    :rules="[rules.required]"
                                ></v-select>
                            </v-col>

                            <v-col cols="6" class="my-0">
                                <v-select
                                    :loading="isLoadingDepartments"
                                    v-model="state.department_id"
                                    :items="departments?.metadata"
                                    item-title="name"
                                    item-value="id"
                                    label="Thuộc bộ môn"
                                    required
                                    :rules="[rules.required]"
                                ></v-select>
                            </v-col>

                            <v-col cols="12" class="my-0">
                                <upload-file-image
                                    label="Ảnh đại diện"
                                    v-model:value="state.avatar"
                                    @onFileChange="handleOnFileChange"
                                    :imageUrl="state.avatarUrl"
                                />
                            </v-col>
                        </v-row>
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
