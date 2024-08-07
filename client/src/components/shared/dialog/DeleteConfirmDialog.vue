<script setup>
import { ref, watch, watchEffect } from "vue";

const props = defineProps({
    open: Boolean,
    isLoading: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(["update:open", "confirm"]);

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

const handleConfirm = () => {
    emit("confirm", () => {
        dialog.value = false;
    });
};
</script>

<template>
    <v-dialog v-model="dialog" width="auto">
        <v-card
            max-width="400"
            prepend-icon="mdi-delete"
            text="Bạn có chắc chắn muốn xóa. Dữ liệu sẽ bị mất vĩnh viễn!"
            title="Xác nhận trước khi xóa"
        >
            <template v-slot:actions>
                <v-btn
                    color="red"
                    variant="outline"
                    text="Hủy bỏ"
                    @click="handleClose"
                    :loading="isLoading"
                    :disabled="isLoading"
                ></v-btn>
                <v-btn
                    color="green"
                    variant="tonal"
                    text="Ok"
                    @click="handleConfirm"
                    :loading="isLoading"
                    :disabled="isLoading"
                ></v-btn>
            </template>
        </v-card>
    </v-dialog>
</template>