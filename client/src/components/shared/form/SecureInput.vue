<script setup>
import { rules as Rules } from "@/utils/rule";
import { ref, watchEffect } from "vue";

const props = defineProps({
    value: {
        type: String,
        default: "",
    },
    placeholder: {
        type: String,
        default: "Enter your password",
    },
    label: {
        type: String,
        default: "Password",
    },
    rules: {
        type: Array,
        default: [Rules.required, Rules.min(3), Rules.max(40)],
    },
    required: {
        type: Boolean,
        default: true,
    },
});

const textValue = ref(props.value);

const emits = defineEmits(["update:value"]);

const visible = ref(false);

watchEffect(() => {
    emits("update:value", textValue.value);
});
</script>

<template>
    <v-text-field
        :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
        :type="visible ? 'text' : 'password'"
        :label="label"
        :rules="rules"
        :required="required"
        v-model="textValue"
        :placeholder="placeholder"
        @click:append-inner="visible = !visible"
    ></v-text-field>
</template>

