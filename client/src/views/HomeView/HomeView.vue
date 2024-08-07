<script setup>
import PostCard from "@/components/shared/client/PostCard/PostCard.vue";
import CardItem from "@/components/shared/client/CardItem/CardItem.vue";
import useGetCategory from "@/hooks/category.hook";
import { fDate } from "@/utils";

const { data, isLoading } = useGetCategory({
    include_category: "true",
    include_news: "true",
    order: "asc",
    sort: "uutien",
});
</script>

<template>
    <PostCard />

    <v-container v-if="isLoading">
        <v-row>
            <v-col cols="12" md="12">
                <v-skeleton-loader type="heading"></v-skeleton-loader>
            </v-col>

            <v-col
                v-for="item in 5"
                :key="item"
                cols="12"
                md="12"
                class="border"
            >
                <v-row>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader type="image"></v-skeleton-loader>
                    </v-col>
                    <v-col cols="6" md="6">
                        <v-skeleton-loader type="article"></v-skeleton-loader>
                    </v-col>
                </v-row>
            </v-col>
        </v-row>
    </v-container>

    <card-item
        v-for="cardItem in data?.metadata?.filter((t) => t?.hienthi)"
        :priority="cardItem?.uutien"
        :key="cardItem.id"
        :titleMain="cardItem.tentheloai"
        :news="cardItem.tintuc"
        :description="cardItem?.tintuc[0]?.mota"
        :title="cardItem?.tintuc[0]?.tieude"
        :imageUrl="cardItem?.tintuc[0]?.hinhdaidien"
        :datetime="
            fDate(cardItem?.tintuc[0]?.created_at, 'DD/MM/YYYY HH:mm:ss')
        "
        :id="cardItem?.tintuc[0]?.id"
        :views="cardItem?.tintuc[0]?.luotxem"
        :comments="cardItem?.tintuc[0]?.binhluan?.length"
    />
</template>

<style lang="css" scoped></style>
