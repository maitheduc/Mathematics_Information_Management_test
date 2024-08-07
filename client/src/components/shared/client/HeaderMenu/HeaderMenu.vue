<script setup>
import HeaderMenuItem from "@/components/shared/client/HeaderMenuItem";

defineProps({
    data: {
        type: Array,
        required: true,
    },
});
</script>

<template>
    <v-menu
        v-for="(category, idx) in data"
        :key="idx"
        open-on-hover
        link
        offset-y
        nudge-width="200"
    >
        <template v-slot:activator="{ props }">
            <router-link v-bind="props" :to="category.to" class="nav-button">
                <v-list-item-title class="text-capitalize">
                    {{ category.name }}
                </v-list-item-title>
            </router-link>
        </template>

        <header-menu-item
            v-if="
                category.id !== 2 &&
                category?.children &&
                category?.children?.length > 0
            "
            :item="category"
        />
    </v-menu>
</template>

<style lang="css" scoped>
.nav-button {
    color: var(--white);
    padding: 10px 18px;
    text-decoration: none;
}

.nav-button:hover {
    background-image: linear-gradient(
        rgba(0, 0, 0, 0) 0%,
        rgba(0, 0, 0, 0.2) 100%
    );
}
</style>