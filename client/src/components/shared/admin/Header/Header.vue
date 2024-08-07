<script setup>
import { ref, onMounted, onBeforeUnmount, inject, computed } from "vue";
import { ROUTE_PATHS } from "@/constants/route.constant";
import Search from "@/components/ui/Search";
import { useGetCountMailbox } from "@/hooks/mailbox.hook";
import { AuthLocalStorageService } from "@/services/auth.service";
import { useRouter } from "vue-router";
import { toast } from "vue-sonner";
import { getAuth } from "@/hooks/auth.hook";

const drawer = inject("drawer");

const { data } = useGetCountMailbox();
const router = useRouter();

const { userId } = getAuth();

const countMailbox = computed(() => {
    if (!data?.value) return false;

    return (
        Object.entries(data.value).reduce(
            (acc, [key, value]) => (acc += value),
            0
        ) > 0
    );
});

const handleLogout = () => {
    AuthLocalStorageService.removeAuth();
    router.push({ name: "login" });
    toast.success("Đăng xuất thành công!");
};
</script>

<template>
    <v-system-bar class="header-top">
        <div class="header-left">
            <a href="#" class="header-logo">Admin page</a>
        </div>
        <div class="header-right">
            <div>
                <v-app-bar-nav-icon
                    @click="drawer = !drawer"
                    class="drawer-icon"
                ></v-app-bar-nav-icon>
                <v-btn
                    :to="ROUTE_PATHS.Home"
                    class="home-page-btn action-icon-btn"
                >
                    Client page
                </v-btn>
            </div>
            <div class="top-right">
                <Search width="198px" height="33px" widthIcon="49px" />

                <div class="mx-3">
                    <router-link to="/admin/message" class="text-white">
                        <v-icon :class="countMailbox ? 'shake' : ''">
                            mdi-bell-outline
                        </v-icon>
                    </router-link>
                </div>

                <v-menu min-width="200px" rounded>
                    <template v-slot:activator="{ props }">
                        <v-avatar
                            icon
                            v-bind="props"
                            class="avatar-bg mx-3"
                            color="brown"
                            size="small"
                        >
                            <v-icon>mdi-account</v-icon>
                        </v-avatar>
                    </template>
                    <v-card>
                        <v-card-text>
                            <div class="card-avatar">
                                <v-btn
                                    v-if="userId"
                                    link
                                    :to="{
                                        name: 'account_edit',
                                        params: { id: userId },
                                    }"
                                    class="custom-btn"
                                    variant="text"
                                >
                                    Trang cá nhân
                                </v-btn>
                                <v-btn
                                    class="custom-btn"
                                    variant="text"
                                    @click="handleLogout"
                                >
                                    Đăng xuất
                                </v-btn>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-menu>
            </div>
        </div>
    </v-system-bar>
</template>

<style lang="css" scoped>
.drawer-icon {
    background-color: var(--primary);
    height: 51px;
    width: 51px;
    border-radius: 50%;
}

.home-page-btn {
    margin-left: 10px;
    height: 33px !important;
    background-color: var(--white) !important;
    color: var(--primary) !important;
}

.header-top {
    background-color: var(--primary);
    height: 51px !important;
    color: var(--white);
}

.header-logo {
    font-family: "Pacifico", cursive;
    font-size: 24px;
    color: white;
    text-align: center;
    margin: 0;
    padding: 10px;
    text-decoration: none;
}

.header-left {
    width: 250px;
    height: 100%;
    display: flex;
    align-items: center;
    border-right: 1px solid var(--white);
}

.header-right {
    width: calc(100% - 250px + 7px);
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.top-right {
    display: flex;
    align-items: center;
}

.avatar-bg {
    background-color: var(--primary) !important;
}

.custom-btn {
    width: 150px;
    transition: background-color 0.3s, color 0.3s;
    margin-bottom: 8px;
    border-bottom: 1px solid var(--primary);
    border-radius: 0px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.custom-btn:hover {
    background-color: var(--primary);
    color: var(--white);
}

/* bell */
.shake {
    animation: shake 1s infinite;
}

@keyframes shake {
    0%,
    100% {
        transform: translateX(0);
    }

    25% {
        transform: translateX(-10px);
    }

    50% {
        transform: translateX(10px);
    }

    75% {
        transform: translateX(-10px);
    }
}

/* end header top */
</style>
