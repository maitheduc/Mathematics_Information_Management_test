<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue';

const currentYear = new Date().getFullYear();
const showTopPage = ref(false);

function handleScroll() {
    showTopPage.value = window.scrollY > 200;
}

function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

onMounted(() => {
    window.addEventListener('scroll', handleScroll);
});

onBeforeUnmount(() => {
    window.removeEventListener('scroll', handleScroll);
});
</script>

<template>
    <div class="footer">
        <v-container>
            <v-row class="footer-content">
                <v-col class="footer-left padding-0">
                    <div class="title-footer">
                        KHOA TOÁN - TIN HỌC TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN, ĐHQG TPHCM
                    </div>
                    <p class="mt-3 text-gray">LIÊN HỆ CHÚNG TÔI</p>
                    <ul>
                        <li>
                            <a href="#">
                                <v-icon class="mr-1">mdi-map-marker-radius</v-icon>
                                Địa chỉ: F09, 227 Nguyễn Văn Cừ, Quận 5 Thành phố Hồ Chí Minh
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <v-icon class="mr-1">mdi-phone-in-talk</v-icon>
                                Điện thoại: 123456789
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <v-icon class="mr-1">mdi-cellphone-basic</v-icon>
                                Fax: 0234.12345678
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <v-icon class="mr-1">mdi-email-outline</v-icon>
                                Email: math@hcmus.edu.vn
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <v-icon class="mr-1">mdi-earth</v-icon>
                                Website: https://www.math.hcmus.edu.vn/en/
                            </a>
                        </li>
                    </ul>
                </v-col>

                <v-col class="footer-right padding-0 text-end">
                    <iframe
                        src="https://www.facebook.com/plugins/page.php?href=https://www.facebook.com/khoatoantinhoc/&amp;width=500&amp;height=300&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId"
                        width="500" height="300" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
                        allowtransparency="true" allow="encrypted-media"></iframe>
                </v-col>
            </v-row>

            <div class="footer-bottom text-center text-gray">
                <p>
                    © 2024 Khoa Toán - Tin học — {{ currentYear }}
                </p>
                <div class="top-page" v-show="showTopPage">
                    <p class="icon-top" id="scroll-to-top" @click="scrollToTop">
                        <v-icon>mdi-chevron-up</v-icon>
                    </p>
                </div>
            </div>
        </v-container>
    </div>
</template>

<style lang="css" scoped>
.text-gray {
    color: var(--gray);
}

.footer {
    background-color: var(--primary);
    color: var(--white);
    margin-top: 30px;
}

.title-footer {
    font-size: 20px;
}

.footer-content {
    display: flex;
    margin-top: 18px;
    padding: 0;
}

.padding-0 {
    padding: 0;
}

.footer-left ul {
    list-style: none;
}

.footer-left ul li {
    list-style: none;
    margin: 4px 0;
    padding: 6px 10px;
    font-size: 14px;
}

.footer-left ul a {
    text-decoration: none;
    color: var(--gray);
}

.footer-left ul li a:hover {
    padding-left: 20px;
    transition: all 0.5s ease;
    opacity: 0.8;
}

.footer-bottom {
    border-top: 1px solid rgba(251, 251, 251, 0.1);
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 16px;
}

.footer-bottom .top-page {
    background-color: var(--white);
    width: 30px;
    height: 30px;
    border-radius: 50%;
    position: fixed;
    top: 70%;
    right: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 4px 24px;
    border: 1px solid var(--primary);
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.footer-bottom .top-page:hover {
    background-color: var(--primary);
    color: var(--white);
}

.footer-bottom .top-page .icon-top {
    display: flex;
    justify-content: center;
    align-items: center;
}

.footer-bottom .top-page .icon-top .v-icon {
    color: var(--primary);
}

.footer-bottom .top-page:hover .icon-top .v-icon {
    color: var(--white);
}
</style>
