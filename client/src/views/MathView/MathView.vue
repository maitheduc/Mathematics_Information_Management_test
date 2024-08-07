<script setup lang="ts">
import { ROUTE_PATHS } from "@/constants/route.constant";
</script>

<template>
    <div class="syllabus">
        <div class="section">
            <h1 class="box-shadow">Chương trình đào tạo ngành Toán học</h1>
            <h2 class="box-shadow">Thông tin chung</h2>
            <ul>
                <li>
                    Tháng 12/2023 Khoa có 1109 sinh viên theo học nhóm ngành
                    Toán học, Toán ứng dụng và Toán tin. Mỗi năm Khoa tuyển mới
                    khoảng 210 sinh viên vào nhóm ngành Toán học, Toán tin và
                    Toán ứng dụng, trong đó khoảng 30 sinh viên được chọn vào
                    chương trình tài năng. Sinh viên tốt nghiệp được cấp bằng Cử
                    nhân Toán học, Cử nhân Toán ứng dụng và Cử nhân Toán tin.
                    Bảng tốt nghiệp và bảng điểm không ghi chuyên ngành.
                </li>
                <li>
                    Trong 3 học kì đầu sinh viên học các môn đại cương. Từ học
                    kì thứ tư sinh viên vào giai đoạn chuyên ngành. Sinh viên có
                    thể được lựa chọn ngành và chuyên ngành theo nguyện vọng ở
                    đầu học kỳ 4. Sinh viên có thể điều chỉnh ngành và chuyên
                    ngành, nhưng chỉ được một lần duy nhất. Sinh viên làm khóa
                    luận tốt nghiệp, nếu đủ điều kiện miễn chuyên đề.
                </li>
                <li>
                    Chương trình đào tạo theo hệ thống tín chỉ, có tính tích hợp
                    và tính tự chọn cao, cho phép sinh viên nhiều lựa chọn linh
                    hoạt trong học tập, nghiên cứu, hướng tới nghiên cứu, ứng
                    dụng, thực hành, tùy nguyện vọng và năng lực.
                </li>
            </ul>
        </div>

        <div class="section">
            <h2 class="box-shadow">Toàn văn chương trình đào tạo</h2>
            <ul>
                <li>Chương trình đào tạo ngành Toán học năm 2020</li>
                <li>Chương trình đào tạo năm 2019</li>
                <li>Chương trình đào tạo năm 2018</li>
            </ul>
        </div>

        <div class="section">
            <h2 class="box-shadow">Dự thảo chương trình đào tạo</h2>
            <ul>
                <li>
                    Ngành Toán học: Khóa 2021 và 2022 (dự thảo và phụ lục), Khóa
                    2023 (dự thảo và phụ lục)
                </li>
                <li>
                    Ngành Toán ứng dụng: Khóa 2021 và 2022 (dự thảo và phụ lục),
                    Khóa 2023 (dự thảo và phụ lục)
                </li>
                <li>
                    Ngành Toán tin: Khóa 2021 và 2022 (dự thảo và phụ lục), Khóa
                    2023 (dự thảo và phụ lục)
                </li>
            </ul>
        </div>

        <router-link
            :to="ROUTE_PATHS.MathList"
            class="highlight box-shadow text"
        >
            Xem thêm về chương trình đào tạo
        </router-link>
    </div>
</template>
  
<style scoped>
.syllabus {
    font-family: Arial, sans-serif;
}

.section {
    margin-bottom: 20px;
}

h1,
h2 {
    color: #930000;
}

ul {
    list-style-type: disc;
    padding-left: 20px;
}

li {
    margin-bottom: 10px;
}
.highlight {
    font-size: 18px; 
    font-weight: bold; 
    padding: 10px; 
    text-align: center; 
    display: block; 
    text-decoration: none; 
    color: #930000; 
}

.highlight:hover {
    color: #000; 
    background-color: #f0f0f0; 
}

.box-shadow {
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}
</style>
  