<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { rules } from "@/utils/rule";
import SecureInput from "@/components/shared/form/SecureInput.vue";
import { mutationLogin } from "@/hooks/auth.hook";
import { toast } from "vue-sonner";
import { PERMISSIONS } from "@/constants";
import { AuthLocalStorageService } from "@/services/auth.service";

const email = ref("");
const password = ref("");
const form = ref(null);
const valid = ref(false);

const router = useRouter();
const { mutate, isPending } = mutationLogin();

const handleSubmit = async () => {
    const { valid } = await form.value.validate();

    if (!valid) return;

    mutate(
        { email: email.value, password: password.value },
        {
            onSuccess: ({ metadata }) => {
                toast.success("Đăng nhập thành công");

                AuthLocalStorageService.setAuth(metadata?.id);

                if (metadata?.permission === PERMISSIONS.ADMIN) {
                    router.push({ name: "dashboard" });
                } else {
                    router.push({ path: "/" });
                }
            },
        }
    );
};
</script>

<template>
    <div class="login">
        <v-card class="card-login">
            <v-form
                @submit.prevent="handleSubmit"
                ref="form"
                v-model="valid"
                class="card-login-form"
            >
                <div class="text-center mt-5">
                    <h1 class="font-weight-light">Đăng nhập</h1>
                    <p class="font-weight-thin text-h7 my-2">
                        Great to have back!
                    </p>
                </div>

                <v-text-field
                    v-model="email"
                    label="E-mail"
                    :rules="[rules.required, rules.email]"
                />
                <secure-input
                    class="mt-2"
                    v-model="password"
                    label="Mật khẩu"
                    placeholder="Nhập mật khẩu"
                />

                <div class="btn-login">
                    <v-btn
                        type="submit"
                        class="text-center"
                        :loading="isPending"
                        :disabled="isPending"
                    >
                        Đăng nhập
                    </v-btn>
                    <v-btn
                        to="/"
                        variant="text"
                        class="my-2"
                        :loading="isPending"
                        :disabled="isPending"
                    >
                        Về trang chủ
                    </v-btn>
                </div>
            </v-form>
        </v-card>
    </div>
</template>

<style scoped>
.login {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card-login {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    box-shadow: 0 25px 45px rgb(1 2 2 / 12%);
    margin: auto;
    width: 500px;
}

.card-login-form {
    width: 80%;
}

.btn-login {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin-bottom: 20px;
}

.btn-login .v-btn {
    margin: 10px 0;
}

.btn-login .v-btn:first-child {
    background-color: var(--primary);
    color: var(--white);
    margin: 10px 0;
}
</style>
