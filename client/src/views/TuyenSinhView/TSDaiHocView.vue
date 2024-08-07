<script setup lang="ts">
import { ROUTE_PATHS } from "@/constants/route.constant";
</script>

<template>
    <div class="syllabus">
        <div class="section">
            <h1 class="box-shadow">Tuyển sinh 2024</h1>
            <h2 class="box-shadow">Thông tin tuyển sinh các ngành đào tạo
                của Khoa Toán - Tin học năm 2024</h2>
            </div>
        
        <img src="https://www.math.hcmus.edu.vn/images/2023/Brochure_Math__CS_1-4_-_Web-01.jpg" alt="mô_tả_ảnh" width="700px" height="700px">
        <img src="https://www.math.hcmus.edu.vn/images/2023/Brochure_Math__CS_1-4_-_Web-02.jpg" alt="mô_tả_ảnh" width="700px" height="700px">
        </div>


        

       
        <router-link
            :to="ROUTE_PATHS.TSPhapViet"
            class="highlight box-shadow text"
        >
            Thông tin tuyển sinh Toán ứng dụng Pháp Việt
        </router-link>
        <br/>
        <router-link
            :to="ROUTE_PATHS.TSSauDH"
            class="highlight box-shadow text"
        >
            Thông tin tuyển sinh Sau Đại học
        </router-link>
    
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
a {
    color: #930000;
}
</style>
  