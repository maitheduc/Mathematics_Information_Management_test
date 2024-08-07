<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import queryKeys from "@/constants/queryKey.constant";
import useGetCategory, {
    queryKeyCategory,
    useMutationChangeDisplayCategory,
    useMutationSortPriority,
} from "@/hooks/category.hook";
import {
    useGetNotification,
    useMutationAddNotification,
    useMutationEditNotification,
} from "@/hooks/notification.hook";
import { fDate, getQueryKeys } from "@/utils";
import { rules } from "@/utils/rule";
import { useQueryClient } from "@tanstack/vue-query";
import { ref, onMounted, computed, watchEffect, watch } from "vue";
import { toast } from "vue-sonner";

const options = computed(() => {
    return {
        page: 1,
        order: "asc",
        sort: "uutien",
    };
});

const formData = ref({
    Title: "",
    Content: "",
    Note: "",
    DateStart: null,
    DateEnd: null,
});

const form = ref(null);
const valid = ref(false);

const getNotification = useGetNotification();

const mutationAddNotification = useMutationAddNotification();
const mutationEditNotification = useMutationEditNotification();

const { data, isLoading } = useGetCategory(options.value);
const queryClient = useQueryClient();
const { mutate, isPending } = useMutationSortPriority();
const { mutate: mutateChangeDisplay, isPending: isPendingChangeDisplay } =
    useMutationChangeDisplayCategory();

const selectedCheckboxes = ref([]);

watchEffect(() => {
    if (data.value?.metadata?.length > 0) {
        selectedCheckboxes.value = data.value?.metadata
            .filter((t) => t.hienthi)
            .map((item) => item.id);
    }

    if(getNotification.data.value?.id){
        formData.value.Title = getNotification.data.value.tieude;
        formData.value.Content = getNotification.data.value.noidung;
        formData.value.Note = getNotification.data.value.ghichu;
        formData.value.DateEnd = getNotification.data.value.ngayhethan;
        formData.value.DateStart = getNotification.data.value.ngaybatdau;
    }
});

// Trạng thái của snackbar
const showSnackbar = ref(false);

// Hàm lưu và hiển thị thông báo
const save = () => {
    if (selectedCheckboxes.value.length === 0) {
        toast.error("Ít nhất 1 danh mục phải được hiển thị!");
        return;
    }

    const displayIds = selectedCheckboxes.value;
    const hiddenIds = data.value?.metadata
        ?.filter((item) => !displayIds.includes(item.id))
        ?.map((item) => item.id);

    const payload = {
        displayIds,
        hiddenIds,
    };

    // Đoạn này có thể gửi request API để lưu dữ liệu vào server
    mutateChangeDisplay(payload, {
        onSuccess: () => {
            toast.success("Đã cập nhật thành công");
            queryClient.invalidateQueries({
                queryKey: queryKeyCategory(options.value),
                exact: true,
            });
        },
    });

    // Hiển thị thông báo thành công
    showSnackbar.value = true;

    setTimeout(() => {
        showSnackbar.value = false; // Tắt alert sau 3 giây
    }, 3000);
};

// Hàm hien thi sắp xếp lại
const selectedItems = computed(() => {
    return selectedCheckboxes.value;
});

// di chuyển sắp xếp lại
const moveItemUp = (index, id) => {
    if (index > 0) {
        const moveIndex = index - 1;

        const moveId = selectedItems.value[moveIndex];
        const currentId = selectedItems.value[index];

        const payload = {
            moveId,
            currentId,
        };

        mutate(payload, {
            onSuccess: () => {
                toast.success("Đã thay đổi thành công");
                queryClient.invalidateQueries({
                    queryKey: queryKeyCategory(options.value),
                    exact: true,
                });
            },
        });
    }
};

const moveItemDown = (index, id) => {
    if (index < selectedItems.value.length - 1) {
        const moveIndex = index + 1;

        const moveId = selectedItems.value[moveIndex];
        const currentId = selectedItems.value[index];

        const payload = {
            moveId,
            currentId,
        };

        mutate(payload, {
            onSuccess: () => {
                toast.success("Đã thay đổi thành công");
                queryClient.invalidateQueries({
                    queryKey: queryKeyCategory(options.value),
                    exact: true,
                });
            },
        });
    }
};

const submitForm = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    const payload = {
        tieude: formData.value.Title,
        noidung: formData.value.Content,
        ghichu: formData.value.Note,
        ngaybatdau: formData.value.DateStart,
        ngayhethan: formData.value.DateEnd,
    };

    if (getNotification.data.value?.id) {
        // update getNotification
        mutationEditNotification.mutate(
            { id: getNotification.data.value.id, ...payload },
            {
                onSuccess: () => {
                    queryClient.invalidateQueries({
                        queryKey: queryKeyCategory({
                            key: queryKeys.notification.GET_ALL,
                        }),
                        exact: true,
                    });

                    toast.success("Đã cập nhật thành công.");
                },
            }
        );

        return;
    }

    // create notification
    mutationAddNotification.mutate(payload, {
        onSuccess: () => {
            queryClient.invalidateQueries({
                queryKey: queryKeyCategory({
                    key: queryKeys.notification.GET_ALL,
                }),
                exact: true,
            });

            toast.success("Đã thêm thông báo mới thành công.");
        },
    });
};

const getCategoryById = (id) => {
    const category = data.value?.metadata.find((item) => item.id === id);
    return category;
};
</script>

<template>
    <MainTop
        title="Hiển thị"
        sub="Quản lí trình bày - hiển thị nội dung trang chủ"
        icon="mdi-pencil-box-outline"
        parent="Trang chủ"
    />

    <v-card class="card-display mx-30 pa-30">
        <v-row class="padding-0">
            <v-col class="padding-0">
                <v-alert
                    variant="tonal"
                    v-model="showSnackbar"
                    color="success"
                    class="padding-0 ma-3"
                >
                    <div class="card-alert">
                        <div>
                            <v-icon>mdi-check</v-icon>
                            Thành công : Nội dung đã được cập nhật!
                        </div>
                        <v-btn variant="text" @click="showSnackbar = false">
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                    </div>
                </v-alert>

                <div>
                    <v-card-title>Danh mục tin tức hiển thị</v-card-title>
                    <v-skeleton-loader
                        v-if="isLoading || isPending || isPendingChangeDisplay"
                        type="list-item,list-item,list-item,list-item"
                    />
                    <p v-else class="text-content">
                        <v-checkbox
                            v-for="item in data?.metadata"
                            :key="item?.id"
                            v-model="selectedCheckboxes"
                            color="primary"
                            :label="item.tentheloai"
                            :value="item.id"
                            hide-details
                        ></v-checkbox>
                    </p>

                    <v-btn @click="save" class="ma-5 card-display-btn">
                        <v-icon class="mr-2">mdi-check</v-icon>
                        Lưu lại
                    </v-btn>
                </div>

                <div>
                    <v-card-title>Sắp xếp hiển thị ưu tiên</v-card-title>

                    <v-skeleton-loader
                        v-if="isLoading || isPending || isPendingChangeDisplay"
                        type="list-item,list-item,list-item,list-item"
                    />

                    <ul v-else class="text-content ml-15">
                        <li
                            v-for="(item, index) in selectedItems"
                            :key="item.id"
                            class="my-2"
                        >
                            <span>{{ getCategoryById(item)?.tentheloai }}</span>

                            <v-btn
                                @click="moveItemUp(index, item)"
                                v-if="index > 0"
                                class="move"
                            >
                                <v-icon>mdi-arrow-up</v-icon>
                            </v-btn>

                            <v-btn
                                @click="moveItemDown(index, item)"
                                v-if="index < selectedItems.length - 1"
                                class="move"
                            >
                                <v-icon>mdi-arrow-down</v-icon>
                            </v-btn>
                        </li>
                    </ul>
                </div>
            </v-col>

            <v-col class="padding-0">
                <v-card-title>Cập nhật thông báo</v-card-title>
                <v-form @submit.prevent="submitForm" ref="form" v-model="valid">
                    <div class="text-content">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <div
                                    class="text-subtitle-1 text-medium-emphasis"
                                >
                                    Tiêu đề
                                </div>

                                <v-text-field
                                    v-model="formData.Title"
                                    density="compact"
                                    placeholder="Nhập tiêu đề"
                                    variant="outlined"
                                    :rules="[rules.required, rules.max(255)]"
                                ></v-text-field>
                            </div>

                            <div class="form-group">
                                <div
                                    class="text-subtitle-1 text-medium-emphasis"
                                >
                                    Nội dung
                                </div>

                                <v-textarea
                                    v-model="formData.Content"
                                    density="compact"
                                    placeholder="Nhập nội dung"
                                    variant="outlined"
                                    :rules="[rules.required]"
                                    auto-grow
                                ></v-textarea>
                            </div>
                            <div class="form-group">
                                <div
                                    class="text-subtitle-1 text-medium-emphasis"
                                >
                                    Ghi chú
                                </div>

                                <v-textarea
                                    v-model="formData.Note"
                                    density="compact"
                                    placeholder="Nhập ghi chú"
                                    variant="outlined"
                                    :rules="[rules.required]"
                                    auto-grow
                                    :rows="1"
                                ></v-textarea>
                            </div>

                            <div class="form-group">
                                <div
                                    class="text-subtitle-1 text-medium-emphasis"
                                >
                                    Ngày bắt đầu
                                </div>

                                <v-text-field
                                    v-model="formData.DateStart"
                                    density="compact"
                                    placeholder="Nhập ngày bắt đầu"
                                    hint="Ngày bắt đầu (VD: 2022-01-01)"
                                    variant="outlined"
                                    :rules="[rules.required, rules.date]"
                                ></v-text-field>
                            </div>
                            <div class="form-group">
                                <div
                                    class="text-subtitle-1 text-medium-emphasis"
                                >
                                    Ngày hết hạn
                                </div>

                                <v-text-field
                                    v-model="formData.DateEnd"
                                    density="compact"
                                    placeholder="Nhập ngày hết hạn"
                                    hint="Ngày hết hạn (VD: 2022-01-01)"
                                    variant="outlined"
                                    :rules="[rules.required, rules.date]"
                                ></v-text-field>
                            </div>

                            <div class="form-group">
                                <v-btn
                                    type="submit"
                                    @click="submitForm"
                                    class="card-display-btn cus-btn"
                                    :loading="
                                        mutationAddNotification.isPending
                                            .value ||
                                        mutationEditNotification.isPending.value
                                    "
                                    :disabled="
                                        mutationAddNotification.isPending
                                            .value ||
                                        mutationEditNotification.isPending.value
                                    "
                                >
                                    <v-icon class="mr-2">mdi-check</v-icon>
                                    Tải lên thông báo mới
                                </v-btn>
                            </div>
                        </div>
                    </div>
                </v-form>
            </v-col>
        </v-row>
    </v-card>
</template>

<style lang="css" scoped>
.card-display {
    margin-bottom: 30px;
}

.v-cart-title {
    font-size: 24px;
    line-height: 36px;
}

.text-content {
    text-align: justify;
    width: 100%;
    padding: 0 10px;
}

.card-display-btn {
    background-color: var(--primary);
    color: var(--white);
    box-shadow: #0006 0px 4px 8px 0px;
    text-transform: initial;
}

.cus-btn {
    margin: 10px 0;
    width: 250px;
}

.card-alert {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 45px;
    padding-left: 10px;
}

.move.v-btn.v-btn--density-default {
    height: 20px !important;
    padding: 0 !important;
    min-width: 20px !important;
    margin-left: 4px;
}

/* right */
.form-group {
    display: flex;
    flex-direction: column;
}

.col-form-label {
    margin: 10px 0;
}

.form-control.content-info.is-valid {
    box-shadow: 0 0 0 0.15rem var(--primary);
    border-radius: 4px;
    padding: 6px 20px;
    outline: none;
}

.form-control.content-info {
    box-shadow: 0 0 0 0.15rem #ced4da;
    border-radius: 4px;
    padding: 6px 20px;
    outline: none;
    margin-bottom: 20px;
}
</style>
