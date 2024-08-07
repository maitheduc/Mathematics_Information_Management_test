<script setup>
import CKEditor from "@/components/shared/admin/CKeditorCustom";
import MainTop from "@/components/shared/admin/MainTop/MainTop.vue";
import useGetCategory from "@/hooks/category.hook";
import {
    useGetNewsDetails,
    useMutationAddPost,
    useMutationEditPost,
} from "@/hooks/news.hook";
import { useGetNewsTypes } from "@/hooks/newsTypes.hook";
import uploadService from "@/services/upload.service";
import { computed, ref, watch, watchEffect } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";
import { urlImage as urlImageHost } from "@/utils";

const router = useRouter();
const route = useRoute();
const id = computed(() => route.params.id);

const { data: getDetailsNews } = useGetNewsDetails(
    id,
    { include_news_types: "true" },
    computed(() => Boolean(id.value))
);
const { data: categories, isLoading } = useGetCategory({ all: 1 });
const mutationAdd = useMutationAddPost();
const mutationEdit = useMutationEditPost();

const form = ref(null);
const valid = ref(false);

const image = ref(null);
const title = ref("");
const category = ref(null);
const newsType = ref(null);
const description = ref("");
const content = ref("");
const popular = ref(false);
const urlImage = ref({
    url: "",
    name: "",
});

const optionGetNewsTypes = computed(() => {
    return {
        all: 1,
        "category_id[eq]": category,
    };
});

const { data: newsTypesOptions, isLoading: isLoadingNewsTypes } =
    useGetNewsTypes(
        optionGetNewsTypes.value,
        computed(() => Boolean(category.value))
    );

watchEffect(() => {
    if (!getDetailsNews.value || !getDetailsNews.value?.metadata) return;

    const { metadata } = getDetailsNews.value;

    title.value = metadata.tieude;
    newsType.value = metadata.id_loaitin;
    description.value = metadata.mota;
    content.value = metadata.noidung;
    popular.value = Boolean(metadata.noibat);

    if (metadata.hinhdaidien) {
        urlImage.value = {
            url: urlImageHost(metadata.hinhdaidien, "hinhtintuc"),
            name: metadata.hinhdaidien,
        };
    }

    if (metadata?.loaitin) {
        category.value = metadata?.loaitin?.id_theloai;
    }
});

watch(category, (newValue) => {
    // if (isLoadingNewsTypes.value) {
    //     newsType.value = null;
    //     return;
    // }
    // if (!newsType.value && id.value && getDetailsNews.value) {
    //     newsType.value = getDetailsNews.value?.metadata?.id_loaitin;
    // }
});

watch(image, (value) => {
    if (!value) {
        urlImage.value = {
            url: "",
            name: "",
        };
        return;
    }

    uploadService
        .uploadFile(value, "user/images/hinhtintuc")
        .then(({ metadata }) => {
            urlImage.value = {
                url: metadata.url,
                name: metadata.name,
            };
        })
        .catch((err) => {
            console.log(`upload err:::`, err);
        });
});

const rules = {
    required: (value) => !!value || "Trường này bắt buộc.",
};

const submit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    const payload = {
        tieude: title.value,
        mota: description.value,
        hinhdaidien: urlImage.value.name,
        noidung: content.value,
        id_loaitin: newsType.value,
        noibat: popular.value,
        id_user: 1,
    };

    if (!payload.noidung || !payload.hinhdaidien) {
        toast.error("Vui lòng điền đầy đủ thông tin!");
        return;
    }

    if (id.value) {
        mutationEdit.mutate(
            { ...payload, id: id.value },
            {
                onSuccess: () => {
                    reset();
                    router.push({ name: "post" });
                },
            }
        );

        return;
    }

    mutationAdd.mutate(payload, {
        onSuccess: () => {
            reset();
            router.push({ name: "post" });
        },
    });
};

const reset = () => {
    form.value.reset();
};
</script>

<template>
    <MainTop
        title="Danh sách bài viết"
        sub="Quản lí bài viết"
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
                        <small class="text--secondary">
                            Loại tin mới không hợp lệ nếu đã tồn tại một loại
                            tin giống nó.
                        </small>

                        <v-select
                            :loading="isLoading"
                            v-model="category"
                            :items="categories?.metadata"
                            item-title="tentheloai"
                            item-value="id"
                            label="Thuộc thể loại"
                            :rules="[rules.required]"
                            required
                        ></v-select>

                        <v-select
                            :loading="isLoadingNewsTypes"
                            v-model="newsType"
                            :items="newsTypesOptions?.metadata"
                            item-title="tenloaitin"
                            item-value="id"
                            label="Loại tin tức"
                            :rules="[rules.required]"
                            required
                        ></v-select>

                        <v-text-field
                            v-model="title"
                            :rules="[rules.required]"
                            label="Tiêu đề"
                            placeholder="Nhập tên tiêu đề tức"
                            required
                        ></v-text-field>

                        <v-textarea
                            v-model="description"
                            label="Viết mô tả ngắn..."
                            auto-grow
                            outlined
                            rows="3"
                            :rules="[rules.required]"
                            required
                        ></v-textarea>

                        <small
                            class="text-secondary mt-3 d-block font-weight-bold"
                        >
                            Nội dung bài đăng
                        </small>

                        <CKEditor v-model="content" />

                        <v-file-input
                            v-model="image"
                            label="Hình mô tả"
                            class="mt-4"
                        ></v-file-input>

                        <v-img
                            v-if="urlImage.url"
                            :src="urlImage.url"
                            :width="200"
                            :height="200"
                            :alt="urlImage.name"
                            cover
                        ></v-img>

                        <v-switch
                            v-model="popular"
                            label="Tin nổi bật"
                            inset
                            indeterminate
                            color="primary"
                        ></v-switch>
                    </v-card-text>

                    <v-card-actions>
                        <v-btn
                            :loading="
                                mutationAdd.isPending.value ||
                                mutationEdit.isPending.value
                            "
                            variant="tonal"
                            @click="submit"
                            class="action-icon-btn"
                        >
                            {{ id ? "Lưu thay đổi" : "Thêm mới" }}
                        </v-btn>

                        <v-btn
                            :loading="
                                mutationAdd.isPending.value ||
                                mutationEdit.isPending.value
                            "
                            color="secondary"
                            variant="tonal"
                            @click="reset"
                        >
                            Nhập lại
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-form>
        </v-container>
    </v-card>
</template>

<style lang="css" scoped></style>
