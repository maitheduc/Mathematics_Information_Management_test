<script setup>
import { useGetDepartment } from "@/hooks/department.hook";
import { urlImage } from "@/utils";
import { mapToNamePersonnel } from "@/constants/personnel.constant";

const { data: departments, isLoading } = useGetDepartment(
    {
        all: 1,
        include_personnel: "true",
        include_faculty: "true",
    },
    (data) => data?.metadata
);
</script>

<template>
    <v-skeleton-loader
        v-if="isLoading"
        type="article,article,article,article,article"
    ></v-skeleton-loader>

    <div v-else>
        <template v-for="data in departments" :key="data.id">
            <div v-if="data.personnel.length">
                <v-row>
                    <v-col cols="12">
                        <h1 class="text-center">{{ data.name }}</h1>
                    </v-col>
                </v-row>

                <v-row class="content-personnel">
                    <v-col
                        v-for="item in data.personnel"
                        :key="item.id"
                        cols="12"
                        sm="6"
                        md="6"
                    >
                        <v-card>
                            <v-card-subtitle class="content-title">
                                {{ item.position }}
                            </v-card-subtitle>

                            <v-img
                                :src="urlImage(item.avatar, 'personnel')"
                                class="white--text"
                                height="200px"
                            ></v-img>

                            <v-card-title class="text-center">
                                {{ mapToNamePersonnel(item) }}
                            </v-card-title>
                            <v-card-actions>
                                <router-link
                                    class="mx-auto"
                                    :to="{
                                        name: 'person_details',
                                        params: { id: item.id },
                                    }"
                                    ><v-btn class="action-icon-btn"
                                        >xem thêm</v-btn
                                    >
                                </router-link>
                            </v-card-actions>
                        </v-card>
                    </v-col>
                </v-row>
            </div>
        </template>
    </div>
</template>

<style lang="css" scoped>
.content-personnel {
    width: 100%;
    margin: auto;
}

.content-title {
    text-align: center;
    font-weight: 500;
    font-size: 20px;
    margin: 10px 0;
    color: var(--primary);
}
</style>
