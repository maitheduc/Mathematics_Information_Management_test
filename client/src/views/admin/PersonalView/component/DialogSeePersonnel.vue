<script setup>
import { GENDERS } from "@/constants/personnel.constant";
import { fPrice, urlImage } from "@/utils";
import { ref, watch, watchEffect } from "vue";

const props = defineProps({
    open: Boolean,
    data: {
        type: Object,
        default: null,
    },
});

const emit = defineEmits(["update:open"]);

const dialog = ref(false);

watchEffect(() => {
    dialog.value = props.open;
});

watch(dialog, (val) => {
    emit("update:open", val);
});

const handleClose = () => {
    dialog.value = false;
};
</script>

<template>
    <v-dialog v-model="dialog" width="auto">
        <v-card
            max-width="600"
            prepend-icon="mdi-account-star"
            title="Tổng quan về nhân sự"
        >
            <v-card-text>
                <v-row>
                    <v-col cols="12" v-if="data.avatar">
                        <v-avatar size="100px">
                            <v-img
                                v-if="data.avatar"
                                alt="Avatar"
                                :src="urlImage(data.avatar, 'personnel')"
                            ></v-img>
                        </v-avatar>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.last_name"
                            defaultValue="data.last_name"
                            label="Họ và chữ lọ"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.first_name"
                            label="Ten"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.email"
                            label="Email"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.phone"
                            label="Số điện thoại"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="GENDERS[data.gender]"
                            label="Gioi tinh"
                        ></v-text-field>
                    </v-col>

                    <!-- <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.dob"
                            label="Ngày sinh"
                        ></v-text-field>
                    </v-col> -->

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data?.department?.faculty?.name"
                            label="Thuộc khoa"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data?.department?.name"
                            label="Thuộc bộ môn"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            readonly
                            :model-value="data.position"
                            label="Đảm nhiệm vị trí"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="6">
                        <v-text-field
                            :model-value="fPrice(data.base_salary)"
                            label="Luong cơ bản"
                            readonly
                        ></v-text-field>
                    </v-col>

                    <v-col cols="12">
                        <v-text-field
                            readonly
                            :model-value="data.address"
                            label="Địa chỉ"
                        ></v-text-field>
                    </v-col>

                    <v-col cols="12">
                        <v-textarea
                            readonly
                            :model-value="data.description"
                            label="Mô tả"
                            rows="1"
                        ></v-textarea>
                    </v-col>
                </v-row>
            </v-card-text>

            <template v-slot:actions>
                <v-btn
                    color="red"
                    variant="outline"
                    text="Đóng"
                    @click="handleClose"
                ></v-btn>
            </template>
        </v-card>
    </v-dialog>
</template>