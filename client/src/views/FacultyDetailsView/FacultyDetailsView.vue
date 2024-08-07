<script setup>
import { useGetFacultyDetails } from "@/hooks/faculty.hook";
import { computed } from "vue";
import { useRoute } from "vue-router";
import { urlImage } from "@/utils";

const route = useRoute();

const facultyId = computed(() => route.params?.id);

const { data: getDetails, isLoading } = useGetFacultyDetails({
    id: facultyId,
    params: {
        include_department: "true",
    },
});
</script>

<template>
    <div>
        <v-skeleton-loader
            v-if="isLoading"
            type="article,article,article,list-item,list-item,list-item,list-item,list-item,list-item"
        ></v-skeleton-loader>

        <v-card v-else>
            <v-img
                v-if="Boolean(getDetails?.metadata?.image)"
                height="200px"
                :src="urlImage(getDetails?.metadata?.image, 'faculty')"
                cover
            ></v-img>

            <v-card-title>{{ getDetails?.metadata?.name }}</v-card-title>

            <v-card-text class="">
                {{ getDetails?.metadata?.description }}
            </v-card-text>

            <v-card-title
                v-if="Boolean(getDetails?.metadata?.departments?.length)"
                >Danh sách bộ môn</v-card-title
            >

            <v-container
                fluid
                v-if="Boolean(getDetails?.metadata?.departments?.length)"
            >
                <v-row dense>
                    <v-col
                        v-for="card in getDetails?.metadata?.departments"
                        :key="card.id"
                        :cols="6"
                    >
                        <v-card>
                            <v-img
                                :src="urlImage(card?.image, 'department')"
                                class="align-end"
                                gradient="to bottom, rgba(0,0,0,.25), rgba(0,0,0,.9)"
                                height="200px"
                                cover
                            >
                                <v-card-title
                                    class="text-white"
                                    :textContent="card.name"
                                ></v-card-title>
                            </v-img>

                            <v-card-actions>
                                <v-spacer></v-spacer>

                                <router-link
                                    :to="{
                                        name: 'department_details',
                                        params: { id: card.id },
                                    }"
                                >
                                    <v-btn
                                        color="medium-emphasis"
                                        icon="mdi-arrow-right-bottom"
                                        size="small"
                                    ></v-btn>
                                </router-link>
                            </v-card-actions>
                        </v-card>
                    </v-col>
                </v-row>
            </v-container>
        </v-card>
    </div>
</template>