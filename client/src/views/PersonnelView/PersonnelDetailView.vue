<script setup>
import { useGetPersonnelDetails } from "@/hooks/personnel.hook";
import { computed } from "vue";
import { useRoute } from "vue-router";
import { mapToNamePersonnel } from "@/constants/personnel.constant";
import { urlImage } from "@/utils";

const route = useRoute();
const id = computed(() => route.params?.id);

const { data, isLoading } = useGetPersonnelDetails({
    id,
    params: {
        include_faculty: "true",
        include_department: "true",
    },
    select: (data) => data?.metadata,
});
</script>

<template>
    <v-skeleton-loader
        v-if="isLoading"
        type="heading,paragraph,paragraph,paragraph,paragraph,paragraph"
    >
    </v-skeleton-loader>

    <div v-else>
        <v-row>
            <v-col cols="12">
                <h1 class="text-center title">
                    {{ mapToNamePersonnel(data) }}
                </h1>

                <p class="text-center mb-3">
                    {{ `${data?.position} (${data?.department?.name})` }}
                </p>
            </v-col>
        </v-row>

        <v-row class="content-personnel">
            <v-col cols="12" sm="4" md="4">
                <v-avatar size="200px">
                    <v-img
                        v-if="data.avatar"
                        alt="Avatar"
                        :src="urlImage(data.avatar, 'personnel')"
                    ></v-img>
                </v-avatar>
            </v-col>

            <v-col cols="12" sm="8" md="8">
                <v-row>
                    <v-col>
                        <div class="mb-3 h-50">
                            <h3>Chức vụ</h3>
                            <p>{{ data?.position }}</p>
                        </div>

                        <div class="mb-3 h-50">
                            <h3>SĐT</h3>
                            <p>{{ data?.phone }}</p>
                        </div>
                    </v-col>

                    <v-col>
                        <div class="mb-3 h-50">
                            <h3>Email</h3>
                            <p>{{ data?.email }}</p>
                        </div>

                        <div class="mb-3 h-50">
                            <h3>Thuộc khoa</h3>
                            <p>{{ data?.department?.faculty?.name }}</p>
                        </div>
                    </v-col>
                </v-row>
            </v-col>

            <v-col class="pa-0" v-if="data?.description">
                <v-card>
                    <p class="text-justify pa-2">
                        {{ data?.description }}
                    </p>
                </v-card>
            </v-col>
        </v-row>
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

.title {
    font-family: "Arial", sans-serif;
    font-size: 32px;
    background: linear-gradient(
        45deg,
        #ff6b6b,
        #f06595,
        #cc5de8,
        #845ef7,
        #5c7cfa,
        #339af0,
        #22b8cf,
        #20c997,
        #51cf66,
        #94d82d,
        #fcc419,
        #ff922b
    );
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 5px;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    animation: rainbow 3s infinite alternate;
}

@keyframes rainbow {
    0% {
        filter: hue-rotate(0deg);
    }

    100% {
        filter: hue-rotate(360deg);
    }
}
</style>
