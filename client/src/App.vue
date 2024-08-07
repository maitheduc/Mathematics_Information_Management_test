<script setup>
import { VueQueryDevtools } from "@tanstack/vue-query-devtools";
import { Toaster } from "vue-sonner";
</script>

<template>
    <RouterView />
    <VueQueryDevtools />
    <Toaster richColors position="top-right" />
</template>

<style scoped></style>
