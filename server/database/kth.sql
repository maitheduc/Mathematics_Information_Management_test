-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 03:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khoatinhoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `noidung` text NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_tintuc` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `created_at`, `updated_at`, `noidung`, `id_user`, `id_tintuc`) VALUES
(3, '2024-07-04 04:36:45', '2024-07-04 04:36:45', 'Bài viết hay quá', 1, 11),
(4, '2024-07-04 04:37:07', '2024-07-04 04:37:07', 'Bài viết hay quá uhm hửm', 1, 11),
(5, '2024-07-04 04:37:30', '2024-07-04 04:37:30', 'Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm', 1, 11),
(6, '2024-07-04 07:19:39', '2024-07-04 07:19:39', 'Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm Bài viết hay quá uhm hửm', 1, 11),
(7, '2024-07-04 07:22:21', '2024-07-04 07:22:21', 'sdfs', 1, 11),
(8, '2024-07-04 07:22:45', '2024-07-04 07:22:45', 'hôm nay trời đẹp quá', 1, 11),
(9, '2024-07-04 07:31:24', '2024-07-04 07:31:24', 'hihi', 1, 1),
(10, '2024-07-04 08:45:24', '2024-07-04 08:45:24', 'lạnh', 1, 9),
(11, '2024-07-05 03:13:14', '2024-07-05 03:13:14', 'hù', 1, 9),
(12, '2024-07-08 05:15:00', '2024-07-08 12:57:12', 'đã đăng nhập  chỉnh sửa', 10, 13),
(14, '2024-07-08 05:53:27', '2024-07-08 07:37:39', 'đã đăng nhập update', 9, 13),
(15, '2024-07-08 07:38:51', '2024-07-08 07:38:51', 'thêm bình luận nè', 9, 13),
(16, '2024-07-08 08:00:41', '2024-07-08 08:00:41', 'comment nef', 9, 3),
(17, '2024-07-08 08:01:04', '2024-07-08 08:01:04', 'comment nuaw ne', 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_binh_luans`
--

CREATE TABLE `chi_tiet_binh_luans` (
  `id` int(10) UNSIGNED NOT NULL,
  `noidung` text NOT NULL,
  `id_binhluan` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chi_tiet_binh_luans`
--

INSERT INTO `chi_tiet_binh_luans` (`id`, `noidung`, `id_binhluan`, `id_user`, `created_at`, `updated_at`) VALUES
(4, 'hi hi', 5, 2, '2024-07-04 04:59:48', '2024-07-04 04:59:48'),
(5, 'uhm  hửm', 8, 1, '2024-07-04 07:29:43', '2024-07-04 07:29:43'),
(6, 'uhmw hửm', 8, 1, '2024-07-04 07:29:53', '2024-07-04 07:29:53'),
(7, 'quá tuyệt vời', 7, 1, '2024-07-04 07:30:28', '2024-07-04 07:30:28'),
(8, 'quá  nhiều bình luận', 5, 1, '2024-07-04 07:46:44', '2024-07-04 07:46:44'),
(9, 'chiều hôm nay tối thui', 10, 1, '2024-07-04 10:05:05', '2024-07-04 10:05:05'),
(10, 'bình luận', 10, 1, '2024-07-05 03:13:05', '2024-07-05 03:13:05'),
(11, 'hết hồn', 11, 1, '2024-07-05 03:13:22', '2024-07-05 03:13:22'),
(12, 'haha', 11, 1, '2024-07-05 03:13:42', '2024-07-05 03:13:42'),
(13, 'haha', 3, 3, '2024-07-08 03:17:31', '2024-07-08 03:17:31'),
(14, 'Hello', 9, 10, '2024-07-08 05:18:47', '2024-07-08 05:18:47'),
(18, 'reply comment update', 12, 9, '2024-07-08 07:53:15', '2024-07-08 07:53:42'),
(19, 'hi', 4, 9, '2024-07-08 12:47:34', '2024-07-08 12:47:34'),
(20, 'reply comment nha', 14, 10, '2024-07-08 12:57:31', '2024-07-08 12:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `faculty_id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Bộ môn trí tuệ nhân tạo', 2, 'Bộ môn trí tuệ nhân tạo chuyên đào tạo về mảng trí tuệ nhân tạo hiện đại', 'budget-1024x617.webp', '2024-07-06 13:26:31', '2024-07-08 02:20:49'),
(3, 'Bộ môn phát triển phần mềm', 2, 'Bộ môn phát triển phần mềm chuyên đào tạo các cử nhân trong tương lai đáp ứng nhu cầu phát triển phần mềm cho các doanh nghiệp hàng đầu hiện nay', '7.3.png', '2024-07-07 11:24:52', '2024-07-08 02:22:48'),
(4, 'Bộ môn cơ điện tử', 2, 'Bộ môn cơ điện tử giúp cho sinh viên tiếp thu các kiến thức thực tiển áp dụng vào thực tế.', 'istockphoto-495853751-612x612.jpg', '2024-07-07 11:25:33', '2024-07-08 12:27:22'),
(6, 'Bộ môn toán tin ứng dụng', 2, 'Mô tả Bộ môn toán tin ứng dụng', 'a4.jpg', '2024-07-08 13:02:15', '2024-07-08 13:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Khoa Tin học', 'Khoa Tin học là khoa chuyên đào tạo các chuyên ngành chất lượng cao cập  nhật', 'tool4.png', '2024-07-06 13:23:52', '2024-07-08 13:01:43'),
(4, 'Khoa Công Nghệ', 'Khoa Công Nghệ là khoa mạnh về đạo tạo kĩ thuật', '3.png', '2024-07-07 10:29:48', '2024-07-08 02:16:43'),
(5, 'Khoa Nhân Văn Xã Hội', 'Đây là Khoa Về Xã Hội', '5.4.png', '2024-07-07 10:30:40', '2024-07-07 10:32:30'),
(6, 'Khoa Kinh Tế', 'Khoa Kinh Tế đào tạo các kiến thức về lĩnh vực kinh tế chất lượng cao', '7.1.png', '2024-07-07 10:49:02', '2024-07-08 02:17:41'),
(7, 'Khoa Sư Phạm', 'Đào tạo chuẩn giao dục chuyên môn chất lượng dành cho các giáo viên tương lai, đáp ứng nhu cầu phục vụ cho ngành giáo dục hiện nay.', 'tool2.png', '2024-07-07 10:49:52', '2024-07-08 02:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `hop_thus`
--

CREATE TABLE `hop_thus` (
  `id` int(10) UNSIGNED NOT NULL,
  `hoten` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `dienthoai` varchar(191) DEFAULT NULL,
  `noidung` text NOT NULL,
  `andanh` tinyint(1) NOT NULL,
  `daxem` tinyint(1) NOT NULL,
  `dadoc` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hop_thus`
--

INSERT INTO `hop_thus` (`id`, `hoten`, `email`, `dienthoai`, `noidung`, `andanh`, `daxem`, `dadoc`, `created_at`, `updated_at`) VALUES
(1, 'Ẩn danh', 'a@gmail.com', '0123456789', 'Tôi không phải ẩn danh', 0, 0, 1, '2020-03-15 06:12:20', '2024-07-05 15:49:55'),
(2, 'Ẩn danh', NULL, NULL, 'sdfs', 1, 0, 1, '2024-06-23 07:25:22', '2024-07-05 15:50:13'),
(3, 'Ẩn danh', NULL, NULL, 'Tôi là người ẩn danh', 1, 0, 1, '2024-07-01 07:56:46', '2024-07-05 15:31:50'),
(4, 'Ẩn danh', 'a@gmail.com', '0123456789', 'Tôi không phải ẩn danh', 0, 0, 1, '2024-07-01 07:59:04', '2024-07-05 15:48:57'),
(5, 'Nguyễn Văn A', 'a@gmail.com', '0123456789', 'Tôi không phải ẩn danh', 0, 0, 1, '2024-07-01 08:07:24', '2024-07-05 14:15:02'),
(6, 'Ẩn danh', NULL, NULL, 'ẩn danh', 1, 0, 1, '2024-07-04 10:01:46', '2024-07-05 15:50:04'),
(7, 'Nguyễn Văn A', 'sdfs@gmail.com', '0123121212', 'sdfs', 0, 0, 1, '2024-07-04 10:07:25', '2024-07-05 14:15:12'),
(8, 'Ẩn danh', NULL, NULL, 'Ẩn Danh Nè', 1, 0, 1, '2024-07-05 15:54:15', '2024-07-05 16:04:44'),
(9, 'Ẩn danh', NULL, NULL, 'Ẩn Danh HAHA', 1, 0, 1, '2024-07-05 15:54:40', '2024-07-05 16:04:41'),
(10, 'Ẩn danh', NULL, NULL, 'TEst', 1, 0, 1, '2024-07-05 15:55:14', '2024-07-05 16:04:39'),
(11, 'Ẩn danh', NULL, NULL, 'Ẩn danh', 1, 0, 1, '2024-07-05 16:05:51', '2024-07-05 16:06:05'),
(12, 'Ẩn danh', 'a@gmail.com', '0123456789', 'Mai có đi học ko shop?', 0, 0, 1, '2024-07-05 16:07:03', '2024-07-08 12:59:25'),
(13, 'Ẩn danh', NULL, NULL, 'Tôi gửi ẩn danh', 1, 0, 1, '2024-07-08 12:56:11', '2024-07-08 12:59:32'),
(14, 'Ẩn danh', 'test@gmail.com', '0123456789', 'Không phải ẩn danh', 0, 0, 1, '2024-07-08 12:56:37', '2024-07-08 12:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `lien_kets`
--

CREATE TABLE `lien_kets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenlienket` varchar(191) DEFAULT NULL,
  `linklienket` varchar(191) DEFAULT NULL,
  `loailienket` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lien_kets`
--

INSERT INTO `lien_kets` (`id`, `tenlienket`, `linklienket`, `loailienket`, `created_at`, `updated_at`) VALUES
(1, 'https://thpt-nguyentatthanh-tphcm.edu.vn/uploads/banners/img_bgddt_220-1_1.jpg', 'https://moet.gov.vn/Pages/home.aspx', 'HinhAnh', NULL, NULL),
(2, 'https://thpt-nguyentatthanh-tphcm.edu.vn/uploads/banners/truonghocketnoitop_banner2_1.gif', 'http://www.ntthnue.edu.vn/', 'HinhAnh', NULL, NULL),
(3, 'https://thpt-nguyentatthanh-tphcm.edu.vn/uploads/banners/logo_small.gif', 'https://hcm.edu.vn/Default33.aspx', 'HinhAnh', NULL, NULL),
(4, 'https://thpt-nguyentatthanh-tphcm.edu.vn/uploads/banners/img_baogiaoduc_tphcm.jpg', 'https://giaoduc.net.vn/', 'HinhAnh', NULL, NULL),
(5, 'Trang web 1', 'https://hcm.edu.vn/Default33.aspx', 'GiaoVien', NULL, NULL),
(6, 'Trang web 2', 'https://giaoduc.net.vn/', 'GiaoVien', NULL, NULL),
(7, 'Trang web 1', 'https://hcm.edu.vn/Default33.aspx', 'HocSinh', NULL, NULL),
(8, 'Trang web 2', 'https://giaoduc.net.vn/', 'HocSinh', NULL, NULL),
(9, 'Trang web 1', 'https://hcm.edu.vn/Default33.aspx', 'LienKetKhac', NULL, NULL),
(10, 'Trang web 2', 'https://giaoduc.net.vn/', 'LienKetKhac', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loai_tins`
--

CREATE TABLE `loai_tins` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenloaitin` varchar(191) NOT NULL,
  `id_theloai` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loai_tins`
--

INSERT INTO `loai_tins` (`id`, `tenloaitin`, `id_theloai`, `created_at`, `updated_at`) VALUES
(1, 'Chung', 1, NULL, NULL),
(2, 'Trường', 1, NULL, NULL),
(3, 'Đoàn - hội', 1, NULL, NULL),
(4, 'Khoa', 1, NULL, NULL),
(5, 'Chung', 2, NULL, NULL),
(6, 'Trường', 2, NULL, NULL),
(7, 'Đoàn - hội', 2, NULL, NULL),
(8, 'Khoa', 2, NULL, NULL),
(9, 'Đại học', 3, NULL, NULL),
(10, 'Sau đại học', 3, NULL, '2024-07-05 09:10:20'),
(11, 'Đại học', 4, NULL, NULL),
(12, 'Sau đại học', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_01_030140_create_the_loais_table', 1),
(4, '2019_02_01_030239_create_loai_tins_table', 1),
(5, '2019_02_01_030253_create_tin_tucs_table', 1),
(6, '2019_02_01_112429_create_binh_luans_table', 1),
(7, '2019_02_01_153013_create_trang_chus_table', 1),
(8, '2019_02_03_183714_create_thong_baos_table', 1),
(9, '2019_02_05_155133_create__chi_tiet_binh_luans_table', 1),
(10, '2019_04_16_060112_create_hop_thus_table', 1),
(11, '2019_12_20_160459_create_lien_kets_table', 1),
(12, '2024_07_06_193747_create_table_faculties', 2),
(13, '2024_07_06_193841_create_table_departments', 2),
(14, '2024_07_06_193946_create_table_personnel', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `base_salary` int(11) NOT NULL DEFAULT 0,
  `department_id` int(10) UNSIGNED NOT NULL,
  `academic_level` varchar(191) DEFAULT NULL,
  `degrees` varchar(191) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `dob`, `position`, `description`, `avatar`, `base_salary`, `department_id`, `academic_level`, `degrees`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'Anh', 'Trần Tuấn', 'tuananh@gmail.com', '0123456789', NULL, '1990-01-01', 'Phó khoa', 'Cập nhật mô tả', 'a1.jpg', 3, 2, 'Prof', 'TS', 'male', '2024-07-06 13:48:06', '2024-07-08 12:52:27'),
(2, 'Tiến', 'Nguyễn Thị Tâm', 'tamtien@gmail.com', '0123456788', NULL, '1990-01-01', 'Trưởng phòng', NULL, 'a2.jpg', 3, 3, 'Prof', 'TS', 'female', '2024-07-06 13:50:05', '2024-07-08 12:52:49'),
(3, 'A', 'Nguyễn Văn', 'a@gmail.com', '0123345678', NULL, '1988-01-01', 'Trưởng Khoa', NULL, 'a3.jfif', 10000000, 2, 'Professor', 'TS', 'male', '2024-07-07 13:24:11', '2024-07-08 12:52:59'),
(4, 'B', 'Nguyễn  Văn', 'b@gmail.com', '0123456678', NULL, '1988-01-01', 'Giảng Viên', NULL, 'a4.jpg', 6000000, 4, NULL, 'TS', 'male', '2024-07-07 13:27:29', '2024-07-08 12:53:07'),
(5, 'Toàn', 'Nguyễn Văn', 'toan@gmail.com', '0123456612', NULL, '1980-01-01', 'Trưởng Khoa', NULL, 'a4.jpg', 9000000, 6, 'Prof', 'TS', 'male', '2024-07-08 13:03:38', '2024-07-08 13:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `the_loais`
--

CREATE TABLE `the_loais` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentheloai` varchar(191) NOT NULL,
  `uutien` int(11) NOT NULL,
  `hienthi` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `the_loais`
--

INSERT INTO `the_loais` (`id`, `tentheloai`, `uutien`, `hienthi`, `created_at`, `updated_at`) VALUES
(1, 'Thông báo', 2, 1, NULL, '2024-07-08 13:00:31'),
(2, 'Tin tức', 1, 1, NULL, '2024-07-08 13:00:31'),
(3, 'Tuyển sinh', 3, 1, NULL, '2024-07-08 13:00:27'),
(4, 'Chương trình học tập', 0, 1, NULL, '2024-07-08 13:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `thong_baos`
--

CREATE TABLE `thong_baos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieude` varchar(191) NOT NULL,
  `noidung` text NOT NULL,
  `ghichu` varchar(191) NOT NULL,
  `ngaybatdau` date NOT NULL,
  `ngayhethan` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thong_baos`
--

INSERT INTO `thong_baos` (`id`, `tieude`, `noidung`, `ghichu`, `ngaybatdau`, `ngayhethan`, `created_at`, `updated_at`) VALUES
(1, 'Lịch học kỳ II', '<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch sthi cụ thể.<hr> \n						<hr>', '* Thông báo cập nhật lúc 18h40 ngày 10/01/2019.', '2024-07-08', '2024-07-10', NULL, '2024-07-08 13:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `tin_tucs`
--

CREATE TABLE `tin_tucs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieude` text NOT NULL,
  `mota` text NOT NULL,
  `hinhdaidien` text NOT NULL,
  `noidung` longtext NOT NULL,
  `noibat` tinyint(1) NOT NULL DEFAULT 0,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `id_loaitin` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tin_tucs`
--

INSERT INTO `tin_tucs` (`id`, `tieude`, `mota`, `hinhdaidien`, `noidung`, `noibat`, `luotxem`, `id_loaitin`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'Hội thi “Tìm hiểu Chương trình Giáo dục phổ thông mới cấp Tiểu học”', 'Chương trình Giáo dục phổ thông tổng thể (2017) và Chương trình giáo dục phổ thông các môn học (Ban hành kèm theo Thông tư số 32/2018/TT-BGDĐT ngày 26 tháng 12 năm 2018 của Bộ trưởng Bộ GD&ĐT) đã đặt ra những cơ hội và thách thức cho hoạt động đào tạo ở các trường đại học sư phạm, các trường phổ thông trong cả nước. Trước nhiệm vụ phát triển năng lực sư phạm của giáo viên trong bối cảnh mới, Trường Đại học Sư phạm, Đại học Huế đã khuyến khích các đơn vị tổ chức các hoạt động giúp sinh viên tìm hiểu về Chương trình giáo dục phổ thông mới.', '1556362611TinTuc1.jpg', '  <div>\r\n                                <div id=\"PAGE1\">\r\n                                <div>\r\n                                <p>&nbsp;</p>\r\n                                </div>\r\n                                </div>\r\n                                </div>\r\n                                <div style=\"text-align: center;\"><strong>Hội thi &ldquo;T&igrave;m hiểu Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới cấp Tiểu học&rdquo;</strong></div>\r\n                                <div id=\"PAGE1\">\r\n                                <div>\r\n                                <p>Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng tổng thể (2017) v&agrave; Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng c&aacute;c m&ocirc;n học (Ban h&agrave;nh k&egrave;m theo Th&ocirc;ng tư s&ocirc;́ 32/2018/TT-BGDĐT ng&agrave;y 26 th&aacute;ng 12 năm 2018 của Bộ trưởng Bộ GD&amp;ĐT) đ&atilde; đặt ra những cơ hội v&agrave; th&aacute;ch thức cho hoạt động đ&agrave;o tạo ở c&aacute;c trường đại học sư phạm, c&aacute;c trường phổ th&ocirc;ng trong cả nước. Trước nhiệm vụ ph&aacute;t triển năng lực sư phạm của gi&aacute;o vi&ecirc;n trong bối cảnh mới, Trường Đại học Sư phạm, Đại học Huế đ&atilde; khuyến kh&iacute;ch c&aacute;c đơn vị tổ chức c&aacute;c hoạt động gi&uacute;p sinh vi&ecirc;n t&igrave;m hiểu về Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151646_58377885_2481634478602514_3728594034600443904_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Tr&ecirc;n tinh thần đ&oacute;, Khoa Gi&aacute;o dục Tiểu học - Trường Đại học Sư phạm, Đại học Huế tổ chức Hội thi &ldquo;T&igrave;m hiểu chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới cấp tiểu học&rdquo; diễn ra tối 24/4 tại Giảng đường I với sự tham gia của 14 đội thi đến từ 14 lớp trực thuộc Khoa.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Hội thi nhằm gi&uacute;p &nbsp;sinh vi&ecirc;n tiếp cận Chương tr&igrave;nh GDPT mới, ph&aacute;t triển c&aacute;c năng lực cơ bản đ&aacute;p ứng y&ecirc;u cầu đổi mới gi&aacute;o dục, trong đ&oacute; đặc biệt l&agrave; năng lực ph&acirc;n t&iacute;ch Chương tr&igrave;nh.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151650_58543783_2177721019207161_2010505097842262016_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Sau hai v&ograve;ng thi&nbsp;<em>Khởi động</em>&nbsp;v&agrave;&nbsp;<em>Tăng tốc&nbsp;</em>với c&aacute;c g&oacute;i c&acirc;u hỏi về Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng tổng thể v&agrave; Chương tr&igrave;nh m&ocirc;n học mới ở cấp Tiểu học gắn với c&aacute;c lĩnh vực chuy&ecirc;n m&ocirc;n, Ban Gi&aacute;m khảo chọn ra 5 đội c&oacute; số điểm cao nhất bước v&agrave;o phần thi&nbsp;<em>Về đ&iacute;ch</em>.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Ở v&ograve;ng thi Về đ&iacute;ch, c&aacute;c đội thi lần lượt bốc thăm v&agrave; trả lời c&aacute;c c&acirc;u hỏi li&ecirc;n quan về lĩnh vực: To&aacute;n, Tiếng việt, &Acirc;m nhạc, Tự nhi&ecirc;n - X&atilde; hội,&hellip;&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151640_58374255_420914768489114_1029134598606422016_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>C&aacute;c c&acirc;u hỏi của 3 phần thi gi&uacute;p sinh vi&ecirc;n thể hiện, trải nghiệm những hiểu biết về Chương tr&igrave;nh GDPT mới, đồng thời, ph&aacute;t triển tư duy phản biện, năng lực đ&aacute;nh gi&aacute;, so s&aacute;nh Chương tr&igrave;nh mới với Chương tr&igrave;nh c&aacute;c m&ocirc;n học hiện h&agrave;nh.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Kết quả: Giải Nhất thuộc về lớp GDTH 3D; Giải Nh&igrave; thuộc về lớp GDTH 1A, GDTH 2C v&agrave; GDTH 4D; Giải Ba thuộc về lớp GDTH 4A.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151645_58377544_2378582202208315_3074079566021525504_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Ngo&agrave;i ra, Hội thi th&ecirc;m phần s&ocirc;i nổi khi c&aacute;c cổ động vi&ecirc;n cổ vũ nhiệt t&igrave;nh v&agrave; tham gia trả lời c&acirc;u hỏi d&agrave;nh cho kh&aacute;n giả, g&oacute;p phần khuấy động v&agrave; khơi dậy ở to&agrave;n thể sinh vi&ecirc;n Khoa GDTH kh&ocirc;ng kh&iacute; học tập, chia sẻ về những điểm mới của CT phổ th&ocirc;ng 2018.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Chia sẻ về Hội thi, sinh vi&ecirc;n Nguyễn Thị Anh Thư, lớp GDTH 3D cho biết: &ldquo;Đ&acirc;y l&agrave; một s&acirc;n chơi đầy bổ &iacute;ch, l&iacute; th&uacute;. Ch&uacute;ng em vừa được học những kiến thức mới mẻ, thiết thực th&ocirc;ng qua h&igrave;nh thức game show rất th&uacute; vị. Em nghĩ qua hội thi n&agrave;y, ai cũng l&agrave; người chiến thắng v&igrave; phần thưởng lớn nhất l&agrave; kiến thức &ndash; thứ m&agrave; kh&ocirc;ng chỉ cho c&aacute;c đội chơi m&agrave; c&ograve;n cho cả kh&aacute;n giả&rdquo;.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Sinh vi&ecirc;n Nguyễn Thị Thu L&yacute;, lớp GDTH 1A cũng chia sẻ: &ldquo;Mặc d&ugrave; mới năm 1 th&ocirc;i, nhưng trong tương lai ch&uacute;ng em sẽ l&agrave; những gi&aacute;o vi&ecirc;n phải giảng dạy chương tr&igrave;nh GDPT mới cấp Tiểu học. Hội thi như một bước tiền đề để ch&uacute;ng em tiếp cận với những kiến thức sẽ được học trong thời gian sắp tới. Cuộc thi kh&ocirc;ng hề kh&ocirc; khan m&agrave; lại rất th&uacute; vị, em nghĩ, n&ecirc;n nh&acirc;n rộng m&ocirc; h&igrave;nh chương tr&igrave;nh n&agrave;y cho c&aacute;c khoa ở trong v&agrave; ngo&agrave;i trường để c&aacute;c bạn vừa học - vừa chơi&rdquo;.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Hội thi&nbsp;<em>T&igrave;m hiểu Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới cấp tiểu học</em>&nbsp;của Khoa Gi&aacute;o dục Tiểu học, ĐH ĐHQG TPHCM tạo dấu ấn mạnh mẽ, t&iacute;ch cực đối với sinh vi&ecirc;n, được đ&aacute;nh gi&aacute; l&agrave; hoạt động chuy&ecirc;n m&ocirc;n v&ocirc; c&ugrave;ng bổ &iacute;ch, khởi đầu cho h&agrave;nh tr&igrave;nh tiếp cận v&agrave; triển khai CT gi&aacute;o dục phổ th&ocirc;ng mới trong bối cảnh hiện nay. Hi vọng m&ocirc; h&igrave;nh n&agrave;y sẽ tiếp tục được lan toả, ph&aacute;t triển với quy m&ocirc; lớn hơn v&agrave; mang t&iacute;nh hệ thống hơn.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Một số h&igrave;nh ảnh Hội thi:</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151630_57882338_360058654612308_7522678430609965056_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Nhất cho lớp GDTH 3D.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151633_58114976_875681269445739_6659451611124858880_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Nh&igrave; cho c&aacute;c lớp GDTH 1A, GDTH 2C v&agrave; GDTH 4D.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151636_58373362_2250225738628401_3370164402270502912_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Ba cho lớp GDTH 4A.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151651_58701261_430009187555824_5795088334703296512_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Khuyến kh&iacute;ch cho lớp GDTH 1C.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151653_58825837_432440694181758_6987745820170780672_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151626_57618296_394192784767449_6958118826525327360_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151625_57604345_382850865637401_3499676280633163776_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151647_58378797_443614369781057_6965565728585940992_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151628_57710754_1031673300375223_5558425075369115648_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151638_58373399_641831436254478_4687618385930878976_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151623_58961607_591179584715656_7838982156117344256_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151632_58003875_453796292096911_3629520035413753856_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức v&agrave; c&aacute;c đội thi chụp ảnh lưu niệm.</em></div>\r\n                                </div>\r\n                                </div>\r\n                                </div>', 1, 3, 5, 1, '2019-04-27 10:46:08', '2024-07-05 09:17:46'),
(3, 'THÔNG BÁO Chấm phúc khảo cho thí sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế', 'THÔNG BÁO Chấm phúc khảo cho thí sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế', '1556362721avatar.jpg', '<div style=\"text-align: center;\"><strong>TH&Ocirc;NG B&Aacute;O Chấm ph&uacute;c khảo cho th&iacute; sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế</strong></div>\r\n                        <div id=\"PAGE1\">\r\n                        <div>\r\n                        <p>Căn cứ Quy chế đ&agrave;o tạo tr&igrave;nh độ thạc sỹ của Bộ trưởng Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo hiện h&agrave;nh;</p>\r\n                        <p>Hội đồng Tuyển sinh Sau đại họccủa Đại học Huế sẽ nhận đơn xin chấm ph&uacute;c khảo b&agrave;i thi cho những th&iacute; sinh đ&atilde; dự thi kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế c&oacute; y&ecirc;u cầu.</p>\r\n                        <p>&nbsp;</p>\r\n                        <p>- Thời gian: từ ng&agrave;y&nbsp;<strong>18/4/2019</strong>&nbsp;đến hết ng&agrave;y&nbsp;<strong>02/5/2019</strong>.</p>\r\n                        <p align=\"center\"><em>(Nếu th&iacute; sinh gửi theo đường thư t&iacute;n th&igrave; ng&agrave;y nộp đơn căn cứ theo ng&agrave;y tr&ecirc;n dấu bưu điện)</em></p>\r\n                        <p>- Lệ ph&iacute; chấm ph&uacute;c khảo: 200.000đ/1 m&ocirc;n</p>\r\n                        <p><em>(Hồ sơ hợp lệ nếu đ&atilde; nộp đầy đủ lệ ph&iacute; chấm ph&uacute;c khảo)</em></p>\r\n                        <p>&nbsp;</p>\r\n                        <p>- Địa điểm nhận đơn: Đơn xin chấm ph&uacute;c khảo gửi đến Hội đồng Tuyển sinh Sau đại họcĐại học Huế theo địa chỉ:</p>\r\n                        <p>&nbsp;&nbsp;<strong>Ban Đ&agrave;o tạo - Đại học Huế, số 04 L&ecirc; Lợi - TP Huế&nbsp;</strong><em>(tầng 3).</em></p>\r\n                        <p>&nbsp; Mọi chi tiết xin li&ecirc;n hệ qua số điện thoại&nbsp;<strong>0234.3833578</strong></p>\r\n                        </div>\r\n                        <div style=\"text-align: right;\"><em>TL. CHỦ TỊCH<br />THƯỜNG TRỰC HỘI ĐỒNG<br /><br /><br /><br /><br /><br />QUYỀN TRƯỞNG BAN Đ&Agrave;O TẠO<br />TRẦN TRUNG HỶ</em></div>\r\n                        </div>', 1, 0, 12, 1, '2019-04-27 10:58:41', '2019-04-27 10:58:41'),
(4, 'Thông báo Bảo vệ luận án tiến sĩ cấp cơ sở (Huỳnh Thị Minh Thành)', 'Thực hiện Quyết định số 229/QĐ-ĐHH ngày 05/03/2019 của Giám đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đánh giá luận án Tiến sĩ cấp Đại học Huế về đề tài: Nghiên cứu đặc điểm sinh học của rệp sáp bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) và khả năng khống chế rệp của ong ký sinh (Anagyrus lopezi De Santis, 1964) \r\n                        Chuyên ngành: Động vật học', '1556362865avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Bảo vệ luận &aacute;n tiến sĩ cấp Đại học Huế (Ho&agrave;ng Hữu T&igrave;nh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Thực hiện Quyết định số 229/QĐ-ĐHH ng&agrave;y 05/03/2019 của Gi&aacute;m đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đ&aacute;nh gi&aacute; luận &aacute;n Tiến sĩ cấp Đại học Huế về đề t&agrave;i:&nbsp;<strong><em>Nghi&ecirc;n cứu đặc điểm sinh học của rệp s&aacute;p bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) v&agrave; khả năng khống chế rệp của ong k&yacute; sinh (Anagyrus lopezi De Santis, 1964)</em></strong></p>\r\n                    <p>Chuy&ecirc;n ng&agrave;nh: Động vật học</p>\r\n                    <p>M&atilde; số: 62 42 01 03</p>\r\n                    <p>Cho nghi&ecirc;n cứu sinh:&nbsp;<strong>Ho&agrave;ng Hữu T&igrave;nh</strong></p>\r\n                    <p>Thời gian:&nbsp;&nbsp; &nbsp;<strong>8 giờ 00, ng&agrave;y 17 th&aacute;ng 04&nbsp; năm 2019</strong></p>\r\n                    <p>Địa điểm: Ph&ograve;ng I.1, Đại học Huế, số 4 L&ecirc; Lợi, TP. Huế</p>\r\n                    <p>Tr&acirc;n trọng th&ocirc;ng b&aacute;o v&agrave; k&iacute;nh mời qu&yacute; vị quan t&acirc;m đến dự<strong><em>.</em></strong></p>\r\n                    </div>\r\n                    <div style=\"text-align: right;\"><em>TL. HIỆU TRƯỞNG&nbsp;<br />TRƯỞNG PH&Ograve;NG ĐT SAU ĐẠI HỌC<br /><br /><br />(Đ&atilde; k&yacute;)<br /><br /><br />GS.TS. DƯƠNG TUẤN QUANG</em></div>\r\n                    </div>', 1, 0, 12, 1, '2019-04-27 11:00:03', '2024-07-05 11:11:43'),
(5, 'Thông báo Bảo vệ luận án tiến sĩ cấp Đại học Huế (Hoàng Hữu Tình)', 'Thực hiện Quyết định số 229/QĐ-ĐHH ngày 05/03/2019 của Giám đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đánh giá luận án Tiến sĩ cấp Đại học Huế về đề tài: Nghiên cứu đặc điểm sinh học của rệp sáp bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) và khả năng khống chế rệp của ong ký sinh (Anagyrus lopezi De Santis, 1964) \r\n                        Chuyên ngành: Động vật học', '1556362865avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Bảo vệ luận &aacute;n tiến sĩ cấp Đại học Huế (Ho&agrave;ng Hữu T&igrave;nh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Thực hiện Quyết định số 229/QĐ-ĐHH ng&agrave;y 05/03/2019 của Gi&aacute;m đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đ&aacute;nh gi&aacute; luận &aacute;n Tiến sĩ cấp Đại học Huế về đề t&agrave;i:&nbsp;<strong><em>Nghi&ecirc;n cứu đặc điểm sinh học của rệp s&aacute;p bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) v&agrave; khả năng khống chế rệp của ong k&yacute; sinh (Anagyrus lopezi De Santis, 1964)</em></strong></p>\r\n                    <p>Chuy&ecirc;n ng&agrave;nh: Động vật học</p>\r\n                    <p>M&atilde; số: 62 42 01 03</p>\r\n                    <p>Cho nghi&ecirc;n cứu sinh:&nbsp;<strong>Ho&agrave;ng Hữu T&igrave;nh</strong></p>\r\n                    <p>Thời gian:&nbsp;&nbsp; &nbsp;<strong>8 giờ 00, ng&agrave;y 17 th&aacute;ng 04&nbsp; năm 2019</strong></p>\r\n                    <p>Địa điểm: Ph&ograve;ng I.1, Đại học Huế, số 4 L&ecirc; Lợi, TP. Huế</p>\r\n                    <p>Tr&acirc;n trọng th&ocirc;ng b&aacute;o v&agrave; k&iacute;nh mời qu&yacute; vị quan t&acirc;m đến dự<strong><em>.</em></strong></p>\r\n                    </div>\r\n                    <div style=\"text-align: right;\"><em>TL. HIỆU TRƯỞNG&nbsp;<br />TRƯỞNG PH&Ograve;NG ĐT SAU ĐẠI HỌC<br /><br /><br />(Đ&atilde; k&yacute;)<br /><br /><br />GS.TS. DƯƠNG TUẤN QUANG</em></div>\r\n                    </div>', 1, 0, 12, 1, '2019-04-27 11:01:05', '2024-07-05 11:11:40'),
(6, 'Thông tin luận án tiến sĩ (Trần Nam Sinh)', '1. NCS Trần Nam Sinh - CN: Đại số Và lý thuyết số\r\n\r\n                                Mã số: 62460104  Bảo vệ  lúc ..... giờ....., ngày ..... tháng ...... năm 20….\r\n\r\n                                - Cơ sở đào tạo: Trường Đại học Sư phạm -  ĐHH', '1556362952avatar.jpg', '<div><strong>Th&ocirc;ng tin luận &aacute;n tiến sĩ (Trần Nam Sinh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p><strong>1.&nbsp;NCS&nbsp;Trần Nam Sinh&nbsp;- CN:&nbsp;Đại số V&agrave; l&yacute; thuyết số</strong></p>\r\n                    <p><strong>M&atilde; số:&nbsp;62460104&nbsp; Bảo vệ &nbsp;l&uacute;c ..... giờ....., ng&agrave;y ..... th&aacute;ng ...... năm 20&hellip;.</strong></p>\r\n                    <p><strong>- Cơ sở đ&agrave;o tạo: Trường Đại học Sư phạm - &nbsp;ĐHH</strong></p>\r\n                    <p><strong>- Địa điểm:&nbsp;...........................</strong></p>\r\n                    <p><strong>- T&ecirc;n đề t&agrave;i luận &aacute;n:&nbsp;<em>CHỈ SỐ CH&Iacute;NH QUY CỦA TẬP ĐIỂM B&Eacute;O TRONG KH&Ocirc;NG GIAN XẠ ẢNH</em></strong></p>\r\n                    <p><strong>- To&agrave;n văn luận &aacute;n:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095143_tnsinh-tvla.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>- T&oacute;m tắt nội dung:&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+ Tiếng Việt:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095132_tnsinh-ttla-tv_.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+ Tiếng Anh:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095124_tnsinh_-ttla-ta.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>- Th&ocirc;ng tin những đ&oacute;ng g&oacute;p luận &aacute;n:&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+&nbsp;<a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095117_tn_sinh-dong_gop_la-tv.pdf\" target=\"_blank\" rel=\"noopener\">Tiếng Việt:&nbsp;File đ&iacute;nh k&egrave;m</a>&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+&nbsp;<a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095116_tn_sinh-dong_gop_la-ta.pdf\" target=\"_blank\" rel=\"noopener\">Tiếng Anh:&nbsp;File đ&iacute;nh k&egrave;</a>m</strong></p>\r\n                    <p><strong>- Tr&iacute;ch yếu luận &aacute;n:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095127_tnsinh-trich_yeu_la.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>P/S</strong>: Xin vui l&ograve;ng truy cập v&agrave;o Website:&nbsp;<u>http://www.dhsphue.edu.vn/cd_cmp.aspx?cd=020501&amp;id=0</u>&nbsp;để xem th&ocirc;ng tin cụ thể.</p>\r\n                    </div>\r\n                    <div><em>Ph&ograve;ng Đ&agrave;o tạo Sau đại học</em></div>\r\n                    </div>', 1, 1, 12, 1, '2019-04-27 11:02:32', '2024-07-05 11:11:42'),
(7, 'Đội tuyển Olympic Vật lý xuất sắc đạt 2 Giải Nhất và 5 Giải Ba Cuộc thi Olympic Vật lý sinh viên toàn quốc', 'Đội tuyển Olympic Vật lý Trường Đại học ĐHQG TPHCM xuất sắc đạt Giải Nhì toàn đoàn tại Cuộc thi Olympic Vật lý sinh viên toàn quốc với  02 Giải Nhất (Phần thi thí nghiệm Vật lý) và 05 Giải Ba (Phần thi Giải bài tập vật lý, Trắc nghiệm vật lý).', '1556363043tintuc2.jpg', '<div><strong>Đội tuyển Olympic Vật l&yacute; xuất sắc đạt 2 Giải Nhất v&agrave; 5 Giải Ba Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Đội tuyển Olympic Vật l&yacute; Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">Đại học ĐHQG TPHCM</a>&nbsp;xuất sắc đạt Giải Nh&igrave; to&agrave;n đo&agrave;n tại Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc với &nbsp;02 Giải Nhất (Phần thi th&iacute; nghiệm Vật l&yacute;) v&agrave; 05 Giải Ba (Phần thi Giải b&agrave;i tập vật l&yacute;, Trắc nghiệm vật l&yacute;).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190424162009_1.jpg\" /></div>\r\n                    <div><em>Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường ĐHSP tham gia Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Olympic Vật l&yacute; sinh vi&ecirc;n năm nay diễn ra từ ng&agrave;y 17-20/4/2019 tại Trường Đại học Thủy Lợi &ndash; H&agrave; Nội với tổng số 248 sinh vi&ecirc;n của 42 đội dự thi. Đ&acirc;y l&agrave; hoạt động thường ni&ecirc;n do Bộ GD-ĐT, Li&ecirc;n hiệp c&aacute;c Hội Khoa học v&agrave; Kỹ thuật Việt Nam, Hội Vật l&yacute; Việt Nam tổ chức nhằm g&oacute;p phần th&uacute;c đẩy, n&acirc;ng cao chất lượng dạy v&agrave; học m&ocirc;n Vật l&yacute; tại c&aacute;c trường ĐH, CĐ, Học viện.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Qua đ&oacute;, cuộc thi t&igrave;m kiếm, ph&aacute;t hiện t&agrave;i năng trẻ trong lĩnh vực Vật l&yacute;, đồng thời gi&uacute;p c&aacute;c bạn sinh vi&ecirc;n y&ecirc;u th&iacute;ch m&ocirc;n học n&agrave;y c&oacute; điều kiện tiếp x&uacute;c trao đổi, chia sẻ đam m&ecirc; học tập v&agrave; nghi&ecirc;n cứu.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Olympic vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc l&agrave; kỳ thi kh&oacute;, thu h&uacute;t sinh vi&ecirc;n từ c&aacute;c đơn vị gi&aacute;o dục c&oacute; tiếng, như Trường ĐH B&aacute;ch Khoa H&agrave; Nội, Trường ĐH Khoa học Tự Nhi&ecirc;n &ndash; ĐH Quốc gia H&agrave; Nội, Trường ĐH Sư phạm TP. Hồ Ch&iacute; Minh, ĐH B&aacute;ch Khoa TP. Hồ Ch&iacute; Minh&hellip; v&igrave; thế cuộc đua th&agrave;nh t&iacute;ch kh&ocirc;ng dễ d&agrave;ng.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tuy nhi&ecirc;n, Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường ĐH ĐHQG TPHCM lu&ocirc;n gi&agrave;u th&agrave;nh t&iacute;ch v&agrave; nằm trong tốp đầu, so với c&aacute;c trường sư phạm trong cả nước. Điển h&igrave;nh như tại kỳ thi năm 2004, đội tuyển của Khoa từng gi&agrave;nh giải nhất to&agrave;n đo&agrave;n; nhiều năm đạt giải nh&igrave; to&agrave;n đo&agrave;n (2009, 2010, 2013, 2017, 2018, 2019). Đội tuyển lu&ocirc;n c&oacute; được thứ hạng cao, trong tốp 5, 6 v&agrave; c&oacute; nhiều sinh vi&ecirc;n đạt giải nhất, nh&igrave; c&aacute; nh&acirc;n. Đặc biệt, trong hai năm li&ecirc;n tiếp 2018 v&agrave; 2019, mỗi năm đội c&oacute; 2 Giải Nhất c&aacute; nh&acirc;n phần thi Th&iacute; nghiệm.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Để c&oacute; th&agrave;nh t&iacute;ch như vậy, được sự hỗ trợ, tạo điều kiện của Nh&agrave; trường, Khoa đ&atilde; c&oacute; kế hoạch tuyển chọn v&agrave; &ocirc;n luyện b&agrave;i bản, khoa học. H&agrave;ng năm v&agrave;o khoảng th&aacute;ng 11, 12, Khoa tiến h&agrave;nh tổ chức Kỳ thi Olympic Vật l&yacute; sinh vi&ecirc;n cấp Khoa, nhằm ph&aacute;t hiện c&aacute;c sinh vi&ecirc;n c&oacute; tiềm năng để chọn v&agrave;o đội tuyển v&agrave; bồi dưỡng; đồng thời, cũng l&agrave; cơ hội để c&aacute;c sinh vi&ecirc;n &ocirc;n luyện, n&acirc;ng cao kiến thức chuy&ecirc;n ng&agrave;nh.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Sau khi tuyển chọn được c&aacute;c sinh vi&ecirc;n tốt nhất v&agrave;o đội tuyển, Khoa sẽ ph&acirc;n c&ocirc;ng c&aacute;c giảng vi&ecirc;n c&oacute; năng lực v&agrave; kinh nghiệm để bồi dưỡng, &ocirc;n luyện cho đội tuyển. Mỗi giảng vi&ecirc;n đảm nhận một nội dung &ocirc;n tập, đảm bảo t&iacute;nh chuy&ecirc;n s&acirc;u về kiến thức của mỗi phần thi.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đặc biệt, sinh vi&ecirc;n của Khoa đ&atilde; tham dự v&agrave; đạt giải trong c&aacute;c Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc trước đ&acirc;y đều được đ&aacute;nh gi&aacute; cao về kiến thức chuy&ecirc;n m&ocirc;n v&agrave; c&aacute;c kỹ năng kh&aacute;c. C&aacute;c sinh vi&ecirc;n ra trường đều c&oacute; việc l&agrave;m hoặc theo học c&aacute;c chương tr&igrave;nh sau đại học ở nước ngo&agrave;i. Một số sinh vi&ecirc;n đ&atilde; tr&uacute;ng tuyển v&agrave;o l&agrave;m giảng vi&ecirc;n ở c&aacute;c trường đại học, cao đẳng.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đạt được kết quả tr&ecirc;n l&agrave; nhờ sự quan t&acirc;m của Nh&agrave; trường, sự nỗ lực của giảng vi&ecirc;n sinh vi&ecirc;n; qua đ&oacute;, phản ảnh chất lượng dạy v&agrave; học của Khoa Vật l&yacute; n&oacute;i ri&ecirc;ng v&agrave; Nh&agrave; trường n&oacute;i chung trong thời gian qua; đồng thời, l&agrave; cơ sở để Nh&agrave; trường tiếp tục đẩy mạnh đổi mới, n&acirc;ng cao chất lượng, hiệu quả giảng dạy Vật l&yacute;, đ&aacute;p ứng y&ecirc;u cầu ng&agrave;y c&agrave;ng ph&aacute;t triển của đất nước trong cuộc c&aacute;ch mạng c&ocirc;ng nghiệp lần thứ 4.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Kết quả cụ thể của Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường năm 2019:</p>\r\n                    <p>1.&nbsp;&nbsp;&nbsp;&nbsp; Đặng Hữu Tuấn - Lớp L&yacute; 4B (Giải Nhất phần thi Th&iacute; nghiệm Vật l&yacute;)</p>\r\n                    <p>2.&nbsp;&nbsp;&nbsp;&nbsp; L&ecirc; B&aacute; L&acirc;n - Lớp L&yacute; 3B&nbsp;(Giải Nhất phần thi Th&iacute; nghiệm Vật l&yacute;)&nbsp; &nbsp;</p>\r\n                    <p>3.&nbsp;&nbsp;&nbsp;&nbsp; Huỳnh C&ocirc;ng Quang &ndash; Lớp L&yacute; 2A (Giải Ba phần thi Giải b&agrave;i tập Vật l&yacute;, Giải Ba phần thi Trắc nghiệm Vật l&yacute;)</p>\r\n                    <p>4.&nbsp;&nbsp;&nbsp;&nbsp; Đặng Thị Quy&ecirc;n &ndash; Lớp L&yacute; 4C (Giải Ba phần thi Trắc nghiệm Vật l&yacute;)</p>\r\n                    <p>5.&nbsp;&nbsp;&nbsp;&nbsp; Ho&agrave;ng Đại Nghĩa &ndash; Lớp L&yacute; 3B (Giải Ba phần thi&nbsp;Giải b&agrave;i tập Vật l&yacute;)</p>\r\n                    <p>6.&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;L&ecirc; Gia Bảo Khanh - Lớp L&yacute; 2B&nbsp;(Giải Ba phần thi Trắc nghiệm Vật l&yacute;).</p>\r\n                    </div>\r\n                    <div><em>ĐHSP</em></div>\r\n                    </div>', 1, 0, 6, 1, '2019-04-27 11:04:03', '2019-04-27 11:04:03'),
(8, '203 tân Tiến sĩ, Thạc sĩ nhận bằng tốt nghiệp', 'Sáng 29/3/2019, Trường Đại học Sư phạm, Đại học Huế long trọng tổ chức Lễ tốt nghiệp và trao bằng Tiến sĩ, Thạc sĩ năm 2019.', '1556363186tintuc3.jpg', '<div><strong>203 t&acirc;n Tiến sĩ, Thạc sĩ nhận bằng tốt nghiệp</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>S&aacute;ng 29/3/2019, Trường Đại học Sư phạm, Đại học Huế long trọng tổ chức Lễ tốt nghiệp v&agrave; trao bằng Tiến sĩ, Thạc sĩ năm 2019.</p>\r\n                    <p><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105715_56325263_790144171360454_7170335896514854912_n.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105708_56405436_269870730611436_1213642364963258368_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường trao bằng cho c&aacute;c t&acirc;n Tiến sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Năm nay, Trường c&oacute; 10 nghi&ecirc;n cứu sinh bảo vệ th&agrave;nh c&ocirc;ng luận &aacute;n tiến sĩ, được c&ocirc;ng nhận học vị v&agrave; cấp bằng tiến sĩ thuộc 5 chuy&ecirc;n ng&agrave;nh, trong đ&oacute; nhiều nghi&ecirc;n cứu sinh đ&atilde; c&oacute; c&aacute;c c&ocirc;ng tr&igrave;nh khoa học đăng tải tr&ecirc;n những tạp ch&iacute; quốc tế uy t&iacute;n thuộc hệ thống SCI xếp hạng Q1, Q2 với chỉ số ảnh hưởng cao; 193 học vi&ecirc;n bảo vệ th&agrave;nh c&ocirc;ng luận văn thạc sĩ, được x&eacute;t tốt nghiệp v&agrave; cấp bằng thạc sĩ thuộc 27 chuy&ecirc;n ng&agrave;nh, trong đ&oacute; c&oacute; 3 học vi&ecirc;n đến từ nước bạn L&agrave;o (2 học vi&ecirc;n được nhận học bổng của tỉnh Thừa Thi&ecirc;n Huế, 1 học vi&ecirc;n được nhận học bổng của Trường Đại học Sư phạm, Đại học Huế).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105712_55698512_338113427058001_6334021217552433152_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường (tr&aacute;i ảnh) trao Bằng Tốt nghiệp v&agrave; Giấy khen cho T&acirc;n Tiến sĩ c&oacute; nhiều b&agrave;i b&aacute;o c&ocirc;ng bố quốc tế.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105715_56325263_790144171360454_7170335896514854912_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp v&agrave; Giấy khen cho c&aacute;c thạc sĩ l&agrave; T&acirc;n Thủ khoa ng&agrave;nh.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tại buổi lễ, PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường đ&atilde; gửi lời ch&uacute;c mừng v&agrave; ghi nhận những nỗ lực phấn đấu trong học tập v&agrave; r&egrave;n luyện của c&aacute;c học vi&ecirc;n. Đồng thời, cũng mong c&aacute;c t&acirc;n Tiến sĩ, Thạc sĩ vận dụng những kiến thức đ&atilde; học, kết quả nghi&ecirc;n cứu v&agrave;o thực tiễn c&ocirc;ng việc để ho&agrave;n th&agrave;nh tốt nhiệm vụ được giao, g&oacute;p phần thiết thực v&agrave;o sự ph&aacute;t triển nền gi&aacute;o dục nước nh&agrave;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Nh&acirc;n dịp n&agrave;y, Trường Đại học Sư phạm, Đại học Huế tuy&ecirc;n dương khen thưởng 10 t&acirc;n Thạc sĩ thủ khoa ng&agrave;nh, 1 nghi&ecirc;n cứu sinh c&oacute; nhiều c&ocirc;ng tr&igrave;nh c&ocirc;ng bố quốc tế.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402110545_53529153_267347477536377_2684167612958507008_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Văn Thuận - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">Đại học ĐHQG TPHCM</a>&nbsp;được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo giao nhiệm vụ đ&agrave;o tạo v&agrave; bồi dưỡng sau đại học từ năm 1991. Đ&ecirc;n nay, Trường đ&atilde; đ&agrave;o tạo được 25 kho&aacute; cao học với tr&ecirc;n 5700 học vi&ecirc;n được cấp bằng Thạc sĩ, v&agrave; 68 NCS đ&atilde; bảo vệ th&agrave;nh c&ocirc;ng luận &aacute;n v&agrave; được cấp bằng Tiến sĩ. Hiện nay, Trường đang đ&agrave;o tạo kho&aacute; 26 v&agrave; kh&oacute;a 27 với gần 950 học vi&ecirc;n cao học v&agrave; 55 NCS. Trường đ&atilde; v&agrave; đang hợp t&aacute;c với c&aacute;c trường Đại học tr&ecirc;n thế giới để đ&agrave;o tạo nhiều ng&agrave;nh ở bậc đại học v&agrave; sau đại học như: Đại học Kỹ sư quốc gia Val de Loire; Đại học Virginia-Hoa Kỳ; Trường Đại học Sư phạm Morgridge, Đại học Denver, Hoa Kỳ; Trường Cao đẳng Sư phạm Savannakhet &ndash; L&agrave;o; Đại học Quốc gia L&agrave;o; Đại học Chiao Tung - Đ&agrave;i Loan; Trường ĐH Sư phạm Hokaido, Nhật Bản.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105714_55882177_1963798160397622_2760579766963666944_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đặc biệt, năm 2019, Trường mở mới 1 m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ&nbsp;<em>Hệ thống th&ocirc;ng tin</em>, n&acirc;ng số m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ l&ecirc;n 28 chuy&ecirc;n ng&agrave;nh v&agrave; 12 chuy&ecirc;n ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ tiến sĩ.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105713_55719465_655989801500506_9042285362273058816_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Th&agrave;nh Nh&acirc;n - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Trong thời gian tới, Trường Đại học sư phạm, Đại học Huế tiếp tục n&acirc;ng cao chất lượng đ&agrave;o tạo sau đại học; x&acirc;y dựng đề &aacute;n mở mới c&aacute;c m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ, tiến sĩ đ&aacute;p ứng nhu cầu của x&atilde; hội; tăng cường hỗ trợ c&aacute;c địa phương kh&oacute; khăn trong đ&agrave;o tạo sau đại học thuộc khu vực Nam Bộ v&agrave; T&acirc;y Nguy&ecirc;n; đồng thời tăng cường hợp t&aacute;c quốc tế trong c&ocirc;ng t&aacute;c đ&agrave;o tạo sau đại học.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105710_55549709_427595797975611_7584322021740249088_n.jpg\" /></div>\r\n                    <div><em>Đại diện học vi&ecirc;n tặng hoa ch&uacute;c mừng Nh&agrave; trường nh&acirc;n dịp Lễ Tốt nghiệp v&agrave; Trao bằng Tiến sĩ, Thạc sĩ.</em></div>\r\n                    </div>\r\n                    </div>\r\n                    </div>', 1, 4, 10, 1, '2019-04-27 11:06:26', '2019-04-27 11:06:26'),
(9, 'Thông báo Tuyển sinh Nghiên cứu sinh năm 2019 của Đại học Huế', 'Đại học Huế thông báo tuyển nghiên cứu sinh năm 2019 cho 46 chuyên ngành vào các trường đại học thành viên.', '1556363474avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Tuyển sinh Nghi&ecirc;n cứu sinh năm 2019 của Đại học Huế</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <div>\r\n                    <div>Đại học Huế th&ocirc;ng b&aacute;o tuyển nghi&ecirc;n cứu sinh năm 2019 cho 46 chuy&ecirc;n ng&agrave;nh v&agrave;o c&aacute;c trường đại học th&agrave;nh vi&ecirc;n.</div>\r\n                    <p>Thời gian nhận hồ: Trước ng&agrave;y 15 của c&aacute;c th&aacute;ng chẵn trong năm 2019.</p>\r\n                    <p>Thời gian x&eacute;t tuyển : Trong khoảng thời gian&nbsp;<strong>10&nbsp;</strong>ng&agrave;y t&iacute;nh từ ng&agrave;y nhận hồ sơ, Đại học Huế sẽ phản hồi đến người dự tuyển c&aacute;c th&ocirc;ng tin về t&igrave;nh trạng hồ sơ v&agrave; c&aacute;c y&ecirc;u cầu điều chỉnh, bổ sung nếu hồ sơ chưa đảm bảo y&ecirc;u cầu, hoặc kế hoạch x&eacute;t tuyển đối với những hồ sơ đ&atilde; đảm bảo c&aacute;c y&ecirc;u cầu theo quy định của Hội đồng tuyển sinh.</p>\r\n                    <p>Địa điểm ph&aacute;t mẫu hồ sơ v&agrave; thu nhận hồ sơ dự tuyển: Th&iacute; sinh li&ecirc;n hệ, gửi hoặc nộp trực tiếp hồ sơ đăng k&yacute; dự tuyển cho c&aacute;c đơn vị đ&agrave;o tạo th&agrave;nh vi&ecirc;n của Đại học Huế.</p>\r\n                    <p>Chi tiết tại&nbsp;<strong><a href=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190111160630_tb_tsncs_2019.pdf\" target=\"_blank\" rel=\"noopener\">FILE Đ&Iacute;NH K&Egrave;M</a></strong></p>\r\n                    </div>\r\n                    </div>\r\n                    </div>', 1, 3, 2, 1, '2019-04-27 11:11:14', '2019-04-27 11:11:14'),
(10, '“Làm sạch biển và xây dựng môi trường xanh - sạch - sáng”', 'Ngày 28/4, Trường Đại học Sư phạm, Đại học Huế tổ chức ra quân thực hiện chiến dịch:“Làm sạch biển và xây dựng môi trường xanh - sạch - sáng” nhằm hưởng ứng Ngày Môi trường thế giới (5/6/2019).', '1556997044hinh1.jpg', '<p>\\</p>\r\n                    <div><strong>&ldquo;L&agrave;m sạch biển v&agrave; x&acirc;y dựng m&ocirc;i trường xanh - sạch - s&aacute;ng&rdquo;</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Ng&agrave;y 28/4, Trường Đại học Sư phạm, Đại học Huế tổ chức ra qu&acirc;n thực hiện chiến dịch<strong>:&ldquo;L&agrave;m sạch biển v&agrave; x&acirc;y dựng m&ocirc;i trường xanh - sạch - s&aacute;ng&rdquo;&nbsp;</strong>nhằm hưởng ứng Ng&agrave;y M&ocirc;i trường thế giới (5/6/2019).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tham dự c&oacute;: PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường, B&iacute; th&iacute; Đo&agrave;n Thanh ni&ecirc;n, Chủ tịch Hội sinh vi&ecirc;n, đại diện l&atilde;nh đạo c&aacute;c Ph&ograve;ng chức năng c&ugrave;ng đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường, lực lượng Bộ đội bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế, đo&agrave;n vi&ecirc;n - thanh ni&ecirc;n x&atilde; Vinh Hải.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150008_58805515_365118427458040_7960244656434839552_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường (giữa ảnh) tham gia trồng c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Mở đầu chuỗi hoạt động, đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n đ&atilde; l&agrave;m vệ sinh m&ocirc;i trường, dọn r&aacute;c thải v&agrave; trồng 400 c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải, huyện Ph&uacute; Lộc, tỉnh Thừa Thi&ecirc;n Huế. Tại đ&acirc;y, Trường đ&atilde; đến thăm v&agrave; tặng qu&agrave; cho c&aacute;c hộ gia đ&igrave;nh ch&iacute;nh s&aacute;ch, hộ ngh&egrave;o; thăm v&agrave; l&agrave;m việc với Đồn bi&ecirc;n ph&ograve;ng Vinh Hiền thuộc Bộ đội Bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Song song với đ&oacute;, Trường tặng b&igrave;nh nước sử dụng nhiều lần cho học sinh tiểu học, trung học cơ sở tr&ecirc;n địa bản th&agrave;nh phố Huế; tặng t&uacute;i x&aacute;ch sử dụng nhiều lần cho nh&acirc;n d&acirc;n nhằm tuy&ecirc;n truyền về t&aacute;c hại của t&uacute;i nilon.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150009_59301578_438758306928169_818123529663807488_n.jpg\" /></div>\r\n                    <div><em>Đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường tham gia dọn r&aacute;c.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150007_57427485_999485960260501_5657443085362135040_n.jpg\" /></div>\r\n                    <div><em>Đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n trồng c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Hưởng ứng lời l&ecirc;u gọi của Chủ tịch Tỉnh Thừa Thi&ecirc;n Huế Phan Ngọc Thọ &ldquo;H&atilde;y h&agrave;nh động để Thừa Thi&ecirc;n Huế xanh - sạch - s&aacute;ng&rdquo;, Chủ nhật hằng tuần, đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n tiến h&agrave;nh vệ sinh khu&ocirc;n vi&ecirc;n s&acirc;n trường, ph&ograve;ng học, giảng đường tại cơ sở 1 (34 L&ecirc; Lợi, Tp Huế) v&agrave; cơ sở 2 (đường V&otilde; Văn Kiệt, Tp Huế).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Th&ocirc;ng qua chuỗi hoạt động &yacute; nghĩa đ&oacute; gi&uacute;p n&acirc;ng cao nhận thức v&agrave; tr&aacute;ch nhiệm của đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n v&agrave; cộng đồng đối với c&ocirc;ng t&aacute;c vệ sinh m&ocirc;i trường, giải quyết &ocirc; nhiễm nhựa v&agrave; nilon, thu gom xử l&yacute; chất thải, r&aacute;c thải, vệ sinh nguồn nước, ứng ph&oacute; với biến đổi kh&iacute; hậu, &ocirc; nhiễm kh&ocirc;ng kh&iacute;, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống. Vận động đo&agrave;n vi&ecirc;n sinh vi&ecirc;n tham gia hoạt động vệ sinh m&ocirc;i trường, tuy&ecirc;n truyền cho nh&acirc;n d&acirc;n để x&acirc;y dựng c&aacute;c phong tr&agrave;o vệ sinh m&ocirc;i trường rộng khắp ở khu d&acirc;n cư.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150007_58728074_433368754089220_8351890011053883392_n.jpg\" /></div>\r\n                    <div><em>Bộ đội bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế, đo&agrave;n vi&ecirc;n - thanh ni&ecirc;n x&atilde; Vinh Hải v&agrave; đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường dọn r&aacute;c tại b&atilde;i biến Vinh Hải.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Sau khi tham gia chuỗi hoạt động, sinh vi&ecirc;n Trần Thị Na - lớp Văn 2 chia sẻ: &ldquo;Em hi vọng, với niềm tin v&agrave; nhiệt huyết của tuổi trẻ, ch&uacute;ng em sẽ gi&uacute;p m&ocirc;i trường sống kh&ocirc;ng chỉ sạch h&ocirc;m nay m&agrave; hơn hết sẽ đ&aacute;nh thức được &yacute; thức, tr&aacute;ch nhiệm của người d&acirc;n để bảo vệ m&ocirc;i trường sống &nbsp;ng&agrave;y c&agrave;ng xanh - sạch - s&aacute;ng&rdquo;.</p>\r\n                    </div>\r\n                    <div><em>ĐHSP, ảnh Nguyễn Văn Quang</em></div>\r\n                    </div>\r\n                    <p style=\"text-align: center;\"><br /><br /></p>', 1, 0, 5, 1, '2019-05-04 19:10:44', '2024-07-05 14:10:30');
INSERT INTO `tin_tucs` (`id`, `tieude`, `mota`, `hinhdaidien`, `noidung`, `noibat`, `luotxem`, `id_loaitin`, `id_user`, `created_at`, `updated_at`) VALUES
(11, 'Tưng bừng Hội trại nghiệp vụ Trường Đại học Sư phạm, Đại học Huế', 'Hòa chung không khí tuổi trẻ cả nước chào mừng 88 năm ngày Thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh, 44 năm giải phóng quê hương Thừa Thiên Huế và Tháng thanh niên năm 2019, trong hai ngày 23-24/3/2019, tại Cơ sở 2 đường Võ Văn Kiệt, Trường Đại học Sư phạm, Đại học Huế tổ chức Hội trại nghiệp vụ với chủ đề “Tuổi trẻ Trường Đại học Sư phạm, Đại học Huế tiếp lửa truyền thống, dựng xây tương lai”.', '1556997150hinh2.jpg', '<p><strong>Tưng bừng Hội trại nghiệp vụ Trường Đại học Sư phạm, Đại học Huế</strong></p><p>Hòa chung không khí tuổi trẻ cả nước chào mừng 88 năm ngày Thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh, 44 năm giải phóng quê hương Thừa Thiên Huế và Tháng thanh niên năm 2019, trong hai ngày 23-24/3/2019, tại Cơ sở 2 đường Võ Văn Kiệt, Trường Đại học Sư phạm, Đại học Huế tổ chức Hội trại nghiệp vụ với chủ đề “Tuổi trẻ Trường Đại học Sư phạm, Đại học Huế tiếp lửa truyền thống, dựng xây tương lai”.</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083144_img_0420.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083145_img_0435.jpg\"></p><p><i>Đồng diễn dân vũ với sự tham gia của hàng trăm đoàn viên - sinh viên tạo không khi sôi động của Hội trại.</i></p><p>&nbsp;</p><p>&nbsp;</p><p>Hội trại thu hút đông đảo đoàn viên - sinh viên và học sinh Trường THPT Thuận Hóa tham gia, với nhiều hoạt động ý nghĩa: &nbsp;Hội thi trang trí trại và gian hàng; trò chơi lớn “Tuổi trẻ ĐHQG TPHCM với hành trình giải phóng quê hương”; kéo co nam nữ, dân vũ - vũ khúc thanh niên “Sẻ chia từng khoảnh khắc”; gala văn nghệ Giai điệu tháng 3 và hội thi Nghiệp vụ cán bộ Đoàn (ngày 17/3).</p><p>&nbsp;</p><p>Ở mỗi phần thi thể hiện sự năng động, sáng tạo và tài năng của đoàn viên - sinh viên Nhà trường. Qua đó góp phần rèn luyện kỹ năng mềm, kỹ năng hoạt động Đoàn và các bộ môn hoạt động thanh niên cho đoàn viên - sinh viên và học sinh Trường.</p><p>&nbsp;</p><p>Kết thúc Hội trại, Ban Tổ chức trao Giải toàn đoàn cho các Liên Chi đoàn: Khoa Hóa học – Giải Nhất; &nbsp;Khoa Giáo dục Mầm non và Giáo dục Chính trị - Giải Nhì; Khoa Giáo dục Tiểu học, Khoa Toán học và Trường THPT Thuận Hóa - Giải Ba.</p><p>&nbsp;</p><p>Chi tiết Giải:</p><figure class=\"table\"><table><tbody><tr><td><strong>STT</strong></td><td><strong>Nội dung</strong></td><td><strong>Giải Nhất</strong></td><td><strong>Giải Nhì</strong></td><td><strong>Giải Ba</strong></td></tr><tr><td>1</td><td>Cổng trại</td><td><i>Khoa GDTH</i></td><td><i>Khoa GDCT</i></td><td><i>Khoa Hóa học</i></td></tr><tr><td>2</td><td>Trại chính</td><td><i>Khoa GDCT</i></td><td><i>Khoa Hóa học</i></td><td><i>Khoa Ngữ văn</i></td></tr><tr><td>3</td><td>Gian hàng</td><td><i>Khoa Hóa học</i></td><td><i>Khoa Ngữ văn</i></td><td><i>Khoa GDTH</i></td></tr><tr><td>4</td><td>Dân vũ</td><td><i>Khoa GDTH</i></td><td><i>Khoa Ngữ văn</i></td><td><i>Khoa TLGD</i></td></tr><tr><td>5</td><td>Hóa trang</td><td><i>Khoa GDMN</i></td><td><i>THPT Thuận Hóa</i></td><td><i>Khoa Hóa học</i></td></tr><tr><td>6</td><td>Kéo co nữ</td><td><i>Khoa GDMN</i></td><td><i>THPT Thuận Hóa</i></td><td><i>Khoa GDCT</i></td></tr><tr><td>7</td><td>Trò chơi lớn</td><td><i>Khoa GDMN</i></td><td><i>Khoa TLGD</i></td><td><i>Khoa Sinh học</i></td></tr></tbody></table></figure><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083125_30.jpg\"></p><p><i>PGS.TS. Nguyễn Văn Thuận (phải ảnh) và PGS.TS. Nguyến Đình Luyện (trái ảnh) - Phó Hiệu trưởng Nhà trường trao Giải Nhất, Giải Nhì toàn đoàn cho các Liên Chi đoàn.</i></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083125_31.jpg\"></p><p><i>Đ/c Nguyến Mạnh Quyền - Phó Bí thư Đoàn trường (phải ảnh) trao Giải Ba toàn đoàn cho các Liên Chi đoàn.</i></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083145_img_0449.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083146_img_0454.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083147_img_0472.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083147_img_0474.jpg\"></p><p><i>Dân vũ - vũ khúc thanh niên “Sẻ chia từng khoảnh khắc” thể hiện sự sáng tạo và năng động của học sinh, sinh viên ĐHQG TPHCM.</i></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083141_img_0404.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083139_img_0395.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083140_img_0399.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083142_img_0406.jpg\"></p><p><i>Không gian ngập tràn sắc màu tuổi trẻ với những cổng trại và gian hàng được trang trí bắt mắt.</i></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083115_4.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083114_2.jpg\"></p><p><i>Các Liên Chi đoàn hào hứng tham gia trò chơi kéo co.</i></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083116_6.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083120_19.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083118_13.jpg\"></p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083120_21.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083123_25.jpg\"></p><p><i>Đêm Gala \"Giai điệu tháng 3\" là điểm nhấn của Hội trại khi các tài năng sinh viên được thể hiện qua các tiết mục nhảy hiện đại, đơn ca, tốp ca và trình diễn thời trang.</i></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083131_44.jpg\"></p><p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083130_43.jpg\"></p><p><i>Ngọn lửa thanh niên cháy rực trong đêm lửa trại.</i></p>', 1, 8, 5, 1, '2019-05-04 19:12:30', '2024-07-05 14:10:29'),
(13, 'test update', 'test update', 'budget-c859a4e77f744197b0340b1250fc48d0.png', '<p>test update</p>', 1, 0, 11, 1, '2024-07-05 10:34:55', '2024-07-08 13:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `trang_chus`
--

CREATE TABLE `trang_chus` (
  `id` int(10) UNSIGNED NOT NULL,
  `gioithieu` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trang_chus`
--

INSERT INTO `trang_chus` (`id`, `gioithieu`, `created_at`, `updated_at`) VALUES
(1, '<h2><strong>Giới thiệu cập nhật 2</strong></h2><p>Khoa Tin học Trường&nbsp;<a href=\"http://www.huce.vn/\">Đại học ĐHQG TPHCM</a>&nbsp;được chính thức thành lập vào ngày 15 tháng 12 năm 1999 theo quyết định của Đại Học Huế số 398/QĐ-ĐHH-TCNS ngày 10 tháng 12 năm 1999 mà tiền thân là Bộ môn Tin học được thành lập theo quyết định số 09/QĐ-TC ngày 8 tháng 3 năm 1996 của Ban Giám hiệu trường&nbsp;<a href=\"http://www.huce.vn/\">ĐHSP Huế</a>.</p><p>Trải qua&nbsp;hơn 20 năm xây dựng và phát triển, với nhiệm vụ Đào tạo giáo viên Tin học, đến nay Khoa Tin học đã lớn mạnh về nhiều mặt từ đội ngũ cán bộ&nbsp;giảng dạy&nbsp;đến qui mô đào tạo, nghiên cứu khoa học và chất lượng đào tạo được xã hội đánh giá cao.</p><p>Bước đầu thành lập, Bộ môn Tin học với 8 cán bộ, đến nay, Khoa Tin học có&nbsp;Khoa hiên có 17 giảng viên cơ hữu, 5 giảng viên sinh hoạt chuyên môn ở Khoa, 4 nghiên cứu viên. Với 6 tiến sĩ và 20 thạc sĩ. Năm học này Khoa đã có một NCS bảo vệ thành công luân án Tiến sĩ, một NCV tốt nghiệp Thac sĩ. Giảng viên được đào tạo có hệ thống, có truyền thống nghiêm túc trong giảng dạy và nghiên cứu khoa học; có mối quan hệ,&nbsp;trao đổi chuyên môn với nhiều trung tâm nghiên cứu&nbsp;tin học và trung tâm nghiên cứu giáo dục&nbsp;ở trên toàn quốc.</p><p>Trong những năm gần đây, Khoa Tin học không ngừng nâng cao chất lượng dạy và học để góp phần cung cấp nguồn nhân lực chất lượng cao cho các cơ sở giáo dục và các công ty phần mềm. Với những cố gắng vượt bậc của đội ngũ giảng viên, nhân viên và các sinh viên, khoa Tin học đã có những bước phát triển mạnh mẽ. Khoa luôn xác định và tập trung vào 4 nhân tố chính là&nbsp;<strong>Cơ sở vật chất, chương trình đào tạo, chất lượng đội ngũ và thái độ sinh viên</strong>&nbsp;để nâng cao chất lượng đào tạo và điều chỉnh, xây dựng các giải pháp phát triển.</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc1.jpg\"></p><p>Đội ngũ giảng viên của Khoa tích cực tham gia nghiên cứu khoa học. Khoa đã tổ chức&nbsp;<strong>các hội thảo Quốc tế SoICT 2015 và KSE2017 và Hội thảo Quốc gia 2018</strong>. Trên lĩnh vực hoạt động giao lưu học thuật, sinh viên của khoa cũng đã đạt được&nbsp;<strong>nhiều giải thưởng tại các cuộc thi Olympic sinh viên toàn quốc</strong>.</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/soit.jpg\"></p><p><i><strong>Hội thảo Quốc tế SoICT 2015</strong></i></p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/kse.jpg\"></p><p><i><strong>Hội thảo Quốc tế KSE 2017</strong></i></p><p>&nbsp;</p><p>Các hoạt động văn hóa văn nghệ thể dục thể thao của sinh viên cũng được Khoa quan tâm và sự tham gia nhiệt tình của sinh viên.</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc3.jpg\"></p><p>Năm học vừa qua đội bóng đá nữ sinh viên của khoa đạt giải nhất trong giải bóng đá truyền thống sinh viên Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\">ĐHSP Huế</a>.</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc4.jpg\"></p><p>Đội bóng chuyền cán bộ Khoa đạt giải nhì trong giải bóng chuyền truyền thống Cán bộ viên chức trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\">ĐHSP Huế</a></p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc5.jpg\"></p><p>Đội bóng chuyền nam đạt giải nhì trong giải bóng chuyền sinh viên Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\">ĐHSP Huế</a></p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/bong_chuyen_sv.jpg\"></p><p>Sinh viên của cũng được chú trọng rèn luyện nghiệp vụ sư phạm và các kỹ năng mềm</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc6.jpg\"></p><p><i><strong>Trại Nghiệp vụ 26-03</strong></i></p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc7.jpg\"></p><p><i><strong>Hội thi Nghiệp vụ Sư phạm cấp Khoa</strong></i></p><p>&nbsp;</p><p>Bên cạnh nhiệm vụ học tập sinh viên còn tham gia các hoạt động thiện nguyện (lớp học tình thương Phú cát) và các hoạt động tình nguyện</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinh_thuong.jpg\"></p><p>Sinh viên của Khoa sau khi tốt nghiệp rất nhiều cơ hội về việc làm, ngoài việc làm tại các cơ sở giáo dục còn một nguồn lớn các cơ hội từ các công ty phần mềm. Môn Tin học trở thành một môn học chính trong chương trình giáo dục Phổ thông mới cũng tạo điều kiện thuận lợi về cơ hôi việc làm cho sinh viện của Khoa trong những năm sắp đến.</p><p><img src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/gameloft.jpg\"></p><p>Trong những năm tiêp theo, Khoa phấn đấu là đơn vị đào tạo giáo viên Tin học chất lượng của vùng Duyên Hải miền Trung và cả nước, thành lập 2 nhóm nghiên cứu mạnh để nghiên cứu và chuyển giao công nghệ trong lĩnh vực CNTT. Tiếp tục phát triển đội ngũ có trình độ cao. Năm 2018 Khoa sẽ bắt đầu đào tạo Thạc sĩ chuyên ngành Hệ thống thông tin.</p>', NULL, '2024-07-08 12:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `viewname` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `image` text NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `viewname`, `email`, `email_verified_at`, `password`, `permission`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Huỳnh Văn Thùy', 'huynhvanthuy1997@gmail.com', NULL, '$2y$10$j3AxkmNjzegLtPWuMcCho.ePOg/j65DSH/qBLFSNFOEf04yhsoe.2', 'Admin', 'avatar.jpg', 'DANxlLoTKaAvYcvBvQ72p7TNwDzhOU18KwFH1FODDXstXhtXReGKHAYiX8bN', NULL, NULL),
(2, 'sinhvien', 'Sinh Viên', 'sinhvien@gmail.com', NULL, '$2y$10$KhrcPw.79GtRYnQGyj8n8e.2G9onQ2o3jl.u1DDGCoGEYUjZEB0yC', 'SinhVien', 'avatar.jpg', NULL, NULL, NULL),
(3, 'giangvien', 'Giảng Viên Gugu', 'giangvien@gmail.com', NULL, '$2y$10$nza1bxbZrH55w5nH5UPs1Odukk7Z6lBZEz9iXsA8OuYNmJ8QGQE8q', 'GiangVien', 'avatar.jpg', 'VSEbyP0ZGtS7OXpEPhA9IHmMyXc43dKnbVGEKN3Be0jB8b2kkYGJDgblwdVU', NULL, '2024-07-06 08:58:44'),
(9, 'admin2', 'Nguyễn Admin 2 Nè', 'admin2@gmail.com', NULL, '$2y$10$t5kASe0eGcbyw3yEwSrXyeRex40qxkv1Jk7NycX7OUw.NjfhkqHpq', 'Admin', 'a1.jpg', 'mat5zW1Hel3flba3GbiCxz5lw6MZOhwIlJ8DEuIU2UC1jbdIS0ztSKF5VoaZ', '2024-07-06 08:37:09', '2024-07-08 12:52:01'),
(10, 'vanan', 'Nguyễn Văn An', 'an@gmail.com', NULL, '$2y$10$nFrGvrCLot04YJJEF/.iQuUGi9WRY2RM5fLaFtw5LHEatrsDAN2mS', 'GiangVien', '5.6.png', NULL, '2024-07-06 09:13:06', '2024-07-06 09:13:15'),
(11, 'test', 'Test test', 'test@gmail.com', NULL, '$2y$10$harge10db4YFQQmne/IZauhXMFmuAyx7RyHqpwPzhygjZ2CcjqK8.', 'SinhVien', 'a2.jpg', NULL, '2024-07-08 12:58:44', '2024-07-08 12:58:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binh_luans_id_user_foreign` (`id_user`),
  ADD KEY `binh_luans_id_tintuc_foreign` (`id_tintuc`);

--
-- Indexes for table `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chi_tiet_binh_luans_id_binhluan_foreign` (`id_binhluan`),
  ADD KEY `chi_tiet_binh_luans_id_user_foreign` (`id_user`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_faculty_id_foreign` (`faculty_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hop_thus`
--
ALTER TABLE `hop_thus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lien_kets`
--
ALTER TABLE `lien_kets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loai_tins`
--
ALTER TABLE `loai_tins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loai_tins_id_theloai_foreign` (`id_theloai`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personnel_email_unique` (`email`),
  ADD UNIQUE KEY `personnel_phone_unique` (`phone`),
  ADD KEY `personnel_department_id_foreign` (`department_id`);

--
-- Indexes for table `the_loais`
--
ALTER TABLE `the_loais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thong_baos`
--
ALTER TABLE `thong_baos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tin_tucs_id_loaitin_foreign` (`id_loaitin`),
  ADD KEY `tin_tucs_id_user_foreign` (`id_user`);

--
-- Indexes for table `trang_chus`
--
ALTER TABLE `trang_chus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hop_thus`
--
ALTER TABLE `hop_thus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lien_kets`
--
ALTER TABLE `lien_kets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `loai_tins`
--
ALTER TABLE `loai_tins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `the_loais`
--
ALTER TABLE `the_loais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thong_baos`
--
ALTER TABLE `thong_baos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trang_chus`
--
ALTER TABLE `trang_chus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD CONSTRAINT `binh_luans_id_tintuc_foreign` FOREIGN KEY (`id_tintuc`) REFERENCES `tin_tucs` (`id`),
  ADD CONSTRAINT `binh_luans_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  ADD CONSTRAINT `chi_tiet_binh_luans_id_binhluan_foreign` FOREIGN KEY (`id_binhluan`) REFERENCES `binh_luans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chi_tiet_binh_luans_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loai_tins`
--
ALTER TABLE `loai_tins`
  ADD CONSTRAINT `loai_tins_id_theloai_foreign` FOREIGN KEY (`id_theloai`) REFERENCES `the_loais` (`id`);

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD CONSTRAINT `tin_tucs_id_loaitin_foreign` FOREIGN KEY (`id_loaitin`) REFERENCES `loai_tins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tin_tucs_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
