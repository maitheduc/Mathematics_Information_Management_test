<script setup>
import { ref, provide } from 'vue';
import Header from '@/components/shared/admin/Header';
import Navbar from '@/components/shared/admin/Navbar';

const drawer = ref(false);
provide('drawer', drawer);


</script>

<template>
    <v-app>
        <Header />

        <Navbar />

        <v-main class="bg-gray">
            <router-view v-slot="{ Component }">
                <component :is="Component"></component>
            </router-view>
        </v-main>
    </v-app>
</template>

<style lang="css" scoped></style>