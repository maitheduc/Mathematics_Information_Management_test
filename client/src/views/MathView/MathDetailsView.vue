<script setup>
import { useGetDepartmentDetails } from "@/hooks/department.hook";
import { computed, ref } from "vue";
import { useRoute } from "vue-router";
import SeeCategoryMath from "@/views/MathView/components/SeeCategoryMath.vue";

const route = useRoute();

const id = computed(() => route.params?.id);
const categorySelected = ref(null);
const open = ref(false);

const activeId = ref(-1);
const activeSubjectId = ref(-1);

const { data, isLoading } = useGetDepartmentDetails({
    id,
    params: {
        include_major: "true",
    },
    select: (data) => {
        if (data?.metadata) {
            activeId.value = data?.metadata?.id;

            return {
                ...data?.metadata,
                major: data?.metadata?.major?.map((t, index) => {
                    const parse = JSON.parse(t?.subjects);

                    return {
                        ...t,
                        subjects: parse.map((t) => ({
                            ...t,
                            ...(!t.categories && { categories: [] }),
                        })),
                    };
                }),
            };
        }

        return null;
    },
});

const toggleActive = (id) => {
    activeId.value = activeId.value === id ? -1 : id;
};

const toggleSubjectActive = (id) => {
    activeSubjectId.value = activeSubjectId.value === id ? -1 : id;
};

const isActive = (id) => {
    return activeId.value === id;
};

const isSubjectActive = (id) => {
    return activeSubjectId.value === id;
};

const onClickOpenCategory = (category) => {
    categorySelected.value = category;
    open.value = true;
};

const handleClose = (value) => {
    if (!value) {
        categorySelected.value = null;
        open.value = false;
    }
};
</script>
<template>
    <v-skeleton-loader
        v-if="isLoading"
        type="article,article,article,list-item,list-item,list-item,list-item,list-item,list-item"
    ></v-skeleton-loader>

    <div v-else>
        <see-category-math
            :open="open"
            @update:open="handleClose"
            :category="categorySelected"
        />

        <h1 class="box-shadow text-center">{{ `Bộ môn ${data?.name}` }}</h1>

        <div class="mt-5 d-flex flex-wrap flex-column" style="gap: 30px">
            <div v-for="(row, index) in data?.major" :key="index">
                <v-card
                    class="custom-card elevation-8"
                    @click="toggleActive(row.id)"
                >
                    <v-card-text class="custom-text">
                        {{ row?.name }}
                    </v-card-text>

                    <v-icon>
                        {{
                            isActive(row.id)
                                ? "mdi-chevron-up"
                                : "mdi-chevron-down"
                        }}
                    </v-icon>
                </v-card>

                <div
                    v-if="isActive(row.id)"
                    class="mt-5 d-flex flex-wrap flex-column ml-10"
                    style="gap: 30px"
                >
                    <template
                        v-for="subject in row?.subjects"
                        :key="subject.id"
                    >
                        <v-card
                            class="custom-card bg-child elevation-8"
                            @click="toggleSubjectActive(subject.id)"
                        >
                            <v-card-text class="custom-text">
                                {{ subject?.name }}
                            </v-card-text>

                            <v-icon>
                                {{
                                    isSubjectActive(subject.id)
                                        ? "mdi-chevron-up"
                                        : "mdi-chevron-down"
                                }}
                            </v-icon>
                        </v-card>

                        <div
                            v-if="isSubjectActive(subject.id)"
                            class="mt-3 ml-5"
                        >
                            <p v-html="subject?.description"></p>

                            <div v-if="subject?.categories.length > 0">
                                <h3 class="box-shadow mb-3">Các môn học liên quan</h3>

                                <div class="grid-container">
                                    <v-btn
                                        color="primary"
                                        v-for="category in subject?.categories"
                                        :key="category.id"
                                        @click="onClickOpenCategory(category)"
                                    >
                                        {{ category?.name }}
                                    </v-btn>
                                </div>
                            </div>
                        </div>
                    </template>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.custom-card {
    cursor: pointer;
    background-color: #930000;
    color: white;
    padding: 10px;
    height: 50px;
    display: flex;
    align-items: center;
    position: relative;
    border-radius: 4px; /* Adjust this as needed */
    overflow: unset !important;
    border-radius: 0;
    max-width: 70%;
    transition: all 0.3s ease-in-out;
}

.custom-card:hover {
    background: var(--primary);
    color: white;
}

.custom-card:hover::after {
    border-left-color: var(--primary);
}

.custom-text {
    font-size: 1rem; /* Adjust font size as needed */
}

.custom-card::after {
    content: "";
    position: absolute;
    right: -20px; /* Adjust this value to control the arrow size */
    top: 0;
    width: 0;
    height: 0;
    border-top: 25px solid transparent;
    border-bottom: 25px solid transparent;
    border-left: 20px solid #930000;
    transition: all 0.3s ease-in-out;
}

h1,
h2 {
    color: #930000;
}

.bg-child {
    background: #cb3030;
    color: white;
}

.bg-child:hover {
    opacity: 0.65;
}

.bg-child::after {
    border-left-color: #cb3030;
}

.highlight {
    font-size: 36px;
    color: #a54141;
    position: relative;
}

.box-shadow {
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 10px;
}
</style>
