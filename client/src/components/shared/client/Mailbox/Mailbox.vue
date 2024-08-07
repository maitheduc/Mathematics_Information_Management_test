<script setup>
import { useMutationAddMailbox } from "@/hooks/mailbox.hook";
import { ref } from "vue";
import { toast } from "vue-sonner";

const isFormVisible = ref(false);
const name = ref("");
const email = ref("");
const phone = ref("");
const message = ref("");

const { mutate } = useMutationAddMailbox();

const handleResetValue = () => {
    name.value = "";
    email.value = "";
    phone.value = "";
    message.value = "";
};

function toggleForm() {
    isFormVisible.value = !isFormVisible.value;
    handleResetValue();
}

function hideForm() {
    isFormVisible.value = false;
    handleResetValue();
}

const submit = () => {
    const payload = {
        hoten: name.value,
        email: email.value,
        dienthoai: phone.value,
        noidung: message.value,
        andanh: 0,
    };

    // Validate form data
    if (
        !payload.hoten ||
        !payload.email ||
        !payload.noidung ||
        !payload.dienthoai
    ) {
        toast.error("Vui lòng nhập đầy đủ thông tin!", {});
        return;
    }

    // Handle form submission
    mutate(payload, {
        onSuccess: () => {
            toast.success("Đã gửi thành công!", {});

            hideForm();
            handleResetValue();
        },
    });
};

const submitAnonymous = () => {
    const anonymousData = {
        noidung: message.value,
        andanh: 1,
    };

    // Validate anonymous form data
    if (!anonymousData.noidung) {
        toast.error("Vui lòng điền nội dung cần hỗ trợ!", {});
        return;
    }

    // Handle anonymous form submission
    mutate(anonymousData, {
        onSuccess: () => {
            toast.success("Đã gửi thành công!", {});

            hideForm();
            handleResetValue();
        },
    });
};
</script>

<template>
    <div class="form-container">
        <div class="form-title" :class="isFormVisible ? ' w-299' : ''">
            <div class="title-left" @click="toggleForm">
                <v-icon class="icon-title-left">mdi-email-outline</v-icon>
                <p>Hỗ trợ sinh viên</p>
            </div>

            <v-icon
                v-if="isFormVisible"
                @click.stop="hideForm"
                style="cursor: pointer"
                >mdi-close-circle-outline</v-icon
            >
        </div>

        <v-form v-if="isFormVisible" class="form">
            <v-text-field
                v-model="name"
                density="compact"
                placeholder="Họ tên"
                prepend-inner-icon="mdi-account-outline"
                variant="outlined"
                label="Họ tên"
                class="text-field mt-3"
            />

            <v-text-field
                v-model="email"
                density="compact"
                placeholder="Địa chỉ email"
                prepend-inner-icon="mdi-email-outline"
                variant="outlined"
                label="Email"
                class="text-field"
            />

            <v-text-field
                v-model="phone"
                density="compact"
                placeholder="Số điện thoại"
                prepend-inner-icon="mdi-cellphone-basic"
                variant="outlined"
                label="Điện thoại"
                class="text-field"
            />

            <v-textarea
                class="mx-2 my-1"
                row-height="25"
                rows="1"
                variant="outlined"
                auto-grow
                shaped
                label="Bạn cần khoa hỗ trợ điều gì?"
                v-model="message"
            >
            </v-textarea>

            <div class="btn-mailbox mb-2">
                <v-btn @click="submit" class="action-icon-btn">
                    Gửi hỗ trợ
                </v-btn>

                <v-btn @click="submitAnonymous" class="ml-2 action-icon-btn">
                    Gửi ẩn danh
                </v-btn>
            </div>
        </v-form>
    </div>
</template>

<style scoped>
.w-299 {
    width: 299px;
}

.form-container {
    position: fixed;
    bottom: 0;
    right: 0;
    z-index: 9999;
}

.form-title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 35px;
    background-color: var(--primary);
    color: var(--white);
    border-radius: 4px 4px 0 0;
    padding: 0 10px;
    font-weight: 400;
}

.title-left {
    display: flex;
    cursor: pointer;
}

.icon-title-left {
    border-right: 1px solid var(--white);
    padding-right: 10px;
    margin-right: 10px;
}

.form {
    border: 1px solid var(--primary);
    background-color: var(--white);
}

.text-field {
    margin: 0 10px;
}

.btn-mailbox {
    display: flex;
    justify-content: center;
    padding-bottom: 10px;
}
</style>