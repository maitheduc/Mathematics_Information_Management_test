<script setup>
import { ref, watch, watchEffect } from "vue";

const props = defineProps({
    open: Boolean,
    category: {
        type: Object,
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
        <v-card min-width="400" prepend-icon="mdi-eye" title="Xem chi tiết">
            <v-card-item>
                <h3>{{ category?.name }}</h3>
                <p v-html="category?.description"></p>
            </v-card-item>
            <template v-slot:actions>
                <v-btn
                    color="green"
                    variant="tonal"
                    text="Ok"
                    @click="handleClose"
                ></v-btn>
            </template>
        </v-card>
    </v-dialog>
</template>