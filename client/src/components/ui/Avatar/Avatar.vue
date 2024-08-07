<script setup>
import { useGetMe } from "@/hooks/auth.hook";
import { AuthLocalStorageService } from "@/services/auth.service";
import { computed } from "vue";
import { PERMISSIONS } from "@/constants";
import { useRouter } from "vue-router";
import { toast } from "vue-sonner";

const router = useRouter();
const userId = computed(() => AuthLocalStorageService.getAuth());

const { data } = useGetMe({
    userId,
    enabled: Boolean(userId.value),
    select: (data) => data?.metadata,
});

const handleLogout = () => {
    AuthLocalStorageService.removeAuth();
    router.push({ name: "login" });
    toast.success("Đăng xuất thành công!");
};
</script>

<template>
    <v-menu min-width="200px" rounded>
        <template v-slot:activator="{ props }">
            <v-btn icon v-bind="props" class="avatar">
                <v-avatar class="avatar-bg" color="brown" size="large">
                    <v-icon>mdi-account</v-icon>
                </v-avatar>
            </v-btn>
        </template>

        <v-card>
            <v-card-text>
                <div class="card-avatar">
                    <v-btn
                        v-if="!Boolean(userId)"
                        to="/auth/login"
                        class="custom-btn"
                        variant="text"
                    >
                        Đăng nhập
                    </v-btn>

                    <v-btn
                        v-if="
                            Boolean(userId) &&
                            data?.permission === PERMISSIONS.ADMIN
                        "
                        to="/admin"
                        class="custom-btn"
                        variant="text"
                    >
                        Quản trị viên
                    </v-btn>

                    <v-btn
                        v-if="Boolean(userId)"
                        class="custom-btn"
                        variant="text"
                        like
                        :to="{
                            name: 'profile',
                        }"
                    >
                        Trang cá nhân
                    </v-btn>

                    <v-btn
                        v-if="Boolean(userId)"
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
</template>

<style lang="css" scoped>
.avatar {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 20;
}

.avatar-bg {
    background-color: var(--primary) !important;
}

.card-avatar {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
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
</style>
