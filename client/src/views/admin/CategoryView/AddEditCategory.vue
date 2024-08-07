<script setup>
import MainTop from "@/components/shared/admin/MainTop/MainTop.vue";
import { routesNavigation } from "@/constants/route.constant";
import useGetCategory from "@/hooks/category.hook";
import {
    useGetNewsTypesById,
    useMutationAddNewsTypes,
    useMutationEditNewsTypes,
} from "@/hooks/newsTypes.hook";
import { filterValuesEmptyObject } from "@/utils";
import { computed, ref, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";

const route = useRoute();
const router = useRouter();
const id = computed(() => route.params.id);
const { data: categories, isLoading } = useGetCategory({ all: 1 });
const mutationAdd = useMutationAddNewsTypes();
const mutationEdit = useMutationEditNewsTypes();
const getNewsTypes = useGetNewsTypesById(id, {
    id,
});
const parentId = computed(() => route.query?.parent_id || null);
const level = computed(() => route.query?.level || 1);
const categoryId = computed(() => route.query.category_id || null);

const form = ref(null);
const valid = ref(false);

const name = ref("");
const category = ref(null);
const link = ref(null);

const rules = {
    required: (value) => !!value || "Trường này bắt buộc.",
};

watchEffect(() => {
    if (getNewsTypes.data.value && getNewsTypes.data.value?.metadata) {
        name.value = getNewsTypes.data.value?.metadata.tenloaitin;
        category.value = getNewsTypes.data.value?.metadata.id_theloai;
        link.value = getNewsTypes.data.value?.metadata.link;
    }
});

const submit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    const payload = {
        tenloaitin: name.value,
        id_theloai: category.value || categoryId.value,
        level: level.value,
        parent_id: parentId.value,
        link: link.value ?? "",
    };

    if (getNewsTypes.data.value && getNewsTypes.data.value?.metadata) {
        mutationEdit.mutate(
            { ...filterValuesEmptyObject(payload), id: getNewsTypes.data.value?.metadata.id },
            {
                onSuccess: () => {
                    reset();
                    router.push({ name: "category" });
                },
            }
        );
    } else {
        mutationAdd.mutate(filterValuesEmptyObject(payload), {
            onSuccess: () => {
                reset();
                router.push({ name: "category" });
            },
        });
    }
};

const reset = () => {
    form.value.reset();
};
</script>

<template>
    <div>
        <MainTop
            title="Loại tin"
            sub="Quản lí danh mục loại tin"
            icon="mdi-pencil-box-outline"
            parent="Tin tức"
        />

        <v-card class="mx-30 pa-30 cate-card">
            <v-container>
                <v-form @submit="submit" ref="form" v-model="valid">
                    <v-card>
                        <v-card-title>
                            <h3>{{ $route.meta.title }}</h3>
                        </v-card-title>

                        <v-card-text>
                            <v-text-field
                                v-model="name"
                                :rules="[rules.required]"
                                :label="
                                    parentId
                                        ? 'Tên danh mục con'
                                        : 'Tên loại tin'
                                "
                                :placeholder="
                                    parentId
                                        ? 'Nhập tên danh mục con'
                                        : 'Nhập tên loại tin tức'
                                "
                                required
                            ></v-text-field>

                            <v-select
                                v-if="!parentId"
                                :loading="isLoading"
                                v-model="category"
                                :items="categories?.metadata"
                                item-title="tentheloai"
                                item-value="id"
                                label="Thuộc thể loại"
                                required
                            ></v-select>

                            <v-select
                                :loading="isLoading"
                                v-model="link"
                                :items="routesNavigation"
                                item-title="name"
                                item-value="path"
                                label="Link chuyển hướng"
                                hint="Link chuyển hướng chỉ cho phép chuyển hướng nội bộ trang web"
                                persistent-hint
                                required
                            ></v-select>

                            <small class="text--secondary">
                                Loại tin mới không hợp lệ nếu đã tồn tại một
                                loại tin giống nó.
                            </small>
                        </v-card-text>

                        <v-card-actions>
                            <v-btn
                                color="primary"
                                variant="tonal"
                                :loading="
                                    mutationAdd.isPending.value ||
                                    mutationEdit.isPending.value
                                "
                                @click="submit"
                            >
                                {{ id ? "Lưu thay đổi" : "Thêm mới" }}
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-form>
            </v-container>
        </v-card>
    </div>
</template>

<style lang="css" scoped></style>
