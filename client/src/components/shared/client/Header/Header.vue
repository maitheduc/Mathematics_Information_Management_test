<script setup>
import { getCurrentTime } from "@/utils";
import { onBeforeUnmount, onMounted, ref, computed } from "vue";
import Avatar from "@/components/ui/Avatar";
import { ROUTE_PATHS } from "@/constants/route.constant";
import useGetCategory from "@/hooks/category.hook";
import HeaderMenu from "@/components/shared/client/HeaderMenu";

const categories = [
    {
        name: "Giới Thiệu",
        to: ROUTE_PATHS.About,
    },
    {
        name: "Nhân sự",
        to: ROUTE_PATHS.Personnel,
    },
    {
        name: "Nghiên cứu",
        to: "#",
        children: [
            {
                name: "Lĩnh vực",
                to: ROUTE_PATHS.Field,
            },
        ],
    },
];

const nestedCategories = (categories, parentId = null) => {
    const categoryList = [];
    let category;

    if (parentId === null) {
        category = categories?.filter((cat) => cat.parent_id === null);
    } else {
        category = categories?.filter((cat) => cat.parent_id === parentId);
    }

    for (let cate of category) {
        categoryList.push({
            ...cate,
            name: cate.tenloaitin,
            to: cate.link ?? `${ROUTE_PATHS.News}?id=${cate.id}`,
            children: nestedCategories(categories, cate.id),
        });
    }

    return categoryList;
};

const { data } = useGetCategory(
    {
        include_category: "true",
        include_news: "true",
        order: "asc",
        sort: "uutien",
    },
    (data) => {
        if (data.metadata) {
            return data.metadata.map((t) => {
                return { ...t, loaitin: nestedCategories(t.loaitin) };
            });
        }

        return [];
    }
);

const categoriesComputed = computed(() => {
    let _category = data.value?.filter((t) => t?.hienthi);

    _category = _category?.map((t) => {
        return {
            id: t.id,
            name: t.tentheloai,
            to: `${ROUTE_PATHS.Home}#card-${t.uutien}`,
            ...(t.loaitin.length
                ? {
                      children: t.loaitin.map((c) => ({
                          id: c.id,
                          name: c.tenloaitin,
                          to: c.link ?? `${ROUTE_PATHS.News}?id=${c.id}`,
                          children: c.children,
                      })),
                  }
                : {}),
        };
    });

    if (!_category) return categories;

    return [...categories, ..._category];
});

const currentTime = ref("");
const searchQuery = ref("");
const searchResults = ref([]);
const showSearchResults = ref(false);

function updateTime() {
    currentTime.value = getCurrentTime();
}

let timer;

onMounted(() => {
    updateTime();
    timer = setInterval(updateTime, 1000);

    // Thêm sự kiện click toàn cầu để phát hiện khi người dùng click ra ngoài
    document.addEventListener('click', handleClickOutside);
});

onBeforeUnmount(() => {
    clearInterval(timer);
    document.removeEventListener('click', handleClickOutside);
});

function handleClickOutside(event) {
    const searchField = document.querySelector('.search-field');
    if (searchField && !searchField.contains(event.target)) {
        showSearchResults.value = false;
    }
}

function handleSearch() {
    const query = searchQuery.value.toLowerCase();
    searchResults.value = categoriesComputed.value.flatMap(cat => {
        const results = [];
        if (cat.name.toLowerCase().includes(query)) {
            results.push(cat);
        }
        if (cat.children) {
            results.push(...cat.children.filter(child => child.name.toLowerCase().includes(query)));
        }
        return results;
    });
    showSearchResults.value = searchResults.value.length > 0;
}

function selectResult() {
    showSearchResults.value = false;
}
</script>

<template>
    <v-container class="pa-0 w-1200">
        <div class="header-container">
            <Avatar class="header-avatar" />
            <v-img
                cover="cover"
                src="/header-bg.jpg"
                class="header-image"
            ></v-img>
        </div>

        <div class="nav-bar-container">
            <router-link :to="ROUTE_PATHS.Home" class="nav-button">
                <v-icon class="home-icon">mdi-home</v-icon>
            </router-link>

            <header-menu :data="categoriesComputed" />
        </div>

        <div class="header-bottom w-1200 m-auto">
            <div>{{ currentTime }}</div>
            <div>
                <div class="search-field">
                    <input
                        type="text"
                        v-model="searchQuery"
                        @input="handleSearch"
                        class="search-text"
                        placeholder="Tìm kiếm..."
                    />
                    <v-icon class="search-icon">mdi-magnify</v-icon>
                    <div v-if="showSearchResults" class="search-results">
                        <div v-for="result in searchResults" :key="result.id">
                            <router-link :to="result.to" @click.native="selectResult">{{ result.name }}</router-link>
                        </div>
                    </div>
                    <div v-else-if="searchQuery" class="search-results">Không có kết quả tìm kiếm.</div>
                </div>
            </div>
        </div>
    </v-container>
</template>

<style lang="css" scoped>
.header-container {
    position: relative;
}

.container {
    position: unset;
}

.m-auto {
    margin: auto;
}

.nav-bar-container {
    width: 100%;
    background-color: var(--primary);
    height: 47px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.home-icon {
    color: var(--white);
}

.nav-button {
    color: var(--white);
    padding: 10px 18px;
    text-decoration: none;
}

.list-cate {
    min-width: 150px;
}

.menu-sub {
    position: relative;
}

.list-cate-children {
    position: absolute;
    right: calc(-100% - 4px);
    top: -40px;
    width: 100%;
    height: 100%;
}

.list-sub {
    padding: 0 !important;
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

.nav-button:hover {
    background-image: linear-gradient(
        rgba(0, 0, 0, 0) 0%,
        rgba(0, 0, 0, 0.2) 100%
    );
}

.header-bottom {
    background-color: #eaeaea;
    border: 1px solid var(--gray);
    height: 52px;
    padding: 0 10px;
    color: var(--primary);
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
}

.search-field {
    background-color: var(--white);
    border: 1px solid var(--gray);
    border-radius: 4px;
    font-family: Arial;
    font-size: 13px;
    height: 33px;
    width: 241px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0;
    position: relative;
}

.search-text {
    width: 100%;
    padding-left: 15px;
    border: none;
    outline: none;
}

.search-icon {
    color: var(--white);
    width: 49px;
    height: 100%;
    background: var(--primary);
    border-radius: 0 4px 4px 0;
}

.search-results {
    margin-top: 10px;
    background: var(--white);
    border: 1px solid var(--gray);
    border-radius: 4px;
    padding: 10px;
    position: absolute;
    top: 100%;
    right: 0;
    width: 241px;
    max-height: 300px;
    overflow-y: auto;
    z-index: 1000;
}
</style>
