<script setup lang="ts">
import { ROUTE_PATHS } from "@/constants/route.constant";
</script>

<template>
    <div class="syllabus">
        
            <h1 class="box-shadow">Đào tạo Sau đại học</h1>
            <h2 class="box-shadow">Thông tin chung</h2>
            <ul>
                <li>
                    Đối với bậc sau đại học Khoa Toán - Tin học quản lí chuyên môn
                     và Phòng Đào tạo sau đại học của Trường quản lí hành chính. 
                     Các thông báo học vụ, thông tin tuyển sinh, qui chế, lịch học, lịch thi
                      ... có thể xem ở trang web của Phòng đào tạo sau đại học. 
                      Các thông báo về lịch học, các môn học mới, seminar và các hoạt động chuyên môn,
                       ... thường có trên trang web của Khoa.
                </li>
                <h2 class="box-shadow">Liên hệ</h2>
                <li>
                    Phụ trách chung: Trưởng Khoa PGS. TS. Mai Hoàng Biên

                    Mỗi ngành có người phụ trách ngành, là trưởng bộ môn tương ứng hoặc đại diện cấp khoa.
                    <div class="section">
                       <li>Ngành Đại số: PGS.TS. Mai Hoàng Biên</li> 
                       <li>Ngành Toán Giải tích: PGS. TS. Lý Kim Hà </li>
                       <li>Ngành Toán ứng dụng: PGS.TS. Nguyễn Lê Hoàng Anh</li>
                       <li>Ngành Xác suất - Thống kê: GS.TS. Đặng Đức Trọng</li>
                       <li>Ngành Cơ sở toán học cho tin học: PGS. TS. Nguyễn Thanh Bình</li></div>

                </li>
                
            </ul>
      

        <div class="section">
            <h2 class="box-shadow">Giáo vụ</h2>
            <ul>
                Khi cần nộp các loại hồ sơ cho Khoa, học viên cao học và nghiên cứu sinh gởi hồ sơ 
                cho Giáo vụ khoa tại Văn phòng Khoa, để lại địa chỉ liên lạc, và nhận lại hồ sơ từ
                 Giáo vụ khoa khi hồ sơ được xử lí xong.
            </ul>
        </div>
        <div class="section">
            <h2 class="box-shadow">Ôn tập thi tuyển sinh cao học</h2>
            <ul>
                <li><a href="https://sdh.hcmus.edu.vn/2022/02/17/de-cuong-on-tap-tuyen-sinh-cao-hoc/">
                    Đề cương ôn tập thi tuyển sinh đầu vào cao học
                </a></li>
                <li>
                    Một số đề thi tuyển sinh cao học:
                    <a href="https://www.math.hcmus.edu.vn/images/%C4%90%E1%BB%81_thi_tuy%E1%BA%BFn_sinh_cao_h%E1%BB%8Dc_2020_%C4%91%E1%BB%A3t_2.pdf">
                        Đề thi đợt 2 năm 2020, </a>
                    <a href="https://www.math.hcmus.edu.vn/images/%C4%91%E1%BB%81_thi_To%C3%A1n_c%C6%A1_b%E1%BA%A3n_%C4%91%E1%BB%A3t_2-2019.pdf">
                        Đề thi môn Toán cơ bản đợt 2 năm 2019</a> ,
                    <a href="https://www.math.hcmus.edu.vn/images/%C4%91%E1%BB%81_thi_cao_h%E1%BB%8Dc-2019-%C4%91%E1%BB%A3t_1.pdf">
                        Đề thi đợt 1 năm 2019 ,</a> 
                        <a href="https://www.math.hcmus.edu.vn/images/dethicaohoc2017%C4%91%E1%BB%A3t2.pdf">
                             Đề thi đợt 2 năm 2017,</a> 
                    <a href="https://www.math.hcmus.edu.vn/images/dethicaohocdot2_2015.pdf">
                        Đề thi đợt 2 năm 2015,  </a> 
                       
                </li>
            </ul>
        </div>


        

        <router-link
            :to="ROUTE_PATHS.MathAfter"
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
a {
    color: #930000;
}
</style>
  