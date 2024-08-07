-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 22, 2024 at 06:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khoatinhoc_new`
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
(17, '2024-07-08 08:01:04', '2024-07-08 08:01:04', 'comment nuaw ne', 9, 3),
(19, '2024-07-11 16:24:37', '2024-07-11 16:24:37', 'hhgjgjh', 9, 10);

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
  `key` varchar(255) DEFAULT 'default',
  `name` varchar(191) NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `key`, `name`, `faculty_id`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'math', 'Giải tích', 2, 'Giải tích là một nhánh của toán học tập trung vào các khái niệm về giới hạn, đạo hàm, tích phân, và chuỗi. Nó có vai trò quan trọng trong nhiều lĩnh vực của khoa học và kỹ thuật.', 'Attracteur_étrange_de_Lorenz.png', '2024-07-06 13:26:31', '2024-07-21 22:45:38'),
(3, 'math', 'Đại số', 2, 'Đại số là một nhánh cơ bản của toán học, tập trung vào việc nghiên cứu các phép toán và cấu trúc đại số như nhóm, vành, trường, và vector không gian.', 'Logo-Math-CS-cyan-192.png', '2024-07-07 11:24:52', '2024-07-16 07:38:49'),
(4, 'math', 'Bộ môn cơ học', 2, 'abc', 'istockphoto-495853751-612x612.jpg', '2024-07-07 11:25:33', '2024-07-21 17:56:16'),
(6, 'math', 'Xác xuất - Thống kê', 2, 'Mô tả Bộ môn toán tin ứng dụng', 'Logo-Math-CS-cyan-192.png', '2024-07-08 13:02:15', '2024-07-16 09:40:17'),
(7, 'math', 'Tối ưu và Hệ Thống', 2, 'abc', 'Logo-Math-CS-cyan-192.png', '2024-07-11 13:53:42', '2024-07-21 17:56:28'),
(8, 'math', 'Ứng dụng tin học', 2, 'abc', 'Logo-Math-CS-cyan-192.png', '2024-07-11 13:54:15', '2024-07-16 09:40:23'),
(9, 'math', 'Giáo dục toán học', 2, 'abc', 'Logo-Math-CS-cyan-192.png', '2024-07-11 13:54:43', '2024-07-21 17:56:35'),
(10, 'other', 'Văn phòng khoa', 2, 'Văn phòng khoa', 'Logo-Math-CS-cyan-192.png', '2024-07-21 20:33:56', '2024-07-21 20:33:56'),
(11, 'other', 'Phòng máy tính', 2, 'phòng máy tính', 'Logo-Math-CS-cyan-192.png', '2024-07-21 20:34:26', '2024-07-21 20:34:26');

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
(2, 'Khoa Toán Tin học', 'Khoa  Toán - Tin học là khoa chuyên đào tạo các chuyên ngành chất lượng cao cập  nhật', 'what-can-you-do-with-a-computer-science-degree.jpg', '2024-07-06 13:23:52', '2024-07-16 17:15:28'),
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loai_tins`
--

INSERT INTO `loai_tins` (`id`, `tenloaitin`, `id_theloai`, `created_at`, `updated_at`, `parent_id`, `level`, `link`) VALUES
(1, 'Chung', 1, NULL, NULL, NULL, 1, NULL),
(2, 'Trường', 1, NULL, NULL, NULL, 1, NULL),
(3, 'Đoàn - hội', 1, NULL, NULL, NULL, 1, NULL),
(4, 'Khoa', 1, NULL, NULL, NULL, 1, NULL),
(5, 'Chung', 2, NULL, NULL, NULL, 1, NULL),
(6, 'Trường', 2, NULL, NULL, NULL, 1, NULL),
(7, 'Đoàn - hội', 2, NULL, NULL, NULL, 1, NULL),
(8, 'Khoa', 2, NULL, NULL, NULL, 1, NULL),
(9, 'Đại học', 3, NULL, NULL, NULL, 1, NULL),
(10, 'Sau đại học', 3, NULL, '2024-07-05 09:10:20', NULL, 1, NULL),
(11, 'Đại học', 4, NULL, '2024-07-21 15:40:21', NULL, 1, '/department'),
(12, 'Sau đại học', 4, NULL, NULL, NULL, 1, NULL),
(20, 'Cử nhân', 4, '2024-07-15 14:50:57', '2024-07-16 05:29:40', 11, 2, NULL),
(21, 'Toán học', 4, '2024-07-15 14:51:31', '2024-07-16 07:16:18', 20, 3, '/math'),
(22, 'Cử nhân tài năng', 4, '2024-07-15 14:51:56', '2024-07-15 14:51:56', 11, 2, NULL),
(23, 'Khoa học dữ liệu', 4, '2024-07-15 14:52:13', '2024-07-15 14:52:13', 20, 3, NULL),
(25, 'Chuyển hướng con', 4, '2024-07-16 15:43:17', '2024-07-16 15:43:17', 22, 3, NULL),
(26, 'Con của toán học', 4, '2024-07-16 15:44:10', '2024-07-16 15:44:10', 21, 4, '/news'),
(27, 'Đại học', 1, '2024-07-21 15:33:24', '2024-07-21 15:35:11', NULL, 1, '/news'),
(28, 'Cố vấn học tập', 4, '2024-07-21 17:15:09', '2024-07-21 17:25:06', NULL, 1, '/news');

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subjects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`subjects`)),
  `department_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `name`, `subjects`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'Chuyên ngành toán tin ứng dụng', '[{\"id\":973379780218,\"name\":\"Phát triển ứng dụng\",\"description\":\"<ul><li>Phát triển ứng dụng là một trong những hướng tiên tiến nhất trong lĩnh vực công nghệ thông tin. Sinh viên sẽ được trang bị kiến thức vững vàng về lập trình và thiết kế ứng dụng, từ đó có khả năng tạo ra các sản phẩm phần mềm hiệu quả và tiện ích.<br>Kĩ năng đầu ra: HTML, CSS, My SQL, SQL Server, Java, .Net....<br>Các công việc liên quan:<br>Web developer, Font - end, Back-end, React...<br>Lộ trình học:</li><li><figure class=\\\"image\\\"><img style=\\\"aspect-ratio:1069/261;\\\" src=\\\"http://localhost:8000/assets/user/images/about\\\\image.png\\\" width=\\\"1069\\\" height=\\\"261\\\"></figure></li></ul>\",\"categories\":[{\"id\":596343874421,\"name\":\"Lập trình .Net\",\"description\":\"<p><strong>Mã học phần</strong>: MTH10310&nbsp;</p><p>Thuộc khối kiến thức: Chuyên ngành Số tín chỉ: 04 (3LT + 1TH)&nbsp;</p><p>Điều kiện đăng ký học phần: Học phần học trước hoặc tiên quyết: <strong>Lập trình Hướng Đối Tượng.&nbsp;</strong></p><p>Học phần song hành: không. Các yêu cầu về kiến thức, kỹ năng của SV: Lập trình căn bản.</p><p><strong>Mục tiêu</strong> <strong>môn học: </strong>Phát triển kỹ năng lập trình ứng dụng với C# trên môi trường lập trình tích hợp Visual Studio .NET.</p><p>&nbsp;Mô tả môn học Sử dụng môi trường Visual Studio 2005: thiết kế giao diện, hiện thực tác vụ của ứng dụng, tạo các thành phần phần mềm… dựa trên .NET, kiểm tra bẩy lỗi, xữ lý lỗi, và triển khai ứng dụng.</p>\"},{\"id\":501990971961,\"name\":\"Lập trình Java\",\"description\":\"<p><strong>Mã học phần:</strong> MTH10316&nbsp;</p><p><strong>Thuộc khối kiến thức: </strong>Chuyên ngành Số tín chỉ: 03 (2LT + 1TH)&nbsp;</p><p><strong>Điều kiện đăng ký học phần: </strong>Học phần tiên quyết (các học phần SV phải đăng ký học trước và thi đạt): Lập trình hướng đối tượng.&nbsp;</p><p><strong>Các yêu cầu về kiến thức, kỹ năng của SV (nếu có):</strong> Kỹ năng lập trình.&nbsp;</p><p><strong>Mô tả môn học: </strong>Trong học phần này sinh viên sẽ học được kiến thức tổng quan về công nghệ phát triển phần mềm bằng Java. Trong chương 2, sinh viên sẽ học thuần túy về ngôn ngữ lập trình Java như các kiểu dữ liệu, từ khóa, biến, toán tử, cấu trúc điều khiển, vòng lập … tương tự như ngôn ngữ lập trình C. - Chương 3, sẽ giới thiệu lại các khái niệm và cách tạo ra lớp (cả lớp nội, lớp trừu tượng), đối tượng và các đặc tính trong lập trình hướng đối tượng như tính kế thừa, tính đa hình. Đặt biệt giới thiệu một khái niệm về lập trình “giao diện - interface” để giải quyết vấn đề kế thừa bội (rắc rối gặp phải khi dùng ngôn ngữ C/C++ để lập trình hướng đối tượng). Bên cạnh đó sẽ giới thiệu một số lớp có sẵn được cung cấp bởi Sun. - Chương 4, giới thiệu về cơ chế quản lý lỗi và thu gom rác trong Java. Sinh viên sẽ được học về khái niệm “biệt lệ - exception”, tạo biệt lệ và cách sử dụng chúng trong lập trình. Hiểu rõ cơ chế “try - catch - finally” và “ném – throws” lỗi. - Chương 5, giới thiệu về cách làm việc với các dòng – stream dữ liệu. Sinh viên sẽ tìm hiểu về cách làm việc với các dòng nhập xuất ký tự, nhị phân được cung cấp trong gói java.io. Tìm hiểu về lớp System và làm việc với các dòng nhập xuất chuẩn. - Chương 6,7,8 giới thiệu về các tao dựng giao diện sử dụng bằng đồ họa được cung cấp trong bộ thư viện AWT. Sinh viên sẽ được học về cách sử lý các sự kiện xảy ra trên chuột, bàn phím để cho phép người dùng có thể điều khiển các chức năng trên giao diện phần mềm. - Chương 9, giới thiệu về khái niệm luồng, các lập trình đa luồng nói chung và trong Java nói riêng. Sinh viên sẽ có kỹ năng làm việc với luồng – Thread trong Java như thiết lập trạng thái, độ ưu tiên và đồ bộ dữ liệu giữa các luồng. Vấn đề Deadlock, cơ chế Chờnhận biết.&nbsp;</p><p><strong>Mục tiêu môn học</strong> Sinh viên sẽ có được các kiến thức và kỹ năng cơ bản đến nâng cao về lập trình Java bao gồm: lập trình cơ bản, lập trình hướng đối tượng, lập trình giao diện. Từ đó sinh viên có thể tìm hiểu chuyên sâu hơn về công nghệ J2EE như lập trình ứng dụng cho môi trường mạng, web, lập trình với CSDL, lập trình phân tán … Đây là những kiến thức cần thiết để sinh viên có thể trở thành chuyên gia lập trình về công nghệ J2EE trong tương lai.</p>\"},{\"id\":499026602841,\"name\":\"Cơ sở dữ liệu\",\"description\":\"<p><strong>Mã môn học:</strong> MTH10344</p><p><strong>&nbsp;Thuộc khối kiến thức:</strong> Chuyên ngành Số tín chỉ: 04(3LT+1TH)</p><p><strong>&nbsp;Điều kiện đăng ký học phần:</strong> Học phần tiên quyết: Cơ sở dữ liệu</p><p>Học phần học trước: Học phần song hành:&nbsp;</p><p>Các yêu cầu về kiến thức, kỹ năng của SV: lập trình&nbsp;</p><p><strong>Nội dung môn học:</strong> - Trình bày ngắn gọn vai trò, vị trí học phần/môn học, kiến thức sẽ trang bị cho sinh viên, quan hệ với các học phần/môn học khác trong chương trình đào tạo) - Các phương pháp thống kê trong nhận dạng mẫu. - Ước lượng thông số. - Học có giám sát. - Học không có giám sát Mục tiêu môn học: Giúp sinh viên tiếp cận các kiến thức về cơ sở dữ liệu, hệ quản trị cơ sở dữ liệu: các thành phần của hệ quản trị cơ sở dữ liệu SQL Server và chức năng của chúng, các cơ chế quản lý truy xuất đồng thời, an toàn và khôi phục dữ liệu sau sự cố, phân quyền và bảo mật.</p>\"},{\"id\":883701629167,\"name\":\"Hệ QT CSDL\",\"description\":\"<p>Mã môn học: MTH10344&nbsp;</p><p>Thuộc khối kiến thức: Chuyên ngành Số tín chỉ: 04(3LT+1TH)</p><p>Điều kiện đăng ký học phần: Học phần tiên quyết: Cơ sở dữ liệu&nbsp;</p><p>Học phần học trước: Học phần song hành: Các yêu cầu về kiến thức, kỹ năng của SV: lập trình</p><p><strong>Nội dung môn học:</strong> - Trình bày ngắn gọn vai trò, vị trí học phần/môn học, kiến thức sẽ trang bị cho sinh viên, quan hệ với các học phần/môn học khác trong chương trình đào tạo) - Các phương pháp thống kê trong nhận dạng mẫu. - Ước lượng thông số. - Học có giám sát. - Học không có giám sát <strong>Mục tiêu môn học:</strong> Giúp sinh viên tiếp cận các kiến thức về cơ sở dữ liệu, hệ quản trị cơ sở dữ liệu: các thành phần của hệ quản trị cơ sở dữ liệu SQL Server và chức năng của chúng, các cơ chế quản lý truy xuất đồng thời, an toàn và khôi phục dữ liệu sau sự cố, phân quyền và bảo mật.</p>\"},{\"id\":363352841389,\"name\":\"PTTK HTTT\",\"description\":\"<p><strong>Mã học phần: MTH10315&nbsp;</strong></p><p><strong>Thuộc khối kiến thức</strong>: Chuyên ngành Số tín chỉ: 04 (3LT + 1TH)&nbsp;</p><p>Điều kiện đăng ký học phần: Học phần học trước hoặc tiên quyết: Cơ sở dữ liệu, Lập trình hướng đối tượng.&nbsp;</p><p>Học phần song hành: không.&nbsp;</p><p>Các yêu cầu về kiến thức, kỹ năng của SV: phương pháp luận hướng đối tượng, thiết kế cơ sở dữ liệu.</p><p>&nbsp;<strong>Mô tả môn học:</strong> - Các khái niệm cơ bản về hệ thống. - Phương pháp khảo sát hiện trạng và tìm hiểu nhu cầu. - Phương pháp phân tích có cấu trúc (SA). - Mô hình dữ liệu thực thể liên kết, mô hình dữ liệu quan hệ. - Phương pháp SART. - Phương pháp SD.&nbsp;</p><p><strong>Mục tiêu môn học:</strong> Giới thiệu cho sinh viên các phương pháp phân tích và thiết kế kinh điển sử dụng trong việc phân tích chức năng, phân tích dữ liệu, phân tích động thái và thiết kế hệ thống.</p>\"}]},{\"id\":993419102369,\"name\":\"Lập trình ứng dụng mạng\",\"description\":\"<p>Lập trình ứng dụng mạng là một trong những hướng tiên tiến nhất trong lĩnh vực công nghệ thông tin. Sinh viên sẽ được trang bị kiến thức vững vàng về lập trình và thiết kế ứng dụng, từ đó có khả năng tạo ra các sản phẩm phần mềm hiệu quả và tiện ích.<br>Kĩ năng đầu ra: HTML, CSS, My SQL, SQL Server, Java, .Net....<br>Các công việc liên quan:<br>Web developer, Font - end, Back-end, React...<br>Syllabus:</p>\",\"categories\":[]},{\"id\":512392753171,\"name\":\"tên hướng cập nhật\",\"description\":\"<p>nội dung hương phát triển nè</p>\",\"categories\":[{\"id\":404696837522,\"name\":\"môn số 1\",\"description\":\"<p>học gì ở môn này nè&nbsp;</p>\"}]}]', 8, '2024-07-16 08:30:47', '2024-07-19 07:06:29'),
(3, 'Chuyên ngành giải tích', '[{\"id\":930892375248,\"name\":\"Vi tích phân A1\",\"description\":\"<p>Vi tích phân A1 mô tả</p>\"},{\"id\":619761292705,\"name\":\"Vi tích phân A2\",\"description\":\"<p>mô tả Vi tích phân A2</p>\"}]', 2, '2024-07-16 09:43:31', '2024-07-16 09:43:31'),
(4, 'Chuyên ngành giải tích số', '[{\"id\":849997477096,\"name\":\"Môn Chuyên ngành giải tích số 1\",\"description\":\"<p>mô tả Môn Chuyên ngành giải tích số 1</p>\"}]', 2, '2024-07-16 09:44:19', '2024-07-16 09:44:19'),
(5, 'Chuyên ngành đại số', '[{\"id\":354107878262,\"name\":\"Đại số tuyến tính\",\"description\":\"<p>mô tả Đại số tuyến tính</p>\"},{\"id\":123193893653,\"name\":\"Đại số tuyến tính 2 \",\"description\":\"<p>upload image</p><figure class=\\\"image\\\"><img style=\\\"aspect-ratio:178/168;\\\" src=\\\"http://localhost:8000/assets/user/images/about\\\\download.jfif\\\" width=\\\"178\\\" height=\\\"168\\\"></figure>\"}]', 3, '2024-07-16 09:44:42', '2024-07-16 15:40:24'),
(6, 'Chuyên ngành xác xuất thống kê', '[{\"id\":780975020131,\"name\":\"xác xuất thống kê 1\",\"description\":\"<p>mô tả xác xuất thống kê</p><figure class=\\\"image\\\"><img style=\\\"aspect-ratio:178/168;\\\" src=\\\"http://localhost:8000/assets/user/images/about\\\\download.jfif\\\" width=\\\"178\\\" height=\\\"168\\\"></figure>\",\"categories\":[{\"id\":741094787329,\"name\":\"hihi\",\"description\":\"<p>hello hihi</p>\"}]}]', 6, '2024-07-16 15:41:05', '2024-07-18 12:28:23'),
(7, 'Phương Pháp Toán Tin Học', '[{\"id\":233923345785,\"name\":\"Xử lý ảnh & Nhận dạng\",\"description\":\"<p>Nghiên cứu và phát triển các phương pháp toán học và thuật toán xử<br>lý ảnh số và nhận dạng mẫu, với ứng dụng rộng rãi từ y tế đến an<br>ninh. Ngành học này là chìa khóa cho sự tiến bộ trong công nghệ<br>nhận dạng.</p><figure class=\\\"image\\\"><img style=\\\"aspect-ratio:1730/372;\\\" src=\\\"http://localhost:8000/assets/user/images/about/Screenshot 2024-07-21 at 21.52.11.png\\\" width=\\\"1730\\\" height=\\\"372\\\"></figure>\",\"categories\":[{\"id\":947416266654,\"name\":\"Cấu trúc dữ liệu và giải thuật\",\"description\":\"<p>Mã môn học: MTH10405<br>Số tín chỉ: 04 (3LT + 1TH)<br>Thuộc khối kiến thức: Đại cương<br>Các môn học tiên quyết: Nhập môn lập trình<br>Các yêu cầu đối với môn học (nếu có): lập trình visual C<br>Số tiết đối với các hoạt động:<br>- Nghe giảng lý thuyết: 45 tiết<br>- Làm bài tập trên lớp: 10 tiết Thực hành, thực tập (ở PTN, nhà máy, thực tập thực<br>tế...): 30 tiết<br>- Thảo luận: 15 tiết<br>- Tự học: 30 tiết<br>- Khác: 5 tiết<br><strong>Mục tiêu của môn học</strong><br>Mục tiêu chung: Trình bày một số kiến thức cơ bản của cấu trúc dữ liệu về thuật giải,<br>cách trừu tượng hóa dữ liệu theo mục đích bài toán của mình. Hai phương pháp tìm<br>kiếm cơ bản và mười một thuật toán sắp xếp được trình bày bày trong phần thứ hai.<br>Chương ba và bốn sẽ trình bày cấu trúc dữ liệu động cơ bản.<br>Mục tiêu cụ thể/ chuẩn đầu ra môn học:<br>- Kiến thức: Nắm vững thuật giải, các phương pháp tìm kiếm, sắp xếp và cấu trúc dữ<br>liệu động<br>- Kỹ năng: phân tích thuật giải, trừu tượng hóa dữ liệu, cài đặt thuật toán<br>- Thái độ, chuyên cần: có thái độ, quan điểm và nhận thức đúng đắn về môn học<br><strong>Mô tả môn học:</strong><br>Tổng quan thuật giải, phân tích thuật giải và trừu tượng hóa dữ liệu. Các phương pháp tìm kiếm<br>và sắp xếp trên mảng.Và cấu trúc dữ liệu động cơ bản: danh sách liên kết đơn và đôi, cây nhị<br>phân tìm kiếm.</p><p>&nbsp;</p><p><strong>Tài liệu học tập</strong><br>1. Mark Allen Weiss, Data Structures and Algorithm Analysis in C, 1997<br>2. Trần Hạnh Nhi - Dương Anh Đức, Nhập môn cấu trúc dữ liệu và giải thuật, 2003<br>3. Christopher J Van Wyk, Data structures and C programs, 1990</p>\"},{\"id\":601087151626,\"name\":\"Lập trình hướng đối tượng\",\"description\":\"<p>Mã học phần: MTH10407<br>Thuộc khối kiến thức: Cơ sở ngành<br>Số tín chỉ: 04 (3LT + 1TH)<br>Điều kiện đăng ký học phần:<br>- Học phần tiên quyết: Không<br>- Học phần học trước: Cấu trúc dữ liệu và thuật giải.<br>- Học phần song hành:<br>- Các yêu cầu về kiến thức, kỹ năng của SV: Lập trình.<br><strong>Mục tiêu môn học</strong><br>Giới thiệu cho sinh viên các nguyên lý cơ bản của phương pháp luận hướng đối tượng<br>và các kỹ thuật lập trình hướng đối tượng làm cơ sở cho việc xây dựng các ứng dụng<br>sau này.<br><strong>Mô tả môn học:</strong><br>- Các nguyên lý của phương pháp luận hướng đối tượng.<br>- Các nguyên tắc xây dựng lớp đối tượng, cách nhận diện dữ liệu và thao tác, thiết lập quan hệ<br>giữa các lớp, đặc biệt là quan hệ kế thừa và tính đa hình.<br>- Thiết kế, xây dựng lớp, định nghĩa thao tác và phép toán trong C++.<br>- Cài đặt cụ thể quan hệ giữa các lớp, quan hệ kế thừa, đa hình trong C++.</p><p>&nbsp;</p><p><strong>Tài liệu học tập</strong><br>[1] Bjarne Stroustrup, The C++ programming language, 3rd Edition, AT&amp;T, 1997.<br>[2] James O. Coplien, Advance C++ Programming Styles and Idioms, Addison-Wesley<br>Longman, 1991.<br>[3] Scott Robert Ladd, C++ Kỹ Thuật và Ứng Dụng, NXB Khoa Học Kỹ Thuật, 1992.<br>[4] J Rumbaugh, M Blaha, W Premerlani, F Eddy, W Lorensen, Object-Oriented<br>Modeling and Design, Prencetice Hall, 1991.<br>Phần mềm hay công cụ hỗ trợ thực hành<br>1. Microsoft Visual studio, phiên bản 6.0 trở lên, <a href=\\\"http://www.microsoft.com/\\\">www.microsoft.com</a><br>2. MSDN, thông tin kỹ thuật, địa chỉ <a href=\\\"http://www.microsoft.com/\\\">www.microsoft.com</a></p>\"}]}]', 8, '2024-07-21 14:54:04', '2024-07-21 14:54:04'),
(8, 'Tài chính định lượng', '[{\"id\":708577249343,\"name\":\"dsadhsjad\",\"description\":\"<p>kasudhsakdh</p>\",\"categories\":[{\"id\":744481340636,\"name\":\"kfjhqwlfuhwlfndslkfj\",\"description\":\"<p>kjfbaklfhdsailf</p><p>ậhbfkjdsahgf</p><p>akdfgasjfghu</p>\"}]}]', 4, '2024-07-21 15:46:08', '2024-07-21 15:46:08');

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
(14, '2024_07_06_193946_create_table_personnel', 2),
(15, '2024_07_15_210117_add_column_table_loai_tins', 3),
(16, '2024_07_16_121336_add_links_to_users_table', 4),
(18, '2024_07_16_132452_add_key_to_departments_table', 5),
(19, '2024_07_16_133021_create_majors_table', 6);

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
  `description` longtext DEFAULT NULL,
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
(9, 'Hải', 'Ông Thanh', 'othai@hcmus.edu.vn', '0123456799', NULL, '1999-01-01', 'Phó trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:14:49', '2024-07-21 18:14:49'),
(10, 'Hà', 'Lý Kim', 'lkha@hcmus.edu.vn', '0696692938', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 2, 'Prof', 'TS', 'male', '2024-07-21 18:46:55', '2024-07-21 18:46:55'),
(11, 'Mỹ Duyên', 'Phan Thị', 'ptmduyen@hcmus.edu.vn', '0246840159', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'female', '2024-07-21 18:48:55', '2024-07-21 18:48:55'),
(12, 'Hạ', 'Lê Ánh', 'laha@hcmus.edu.vn', '0252234029', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:49:49', '2024-07-21 18:49:49'),
(13, 'Huy', 'Nguyễn Vũ', 'nvhuy@hcmus.edu.vn', '0320027860', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'Th.S', 'male', '2024-07-21 18:50:47', '2024-07-21 18:50:47'),
(14, 'Hưng', 'Lê Đức', 'ledhung@hcmus.edu.vn', '0849343269', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:51:45', '2024-07-21 18:51:45'),
(15, 'Khoa', 'Nguyễn Đăng', 'ndkhoa@hcmus.edu.vn', '0425897648', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:52:33', '2024-07-21 18:52:33'),
(16, 'Khiếu', 'Trần Thị', 'ttkhieu@hcmus.edu.vn', '0548466515', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:53:27', '2024-07-21 18:53:27'),
(17, 'Trọng Thanh', 'Bùi Lê', 'bltthanh@hcmus.edu.vn', '0748511778', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'PGS.TS', 'male', '2024-07-21 18:54:23', '2024-07-21 18:54:23'),
(18, 'Hoài Thương', 'Nguyễn Thị', 'ngththuong@hcmus.edu.vn', '0502756073', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'female', '2024-07-21 18:55:05', '2024-07-21 18:55:05'),
(19, 'Vũ', 'Huỳnh Quang', 'hqvu@hcmus.edu.vn', '0220812987', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 2, NULL, 'TS', 'male', '2024-07-21 18:55:54', '2024-07-21 18:55:54'),
(20, 'Biên', 'Mai Hoàng', 'mhbien@hcmus.edu.vn', '0278406350', NULL, '1999-01-01', 'Trưởng bộ môn - Trưởng khoa', NULL, 'person.1024x1024.png', 0, 3, NULL, 'PGS.TS', 'male', '2024-07-21 18:57:08', '2024-07-21 18:57:08'),
(21, 'Luyện', 'Lê Văn', 'lvluyen@hcmus.edu.vn', '0369778165', NULL, '1999-01-01', 'Phó trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 18:58:04', '2024-07-21 18:58:04'),
(22, 'Đèo', 'Trịnh Thanh', 'ttdeo@hcmus.edu.vn', '0112272507', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 18:58:51', '2024-07-21 18:58:51'),
(23, 'Hải', 'Bùi Xuân', 'bxhai@hcmus.edu.vn', '0483824407', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, 'Professor', 'TS', 'male', '2024-07-21 18:59:40', '2024-07-21 18:59:40'),
(24, 'Hợp', 'Lê Văn', 'lvhop@hcmus.edu.vn', '0540099793', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 19:00:58', '2024-07-21 19:00:58'),
(25, 'Nhân', 'Phạm Thế', 'ptnhan@hcmus.edu.vn', '0332567453', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'Th.S', 'male', '2024-07-21 19:01:39', '2024-07-21 19:01:39'),
(26, 'Trí Nhật', 'Nguyễn Hữu', 'nhtnhat@hcmus.edu.vn', '0788547752', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 19:02:32', '2024-07-21 19:02:32'),
(27, 'Ngọc', 'Nguyễn Kim', 'nkngoc@hcmus.edu.vn', '0783167058', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'female', '2024-07-21 19:47:46', '2024-07-21 19:47:46'),
(28, 'Thi', 'Nguyễn Anh', 'nathi@hcmus.edu.vn', '0539347731', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'female', '2024-07-21 19:48:28', '2024-07-21 19:48:28'),
(29, 'Thìn (A)', 'Nguyễn Văn', 'ngvthin@hcmus.edu.vn', '0612667361', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 19:49:10', '2024-07-21 19:49:10'),
(30, 'Tuấn', 'Bùi Anh', 'batuan@hcmus.edu.vn', '0445464949', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 19:50:01', '2024-07-21 19:50:01'),
(31, 'Tùng', 'Nguyễn Khánh', 'nktung@hcmus.edu.vn', '0100987783', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 3, NULL, 'TS', 'male', '2024-07-21 19:50:50', '2024-07-21 19:50:50'),
(32, 'Huy Cường', 'Vũ Đỗ', 'vdhcuong@hcmus.edu.vn', '0455583864', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 4, NULL, 'TS', 'male', '2024-07-21 19:52:18', '2024-07-21 19:52:18'),
(33, 'Chánh', 'Lê Văn', 'lvchanh@hcmus.edu.vn', '0510848517', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 4, NULL, 'Th.S', 'male', '2024-07-21 19:52:55', '2024-07-21 19:52:55'),
(34, 'Thắng', 'Bùi Xuân', 'bxthang@hcmus.edu.vn', '0453279574', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 4, NULL, 'TS', 'male', '2024-07-21 19:53:43', '2024-07-21 19:53:43'),
(35, 'Yến Ngọc', 'Nguyễn Thị', 'ntyngoc@hcmus.edu.vn', '0611537950', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 4, NULL, 'TS', 'female', '2024-07-21 19:54:20', '2024-07-21 19:54:20'),
(36, 'Trọng', 'Đặng Đức', 'ddtrong@hcmus.edu.vn', '0834366991', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 6, 'Professor', 'TS', 'male', '2024-07-21 19:56:17', '2024-07-21 19:56:17'),
(37, 'Mộng Ngọc', 'Nguyễn Thị', 'ngtmngoc@hcmus.edu.vn', '0424029878', NULL, '1999-01-01', 'Phó trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 6, NULL, 'TS', 'female', '2024-07-21 19:57:16', '2024-07-21 19:57:16'),
(38, 'Hà', 'Hoàng Văn', 'hvha@hcmus.edu.vn', '0369838365', NULL, '1999-01-01', 'Phó trưởng khoa', NULL, 'Hoàng Văn Hà.png', 1, 6, NULL, 'TS', 'male', '2024-07-21 19:58:02', '2024-07-21 21:16:16'),
(39, 'Hiên', 'Nguyễn Thị', 'nthien@hcmus.edu.vn', '0448818819', NULL, '1999-01-01', 'Giảng viên', NULL, 'Nguyễn Thị Hiên.png', 1231321, 6, NULL, 'Th.S', 'female', '2024-07-21 19:59:08', '2024-07-21 21:02:34'),
(40, 'Đạt', 'Nguyễn Tiến', 'ndat@hcmus.edu.vn', '0653541364', NULL, '1999-01-01', 'Giảng viên', NULL, 'Nguyễn Tiến Đạt.JPG', 0, 6, NULL, 'TS', 'male', '2024-07-21 20:00:01', '2024-07-21 20:44:46'),
(41, 'Khánh', 'Tô Đức', 'tdkhanh@hcmus.edu.vn', '0553809413', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'TS', 'male', '2024-07-21 20:00:58', '2024-07-21 20:00:58'),
(42, 'Xuân Mai', 'Lê Thị', 'ltxmai@hcmus.edu.vn', '0820305009', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'TS', 'female', '2024-07-21 20:01:44', '2024-07-21 20:01:44'),
(43, 'Hồng Nhung', 'Nguyễn Thị', 'nthnhung@hcmus.edu.vn', '0823920022', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'Th.S', 'female', '2024-07-21 20:02:23', '2024-07-21 20:02:23'),
(44, 'Thìn (B)', 'Nguyễn Văn', 'nvthin@hcmus.edu.vn', '0816204741', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'Th.S', 'male', '2024-07-21 20:03:00', '2024-07-21 20:03:00'),
(45, 'Thanh', 'Đinh Ngọc', 'dnthanh@hcmus.edu.vn', '0626291086', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'PGS.TS', 'male', '2024-07-21 20:08:26', '2024-07-21 20:08:26'),
(46, 'Toàn', 'Nguyễn Hữu', 'nhtoan@hcmus.edu.vn', '0969702791', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'Th.S', 'male', '2024-07-21 20:13:00', '2024-07-21 20:13:00'),
(47, 'Phương', 'Phan Thị', 'phtphuong@hcmus.edu.vn', '0556064830', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 6, NULL, 'Th.S', 'female', '2024-07-21 20:13:51', '2024-07-21 20:13:51'),
(48, 'Hoàng Anh', 'Nguyễn Lê', 'nlhanh@hcmus.edu.vn', '0821163217', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 7, NULL, 'PGS.TS', 'male', '2024-07-21 20:14:42', '2024-07-21 20:14:42'),
(49, 'Thuỳ', 'Nguyễn Văn', 'nvthuy@hcmus.edu.vn', '0485679348', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 7, NULL, 'Th.S', 'female', '2024-07-21 20:15:24', '2024-07-21 20:15:24'),
(50, 'Thục', 'Cao Nghi', 'cnthuc@hcmus.edu.vn', '0777172288', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 7, NULL, 'Th.S', 'female', '2024-07-21 20:16:00', '2024-07-21 20:16:00'),
(51, 'Trọng Long', 'Võ Sĩ', 'vstlong@hcmus.edu.vn', '0969806205', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 7, NULL, 'TS', 'male', '2024-07-21 20:16:40', '2024-07-21 20:16:40'),
(52, 'Trường Giang', 'Nguyễn Mạnh', 'nmtgiang@hcmus.edu.vn', '0523657706', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 7, NULL, 'Th.S', 'male', '2024-07-21 20:17:22', '2024-07-21 20:17:22'),
(53, 'Bình', 'Nguyễn Thanh', 'ngtbinh@hcmus.edu.vn', '0559130917', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'Nguyễn Thanh Bình.jpg', 0, 8, NULL, 'PGS.TS', 'male', '2024-07-21 20:18:14', '2024-07-21 20:42:54'),
(54, 'Thảo', 'Hà Văn', 'hvthao@hcmus.edu.vn', '0199814278', NULL, '1999-01-01', 'Phó trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'male', '2024-07-21 20:19:10', '2024-07-21 20:19:10'),
(55, 'Tuấn', 'Trần Anh', 'tratuan@hcmus.edu.vn', '0330771773', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'TS', 'male', '2024-07-21 20:19:45', '2024-07-21 20:19:45'),
(56, 'Tuyết Nhung', 'Lê Thị', 'lttnhung@hcmus.edu.vn', '0933893084', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'female', '2024-07-21 20:20:30', '2024-07-21 20:20:30'),
(57, 'Bình', 'Lý Như', 'lnbinh@hcmus.edu.vn', '0758658473', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'female', '2024-07-21 20:21:29', '2024-07-21 20:21:29'),
(58, 'Cẩm Hải', 'Võ Đức', 'vdchai@hcmus.edu.vn', '0764213213', NULL, '1999-01-01', 'Phó trưởng khoa', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'male', '2024-07-21 20:22:50', '2024-07-21 20:22:50'),
(59, 'Lương', 'Nguyễn Hiền', 'nhluong@hcmus.edu.vn', '0957125830', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'male', '2024-07-21 20:23:48', '2024-07-21 20:23:48'),
(60, 'Mẫn', 'Ngô Minh', 'nmman@hcmus.edu.vn', '0796294092', NULL, '1999-01-01', 'GIảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'TS', 'male', '2024-07-21 20:24:25', '2024-07-21 20:24:25'),
(61, 'Kiểu Trang', 'Nguyễn Thị', 'ntktrang@hcmus.edu.vn', '0900549931', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'female', '2024-07-21 20:25:08', '2024-07-21 20:28:11'),
(62, 'Sơn', 'Huỳnh Thanh', 'huynhthanh98vn@gmail.com', '0166386448', NULL, '1998-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 8, NULL, 'Th.S', 'male', '2024-07-21 20:26:00', '2024-07-21 20:26:00'),
(63, 'Nguyệt Nga', 'Tạ Thị', 'ttnnga@hcmus.edu.vn', '0347216661', NULL, '1999-01-01', 'Trưởng bộ môn', NULL, 'person.1024x1024.png', 0, 9, NULL, 'TS', 'female', '2024-07-21 20:26:54', '2024-07-21 20:26:54'),
(64, 'Dũng', 'Trần Nam', 'tndung@hcmus.edu.vn', '0963579119', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 9, NULL, 'TS', 'male', '2024-07-21 20:27:43', '2024-07-21 20:27:43'),
(65, 'Hiếu', 'Châu Thị', 'cthieu@hcmus.edu.vn', '0128023335', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 9, NULL, 'Th.S', 'female', '2024-07-21 20:29:54', '2024-07-21 20:29:54'),
(66, 'Kim Liên', 'Đinh Thị', 'dtklien@hcmus.edu.vn', '0569421340', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 9, NULL, 'Th.S', 'female', '2024-07-21 20:30:30', '2024-07-21 20:30:30'),
(67, 'Ái Nhi', 'Phan Nguyễn', 'pnainhi@hcmus.edu.vn', '0782300519', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 9, NULL, 'Th.S', 'female', '2024-07-21 20:31:20', '2024-07-21 20:31:20'),
(68, 'Thảo', 'Trần Hương', 'ththao@hcmus.edu.vn', '0654285735', NULL, '1999-01-01', 'Giảng viên', NULL, 'person.1024x1024.png', 0, 9, NULL, 'Th.S', 'female', '2024-07-21 20:31:55', '2024-07-21 20:31:55'),
(69, 'Tài', 'Dương Tấn', 'taiduong@hcmus.edu.vn', '0683783830', NULL, '1999-01-01', 'Thư ký khoa', NULL, 'person.1024x1024.png', 0, 10, NULL, 'Khac', 'male', '2024-07-21 20:35:37', '2024-07-21 20:35:37'),
(70, 'Kim Hoàng', 'Nguyễn Xuân', 'nxkhoang@hcmus.edu.vn', '0563331502', NULL, '1999-01-01', 'Giáo vụ khoa', NULL, 'person.1024x1024.png', 0, 10, NULL, 'Khac', 'female', '2024-07-21 20:36:26', '2024-07-21 20:36:26'),
(71, 'Duy', 'Nguyễn Thanh', 'ntduy@hcmus.edu.vn', '0667246393', NULL, '1999-01-01', 'Nhân viên văn phòng', NULL, 'person.1024x1024.png', 0, 10, NULL, 'Khac', 'male', '2024-07-21 20:37:32', '2024-07-21 20:37:32'),
(72, 'Đạt', 'Lê Thiện', 'ltdat@hcmus.edu.vn', '0671940877', NULL, '1999-01-01', 'Nhân viên phòng máy', NULL, 'person.1024x1024.png', 0, 11, NULL, 'Khac', 'male', '2024-07-21 20:38:16', '2024-07-21 20:38:16');

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
(1, 'Sự kiện và Tin tức', 1, 1, NULL, '2024-07-21 13:59:06'),
(2, 'Cơ hội việc làm\r\n', 2, 1, NULL, '2024-07-21 13:59:06'),
(3, 'Tuyển sinh', 3, 1, NULL, '2024-07-21 13:59:06'),
(4, 'Chương trình đào tạo', 0, 1, NULL, '2024-07-21 13:59:06');

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
(1, 'Lịch học kỳ II', '<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch sthi cụ thể.<hr> \n						<hr>', '* Thông báo cập nhật lúc 18h40 ngày 10/01/2019.', '2024-07-21', '2024-07-30', NULL, '2024-07-21 15:03:00');

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
(1, 'TMA Tech Group tuyển dụng việc làm dành cho SV mới tốt nghiệp', 'TMA Tech Group là tập đoàn công nghệ hàng đầu Việt Nam với 27 năm phát triển, hơn 4000 kỹ sư tài năng, có khách hàng trên 30 quốc gia và 16 năm đạt huy chương Vàng xuất khẩu phần mềm.', 'Logo-Math-CS-cyan-192.png', '<p>&nbsp;</p><p>TMA Tech Group là tập đoàn công nghệ hàng đầu Việt Nam với&nbsp;<strong>27 năm phát triển</strong>, hơn&nbsp;<strong>4000 kỹ sư&nbsp;</strong>tài năng, có khách hàng trên&nbsp;<strong>30 quốc gia</strong>&nbsp;và&nbsp;<strong>16 năm đạt huy chương Vàng</strong>&nbsp;xuất khẩu phần mềm.</p><p>&nbsp;</p>', 1, 3, 6, 1, '2019-04-27 10:46:08', '2024-07-19 06:58:19'),
(3, 'Trường hè “Sinh viên thực tập nghiên cứu khoa học 2024”', 'Đợt 1: Từ 24-29/06/2024 tại Viện Nghiên cứu cao cấp về Toán\n Đợt 2: Từ 01/7-23/8/2024, làm việc trực tuyến\n Đợt 3: 26-30/08/2024 tại Trường Đại học Xây dựng miền Trung, Thành phố Tuy Hoà, Tỉnh Phú Yên (dự kiến).', 'Logo-Math-CS-cyan-192.png', '<p><strong>Thời gian và Địa điểm</strong>&nbsp;:</p><ul><li>&nbsp;Đợt 1: Từ 24-29/06/2024 tại Viện Nghiên cứu cao cấp về Toán</li><li>&nbsp;Đợt 2: Từ 01/7-23/8/2024, làm việc trực tuyến</li><li>&nbsp;Đợt 3: 26-30/08/2024 tại Trường Đại học Xây dựng miền Trung, Thành phố Tuy Hoà, Tỉnh Phú Yên (dự kiến).</li></ul><p><strong>1. Mục tiêu</strong>&nbsp;:</p><ul><li>Mục tiêu của trường hè là giúp sinh viên sớm tiếp cận với quá trình nghiên cứu toán học, từ bước đi đầu tiên xác định vấn đề, tìm kiếm phương pháp giải quyết và trình bày kết quả thu được. Trải nghiệm này sẽ khuyến khích việc phát triển kỹ năng toán học một cách sâu rộng, nâng cao khả năng tự học, khả năng làm việc nhóm, và tư duy sáng tạo.</li><li>Chương trình sẽ tạo điều kiện thuận lợi nhất cho sinh viên được làm việc trực tiếp với các nhà nghiên cứu giàu kinh nghiệm, được làm việc với các vấn đề thách thức và có ý nghĩa, và được trình bày kết quả nghiên cứu của mình qua các seminar trực tuyến và trực tiếp.</li></ul><p><strong>2. Đối tượng tham dự</strong>&nbsp;:</p><ul><li>Sinh viên đại học&nbsp; thuộc các ngành đào tạo trong lĩnh vực các khoa học toán (mathematical sciences) trên cả nước.</li><li>Viện Nghiên cứu cao cấp về Toán sẽ lựa chọn sinh viên căn cứ trên thành tích cá nhân, bảng điểm đại học và thư giới thiệu của một nhà khoa học.</li><li>Yêu cầu đối với học viên: Cần tập trung làm việc trong toàn bộ thời gian diễn ra trường hè (10 tuần), nỗ lực theo sát hướng dẫn của giảng viên để đạt được kết quả tốt nhất.</li></ul><p><strong>3. Đơn vị tổ chức và tài trợ</strong>&nbsp;:</p><ul><li>Viện Nghiên cứu cao cấp về Toán</li><li>Trường Đại học Xây dựng miền Trung (dự kiến)</li></ul><p><strong>4. Ban Tổ chức</strong>&nbsp;:</p><ul><li>Lê Minh Hà, VIASM</li><li>Phan Thành Nam, LMU Munich, Đức</li></ul><p><strong>5. Ban chương trình</strong>&nbsp;:</p><ul><li>Lê Minh Hà, VIASM;</li><li>Nguyễn Hồng Đức, Trường Đại học Thăng Long;</li><li>Phan Thành Nam, LMU Munich, Đức;</li><li>Phạm Văn Thắng, Trường Đại học Khoa học Tự nhiên - ĐHQG Hà Nội.</li></ul><p><strong>6. Giảng viên chính</strong>&nbsp;:</p><ul><li>Tăng Quốc Bảo, Đại học Graz, Áo;</li><li>Nguyễn Thanh Bình, Trường Đại học Khoa học Tự nhiên, ĐHQG TP Hồ Chí Minh;</li><li>Hà Tuấn Dũng, Trường Đại học Sư phạm Hà Nội 2;</li><li>Nguyễn Quốc Hưng, Viện Hàn lâm Khoa học Trung Quốc;</li><li>Lương Đăng Kỳ; Trường Đại học Quy Nhơn;</li><li>Dabeen Lee, KAIST, Hàn Quốc;</li><li>Nguyễn Tuấn Minh, Đại học Monash, Úc;</li><li>Trần Giang Nam, Viện Toán học, Viện HLKH&amp;CN Việt Nam;</li><li>Nguyễn Xuân Việt Nhân, Trường Đại học FPT Đà Nẵng;</li><li>Nguyễn Phước Tài, Đại học Masaryk, Cộng hòa Séc</li><li>Phạm Minh Quý, Đại học Rochester, Mỹ;</li><li>Trần Mạnh Tuấn, Đại học Khoa học và Công nghệ Trung Quốc.</li></ul><p><strong>7. Giảng viên mời</strong>&nbsp;:</p><ul><li>Phạm Tuấn Huy, Clay Research Fellow, Đại học Stanford, Mỹ;</li><li>Ngô Đắc Tuấn, Trung tâm CNRS, Pháp.</li></ul><p><strong>6. Ngôn ngữ</strong>&nbsp;:&nbsp;Tiếng Việt và Tiếng Anh</p><p><strong>7. Hạn đăng ký tham dự và tài trợ</strong>:&nbsp;15/5/2024</p><p><strong>8. Liên hệ</strong>&nbsp;:&nbsp;Email: <a href=\"mailto:reu@viasm.edu.vn\">reu@viasm.edu.vn</a></p>', 1, 0, 11, 1, '2019-04-27 10:58:41', '2024-07-21 14:03:59'),
(4, 'CHƯƠNG TRÌNH HỖ TRỢ CÔNG BỐ KHOA HỌC VÀ CÔNG NGHỆ (Đợt 2/2024)', 'Mục tiêu: Nhằm khuyến khích Thầy Cô và người học tại Trường trong việc nghiên cứu khoa học, phát triển công nghệ, công bố các kết quả khoa học và công nghệ (KH&CN); từ đó nâng cao năng lực và hiệu quả trong nghiên cứu khoa học, phát triển công nghệ tại Trường, góp phần tích cực vào sự phát triển tại ĐHQG-HCM và phục vụ xã hội.', 'Logo-Math-CS-cyan-192.png', '<p>CHƯƠNG TRÌNH HỖ TRỢ CÔNG BỐ KHOA HỌC VÀ CÔNG NGHỆ (Đợt 2/2024)&nbsp;</p><ol><li>Mục tiêu: Nhằm khuyến khích Thầy Cô và người học tại Trường trong việc nghiên cứu khoa học, phát triển công nghệ, công bố các kết quả khoa học và công nghệ (KH&amp;CN); từ đó nâng cao năng lực và hiệu quả trong nghiên cứu khoa học, phát triển công nghệ tại Trường, góp phần tích cực vào sự phát triển tại ĐHQG-HCM và phục vụ xã hội.</li><li>Công bố khoa học và công nghệ (công bố KH&amp;CN) bao gồm:</li></ol><ul><li>&nbsp;<ul><li>Bài báo khoa học được đăng trên Tạp chí/Kỷ yếu Hội nghị hoặc chương sách thuộc danh mục Scopus hay Web of Science;</li></ul></li><li>&nbsp;<ul><li>Đăng ký sáng chế trong và ngoài nước (được chấp nhận đơn hay được cấp bằng độc quyền); đăng ký giải pháp hữu ích trong nước (được chấp nhận đơn hay được cấp bằng độc quyền); bản quyền phần mềm (được cấp giấy chứng nhận).</li></ul></li></ul><ol><li>Thời gian đăng ký đợt 2 (năm 2024) chương trình hỗ trợ công bố KH&amp;CN từ 01/04/2024 đến 30/04/2024. Đợt 2 này dành cho các công bố trong năm 2022 và 2023.</li></ol><p>Chi tiết về chương trình, vui lòng xem tại: <a href=\"https://research.hcmus.edu.vn/cong-bo-khoa-hoc\">https://research.hcmus.edu.vn/cong-bo-khoa-hoc</a></p><p><a href=\"https://www.facebook.com/hashtag/khoahoc?__eep__=6&amp;__cft__[0]=AZVI29fIzujkN6zLiUH-Ylv3lDl-12bqKfA9B5W2YMvAXbPXfIdiqQVRvXvO0sc-JK9WFlvu84HERuEfZh4ANDB2RG2oZfruShVEKv9WPOwNclCYS8-jZNEs_uGITfZ-Bat7BlSoTHPbI2v7elej3CSK&amp;__tn__=*NK-R\">#khoahoc</a> <a href=\"https://www.facebook.com/hashtag/congnghe?__eep__=6&amp;__cft__[0]=AZVI29fIzujkN6zLiUH-Ylv3lDl-12bqKfA9B5W2YMvAXbPXfIdiqQVRvXvO0sc-JK9WFlvu84HERuEfZh4ANDB2RG2oZfruShVEKv9WPOwNclCYS8-jZNEs_uGITfZ-Bat7BlSoTHPbI2v7elej3CSK&amp;__tn__=*NK-R\">#congnghe</a> <a href=\"https://www.facebook.com/hashtag/scopus?__eep__=6&amp;__cft__[0]=AZVI29fIzujkN6zLiUH-Ylv3lDl-12bqKfA9B5W2YMvAXbPXfIdiqQVRvXvO0sc-JK9WFlvu84HERuEfZh4ANDB2RG2oZfruShVEKv9WPOwNclCYS8-jZNEs_uGITfZ-Bat7BlSoTHPbI2v7elej3CSK&amp;__tn__=*NK-R\">#Scopus</a> <a href=\"https://www.facebook.com/hashtag/wos?__eep__=6&amp;__cft__[0]=AZVI29fIzujkN6zLiUH-Ylv3lDl-12bqKfA9B5W2YMvAXbPXfIdiqQVRvXvO0sc-JK9WFlvu84HERuEfZh4ANDB2RG2oZfruShVEKv9WPOwNclCYS8-jZNEs_uGITfZ-Bat7BlSoTHPbI2v7elej3CSK&amp;__tn__=*NK-R\">#WoS</a></p><p>&nbsp;</p>', 1, 0, 11, 1, '2019-04-27 11:00:03', '2024-07-11 14:10:52'),
(5, 'Thông báo Trường hè \"Sinh Viên Thực Tập Nghiên Cứu Khoa Học\"', 'Thông báo Trường hè \"Sinh Viên Thực Tập Nghiên Cứu Khoa Học\"', 'Logo-Math-CS-cyan-192.png', '<p>Thông tin chi tiết vui lòng xem thông báo<a href=\"https://drive.google.com/file/d/1mt9wZriTeiBpLvXu7ZNDtc5zYlwgLwX0/view?usp=sharing\"> tại đây</a>.</p><p>&nbsp;</p><p>&nbsp;</p>', 1, 0, 11, 1, '2019-04-27 11:01:05', '2024-07-11 14:07:37'),
(6, 'Bế mạc Olympic Toán học SV-HS năm 2024', 'Bế mạc Olympic Toán học SV-HS năm 2024', 'Logo-Math-CS-cyan-192.png', '<p>Lễ Tổng kết và Trao giải Kỳ thi&nbsp;<strong>Olympic Toán học sinh viên&nbsp;và học sinh</strong> lần thứ 30 diễn ra tại Trường ĐH Duy Tân, Đà Nẵng vào ngày 13/4. Kỳ thi do Hội Toán học Việt Nam phối hợp với Liên hiệp các Hội Khoa học Kỹ thuật Việt Nam, Trường ĐH Khoa học Tự nhiên (ĐH Quốc gia Hà Nội) tổ chức.</p><p>Ở phần thi dành cho sinh viên, Đội tuyển Trường Đại học Khoa học Tự nhiên dưới sự dẫn dắt của hai huấn luyện viên Tiến sĩ Nguyễn Hữu Trí Nhật và Tiến sĩ Vũ Đỗ Huy Cường đã xuất sắc giành được 09 giải trên tổng số. Cụ thể như sau:&nbsp;</p><ol><li>&nbsp;Môn Giải tích:&nbsp;</li></ol><ul><li>Giải nhất: bạn Đoàn Đức Tuấn</li><li>Giải nhì: bạn Nguyễn Xuân Tiến, bạn Võ Thịnh Phát.&nbsp;</li><li>Giải ba: bạn Nguyễn Đặng Hữu Thịnh, bạn Đoàn Quang Thắng.</li></ul><ol><li>Môn Đại số:&nbsp;</li></ol><ul><li>Giải nhì: bạn Đỗ Tiền Hải, bạn Nguyễn Vũ Hoàng Minh</li><li>Giải ba: bạn Nguyễn Xuân Tiến, Bạn Nguyễn Hoàng Khôi Nguyên</li></ul><p>Hi vọng những thành công này sẽ truyền cảm hứng cho những thế hệ sinh viên tiếp theo, khuyến khích các bạn bước ra ánh sáng và đặt ra những mục tiêu cao hơn, vươn tới những tầm cao mới trong hành trình khám phá tri thức và tinh thần toán học.&nbsp;</p><p>Chúc mừng các bạn và mong rằng thành công này sẽ là động lực để các bạn tiếp tục phấn đấu và gặt hái thêm nhiều thành tựu trong tương lai.</p><p>&nbsp;</p>', 1, 1, 12, 1, '2019-04-27 11:02:32', '2024-07-11 14:06:33'),
(7, 'Seminar Ứng dụng Tin học tháng 06.2024 - Principled Frameworks for Designing Deep Learning Models: Efficiency, Expressivity, and Robustness', 'Bộ môn Ứng dụng Tin học  tổ chức buổi \"Seminar Ứng dụng Tin học tháng 06.2024\" với bài báo cáo được thực hiện bởi Tiến sĩ Nguyễn Hùng Minh Tân.', 'seminar_26.6_thay_Tan.png', '<p>Bộ môn Ứng dụng Tin học &nbsp;tổ chức buổi \"Seminar Ứng dụng Tin học tháng 06.2024\" với bài báo cáo được thực hiện bởi <a href=\"https://tanmnguyen89.github.io/\">Tiến sĩ Nguyễn Hùng Minh Tân</a>.</p><p>Tiến sĩ Tân hiện đang là Trợ lý Giáo sư Khoa Toán học thuộc<a href=\"https://nus.edu.sg/\">&nbsp;Đại học Quốc gia Singapore (NUS)</a>. Trước đó, anh là nghiên cứu sinh sau tiến sĩ tại Khoa Toán học của Đại học California, Los Angeles, làm việc với Tiến sĩ Stanley J. Osher. Anh đã nhận bằng Tiến sĩ về Machine Learning tại Đại học Rice dưới sự hướng dẫn của Tiến sĩ Richard G. Baraniuk. Tiến sĩ Tân là người tổ chức Hội thảo đầu tiên về Tích hợp Mô hình thần kinh sâu và Phương trình vi phân tại ICLR 2020. Anh cũng đã có hai kỳ thực tập dài hạn tuyệt vời với Amazon AI và NVIDIA Research và nhận Học bổng Sau Tiến sĩ về Đổi mới Máy tính (CIFellows) danh giá từ Hiệp hội Nghiên cứu Máy tính (CRA), Học bổng Nghiên cứu Sau đại học của NSF và Học viên Kỹ thuật Thần kinh IGERT. Anh ấy đã nhận được bằng Thạc sĩ và Cử nhân ngành Kỹ thuật Điện và Máy tính tại Đại học Rice vào tháng 5 năm 2018 và tháng 5 năm 2014.</p><p>Các bạn sinh viên, học viên cao học, nghiên cứu sinh và các đồng nghiệp quan tâm có thể đăng ký tham dự.&nbsp;</p><ul><li>Thời gian:<strong>&nbsp;09h30</strong>&nbsp;sáng&nbsp;thứ 4 ngày&nbsp;<strong>26/06/2024.</strong></li><li>Địa điểm:&nbsp;<strong>Phòng E202</strong>, Cơ sở I, Trường ĐH Khoa học Tự nhiên,&nbsp;Số 227 Đường Nguyễn Văn Cừ, Phường4 Q5, TP. HCM.</li></ul><p>Tiêu đề:&nbsp;<strong>Principled Frameworks for Designing Deep Learning Models:&nbsp;Efficiency, Expressivity, and Robustness</strong></p><p>Thông tin buổi báo cáo như sau:&nbsp;</p><p>Designing deep learning models for practical applications, including those in computer vision, natural language processing, and mathematical modeling, is an art that often involves an expensive search over candidate architectures. In this talk, the speaker will introduce two novel optimization frameworks to facilitate the process of designing efficient and expressive deep learning models including the neural ordinary differential equations (Neural ODEs) and transformers.</p><p><a href=\"https://forms.gle/iiVHodGNgcatwgyr5\">Bấm vào link</a>&nbsp;hoặc quét mã QR bên dưới trước ngày 25/06/2024 để đăng ký tham dự.</p><p>Buổi trình bày cũng sẽ&nbsp;được kết hợp phát trực tuyến cho người ở xa muốn dự.&nbsp;&nbsp;</p><figure class=\"image\"><img style=\"aspect-ratio:1800/1800;\" src=\"http://localhost:8000/assets/user/images/about\\seminar_26.6_thay_Tan.png\" width=\"1800\" height=\"1800\"></figure>', 1, 0, 6, 1, '2019-04-27 11:04:03', '2024-07-11 14:04:46'),
(8, 'Chương trình Học bổng sau tiến sĩ nghiên cứu tại Nhật Bản (Postdoctoral Fellowship for Research in Japan)', '- Đơn ứng tuyển theo mẫu (theo đường link bên dưới);\n- Thư đề cử từ nhà nghiên cứu chịu trách nhiệm tại Nhật Bản;\n- Bằng hoặc chứng chỉ tiến sĩ theo đúng như Mục A của Tiêu chí ứng tuyển;\n- Thư đề cử từ giảng viên hướng dẫn tiến sĩ hoặc tương đương của ứng viên.\nLưu ý: Tất cả các tài liệu đều phải bằng tiếng Anh hoặc được gửi kèm bản dịch tiếng Anh.', 'Logo-Math-CS-cyan-192.png', '<p><strong>1.&nbsp;Chi tiết chương trình:</strong><br>- Thời lượng: Từ 01 tới 12 tháng trong khoảng 01/04/2025 - 31/03/2026, được thống nhất bởi ứng viên và nhà nghiên cứu chịu trách nhiệm.<br>- Hỗ trợ tài chính: JSPS chi trả phí 01 vé máy bay khứ hồi và sinh hoạt phí hàng tháng. Cụ thể:<br>+ Sinh hoạt phí cho ứng viên có bằng tiến sĩ: 362.000 JPY/tháng.<br>+ Sinh hoạt phí cho ứng viên chưa có bằng tiến sĩ: 200.000 JPY/tháng. Nếu ứng viên có bằng tiến sĩ trong thời gian làm việc, sinh hoạt phí này có thể được tăng lên 362.000 JPY/tháng.<br>+ Ngoài ra, các ứng viên với ít nhất 3 tháng làm việc sẽ được cấp 200.000 JPY phí di dời chỗ ở, và nhiều nhất 70.000 JPY/tháng nghiên cứu phí.<br><strong>2.&nbsp;Tiêu chí ứng tuyển:</strong><br>Các ứng viên phải đạt được một trong những tiêu chí sau:<br>- Mục A: Tiêu chí về bằng cấp<br>+ Có bằng tiến sĩ không quá 06 năm trước ở một nước không phải là Nhật Bản<br>+ Sẽ có bằng tiến sĩ ở một nước không phải là Nhật Bản trong vòng không quá 02 năm kể từ ngày bắt đầu làm việc<br>- Mục B: Tiêu chí về quốc tịch<br>+ Là người có quốc tịch là một trong những nước ASEAN<br>+ Là người có quốc tịch không phải là một trong những nước ASEAN nhưng đã tham gia vào các hoạt động nghiên cứu trong ba năm gần đây tại một viện nghiên cứu ở một trong những nước ASEAN<br><strong>3.&nbsp;Hồ sơ ứng tuyển:</strong><br>- Đơn ứng tuyển theo mẫu (theo đường link bên dưới);<br>- Thư đề cử từ nhà nghiên cứu chịu trách nhiệm tại Nhật Bản;<br>- Bằng hoặc chứng chỉ tiến sĩ theo đúng như Mục A của Tiêu chí ứng tuyển;<br>- Thư đề cử từ giảng viên hướng dẫn tiến sĩ hoặc tương đương của ứng viên.<br>Lưu ý: Tất cả các tài liệu đều phải bằng tiếng Anh hoặc được gửi kèm bản dịch tiếng Anh.<br><strong>4.&nbsp;Hạn nộp hồ sơ:</strong>&nbsp;31/7/2024<br><strong>5.&nbsp;Công bố kết quả:</strong>&nbsp;Tháng 02/2025<br>Thông tin&nbsp;chi tiết và nộp hồ sơ ứng tuyển:&nbsp;<a href=\"https://www.aunsec.org/aun-action/scholarships/jsps-international-fellowships-research-japan\">https://www.aunsec.org/aun-action/scholarships/jsps-international-fellowships-research-japan</a></p>', 1, 4, 10, 1, '2019-04-27 11:06:26', '2024-07-21 14:06:02'),
(9, 'Lịch bảo vệ Khóa luận tốt nghiệp', 'Lịch bảo vệ Khóa luận tốt nghiệp', 'Logo-Math-CS-cyan-192.png', '<p>Khoa Toán - Tin học xin thông báo lịch bảo vệ Khóa luận tốt nghiệp, Đồ án tốt nghiệp Đại học của các ngành, chuyên ngành như sau:</p><p><strong>Lịch bảo vệ Khóa luận tốt nghiệp</strong></p><p>1. Hội đồng chuyên ngành Cơ học. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1i9qHJMuxiqHIr3vimmzrigodALbqNdsX/edit\">Tại đây</a></p><p>2.&nbsp;Hội đồng chuyên ngành Đại số. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1hbYQj1kjwWRmGrjEI2QVm66JclYyp2hL/edit\">Tại đây</a></p><p>3.&nbsp;Hội đồng chuyên ngành Giải tích số. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1b5CL7pO-NpvBofMIPGnt5H2wQA493aT0/edit\">Tại đây</a></p><p>4.&nbsp;Hội đồng chuyên ngành&nbsp;Giải tích.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1atIWBXd88jplaqvvZSM1Fhich1hr2rsT/edit\">Tại đây</a></p><p>5.&nbsp;Hội đồng chuyên ngành Lý luận và phương pháp dạy học môn Toán. Xem chi tiết&nbsp; <a href=\"https://docs.google.com/document/d/1h93DMUIZXDnWrmFIwV0TGDBUcyyppA39/edit\">Tại đây</a>.&nbsp;</p><p>6. &nbsp;Hội đồng chuyên ngành Khoa học dữ liệu. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kGKKktO_eyfZAutToKdDkYOfirHhq1X-/edit\">Tại đây</a></p><p>7.&nbsp;Hội đồng chuyên ngành Phương pháp Toán trong tin học.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kKmEumhHh1QA6aR6asDgmWbYvcI0s2Hz/edit\">Tại đây</a></p><p>8.&nbsp;Hội đồng chuyên ngành Toán tin ứng dụng.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kL0NRGGnlV3GALpxomKX4sVuZedH9dIw/edit\">Tại đây</a></p><p>9.&nbsp;Hội đồng chuyên ngành Toán tài chính.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1f7f1kZpfo2MddlIFKWhx0XxsFWFjYs4u/edit\">Tại đây</a></p><p>10.&nbsp;Hội đồng chuyên ngành Tối ưu.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1fA595_GYb5AcgCisuSlH6KsCDZrzapx8/edit\">Tại đây</a></p><p><strong>Lịch bảo vệ Đồ án tốt nghiệp</strong></p><p>&nbsp;1. Hội đồng chấm Đồ án Tốt nghiệp ngành Khoa học dữ liệu. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kJFbFYWavBNuf_hKYhfaWuWsldH_7-0a/edit\">Tại đây</a></p>', 1, 3, 27, 1, '2019-04-27 11:11:14', '2024-07-21 15:33:50'),
(10, 'Lịch bảo vệ Khóa luận Tốt nghiệp - Đồ án tốt nghiệp, HK2/2023-2024', 'Khoa Toán - Tin học xin thông báo lịch bảo vệ Khóa luận tốt nghiệp, Đồ án tốt nghiệp Đại học của các ngành, chuyên ngành như sau:', 'Logo-Math-CS-cyan-192.png', '<p>Khoa Toán - Tin học xin thông báo lịch bảo vệ Khóa luận tốt nghiệp, Đồ án tốt nghiệp Đại học của các ngành, chuyên ngành như sau:</p><p><strong>Lịch bảo vệ Khóa luận tốt nghiệp</strong></p><p>1. Hội đồng chuyên ngành Cơ học. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1i9qHJMuxiqHIr3vimmzrigodALbqNdsX/edit\">Tại đây</a></p><p>2.&nbsp;Hội đồng chuyên ngành Đại số. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1hbYQj1kjwWRmGrjEI2QVm66JclYyp2hL/edit\">Tại đây</a></p><p>3.&nbsp;Hội đồng chuyên ngành Giải tích số. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1b5CL7pO-NpvBofMIPGnt5H2wQA493aT0/edit\">Tại đây</a></p><p>4.&nbsp;Hội đồng chuyên ngành&nbsp;Giải tích.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1atIWBXd88jplaqvvZSM1Fhich1hr2rsT/edit\">Tại đây</a></p><p>5.&nbsp;Hội đồng chuyên ngành Lý luận và phương pháp dạy học môn Toán. Xem chi tiết&nbsp; <a href=\"https://docs.google.com/document/d/1h93DMUIZXDnWrmFIwV0TGDBUcyyppA39/edit\">Tại đây</a>.&nbsp;</p><p>6. &nbsp;Hội đồng chuyên ngành Khoa học dữ liệu. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kGKKktO_eyfZAutToKdDkYOfirHhq1X-/edit\">Tại đây</a></p><p>7.&nbsp;Hội đồng chuyên ngành Phương pháp Toán trong tin học.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kKmEumhHh1QA6aR6asDgmWbYvcI0s2Hz/edit\">Tại đây</a></p><p>8.&nbsp;Hội đồng chuyên ngành Toán tin ứng dụng.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kL0NRGGnlV3GALpxomKX4sVuZedH9dIw/edit\">Tại đây</a></p><p>9.&nbsp;Hội đồng chuyên ngành Toán tài chính.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1f7f1kZpfo2MddlIFKWhx0XxsFWFjYs4u/edit\">Tại đây</a></p><p>10.&nbsp;Hội đồng chuyên ngành Tối ưu.&nbsp;Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1fA595_GYb5AcgCisuSlH6KsCDZrzapx8/edit\">Tại đây</a></p><p><strong>Lịch bảo vệ Đồ án tốt nghiệp</strong></p><p>&nbsp;1. Hội đồng chấm Đồ án Tốt nghiệp ngành Khoa học dữ liệu. Xem chi tiết&nbsp;<a href=\"https://docs.google.com/document/d/1kJFbFYWavBNuf_hKYhfaWuWsldH_7-0a/edit\">Tại đây</a></p>', 1, 0, 5, 1, '2019-05-04 19:10:44', '2024-07-11 14:01:43'),
(11, 'Chương trình chuyên tu liên kết chính sách hướng Nam mới dành cho sinh viên ưu tú - Trường Đại học Công nghệ Đài Bắc', 'Chương trình được giảng dạy bằng tiếng Anh về lĩnh vực công nghệ chất bán dẫn và AI, ngoài ra còn có chương trình giao lưu về chuyên môn và văn hóa như tiết học tiếng Hoa, tham quan nhà máy, trải nghiệm văn hóa địa phương...', '新南向海報ver.1 (2).png', '<p><strong>1. Thời gian đào tạo:</strong>&nbsp;05 tháng kể từ tháng 9/2024 đến tháng 01/2025</p><p><strong>2. Nội dung đào tạo:&nbsp;</strong>Chương trình được giảng dạy bằng tiếng Anh về lĩnh vực công nghệ chất bán dẫn và AI, ngoài ra còn có chương trình giao lưu về chuyên môn và văn hóa như tiết học tiếng Hoa, tham quan nhà máy, trải nghiệm văn hóa địa phương...</p><p><strong>3. Học bổng bao gồm:</strong></p><p>- Vé máy bay khứ hồi hạng phổ thông Việt Nam - Đài Loan;</p><p>- Học phí và chi phí khác trong trường;</p><p>- Sinh hoạt phí: 10,000 Đài tệ/tháng;</p><p>- Phí lưu trú: Thanh toán theo hóa đơn, mức tài trợ tối đa 18,000 Đài tệ/tháng.</p><p><strong>4. Điều kiện dự tuyển:</strong></p><p>- Sinh viên Việt Nam hoặc các nước nằm trong mục tiêu chính sách hướng Nam mới, đang theo học đại học năm thứ 2 đến năm thứ 4 của các khoa ngành tự nhiên, lĩnh vực công nghệ tương quan;</p><p>- Sinh viên không mang hộ chiếu Cộng hòa Nhân dân Trung Hoa hoặc hộ chiếu Trung Hoa Dân Quốc;</p><p>- Sinh viên không được cùng lúc nhận học bổng của các cơ quan, đơn vị khác.</p><p><strong>5. Phương thức đăng ký:</strong></p><p>Đăng ký online tại link trường ĐH CN Đài Bắc (<a href=\"https://forms.gle/wh5bc99iPqaRhoie9\">https://forms.gle/wh5bc99iPqaRhoie9</a>)&nbsp;trước ngày 10/7/2024. Trường sơ tuyển và thông báo phỏng vấn, danh sách được chọn dự kiến thông báo qua email vào ngày 17/7/2024.</p><figure class=\"image\"><img style=\"aspect-ratio:1414/2000;\" src=\"http://localhost:8000/assets/user/images/about\\新南向海報ver.1 (2).png\" width=\"1414\" height=\"2000\"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', 1, 8, 1, 1, '2019-05-04 19:12:30', '2024-07-21 15:30:36'),
(13, 'Buổi ký kết thỏa thuận hợp tác (MOU) giữa Khoa Toán - Tin học, Trường ĐH KHTN, ĐHQG-HCM và HRS GROUP', 'Sáng ngày 24/05/2024, buổi lễ ký kết thỏa thuận hợp tác (MOU) giữa Khoa Toán - Tin học và HRS Group đã diễn ra thành công tốt đẹp. Tại buổi lễ, hai bên đã thống nhất các điều khoản thỏa thuận, nội dung hợp tác, hỗ trợ lẫn nhau trong các hoạt động đào tạo, chia sẻ kiến thức.', '71235f41ce3e6e60372f3.jpg', '<p>Sáng ngày 24/05/2024, buổi lễ ký kết thỏa thuận hợp tác (MOU) giữa Khoa Toán - Tin học và HRS Group đã diễn ra thành công tốt đẹp. Tại buổi lễ, hai bên đã thống nhất các điều khoản thỏa thuận, nội dung hợp tác, hỗ trợ lẫn nhau trong các hoạt động đào tạo, chia sẻ kiến thức. Thông qua thỏa thuận, HRS cam kết sẽ mang đến nhiều cơ hội để các bạn sinh viên được làm việc trong môi trường chuyên nghiệp, đúng chuyên môn. Nhân dịp này, HRS cũng đã tổ chức buổi seminar nhằm cung cấp thông tin cho các bạn sinh viên để chuẩn bị tốt hơn cho sự nghiệp tương lai và kỹ năng thực tế trong bối cảnh sự chuyển đổi mạnh mẽ của môi trường công nghệ.</p>', 1, 0, 11, 1, '2024-07-05 10:34:55', '2024-07-21 13:59:58');

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
(1, '<h2>&nbsp;</h2><h2>GIỚI THIỆU TRƯỜNG</h2><p>Khoa Toán - Tin học<br><a href=\"https://www.hcmus.edu.vn/\">Trường Đại học Khoa học Tự nhiên</a><br><a href=\"https://vnuhcm.edu.vn/\">Đại học Quốc gia Thành phố Hồ Chí Minh</a><br>Phòng F09, 227 Nguyễn Văn Cừ, Quận 5, Thành phố Hồ Chí Minh. Điện thoại: (028) 73089899<br>Trang web: <a href=\"https://www.math.hcmus.edu.vn/\">https://www.math.hcmus.edu.vn</a><br>Bản đồ: Tọa độ 10.762618,106.6821</p><p>&nbsp;</p><h2>GIỚI THIỆU KHOA</h2><figure class=\"image\"><img src=\"https://www.math.hcmus.edu.vn/images/NVCstreet-2018.jpg\" alt=\"NVCstreet 2018\"></figure><p>&nbsp;</p><p>Khoa Toán - Tin học nghiên cứu và chuyển giao tri thức ở mọi cấp bậc trong khả năng của mình, cung cấp nhân lực cho xã hội ở phạm vi địa phương, quốc gia, và quốc tế. Với vị trí thuộc một trường đại học khoa học ở một trung tâm kinh tế xã hội, Khoa hướng tới duy trì truyền thống là một trung tâm lớn về số lượng lẫn chất lượng trong đào tạo và nghiên cứu Toán - Tin học của đất nước.</p><p>Tháng 03/2024 Khoa đang có 60 giảng viên/trợ giảng, được tổ chức thành 7 bộ môn. Khoa đang đào tạo 1200 sinh viên, 179 học viên cao học, và 47 nghiên cứu sinh. Khoa có các lĩnh vực nghiên cứu rộng, từ lý thuyết tới ứng dụng. Nghiên cứu ở Khoa vừa có tính tự do học thuật cao, vừa có truyền thống quan tâm tới nhu cầu của cộng đồng và gắn bó với đào tạo.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', NULL, '2024-07-15 14:08:46');

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
(1, 'Admin', 'Mai Thế Đức', 'admin@gmail.com', NULL, '$2y$10$j3AxkmNjzegLtPWuMcCho.ePOg/j65DSH/qBLFSNFOEf04yhsoe.2', 'Admin', 'hcmus-logo-white.46dafb9a.png', 'DANxlLoTKaAvYcvBvQ72p7TNwDzhOU18KwFH1FODDXstXhtXReGKHAYiX8bN', NULL, '2024-07-18 18:40:11'),
(2, 'sinhvien', 'Sinh Viên', 'sinhvien@gmail.com', NULL, '$2y$10$KhrcPw.79GtRYnQGyj8n8e.2G9onQ2o3jl.u1DDGCoGEYUjZEB0yC', 'SinhVien', 'avatar.jpg', NULL, NULL, NULL),
(3, 'giangvien', 'Giảng Viên Gugu', 'giangvien@gmail.com', NULL, '$2y$10$nza1bxbZrH55w5nH5UPs1Odukk7Z6lBZEz9iXsA8OuYNmJ8QGQE8q', 'GiangVien', 'avatar.jpg', 'VSEbyP0ZGtS7OXpEPhA9IHmMyXc43dKnbVGEKN3Be0jB8b2kkYGJDgblwdVU', NULL, '2024-07-06 08:58:44'),
(9, 'admin2', 'Nhat Dien', 'admin2@gmail.com', NULL, '$2y$10$t5kASe0eGcbyw3yEwSrXyeRex40qxkv1Jk7NycX7OUw.NjfhkqHpq', 'Admin', 'hcmus-logo-white.46dafb9a.png', 'mat5zW1Hel3flba3GbiCxz5lw6MZOhwIlJ8DEuIU2UC1jbdIS0ztSKF5VoaZ', '2024-07-06 08:37:09', '2024-07-21 13:47:38'),
(10, 'vanan', 'Nguyễn Văn An', 'an@gmail.com', NULL, '$2y$10$nFrGvrCLot04YJJEF/.iQuUGi9WRY2RM5fLaFtw5LHEatrsDAN2mS', 'GiangVien', '5.6.png', NULL, '2024-07-06 09:13:06', '2024-07-06 09:13:15');

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
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `majors_department_id_foreign` (`department_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- Constraints for table `majors`
--
ALTER TABLE `majors`
  ADD CONSTRAINT `majors_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

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
