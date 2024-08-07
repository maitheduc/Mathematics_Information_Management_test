<script setup>
import { KEY_OF_DEPARTMENT } from "@/constants";
import { useGetDepartment } from "@/hooks/department.hook";
import { urlImage } from "@/utils";

const { data } = useGetDepartment({
    all: 1,
    "key[eq]": KEY_OF_DEPARTMENT.math,
    include_major: "true",
});
</script>

<template>
    <v-card
        v-for="item in data?.metadata"
        :link="item.major.length ? true : false"
        :key="key"
        class="mt-5"
        :to="{
            name: 'math_details',
            params: { id: item.id },
        }"
    >
        <div class="d-flex flex-no-wrap text-decorator-none">
            <v-avatar class="ma-3" rounded="0" size="100">
                <v-img :src="urlImage(item.image, 'department')"></v-img>
            </v-avatar>

            <div>
                <v-card-title class="text-h6">{{ item.name }}</v-card-title>

                <template v-if="Boolean(item.major.length)">
                    <v-card-subtitle v-for="row in item.major" :key="row">
                        {{ row.name }}
                    </v-card-subtitle>
                </template>

                <v-card-text v-else> Chưa có chuyên ngành </v-card-text>
            </div>
        </div>
    </v-card>
</template>