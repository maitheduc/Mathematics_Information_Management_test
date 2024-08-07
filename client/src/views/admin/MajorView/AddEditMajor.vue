<script setup>
import CKeditorCustom from "@/components/shared/admin/CKeditorCustom/CKeditorCustom.vue";
import MainTop from "@/components/shared/admin/MainTop";
import { useGetDepartment } from "@/hooks/department.hook";
import { useGetFaculty } from "@/hooks/faculty.hook";
import {
    useGetDetailMajor,
    useMutationAddMajor,
    useMutationEditMajor,
} from "@/hooks/major.hook";
import { filterValuesEmptyObject, randomNumber } from "@/utils";
import { rules } from "@/utils/rule";
import { computed, reactive, ref, watch, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";

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
        key: "CD",
        name: "Cao đẳng",
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

const mutationAdd = useMutationAddMajor();
const mutationEdit = useMutationEditMajor();

const { data: departmentOptions, isLoading: isLoadingDepartmentOption } =
    useGetDepartment({ all: 1 }, (data) => data?.metadata);

const form = ref(null);
const isValid = ref(false);

const state = reactive({
    name: "",
    department_id: null,
    subjects: [],
});

const faculty_id = ref(null);

const id = computed(() => route.params?.id);

watch(state, (value) => {
    faculty_id.value = value.faculty_id;
});

const { data: majorDetails, isLoading } = useGetDetailMajor({
    id,
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
    if (majorDetails.value?.id) {
        state.name = majorDetails.value?.name;
        state.department_id = majorDetails.value?.department_id;
        const parser = JSON.parse(majorDetails.value?.subjects);

        state.subjects = parser.map((t) => ({
            ...t,
            ...(!t.categories && { categories: [] }),
        }));
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
        department_id: state.department_id,
        subjects: state.subjects,
    };

    if (!payload.subjects.length) {
        toast.error("Vui lòng thêm môn học");
        return;
    }

    payload.subjects = JSON.stringify(payload.subjects);

    // return;

    if (Boolean(id.value)) {
        mutationEdit.mutate(
            { ...filterValuesEmptyObject(payload), id: id.value },
            {
                onSuccess: () => {
                    router.push({ name: "major" });
                },
            }
        );
        return;
    }

    mutationAdd.mutate(filterValuesEmptyObject(payload), {
        onSuccess: () => {
            router.push({ name: "major" });
        },
    });
};

const onAddCourse = () => {
    const newSubject = {
        id: randomNumber(),
        name: "",
        description: "",
        categories: [],
    };

    state.subjects = [...state.subjects, newSubject];
};

const onAddCate = (subject) => {
    const newCate = {
        id: randomNumber(),
        name: "",
        description: "",
    };

    const prevSubjects = [...state.subjects];

    const index = prevSubjects.findIndex((item) => item.id === subject.id);

    prevSubjects[index].categories = [
        ...prevSubjects[index].categories,
        newCate,
    ];

    state.subjects = prevSubjects;
};

const onDeleteCategory = (subject, category) => {
    const prevSubjects = [...state.subjects];

    const index = prevSubjects.findIndex((item) => item.id === subject.id);

    prevSubjects[index].categories = prevSubjects[index].categories.filter(
        (item) => item.id !== category.id
    );

    state.subjects = prevSubjects;
};
</script>

<template>
     <main-top
        title="Chuyên ngành"
        sub="Quản lý chuyên ngành"
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
                        <v-text-field
                            v-model="state.name"
                            :rules="[rules.required]"
                            label="Tên chuyên ngành"
                            placeholder="Nhập tên chuyên ngành"
                            required
                        ></v-text-field>

                        <v-select
                            :loading="isLoadingDepartmentOption"
                            v-model="state.department_id"
                            :items="departmentOptions"
                            :rules="[rules.required]"
                            item-title="name"
                            item-value="id"
                            label="Thuộc bộ môn"
                            required
                        ></v-select>

                        <div>
                            <div>
                                <v-label>Danh Sách hướng phát triển đầu ra</v-label>

                                <v-btn
                                    color="success"
                                    background="success"
                                    prepend-icon="mdi-plus-circle-outline"
                                    variant="tonal"
                                    class="text-none ml-2"
                                    @click="onAddCourse"
                                >
                                    Thêm hướng
                                </v-btn>
                            </div>

                            <template
                                v-for="(subject, index) in state.subjects"
                                :key="index"
                            >
                                <v-card
                                    variant="outlined"
                                    :text="`Mã hướng #${subject.id}`"
                                    class="mt-5"
                                >
                                    <v-card-item>
                                        <v-text-field
                                            v-model="subject.name"
                                            :rules="[rules.required]"
                                            label="Tên hướng"
                                            placeholder="Nhập tên hướng phát triển"
                                            required
                                        ></v-text-field>

                                        <div>
                                            <v-label>Mô tả </v-label>

                                            <CKeditorCustom
                                                v-model:value="
                                                    subject.description
                                                "
                                            />
                                        </div>

                                        <template
                                            v-for="(
                                                category, index
                                            ) in subject.categories"
                                            :key="index"
                                        >
                                            <v-card
                                                variant="outlined"
                                                :text="`Mã môn học #${category.id}`"
                                                class="mt-5"
                                            >
                                                <v-card-item>
                                                    <v-text-field
                                                        v-model="category.name"
                                                        :rules="[
                                                            rules.required,
                                                        ]"
                                                        label="Tên môn học"
                                                        placeholder="Nhập tên môn học"
                                                        required
                                                    ></v-text-field>

                                                    <div>
                                                        <v-label>
                                                            Mô tả môn học
                                                        </v-label>

                                                        <CKeditorCustom
                                                            v-model:value="
                                                                category.description
                                                            "
                                                        />
                                                    </div>
                                                </v-card-item>

                                                <v-card-actions>
                                                    <v-btn
                                                        color="error"
                                                        text="Xóa môn học"
                                                        variant="tonal"
                                                        @click="
                                                            onDeleteCategory(
                                                                subject,
                                                                category
                                                            )
                                                        "
                                                    ></v-btn>
                                                </v-card-actions>
                                            </v-card>
                                        </template>
                                    </v-card-item>

                                    <v-card-actions>
                                        <v-btn
                                            color="error"
                                            text="Xóa"
                                            variant="tonal"
                                            @click="
                                                state.subjects.splice(index, 1)
                                            "
                                        ></v-btn>

                                        <v-btn
                                            color="success"
                                            background="success"
                                            prepend-icon="mdi-plus-circle-outline"
                                            variant="tonal"
                                            class="text-none ml-2"
                                            @click="onAddCate(subject)"
                                        >
                                            Thêm môn học
                                        </v-btn>
                                    </v-card-actions>
                                </v-card>
                            </template>
                        </div>
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
