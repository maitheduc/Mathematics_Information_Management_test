<script setup>
import MainTop from "@/components/shared/admin/MainTop";
import queryKeys from "@/constants/queryKey.constant";
import {
    queryKeysGetAllMailbox,
    useGetCountMailbox,
    useGetMailbox,
    useMutationEditMailbox,
} from "@/hooks/mailbox.hook";
import { fDate, getQueryKeys } from "@/utils";
import { useQueryClient } from "@tanstack/vue-query";
import { computed } from "vue";
import { useRoute, useRouter } from "vue-router";
import { toast } from "vue-sonner";

const TAB_OPTIONS = {
    NORMAL: "NORMAL",
    ANONYMOUS: "ANONYMOUS",
    ALL: "ALL",
};

const route = useRoute();
const router = useRouter();
const tabOption = computed(() => route.query?.tab || TAB_OPTIONS.NORMAL);
const { mutate } = useMutationEditMailbox();
const queryClient = useQueryClient();

const page = computed(() => parseInt(route.query?.page) || 1);

const options = computed(() => {
    return {
        page,
        limit: 10,
        tab: tabOption,
    };
});

const { data, isLoading } = useGetMailbox(options.value);
const { data: counts } = useGetCountMailbox();

console.log(`counts::`, counts.value);

const links = [
    [
        "mdi-email-outline",
        "Thư thường",
        `${route.path}?tab=${TAB_OPTIONS.NORMAL}`,
        TAB_OPTIONS.NORMAL,
    ],
    [
        "mdi-eye-off",
        "Ẩn danh",
        `${route.path}?tab=${TAB_OPTIONS.ANONYMOUS}`,
        TAB_OPTIONS.ANONYMOUS,
    ],
    [
        "mdi-file-document",
        "Tất cả",
        `${route.path}?tab=${TAB_OPTIONS.ALL}`,
        TAB_OPTIONS.ALL,
    ],
];

const headers = [
    { title: "ID", align: "start", key: "id", maxWidth: 50 },
    {
        title: "Họ và tên",
        align: "start",
        key: "hoten",
        maxWidth: 150,
    },
    {
        title: "Nội dung",
        align: "start",
        key: "noidung",
        maxWidth: 200,
    },
    {
        title: "Trạng thái",
        align: "center",
        key: "dadoc",
        maxWidth: 200,
    },
    {
        title: "Ngày gửi",
        align: "start",
        key: "created_at",
        maxWidth: 200,

        value: (value) => fDate(value.created_at, "DD-MM-YYYY HH:mm:ss"),
    },
    { title: "Đánh dấu đã đọc", key: "actions", sortable: false },
];

const onSelectedRed = (item) => {
    const payload = {
        dadoc: true,
        id: item.id,
    };

    const computedParams = computed(() => {
        return Object.entries(options.value).reduce((acc, [key, value]) => {
            if (key === "tab") {
                const conditions =
                    value.value?.toLowerCase() ===
                    TAB_OPTIONS.NORMAL.toLowerCase()
                        ? { "dadoc[eq]": 0, "andanh[eq]": 0 }
                        : value.value?.toLowerCase() ===
                          TAB_OPTIONS.ANONYMOUS.toLowerCase()
                        ? { "andanh[eq]": 1 }
                        : {
                              limit: 99999999,
                          };

                const entries = Object.entries(conditions);

                if (entries.length) {
                    entries.forEach(([_key, _value]) => {
                        acc[_key] = _value;
                    });
                }
            } else {
                acc[key] = value;
            }

            return acc;
        }, {});
    });

    mutate(payload, {
        onSuccess: () => {
            queryClient.invalidateQueries([
                {
                    queryKey: queryKeysGetAllMailbox(computedParams.value),
                    exact: true,
                },
                {
                    queryKey: getQueryKeys({ key: queryKeys.mailbox.COUNT }),
                    exact: true,
                },
            ]);

            toast.success("Đánh dấu đã đọc thành công");
        },
    });
};
</script>

<template>
    <MainTop
        title="Hộp thư hỗ trợ"
        sub="Danh sách hộp thư hỗ trợ từ sinh viên"
        icon="mdi-pencil-box-outline"
    />

    <div class="mx-30 mb-5">
        <v-row>
            <v-col cols="3">
                <div class="title-message">
                    <h3>Danh sách hộp thư</h3>
                </div>

                <v-card class="pa-3">
                    <v-list class="card-message pa-0">
                        <v-list-item
                            v-for="[icon, text, to, tab] in links"
                            :key="icon"
                            link
                            :to="to"
                            :class="tabOption === tab ? 'active' : ''"
                        >
                            <template v-slot:default="{}">
                                <div :class="'mess-item'">
                                    <div class="mess-item-left">
                                        <v-icon class="mr-1">{{ icon }}</v-icon>
                                        <v-list-item-content>
                                            <v-list-item-title>
                                                {{ text }}
                                            </v-list-item-title>
                                        </v-list-item-content>
                                    </div>

                                    <div
                                        class="mess-item-right"
                                        v-if="counts && counts?.[tab] && counts?.[tab] > 0"
                                    >
                                        <span>{{ counts?.[tab] }}</span>
                                    </div>
                                </div>
                            </template>
                        </v-list-item>
                    </v-list>
                </v-card>
            </v-col>
            <v-col cols="9">
                <v-card class="pa-3">
                    <v-data-table
                        :headers="headers"
                        :items="data?.metadata"
                        :loading="isLoading"
                        :hide-default-footer="true"
                        item-key="name"
                        hover
                    >
                        <template v-slot:loading>
                            <v-skeleton-loader
                                type="table-row@5"
                            ></v-skeleton-loader>
                        </template>

                        <template v-slot:item.hoten="{ value }">
                            <div class="user-title">
                                <p>{{ value }}</p>
                            </div>
                        </template>

                        <template v-slot:item.dadoc="{ value }">
                            <p :class="Boolean(value) ? 'text-green' : 'text-red'">
                                <p>{{ (Boolean(value) ? "Đã đọc" : "Chưa đọc") }}</p>
                            </p>
                        </template>

                        <template v-slot:item.actions="{ item }">
                            <v-icon v-if="!Boolean(item.dadoc)" @click="onSelectedRed(item)" class="me-2 cursor-pointer" size="small" color="green">
                                mdi-checkbox-multiple-marked-circle-outline
                            </v-icon>    
                        </template>
                    </v-data-table>
                </v-card>
            </v-col>
        </v-row>
    </div>
</template>

<style lang="css" scoped>
.title-message {
    height: 40px;
    background-color: var(--primary);
    color: var(--white);
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 4px;
    margin-bottom: 20px;
}

.card-message {
    background-color: var(--light-gray);
}

.v-list-item:hover,
.v-list-item .v-list-item--active {
    color: var(--white);
    background-color: var(--primary);
}

.active {
    color: var(--white);
    background-color: var(--primary);
}

.mess-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.mess-item-left {
    display: flex;
    justify-content: center;
    align-items: center;
}

.mess-item-right {
    color: var(--white);
    background-color: var(--primary);
    width: 25px;
    height: 25px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* right */
.mailbox-controls {
    border-bottom: 1px solid var(--light-gray);
    padding-bottom: 20px;
}

.v-btn--size-default {
    min-width: 32px !important;
    padding: 0 10px !important;
}

.user-title {
    color: var(--yellow);
    display: flex;
    align-items: center;
    cursor: pointer;
}

.user-title p:hover {
    text-decoration: underline;
}
</style>