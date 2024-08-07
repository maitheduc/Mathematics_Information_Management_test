<script setup>
import Header from "@/components/shared/client/Header";
import NavLeft from "@/components/shared/client/NavLeft";
import NavRight from "@/components/shared/client/NavRight";
import Footer from "@/components/shared/client/Footer";
import Mailbox from "@/components/shared/client/Mailbox";
import useGetCategory from "@/hooks/category.hook";

useGetCategory({
    include_category: "true",
    include_news: "true",
    order: "asc",
    sort: "uutien",
});
</script>

<template>
    <v-app>
        <v-container fluid class="pa-0 w-1200">
            <Header />

            <!-- CONTENT -->
            <div class="mt-3">
                <v-row class="no-padding row-gap">
                    <v-col class="no-padding col-gap" cols="2.5">
                        <NavLeft />
                    </v-col>

                    <v-col class="no-padding col-gap" cols="7">
                        <router-view v-slot="{ Component }">
                            <component :is="Component"></component>
                        </router-view>
                    </v-col>

                    <v-col class="no-padding col-gap" cols="2.5">
                        <NavRight />
                    </v-col>
                </v-row>
            </div>
        </v-container>

        <!-- Footer -->
        <Footer />

        <Mailbox />
    </v-app>
</template>

<style lang="css" scoped>
.w-1200 {
    width: 1200px;
}

.no-padding {
    padding: 0 !important;
    margin: 0 !important;
}

.row-gap {
    gap: 16px;
}

.col-gap {
    margin-left: 16px;
}
</style>
