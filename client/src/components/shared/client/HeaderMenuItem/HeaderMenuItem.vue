<script setup>
defineProps({
    item: {
        type: Object,
        required: true,
    },
});
</script>

<template>
    <v-list class="list-cate">
        <v-list-item
            v-for="(sub, idx) in item.children"
            :key="idx"
            link
            class="list-sub"
        >
            <v-menu
                open-on-hover
                link
                offset-x
                nudge-width="200"
                class="menu-sub"
            >
                <template v-slot:activator="{ props }">
                    <router-link v-bind="props" :to="sub.to" class="sub-button">
                        <v-list-item-title class="d-flex justify-space-between">
                            {{ sub.name }}

                            <v-icon
                                v-if="
                                    sub?.children && sub?.children?.length > 0
                                "
                            >
                                mdi-menu-right
                            </v-icon>
                        </v-list-item-title>
                    </router-link>
                </template>

                <div
                    v-if="sub?.children && sub?.children?.length > 0"
                    class="list-cate-children"
                >
                    <v-card class="elevation-10">
                        <header-menu-item :item="sub" />
                    </v-card>
                </div>
            </v-menu>
        </v-list-item>
    </v-list>
</template>

<style lang="css" scoped>
.list-cate {
    min-width: 150px;
}

.list-sub {
    padding: 0 !important;
}

.menu-sub {
    position: relative;
}

.sub-button {
    color: var(--black);
    text-decoration: none;
}

.sub-button .v-list-item-title {
    border-bottom: 1px solid var(--primary);
    padding: 8px;
}

.sub-button .v-list-item-title:hover {
    color: var(--white);
    background-color: var(--primary);
}

.list-cate-children {
    position: absolute;
    right: calc(-100% - 4px);
    top: -40px;
    width: 100%;
    height: 100%;
}
</style>