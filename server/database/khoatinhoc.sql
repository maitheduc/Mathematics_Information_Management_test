-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 19, 2020 lúc 01:58 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `khoatinhoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_tintuc` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `created_at`, `updated_at`, `noidung`, `id_user`, `id_tintuc`) VALUES
(1, '2020-03-15 06:56:40', '2020-03-15 06:56:40', 'Tuyệt vời, ĐHQG TPHCM', 2, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_binh_luans`
--

CREATE TABLE `chi_tiet_binh_luans` (
  `id` int(10) UNSIGNED NOT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_binhluan` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_binh_luans`
--

INSERT INTO `chi_tiet_binh_luans` (`id`, `noidung`, `id_binhluan`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'Nhiệt huyết tuổi trẻ', 1, 2, '2020-03-15 06:57:08', '2020-03-15 06:57:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hop_thus`
--

CREATE TABLE `hop_thus` (
  `id` int(10) UNSIGNED NOT NULL,
  `hoten` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dienthoai` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `andanh` tinyint(1) NOT NULL,
  `daxem` tinyint(1) NOT NULL,
  `dadoc` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hop_thus`
--

INSERT INTO `hop_thus` (`id`, `hoten`, `email`, `dienthoai`, `noidung`, `andanh`, `daxem`, `dadoc`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thành An', 'thanhan1996@gmail.com', '0973625733', 'Cho em hỏi đã có lịch thi học kì 2 chưa ạ?', 0, 0, 0, '2020-03-15 06:12:20', '2020-03-15 06:12:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_kets`
--

CREATE TABLE `lien_kets` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenlienket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklienket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loailienket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lien_kets`
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
-- Cấu trúc bảng cho bảng `loai_tins`
--

CREATE TABLE `loai_tins` (
  `id` int(10) UNSIGNED NOT NULL,
  `tenloaitin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_theloai` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_tins`
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
(10, 'Sau đại học', 3, NULL, NULL),
(11, 'Đại học', 4, NULL, NULL),
(12, 'Sau đại học', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
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
(11, '2019_12_20_160459_create_lien_kets_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `the_loais`
--

CREATE TABLE `the_loais` (
  `id` int(10) UNSIGNED NOT NULL,
  `tentheloai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uutien` int(11) NOT NULL,
  `hienthi` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `the_loais`
--

INSERT INTO `the_loais` (`id`, `tentheloai`, `uutien`, `hienthi`, `created_at`, `updated_at`) VALUES
(1, 'Thông báo', 0, 1, NULL, NULL),
(2, 'Tin tức', 1, 1, NULL, NULL),
(3, 'Tuyển sinh', 2, 1, NULL, NULL),
(4, 'Chương trình học tập', 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_baos`
--

CREATE TABLE `thong_baos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghichu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaybatdau` datetime NOT NULL,
  `ngayhethan` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_baos`
--

INSERT INTO `thong_baos` (`id`, `tieude`, `noidung`, `ghichu`, `ngaybatdau`, `ngayhethan`, `created_at`, `updated_at`) VALUES
(1, 'Lịch học kỳ II', '<hr> \r\n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \r\n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \r\n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \r\n						» Đã có lịch thi chính thức, SV truy cập trang web để xem lịch thi cụ thể.<hr> \r\n						<hr>', '* Thông báo cập nhật lúc 18h40 ngày 10/01/2019.', '2020-03-15 13:02:42', '2020-03-15 13:02:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tin_tucs`
--

CREATE TABLE `tin_tucs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tieude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mota` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhdaidien` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `noibat` tinyint(1) NOT NULL DEFAULT 0,
  `luotxem` int(11) NOT NULL DEFAULT 0,
  `id_loaitin` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tin_tucs`
--

INSERT INTO `tin_tucs` (`id`, `tieude`, `mota`, `hinhdaidien`, `noidung`, `noibat`, `luotxem`, `id_loaitin`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'Hội thi “Tìm hiểu Chương trình Giáo dục phổ thông mới cấp Tiểu học”', 'Chương trình Giáo dục phổ thông tổng thể (2017) và Chương trình giáo dục phổ thông các môn học (Ban hành kèm theo Thông tư số 32/2018/TT-BGDĐT ngày 26 tháng 12 năm 2018 của Bộ trưởng Bộ GD&ĐT) đã đặt ra những cơ hội và thách thức cho hoạt động đào tạo ở các trường đại học sư phạm, các trường phổ thông trong cả nước. Trước nhiệm vụ phát triển năng lực sư phạm của giáo viên trong bối cảnh mới, Trường Đại học Sư phạm, Đại học Huế đã khuyến khích các đơn vị tổ chức các hoạt động giúp sinh viên tìm hiểu về Chương trình giáo dục phổ thông mới.', '1556362611TinTuc1.jpg', '  <div>\r\n                                <div id=\"PAGE1\">\r\n                                <div>\r\n                                <p>&nbsp;</p>\r\n                                </div>\r\n                                </div>\r\n                                </div>\r\n                                <div style=\"text-align: center;\"><strong>Hội thi &ldquo;T&igrave;m hiểu Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới cấp Tiểu học&rdquo;</strong></div>\r\n                                <div id=\"PAGE1\">\r\n                                <div>\r\n                                <p>Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng tổng thể (2017) v&agrave; Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng c&aacute;c m&ocirc;n học (Ban h&agrave;nh k&egrave;m theo Th&ocirc;ng tư s&ocirc;́ 32/2018/TT-BGDĐT ng&agrave;y 26 th&aacute;ng 12 năm 2018 của Bộ trưởng Bộ GD&amp;ĐT) đ&atilde; đặt ra những cơ hội v&agrave; th&aacute;ch thức cho hoạt động đ&agrave;o tạo ở c&aacute;c trường đại học sư phạm, c&aacute;c trường phổ th&ocirc;ng trong cả nước. Trước nhiệm vụ ph&aacute;t triển năng lực sư phạm của gi&aacute;o vi&ecirc;n trong bối cảnh mới, Trường Đại học Sư phạm, Đại học Huế đ&atilde; khuyến kh&iacute;ch c&aacute;c đơn vị tổ chức c&aacute;c hoạt động gi&uacute;p sinh vi&ecirc;n t&igrave;m hiểu về Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151646_58377885_2481634478602514_3728594034600443904_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Tr&ecirc;n tinh thần đ&oacute;, Khoa Gi&aacute;o dục Tiểu học - Trường Đại học Sư phạm, Đại học Huế tổ chức Hội thi &ldquo;T&igrave;m hiểu chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới cấp tiểu học&rdquo; diễn ra tối 24/4 tại Giảng đường I với sự tham gia của 14 đội thi đến từ 14 lớp trực thuộc Khoa.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Hội thi nhằm gi&uacute;p &nbsp;sinh vi&ecirc;n tiếp cận Chương tr&igrave;nh GDPT mới, ph&aacute;t triển c&aacute;c năng lực cơ bản đ&aacute;p ứng y&ecirc;u cầu đổi mới gi&aacute;o dục, trong đ&oacute; đặc biệt l&agrave; năng lực ph&acirc;n t&iacute;ch Chương tr&igrave;nh.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151650_58543783_2177721019207161_2010505097842262016_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Sau hai v&ograve;ng thi&nbsp;<em>Khởi động</em>&nbsp;v&agrave;&nbsp;<em>Tăng tốc&nbsp;</em>với c&aacute;c g&oacute;i c&acirc;u hỏi về Chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng tổng thể v&agrave; Chương tr&igrave;nh m&ocirc;n học mới ở cấp Tiểu học gắn với c&aacute;c lĩnh vực chuy&ecirc;n m&ocirc;n, Ban Gi&aacute;m khảo chọn ra 5 đội c&oacute; số điểm cao nhất bước v&agrave;o phần thi&nbsp;<em>Về đ&iacute;ch</em>.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Ở v&ograve;ng thi Về đ&iacute;ch, c&aacute;c đội thi lần lượt bốc thăm v&agrave; trả lời c&aacute;c c&acirc;u hỏi li&ecirc;n quan về lĩnh vực: To&aacute;n, Tiếng việt, &Acirc;m nhạc, Tự nhi&ecirc;n - X&atilde; hội,&hellip;&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151640_58374255_420914768489114_1029134598606422016_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>C&aacute;c c&acirc;u hỏi của 3 phần thi gi&uacute;p sinh vi&ecirc;n thể hiện, trải nghiệm những hiểu biết về Chương tr&igrave;nh GDPT mới, đồng thời, ph&aacute;t triển tư duy phản biện, năng lực đ&aacute;nh gi&aacute;, so s&aacute;nh Chương tr&igrave;nh mới với Chương tr&igrave;nh c&aacute;c m&ocirc;n học hiện h&agrave;nh.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Kết quả: Giải Nhất thuộc về lớp GDTH 3D; Giải Nh&igrave; thuộc về lớp GDTH 1A, GDTH 2C v&agrave; GDTH 4D; Giải Ba thuộc về lớp GDTH 4A.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151645_58377544_2378582202208315_3074079566021525504_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Ngo&agrave;i ra, Hội thi th&ecirc;m phần s&ocirc;i nổi khi c&aacute;c cổ động vi&ecirc;n cổ vũ nhiệt t&igrave;nh v&agrave; tham gia trả lời c&acirc;u hỏi d&agrave;nh cho kh&aacute;n giả, g&oacute;p phần khuấy động v&agrave; khơi dậy ở to&agrave;n thể sinh vi&ecirc;n Khoa GDTH kh&ocirc;ng kh&iacute; học tập, chia sẻ về những điểm mới của CT phổ th&ocirc;ng 2018.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Chia sẻ về Hội thi, sinh vi&ecirc;n Nguyễn Thị Anh Thư, lớp GDTH 3D cho biết: &ldquo;Đ&acirc;y l&agrave; một s&acirc;n chơi đầy bổ &iacute;ch, l&iacute; th&uacute;. Ch&uacute;ng em vừa được học những kiến thức mới mẻ, thiết thực th&ocirc;ng qua h&igrave;nh thức game show rất th&uacute; vị. Em nghĩ qua hội thi n&agrave;y, ai cũng l&agrave; người chiến thắng v&igrave; phần thưởng lớn nhất l&agrave; kiến thức &ndash; thứ m&agrave; kh&ocirc;ng chỉ cho c&aacute;c đội chơi m&agrave; c&ograve;n cho cả kh&aacute;n giả&rdquo;.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Sinh vi&ecirc;n Nguyễn Thị Thu L&yacute;, lớp GDTH 1A cũng chia sẻ: &ldquo;Mặc d&ugrave; mới năm 1 th&ocirc;i, nhưng trong tương lai ch&uacute;ng em sẽ l&agrave; những gi&aacute;o vi&ecirc;n phải giảng dạy chương tr&igrave;nh GDPT mới cấp Tiểu học. Hội thi như một bước tiền đề để ch&uacute;ng em tiếp cận với những kiến thức sẽ được học trong thời gian sắp tới. Cuộc thi kh&ocirc;ng hề kh&ocirc; khan m&agrave; lại rất th&uacute; vị, em nghĩ, n&ecirc;n nh&acirc;n rộng m&ocirc; h&igrave;nh chương tr&igrave;nh n&agrave;y cho c&aacute;c khoa ở trong v&agrave; ngo&agrave;i trường để c&aacute;c bạn vừa học - vừa chơi&rdquo;.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Hội thi&nbsp;<em>T&igrave;m hiểu Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới cấp tiểu học</em>&nbsp;của Khoa Gi&aacute;o dục Tiểu học, ĐH ĐHQG TPHCM tạo dấu ấn mạnh mẽ, t&iacute;ch cực đối với sinh vi&ecirc;n, được đ&aacute;nh gi&aacute; l&agrave; hoạt động chuy&ecirc;n m&ocirc;n v&ocirc; c&ugrave;ng bổ &iacute;ch, khởi đầu cho h&agrave;nh tr&igrave;nh tiếp cận v&agrave; triển khai CT gi&aacute;o dục phổ th&ocirc;ng mới trong bối cảnh hiện nay. Hi vọng m&ocirc; h&igrave;nh n&agrave;y sẽ tiếp tục được lan toả, ph&aacute;t triển với quy m&ocirc; lớn hơn v&agrave; mang t&iacute;nh hệ thống hơn.</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>Một số h&igrave;nh ảnh Hội thi:</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151630_57882338_360058654612308_7522678430609965056_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Nhất cho lớp GDTH 3D.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151633_58114976_875681269445739_6659451611124858880_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Nh&igrave; cho c&aacute;c lớp GDTH 1A, GDTH 2C v&agrave; GDTH 4D.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151636_58373362_2250225738628401_3370164402270502912_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Ba cho lớp GDTH 4A.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151651_58701261_430009187555824_5795088334703296512_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức trao Giải Khuyến kh&iacute;ch cho lớp GDTH 1C.</em></div>\r\n                                </div>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151653_58825837_432440694181758_6987745820170780672_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151626_57618296_394192784767449_6958118826525327360_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151625_57604345_382850865637401_3499676280633163776_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151647_58378797_443614369781057_6965565728585940992_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151628_57710754_1031673300375223_5558425075369115648_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151638_58373399_641831436254478_4687618385930878976_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151623_58961607_591179584715656_7838982156117344256_n.jpg\" /></p>\r\n                                <p>&nbsp;</p>\r\n                                <p>&nbsp;</p>\r\n                                <div>\r\n                                <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190426151632_58003875_453796292096911_3629520035413753856_n.jpg\" /></div>\r\n                                <div><em>Ban Tổ chức v&agrave; c&aacute;c đội thi chụp ảnh lưu niệm.</em></div>\r\n                                </div>\r\n                                </div>\r\n                                </div>', 1, 2, 5, 1, '2019-04-27 10:46:08', '2019-04-27 10:56:51'),
(2, 'Thông báo kết quả thi Tuyển sinh cao học lần 1 năm 2019', 'Thông báo kết quả thi Tuyển sinh cao học lần 1 năm 2019', '1556362529avatar.jpg', '<div><strong>Th&ocirc;ng b&aacute;o kết quả thi Tuyển sinh cao học lần 1 năm 2019</strong></div>\r\n                        <div id=\"PAGE1\">\r\n                        <div>\r\n                        <p>Kết quả xem tại :&nbsp;<a href=\"http://www.dhsphue.edu.vn/media/db_thongbao/20190422085519_20190418_172317_ketquathich_1_2019.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                        </div>\r\n                        </div>', 1, 2, 12, 1, '2019-04-27 10:55:29', '2019-04-27 10:55:46'),
(3, 'THÔNG BÁO Chấm phúc khảo cho thí sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế', 'THÔNG BÁO Chấm phúc khảo cho thí sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế', '1556362721avatar.jpg', '<div style=\"text-align: center;\"><strong>TH&Ocirc;NG B&Aacute;O Chấm ph&uacute;c khảo cho th&iacute; sinh dự thi Kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế</strong></div>\r\n                        <div id=\"PAGE1\">\r\n                        <div>\r\n                        <p>Căn cứ Quy chế đ&agrave;o tạo tr&igrave;nh độ thạc sỹ của Bộ trưởng Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo hiện h&agrave;nh;</p>\r\n                        <p>Hội đồng Tuyển sinh Sau đại họccủa Đại học Huế sẽ nhận đơn xin chấm ph&uacute;c khảo b&agrave;i thi cho những th&iacute; sinh đ&atilde; dự thi kỳ thi tuyển sinh Cao học lần 1 năm 2019 tại Đại học Huế c&oacute; y&ecirc;u cầu.</p>\r\n                        <p>&nbsp;</p>\r\n                        <p>- Thời gian: từ ng&agrave;y&nbsp;<strong>18/4/2019</strong>&nbsp;đến hết ng&agrave;y&nbsp;<strong>02/5/2019</strong>.</p>\r\n                        <p align=\"center\"><em>(Nếu th&iacute; sinh gửi theo đường thư t&iacute;n th&igrave; ng&agrave;y nộp đơn căn cứ theo ng&agrave;y tr&ecirc;n dấu bưu điện)</em></p>\r\n                        <p>- Lệ ph&iacute; chấm ph&uacute;c khảo: 200.000đ/1 m&ocirc;n</p>\r\n                        <p><em>(Hồ sơ hợp lệ nếu đ&atilde; nộp đầy đủ lệ ph&iacute; chấm ph&uacute;c khảo)</em></p>\r\n                        <p>&nbsp;</p>\r\n                        <p>- Địa điểm nhận đơn: Đơn xin chấm ph&uacute;c khảo gửi đến Hội đồng Tuyển sinh Sau đại họcĐại học Huế theo địa chỉ:</p>\r\n                        <p>&nbsp;&nbsp;<strong>Ban Đ&agrave;o tạo - Đại học Huế, số 04 L&ecirc; Lợi - TP Huế&nbsp;</strong><em>(tầng 3).</em></p>\r\n                        <p>&nbsp; Mọi chi tiết xin li&ecirc;n hệ qua số điện thoại&nbsp;<strong>0234.3833578</strong></p>\r\n                        </div>\r\n                        <div style=\"text-align: right;\"><em>TL. CHỦ TỊCH<br />THƯỜNG TRỰC HỘI ĐỒNG<br /><br /><br /><br /><br /><br />QUYỀN TRƯỞNG BAN Đ&Agrave;O TẠO<br />TRẦN TRUNG HỶ</em></div>\r\n                        </div>', 1, 0, 12, 1, '2019-04-27 10:58:41', '2019-04-27 10:58:41'),
(4, 'Thông báo Bảo vệ luận án tiến sĩ cấp cơ sở (Huỳnh Thị Minh Thành)', 'Thực hiện Quyết định số 229/QĐ-ĐHH ngày 05/03/2019 của Giám đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đánh giá luận án Tiến sĩ cấp Đại học Huế về đề tài: Nghiên cứu đặc điểm sinh học của rệp sáp bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) và khả năng khống chế rệp của ong ký sinh (Anagyrus lopezi De Santis, 1964) \r\n                        Chuyên ngành: Động vật học', '1556362865avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Bảo vệ luận &aacute;n tiến sĩ cấp Đại học Huế (Ho&agrave;ng Hữu T&igrave;nh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Thực hiện Quyết định số 229/QĐ-ĐHH ng&agrave;y 05/03/2019 của Gi&aacute;m đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đ&aacute;nh gi&aacute; luận &aacute;n Tiến sĩ cấp Đại học Huế về đề t&agrave;i:&nbsp;<strong><em>Nghi&ecirc;n cứu đặc điểm sinh học của rệp s&aacute;p bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) v&agrave; khả năng khống chế rệp của ong k&yacute; sinh (Anagyrus lopezi De Santis, 1964)</em></strong></p>\r\n                    <p>Chuy&ecirc;n ng&agrave;nh: Động vật học</p>\r\n                    <p>M&atilde; số: 62 42 01 03</p>\r\n                    <p>Cho nghi&ecirc;n cứu sinh:&nbsp;<strong>Ho&agrave;ng Hữu T&igrave;nh</strong></p>\r\n                    <p>Thời gian:&nbsp;&nbsp; &nbsp;<strong>8 giờ 00, ng&agrave;y 17 th&aacute;ng 04&nbsp; năm 2019</strong></p>\r\n                    <p>Địa điểm: Ph&ograve;ng I.1, Đại học Huế, số 4 L&ecirc; Lợi, TP. Huế</p>\r\n                    <p>Tr&acirc;n trọng th&ocirc;ng b&aacute;o v&agrave; k&iacute;nh mời qu&yacute; vị quan t&acirc;m đến dự<strong><em>.</em></strong></p>\r\n                    </div>\r\n                    <div style=\"text-align: right;\"><em>TL. HIỆU TRƯỞNG&nbsp;<br />TRƯỞNG PH&Ograve;NG ĐT SAU ĐẠI HỌC<br /><br /><br />(Đ&atilde; k&yacute;)<br /><br /><br />GS.TS. DƯƠNG TUẤN QUANG</em></div>\r\n                    </div>', 1, 0, 12, 1, '2019-04-27 11:00:03', '2019-04-27 11:00:03'),
(5, 'Thông báo Bảo vệ luận án tiến sĩ cấp Đại học Huế (Hoàng Hữu Tình)', 'Thực hiện Quyết định số 229/QĐ-ĐHH ngày 05/03/2019 của Giám đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đánh giá luận án Tiến sĩ cấp Đại học Huế về đề tài: Nghiên cứu đặc điểm sinh học của rệp sáp bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) và khả năng khống chế rệp của ong ký sinh (Anagyrus lopezi De Santis, 1964) \r\n                        Chuyên ngành: Động vật học', '1556362865avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Bảo vệ luận &aacute;n tiến sĩ cấp Đại học Huế (Ho&agrave;ng Hữu T&igrave;nh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Thực hiện Quyết định số 229/QĐ-ĐHH ng&agrave;y 05/03/2019 của Gi&aacute;m đốc Đại học Huế, Trường Đại học Sư phạm tổ chức đ&aacute;nh gi&aacute; luận &aacute;n Tiến sĩ cấp Đại học Huế về đề t&agrave;i:&nbsp;<strong><em>Nghi&ecirc;n cứu đặc điểm sinh học của rệp s&aacute;p bột hồng hại sắn (Phenacoccus manihoti Matile - Ferrero, 1977) v&agrave; khả năng khống chế rệp của ong k&yacute; sinh (Anagyrus lopezi De Santis, 1964)</em></strong></p>\r\n                    <p>Chuy&ecirc;n ng&agrave;nh: Động vật học</p>\r\n                    <p>M&atilde; số: 62 42 01 03</p>\r\n                    <p>Cho nghi&ecirc;n cứu sinh:&nbsp;<strong>Ho&agrave;ng Hữu T&igrave;nh</strong></p>\r\n                    <p>Thời gian:&nbsp;&nbsp; &nbsp;<strong>8 giờ 00, ng&agrave;y 17 th&aacute;ng 04&nbsp; năm 2019</strong></p>\r\n                    <p>Địa điểm: Ph&ograve;ng I.1, Đại học Huế, số 4 L&ecirc; Lợi, TP. Huế</p>\r\n                    <p>Tr&acirc;n trọng th&ocirc;ng b&aacute;o v&agrave; k&iacute;nh mời qu&yacute; vị quan t&acirc;m đến dự<strong><em>.</em></strong></p>\r\n                    </div>\r\n                    <div style=\"text-align: right;\"><em>TL. HIỆU TRƯỞNG&nbsp;<br />TRƯỞNG PH&Ograve;NG ĐT SAU ĐẠI HỌC<br /><br /><br />(Đ&atilde; k&yacute;)<br /><br /><br />GS.TS. DƯƠNG TUẤN QUANG</em></div>\r\n                    </div>', 1, 0, 12, 1, '2019-04-27 11:01:05', '2019-04-27 11:01:05'),
(6, 'Thông tin luận án tiến sĩ (Trần Nam Sinh)', '1. NCS Trần Nam Sinh - CN: Đại số Và lý thuyết số\r\n\r\n                                Mã số: 62460104  Bảo vệ  lúc ..... giờ....., ngày ..... tháng ...... năm 20….\r\n\r\n                                - Cơ sở đào tạo: Trường Đại học Sư phạm -  ĐHH', '1556362952avatar.jpg', '<div><strong>Th&ocirc;ng tin luận &aacute;n tiến sĩ (Trần Nam Sinh)</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p><strong>1.&nbsp;NCS&nbsp;Trần Nam Sinh&nbsp;- CN:&nbsp;Đại số V&agrave; l&yacute; thuyết số</strong></p>\r\n                    <p><strong>M&atilde; số:&nbsp;62460104&nbsp; Bảo vệ &nbsp;l&uacute;c ..... giờ....., ng&agrave;y ..... th&aacute;ng ...... năm 20&hellip;.</strong></p>\r\n                    <p><strong>- Cơ sở đ&agrave;o tạo: Trường Đại học Sư phạm - &nbsp;ĐHH</strong></p>\r\n                    <p><strong>- Địa điểm:&nbsp;...........................</strong></p>\r\n                    <p><strong>- T&ecirc;n đề t&agrave;i luận &aacute;n:&nbsp;<em>CHỈ SỐ CH&Iacute;NH QUY CỦA TẬP ĐIỂM B&Eacute;O TRONG KH&Ocirc;NG GIAN XẠ ẢNH</em></strong></p>\r\n                    <p><strong>- To&agrave;n văn luận &aacute;n:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095143_tnsinh-tvla.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>- T&oacute;m tắt nội dung:&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+ Tiếng Việt:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095132_tnsinh-ttla-tv_.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+ Tiếng Anh:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095124_tnsinh_-ttla-ta.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>- Th&ocirc;ng tin những đ&oacute;ng g&oacute;p luận &aacute;n:&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+&nbsp;<a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095117_tn_sinh-dong_gop_la-tv.pdf\" target=\"_blank\" rel=\"noopener\">Tiếng Việt:&nbsp;File đ&iacute;nh k&egrave;m</a>&nbsp;</strong></p>\r\n                    <p><strong>&nbsp; &nbsp; &nbsp; &nbsp;+&nbsp;<a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095116_tn_sinh-dong_gop_la-ta.pdf\" target=\"_blank\" rel=\"noopener\">Tiếng Anh:&nbsp;File đ&iacute;nh k&egrave;</a>m</strong></p>\r\n                    <p><strong>- Tr&iacute;ch yếu luận &aacute;n:&nbsp;</strong><a href=\"http://www.dhsphue.edu.vn/MEDIA/db_html_cmp_020501/20190311095127_tnsinh-trich_yeu_la.pdf\" target=\"_blank\" rel=\"noopener\"><strong>File đ&iacute;nh k&egrave;m</strong></a></p>\r\n                    <p><strong>P/S</strong>: Xin vui l&ograve;ng truy cập v&agrave;o Website:&nbsp;<u>http://www.dhsphue.edu.vn/cd_cmp.aspx?cd=020501&amp;id=0</u>&nbsp;để xem th&ocirc;ng tin cụ thể.</p>\r\n                    </div>\r\n                    <div><em>Ph&ograve;ng Đ&agrave;o tạo Sau đại học</em></div>\r\n                    </div>', 1, 1, 12, 1, '2019-04-27 11:02:32', '2019-04-27 11:02:32'),
(7, 'Đội tuyển Olympic Vật lý xuất sắc đạt 2 Giải Nhất và 5 Giải Ba Cuộc thi Olympic Vật lý sinh viên toàn quốc', 'Đội tuyển Olympic Vật lý Trường Đại học ĐHQG TPHCM xuất sắc đạt Giải Nhì toàn đoàn tại Cuộc thi Olympic Vật lý sinh viên toàn quốc với  02 Giải Nhất (Phần thi thí nghiệm Vật lý) và 05 Giải Ba (Phần thi Giải bài tập vật lý, Trắc nghiệm vật lý).', '1556363043tintuc2.jpg', '<div><strong>Đội tuyển Olympic Vật l&yacute; xuất sắc đạt 2 Giải Nhất v&agrave; 5 Giải Ba Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Đội tuyển Olympic Vật l&yacute; Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">Đại học ĐHQG TPHCM</a>&nbsp;xuất sắc đạt Giải Nh&igrave; to&agrave;n đo&agrave;n tại Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc với &nbsp;02 Giải Nhất (Phần thi th&iacute; nghiệm Vật l&yacute;) v&agrave; 05 Giải Ba (Phần thi Giải b&agrave;i tập vật l&yacute;, Trắc nghiệm vật l&yacute;).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190424162009_1.jpg\" /></div>\r\n                    <div><em>Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường ĐHSP tham gia Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Olympic Vật l&yacute; sinh vi&ecirc;n năm nay diễn ra từ ng&agrave;y 17-20/4/2019 tại Trường Đại học Thủy Lợi &ndash; H&agrave; Nội với tổng số 248 sinh vi&ecirc;n của 42 đội dự thi. Đ&acirc;y l&agrave; hoạt động thường ni&ecirc;n do Bộ GD-ĐT, Li&ecirc;n hiệp c&aacute;c Hội Khoa học v&agrave; Kỹ thuật Việt Nam, Hội Vật l&yacute; Việt Nam tổ chức nhằm g&oacute;p phần th&uacute;c đẩy, n&acirc;ng cao chất lượng dạy v&agrave; học m&ocirc;n Vật l&yacute; tại c&aacute;c trường ĐH, CĐ, Học viện.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Qua đ&oacute;, cuộc thi t&igrave;m kiếm, ph&aacute;t hiện t&agrave;i năng trẻ trong lĩnh vực Vật l&yacute;, đồng thời gi&uacute;p c&aacute;c bạn sinh vi&ecirc;n y&ecirc;u th&iacute;ch m&ocirc;n học n&agrave;y c&oacute; điều kiện tiếp x&uacute;c trao đổi, chia sẻ đam m&ecirc; học tập v&agrave; nghi&ecirc;n cứu.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Olympic vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc l&agrave; kỳ thi kh&oacute;, thu h&uacute;t sinh vi&ecirc;n từ c&aacute;c đơn vị gi&aacute;o dục c&oacute; tiếng, như Trường ĐH B&aacute;ch Khoa H&agrave; Nội, Trường ĐH Khoa học Tự Nhi&ecirc;n &ndash; ĐH Quốc gia H&agrave; Nội, Trường ĐH Sư phạm TP. Hồ Ch&iacute; Minh, ĐH B&aacute;ch Khoa TP. Hồ Ch&iacute; Minh&hellip; v&igrave; thế cuộc đua th&agrave;nh t&iacute;ch kh&ocirc;ng dễ d&agrave;ng.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tuy nhi&ecirc;n, Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường ĐH ĐHQG TPHCM lu&ocirc;n gi&agrave;u th&agrave;nh t&iacute;ch v&agrave; nằm trong tốp đầu, so với c&aacute;c trường sư phạm trong cả nước. Điển h&igrave;nh như tại kỳ thi năm 2004, đội tuyển của Khoa từng gi&agrave;nh giải nhất to&agrave;n đo&agrave;n; nhiều năm đạt giải nh&igrave; to&agrave;n đo&agrave;n (2009, 2010, 2013, 2017, 2018, 2019). Đội tuyển lu&ocirc;n c&oacute; được thứ hạng cao, trong tốp 5, 6 v&agrave; c&oacute; nhiều sinh vi&ecirc;n đạt giải nhất, nh&igrave; c&aacute; nh&acirc;n. Đặc biệt, trong hai năm li&ecirc;n tiếp 2018 v&agrave; 2019, mỗi năm đội c&oacute; 2 Giải Nhất c&aacute; nh&acirc;n phần thi Th&iacute; nghiệm.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Để c&oacute; th&agrave;nh t&iacute;ch như vậy, được sự hỗ trợ, tạo điều kiện của Nh&agrave; trường, Khoa đ&atilde; c&oacute; kế hoạch tuyển chọn v&agrave; &ocirc;n luyện b&agrave;i bản, khoa học. H&agrave;ng năm v&agrave;o khoảng th&aacute;ng 11, 12, Khoa tiến h&agrave;nh tổ chức Kỳ thi Olympic Vật l&yacute; sinh vi&ecirc;n cấp Khoa, nhằm ph&aacute;t hiện c&aacute;c sinh vi&ecirc;n c&oacute; tiềm năng để chọn v&agrave;o đội tuyển v&agrave; bồi dưỡng; đồng thời, cũng l&agrave; cơ hội để c&aacute;c sinh vi&ecirc;n &ocirc;n luyện, n&acirc;ng cao kiến thức chuy&ecirc;n ng&agrave;nh.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Sau khi tuyển chọn được c&aacute;c sinh vi&ecirc;n tốt nhất v&agrave;o đội tuyển, Khoa sẽ ph&acirc;n c&ocirc;ng c&aacute;c giảng vi&ecirc;n c&oacute; năng lực v&agrave; kinh nghiệm để bồi dưỡng, &ocirc;n luyện cho đội tuyển. Mỗi giảng vi&ecirc;n đảm nhận một nội dung &ocirc;n tập, đảm bảo t&iacute;nh chuy&ecirc;n s&acirc;u về kiến thức của mỗi phần thi.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đặc biệt, sinh vi&ecirc;n của Khoa đ&atilde; tham dự v&agrave; đạt giải trong c&aacute;c Cuộc thi Olympic Vật l&yacute; sinh vi&ecirc;n to&agrave;n quốc trước đ&acirc;y đều được đ&aacute;nh gi&aacute; cao về kiến thức chuy&ecirc;n m&ocirc;n v&agrave; c&aacute;c kỹ năng kh&aacute;c. C&aacute;c sinh vi&ecirc;n ra trường đều c&oacute; việc l&agrave;m hoặc theo học c&aacute;c chương tr&igrave;nh sau đại học ở nước ngo&agrave;i. Một số sinh vi&ecirc;n đ&atilde; tr&uacute;ng tuyển v&agrave;o l&agrave;m giảng vi&ecirc;n ở c&aacute;c trường đại học, cao đẳng.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đạt được kết quả tr&ecirc;n l&agrave; nhờ sự quan t&acirc;m của Nh&agrave; trường, sự nỗ lực của giảng vi&ecirc;n sinh vi&ecirc;n; qua đ&oacute;, phản ảnh chất lượng dạy v&agrave; học của Khoa Vật l&yacute; n&oacute;i ri&ecirc;ng v&agrave; Nh&agrave; trường n&oacute;i chung trong thời gian qua; đồng thời, l&agrave; cơ sở để Nh&agrave; trường tiếp tục đẩy mạnh đổi mới, n&acirc;ng cao chất lượng, hiệu quả giảng dạy Vật l&yacute;, đ&aacute;p ứng y&ecirc;u cầu ng&agrave;y c&agrave;ng ph&aacute;t triển của đất nước trong cuộc c&aacute;ch mạng c&ocirc;ng nghiệp lần thứ 4.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Kết quả cụ thể của Đội tuyển Olympic Vật l&yacute; sinh vi&ecirc;n Trường năm 2019:</p>\r\n                    <p>1.&nbsp;&nbsp;&nbsp;&nbsp; Đặng Hữu Tuấn - Lớp L&yacute; 4B (Giải Nhất phần thi Th&iacute; nghiệm Vật l&yacute;)</p>\r\n                    <p>2.&nbsp;&nbsp;&nbsp;&nbsp; L&ecirc; B&aacute; L&acirc;n - Lớp L&yacute; 3B&nbsp;(Giải Nhất phần thi Th&iacute; nghiệm Vật l&yacute;)&nbsp; &nbsp;</p>\r\n                    <p>3.&nbsp;&nbsp;&nbsp;&nbsp; Huỳnh C&ocirc;ng Quang &ndash; Lớp L&yacute; 2A (Giải Ba phần thi Giải b&agrave;i tập Vật l&yacute;, Giải Ba phần thi Trắc nghiệm Vật l&yacute;)</p>\r\n                    <p>4.&nbsp;&nbsp;&nbsp;&nbsp; Đặng Thị Quy&ecirc;n &ndash; Lớp L&yacute; 4C (Giải Ba phần thi Trắc nghiệm Vật l&yacute;)</p>\r\n                    <p>5.&nbsp;&nbsp;&nbsp;&nbsp; Ho&agrave;ng Đại Nghĩa &ndash; Lớp L&yacute; 3B (Giải Ba phần thi&nbsp;Giải b&agrave;i tập Vật l&yacute;)</p>\r\n                    <p>6.&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;L&ecirc; Gia Bảo Khanh - Lớp L&yacute; 2B&nbsp;(Giải Ba phần thi Trắc nghiệm Vật l&yacute;).</p>\r\n                    </div>\r\n                    <div><em>ĐHSP</em></div>\r\n                    </div>', 1, 0, 6, 1, '2019-04-27 11:04:03', '2019-04-27 11:04:03'),
(8, '203 tân Tiến sĩ, Thạc sĩ nhận bằng tốt nghiệp', 'Sáng 29/3/2019, Trường Đại học Sư phạm, Đại học Huế long trọng tổ chức Lễ tốt nghiệp và trao bằng Tiến sĩ, Thạc sĩ năm 2019.', '1556363186tintuc3.jpg', '<div><strong>203 t&acirc;n Tiến sĩ, Thạc sĩ nhận bằng tốt nghiệp</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>S&aacute;ng 29/3/2019, Trường Đại học Sư phạm, Đại học Huế long trọng tổ chức Lễ tốt nghiệp v&agrave; trao bằng Tiến sĩ, Thạc sĩ năm 2019.</p>\r\n                    <p><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105715_56325263_790144171360454_7170335896514854912_n.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105708_56405436_269870730611436_1213642364963258368_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường trao bằng cho c&aacute;c t&acirc;n Tiến sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Năm nay, Trường c&oacute; 10 nghi&ecirc;n cứu sinh bảo vệ th&agrave;nh c&ocirc;ng luận &aacute;n tiến sĩ, được c&ocirc;ng nhận học vị v&agrave; cấp bằng tiến sĩ thuộc 5 chuy&ecirc;n ng&agrave;nh, trong đ&oacute; nhiều nghi&ecirc;n cứu sinh đ&atilde; c&oacute; c&aacute;c c&ocirc;ng tr&igrave;nh khoa học đăng tải tr&ecirc;n những tạp ch&iacute; quốc tế uy t&iacute;n thuộc hệ thống SCI xếp hạng Q1, Q2 với chỉ số ảnh hưởng cao; 193 học vi&ecirc;n bảo vệ th&agrave;nh c&ocirc;ng luận văn thạc sĩ, được x&eacute;t tốt nghiệp v&agrave; cấp bằng thạc sĩ thuộc 27 chuy&ecirc;n ng&agrave;nh, trong đ&oacute; c&oacute; 3 học vi&ecirc;n đến từ nước bạn L&agrave;o (2 học vi&ecirc;n được nhận học bổng của tỉnh Thừa Thi&ecirc;n Huế, 1 học vi&ecirc;n được nhận học bổng của Trường Đại học Sư phạm, Đại học Huế).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105712_55698512_338113427058001_6334021217552433152_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường (tr&aacute;i ảnh) trao Bằng Tốt nghiệp v&agrave; Giấy khen cho T&acirc;n Tiến sĩ c&oacute; nhiều b&agrave;i b&aacute;o c&ocirc;ng bố quốc tế.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105715_56325263_790144171360454_7170335896514854912_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp v&agrave; Giấy khen cho c&aacute;c thạc sĩ l&agrave; T&acirc;n Thủ khoa ng&agrave;nh.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tại buổi lễ, PGS.TS. L&ecirc; Anh Phương - Hiệu trưởng Nh&agrave; trường đ&atilde; gửi lời ch&uacute;c mừng v&agrave; ghi nhận những nỗ lực phấn đấu trong học tập v&agrave; r&egrave;n luyện của c&aacute;c học vi&ecirc;n. Đồng thời, cũng mong c&aacute;c t&acirc;n Tiến sĩ, Thạc sĩ vận dụng những kiến thức đ&atilde; học, kết quả nghi&ecirc;n cứu v&agrave;o thực tiễn c&ocirc;ng việc để ho&agrave;n th&agrave;nh tốt nhiệm vụ được giao, g&oacute;p phần thiết thực v&agrave;o sự ph&aacute;t triển nền gi&aacute;o dục nước nh&agrave;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Nh&acirc;n dịp n&agrave;y, Trường Đại học Sư phạm, Đại học Huế tuy&ecirc;n dương khen thưởng 10 t&acirc;n Thạc sĩ thủ khoa ng&agrave;nh, 1 nghi&ecirc;n cứu sinh c&oacute; nhiều c&ocirc;ng tr&igrave;nh c&ocirc;ng bố quốc tế.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402110545_53529153_267347477536377_2684167612958507008_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Văn Thuận - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">Đại học ĐHQG TPHCM</a>&nbsp;được Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo giao nhiệm vụ đ&agrave;o tạo v&agrave; bồi dưỡng sau đại học từ năm 1991. Đ&ecirc;n nay, Trường đ&atilde; đ&agrave;o tạo được 25 kho&aacute; cao học với tr&ecirc;n 5700 học vi&ecirc;n được cấp bằng Thạc sĩ, v&agrave; 68 NCS đ&atilde; bảo vệ th&agrave;nh c&ocirc;ng luận &aacute;n v&agrave; được cấp bằng Tiến sĩ. Hiện nay, Trường đang đ&agrave;o tạo kho&aacute; 26 v&agrave; kh&oacute;a 27 với gần 950 học vi&ecirc;n cao học v&agrave; 55 NCS. Trường đ&atilde; v&agrave; đang hợp t&aacute;c với c&aacute;c trường Đại học tr&ecirc;n thế giới để đ&agrave;o tạo nhiều ng&agrave;nh ở bậc đại học v&agrave; sau đại học như: Đại học Kỹ sư quốc gia Val de Loire; Đại học Virginia-Hoa Kỳ; Trường Đại học Sư phạm Morgridge, Đại học Denver, Hoa Kỳ; Trường Cao đẳng Sư phạm Savannakhet &ndash; L&agrave;o; Đại học Quốc gia L&agrave;o; Đại học Chiao Tung - Đ&agrave;i Loan; Trường ĐH Sư phạm Hokaido, Nhật Bản.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105714_55882177_1963798160397622_2760579766963666944_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Đặc biệt, năm 2019, Trường mở mới 1 m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ&nbsp;<em>Hệ thống th&ocirc;ng tin</em>, n&acirc;ng số m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ l&ecirc;n 28 chuy&ecirc;n ng&agrave;nh v&agrave; 12 chuy&ecirc;n ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ tiến sĩ.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105713_55719465_655989801500506_9042285362273058816_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Th&agrave;nh Nh&acirc;n - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Bằng Tốt nghiệp cho t&acirc;n Thạc sĩ.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Trong thời gian tới, Trường Đại học sư phạm, Đại học Huế tiếp tục n&acirc;ng cao chất lượng đ&agrave;o tạo sau đại học; x&acirc;y dựng đề &aacute;n mở mới c&aacute;c m&atilde; ng&agrave;nh đ&agrave;o tạo tr&igrave;nh độ thạc sĩ, tiến sĩ đ&aacute;p ứng nhu cầu của x&atilde; hội; tăng cường hỗ trợ c&aacute;c địa phương kh&oacute; khăn trong đ&agrave;o tạo sau đại học thuộc khu vực Nam Bộ v&agrave; T&acirc;y Nguy&ecirc;n; đồng thời tăng cường hợp t&aacute;c quốc tế trong c&ocirc;ng t&aacute;c đ&agrave;o tạo sau đại học.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190402105710_55549709_427595797975611_7584322021740249088_n.jpg\" /></div>\r\n                    <div><em>Đại diện học vi&ecirc;n tặng hoa ch&uacute;c mừng Nh&agrave; trường nh&acirc;n dịp Lễ Tốt nghiệp v&agrave; Trao bằng Tiến sĩ, Thạc sĩ.</em></div>\r\n                    </div>\r\n                    </div>\r\n                    </div>', 1, 2, 10, 1, '2019-04-27 11:06:26', '2019-04-27 11:06:26'),
(9, 'Thông báo Tuyển sinh Nghiên cứu sinh năm 2019 của Đại học Huế', 'Đại học Huế thông báo tuyển nghiên cứu sinh năm 2019 cho 46 chuyên ngành vào các trường đại học thành viên.', '1556363474avatar.jpg', '<div style=\"text-align: center;\"><strong>Th&ocirc;ng b&aacute;o Tuyển sinh Nghi&ecirc;n cứu sinh năm 2019 của Đại học Huế</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <div>\r\n                    <div>Đại học Huế th&ocirc;ng b&aacute;o tuyển nghi&ecirc;n cứu sinh năm 2019 cho 46 chuy&ecirc;n ng&agrave;nh v&agrave;o c&aacute;c trường đại học th&agrave;nh vi&ecirc;n.</div>\r\n                    <p>Thời gian nhận hồ: Trước ng&agrave;y 15 của c&aacute;c th&aacute;ng chẵn trong năm 2019.</p>\r\n                    <p>Thời gian x&eacute;t tuyển : Trong khoảng thời gian&nbsp;<strong>10&nbsp;</strong>ng&agrave;y t&iacute;nh từ ng&agrave;y nhận hồ sơ, Đại học Huế sẽ phản hồi đến người dự tuyển c&aacute;c th&ocirc;ng tin về t&igrave;nh trạng hồ sơ v&agrave; c&aacute;c y&ecirc;u cầu điều chỉnh, bổ sung nếu hồ sơ chưa đảm bảo y&ecirc;u cầu, hoặc kế hoạch x&eacute;t tuyển đối với những hồ sơ đ&atilde; đảm bảo c&aacute;c y&ecirc;u cầu theo quy định của Hội đồng tuyển sinh.</p>\r\n                    <p>Địa điểm ph&aacute;t mẫu hồ sơ v&agrave; thu nhận hồ sơ dự tuyển: Th&iacute; sinh li&ecirc;n hệ, gửi hoặc nộp trực tiếp hồ sơ đăng k&yacute; dự tuyển cho c&aacute;c đơn vị đ&agrave;o tạo th&agrave;nh vi&ecirc;n của Đại học Huế.</p>\r\n                    <p>Chi tiết tại&nbsp;<strong><a href=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190111160630_tb_tsncs_2019.pdf\" target=\"_blank\" rel=\"noopener\">FILE Đ&Iacute;NH K&Egrave;M</a></strong></p>\r\n                    </div>\r\n                    </div>\r\n                    </div>', 1, 3, 2, 1, '2019-04-27 11:11:14', '2019-04-27 11:11:14'),
(10, '“Làm sạch biển và xây dựng môi trường xanh - sạch - sáng”', 'Ngày 28/4, Trường Đại học Sư phạm, Đại học Huế tổ chức ra quân thực hiện chiến dịch:“Làm sạch biển và xây dựng môi trường xanh - sạch - sáng” nhằm hưởng ứng Ngày Môi trường thế giới (5/6/2019).', '1556997044hinh1.jpg', '<p>\\</p>\r\n                    <div><strong>&ldquo;L&agrave;m sạch biển v&agrave; x&acirc;y dựng m&ocirc;i trường xanh - sạch - s&aacute;ng&rdquo;</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>Ng&agrave;y 28/4, Trường Đại học Sư phạm, Đại học Huế tổ chức ra qu&acirc;n thực hiện chiến dịch<strong>:&ldquo;L&agrave;m sạch biển v&agrave; x&acirc;y dựng m&ocirc;i trường xanh - sạch - s&aacute;ng&rdquo;&nbsp;</strong>nhằm hưởng ứng Ng&agrave;y M&ocirc;i trường thế giới (5/6/2019).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Tham dự c&oacute;: PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường, B&iacute; th&iacute; Đo&agrave;n Thanh ni&ecirc;n, Chủ tịch Hội sinh vi&ecirc;n, đại diện l&atilde;nh đạo c&aacute;c Ph&ograve;ng chức năng c&ugrave;ng đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường, lực lượng Bộ đội bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế, đo&agrave;n vi&ecirc;n - thanh ni&ecirc;n x&atilde; Vinh Hải.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150008_58805515_365118427458040_7960244656434839552_n.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Đ&igrave;nh Luyện - Ph&oacute; Hiệu trưởng Nh&agrave; trường (giữa ảnh) tham gia trồng c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Mở đầu chuỗi hoạt động, đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n đ&atilde; l&agrave;m vệ sinh m&ocirc;i trường, dọn r&aacute;c thải v&agrave; trồng 400 c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải, huyện Ph&uacute; Lộc, tỉnh Thừa Thi&ecirc;n Huế. Tại đ&acirc;y, Trường đ&atilde; đến thăm v&agrave; tặng qu&agrave; cho c&aacute;c hộ gia đ&igrave;nh ch&iacute;nh s&aacute;ch, hộ ngh&egrave;o; thăm v&agrave; l&agrave;m việc với Đồn bi&ecirc;n ph&ograve;ng Vinh Hiền thuộc Bộ đội Bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Song song với đ&oacute;, Trường tặng b&igrave;nh nước sử dụng nhiều lần cho học sinh tiểu học, trung học cơ sở tr&ecirc;n địa bản th&agrave;nh phố Huế; tặng t&uacute;i x&aacute;ch sử dụng nhiều lần cho nh&acirc;n d&acirc;n nhằm tuy&ecirc;n truyền về t&aacute;c hại của t&uacute;i nilon.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150009_59301578_438758306928169_818123529663807488_n.jpg\" /></div>\r\n                    <div><em>Đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường tham gia dọn r&aacute;c.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150007_57427485_999485960260501_5657443085362135040_n.jpg\" /></div>\r\n                    <div><em>Đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n trồng c&acirc;y xanh chống x&oacute;i m&ograve;n, sạt lở bờ biển khu vực biển tại x&atilde; Vinh Hải</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Hưởng ứng lời l&ecirc;u gọi của Chủ tịch Tỉnh Thừa Thi&ecirc;n Huế Phan Ngọc Thọ &ldquo;H&atilde;y h&agrave;nh động để Thừa Thi&ecirc;n Huế xanh - sạch - s&aacute;ng&rdquo;, Chủ nhật hằng tuần, đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n tiến h&agrave;nh vệ sinh khu&ocirc;n vi&ecirc;n s&acirc;n trường, ph&ograve;ng học, giảng đường tại cơ sở 1 (34 L&ecirc; Lợi, Tp Huế) v&agrave; cơ sở 2 (đường V&otilde; Văn Kiệt, Tp Huế).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Th&ocirc;ng qua chuỗi hoạt động &yacute; nghĩa đ&oacute; gi&uacute;p n&acirc;ng cao nhận thức v&agrave; tr&aacute;ch nhiệm của đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n v&agrave; cộng đồng đối với c&ocirc;ng t&aacute;c vệ sinh m&ocirc;i trường, giải quyết &ocirc; nhiễm nhựa v&agrave; nilon, thu gom xử l&yacute; chất thải, r&aacute;c thải, vệ sinh nguồn nước, ứng ph&oacute; với biến đổi kh&iacute; hậu, &ocirc; nhiễm kh&ocirc;ng kh&iacute;, g&oacute;p phần n&acirc;ng cao chất lượng cuộc sống. Vận động đo&agrave;n vi&ecirc;n sinh vi&ecirc;n tham gia hoạt động vệ sinh m&ocirc;i trường, tuy&ecirc;n truyền cho nh&acirc;n d&acirc;n để x&acirc;y dựng c&aacute;c phong tr&agrave;o vệ sinh m&ocirc;i trường rộng khắp ở khu d&acirc;n cư.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190502150007_58728074_433368754089220_8351890011053883392_n.jpg\" /></div>\r\n                    <div><em>Bộ đội bi&ecirc;n ph&ograve;ng tỉnh Thừa Thi&ecirc;n Huế, đo&agrave;n vi&ecirc;n - thanh ni&ecirc;n x&atilde; Vinh Hải v&agrave; đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Trường dọn r&aacute;c tại b&atilde;i biến Vinh Hải.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Sau khi tham gia chuỗi hoạt động, sinh vi&ecirc;n Trần Thị Na - lớp Văn 2 chia sẻ: &ldquo;Em hi vọng, với niềm tin v&agrave; nhiệt huyết của tuổi trẻ, ch&uacute;ng em sẽ gi&uacute;p m&ocirc;i trường sống kh&ocirc;ng chỉ sạch h&ocirc;m nay m&agrave; hơn hết sẽ đ&aacute;nh thức được &yacute; thức, tr&aacute;ch nhiệm của người d&acirc;n để bảo vệ m&ocirc;i trường sống &nbsp;ng&agrave;y c&agrave;ng xanh - sạch - s&aacute;ng&rdquo;.</p>\r\n                    </div>\r\n                    <div><em>ĐHSP, ảnh Nguyễn Văn Quang</em></div>\r\n                    </div>\r\n                    <p style=\"text-align: center;\"><br /><br /></p>', 1, 0, 5, 1, '2019-05-04 19:10:44', '2019-05-04 19:10:44');
INSERT INTO `tin_tucs` (`id`, `tieude`, `mota`, `hinhdaidien`, `noidung`, `noibat`, `luotxem`, `id_loaitin`, `id_user`, `created_at`, `updated_at`) VALUES
(11, 'Tưng bừng Hội trại nghiệp vụ Trường Đại học Sư phạm, Đại học Huế', 'Hòa chung không khí tuổi trẻ cả nước chào mừng 88 năm ngày Thành lập Đoàn Thanh niên Cộng sản Hồ Chí Minh, 44 năm giải phóng quê hương Thừa Thiên Huế và Tháng thanh niên năm 2019, trong hai ngày 23-24/3/2019, tại Cơ sở 2 đường Võ Văn Kiệt, Trường Đại học Sư phạm, Đại học Huế tổ chức Hội trại nghiệp vụ với chủ đề “Tuổi trẻ Trường Đại học Sư phạm, Đại học Huế tiếp lửa truyền thống, dựng xây tương lai”.', '1556997150hinh2.jpg', '<div><strong>Tưng bừng Hội trại nghiệp vụ Trường Đại học Sư phạm, Đại học Huế</strong></div>\r\n                    <div id=\"PAGE1\">\r\n                    <div>\r\n                    <p>H&ograve;a chung kh&ocirc;ng kh&iacute; tuổi trẻ cả nước ch&agrave;o mừng 88 năm ng&agrave;y Th&agrave;nh lập Đo&agrave;n Thanh ni&ecirc;n Cộng sản Hồ Ch&iacute; Minh, 44 năm giải ph&oacute;ng qu&ecirc; hương Thừa Thi&ecirc;n Huế v&agrave; Th&aacute;ng thanh ni&ecirc;n năm 2019, trong hai ng&agrave;y 23-24/3/2019, tại Cơ sở 2 đường V&otilde; Văn Kiệt, Trường Đại học Sư phạm, Đại học Huế tổ chức Hội trại nghiệp vụ với chủ đề &ldquo;Tuổi trẻ Trường Đại học Sư phạm, Đại học Huế tiếp lửa truyền thống, dựng x&acirc;y tương lai&rdquo;.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083144_img_0420.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083145_img_0435.jpg\" /></div>\r\n                    <div><em>Đồng diễn d&acirc;n vũ với sự tham gia của h&agrave;ng trăm đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n tạo kh&ocirc;ng khi s&ocirc;i động của Hội trại.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Hội trại thu h&uacute;t đ&ocirc;ng đảo đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n v&agrave; học sinh Trường THPT Thuận H&oacute;a tham gia, với nhiều hoạt động &yacute; nghĩa: &nbsp;Hội thi trang tr&iacute; trại v&agrave; gian h&agrave;ng; tr&ograve; chơi lớn &ldquo;Tuổi trẻ ĐHQG TPHCM với h&agrave;nh tr&igrave;nh giải ph&oacute;ng qu&ecirc; hương&rdquo;; k&eacute;o co nam nữ, d&acirc;n vũ - vũ kh&uacute;c thanh ni&ecirc;n &ldquo;Sẻ chia từng khoảnh khắc&rdquo;; gala văn nghệ Giai điệu th&aacute;ng 3 v&agrave; hội thi Nghiệp vụ c&aacute;n bộ Đo&agrave;n (ng&agrave;y 17/3).</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Ở mỗi phần thi thể hiện sự năng động, s&aacute;ng tạo v&agrave; t&agrave;i năng của đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n Nh&agrave; trường. Qua đ&oacute; g&oacute;p phần r&egrave;n luyện kỹ năng mềm, kỹ năng hoạt động Đo&agrave;n v&agrave; c&aacute;c bộ m&ocirc;n hoạt động thanh ni&ecirc;n cho đo&agrave;n vi&ecirc;n - sinh vi&ecirc;n v&agrave; học sinh Trường.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Kết th&uacute;c Hội trại, Ban Tổ chức trao Giải to&agrave;n đo&agrave;n cho c&aacute;c Li&ecirc;n Chi đo&agrave;n: Khoa H&oacute;a học &ndash; Giải Nhất; &nbsp;Khoa Gi&aacute;o dục Mầm non v&agrave; Gi&aacute;o dục Ch&iacute;nh trị - Giải Nh&igrave;; Khoa Gi&aacute;o dục Tiểu học, Khoa To&aacute;n học v&agrave; Trường THPT Thuận H&oacute;a - Giải Ba.</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>Chi tiết Giải:</p>\r\n                    <table border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tbody>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\"><strong>STT</strong></p>\r\n                    </td>\r\n                    <td>\r\n                    <p align=\"center\"><strong>Nội dung</strong></p>\r\n                    </td>\r\n                    <td>\r\n                    <p align=\"center\"><strong>Giải Nhất</strong></p>\r\n                    </td>\r\n                    <td>\r\n                    <p align=\"center\"><strong>Giải Nh&igrave;</strong></p>\r\n                    </td>\r\n                    <td>\r\n                    <p align=\"center\"><strong>Giải Ba</strong></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">1</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>Cổng trại</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDTH</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDCT</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa H&oacute;a học</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">2</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>Trại ch&iacute;nh</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDCT</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa H&oacute;a học</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa Ngữ văn</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">3</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>Gian h&agrave;ng</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa H&oacute;a học</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa Ngữ văn</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDTH</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">4</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>D&acirc;n vũ</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDTH</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa Ngữ văn</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa TLGD</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">5</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>H&oacute;a trang</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDMN</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>THPT Thuận H&oacute;a</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa H&oacute;a học</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">6</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>K&eacute;o co nữ</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDMN</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>THPT Thuận H&oacute;a</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDCT</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    <tr>\r\n                    <td>\r\n                    <p align=\"center\">7</p>\r\n                    </td>\r\n                    <td>\r\n                    <p>Tr&ograve; chơi lớn</p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa GDMN</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa TLGD</em></p>\r\n                    </td>\r\n                    <td>\r\n                    <p><em>Khoa Sinh học</em></p>\r\n                    </td>\r\n                    </tr>\r\n                    </tbody>\r\n                    </table>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083125_30.jpg\" /></div>\r\n                    <div><em>PGS.TS. Nguyễn Văn Thuận (phải ảnh) v&agrave; PGS.TS. Nguyến Đ&igrave;nh Luyện (tr&aacute;i ảnh) - Ph&oacute; Hiệu trưởng Nh&agrave; trường trao Giải Nhất, Giải Nh&igrave; to&agrave;n đo&agrave;n cho c&aacute;c Li&ecirc;n Chi đo&agrave;n.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083125_31.jpg\" /></div>\r\n                    <div><em>Đ/c Nguyến Mạnh Quyền - Ph&oacute; B&iacute; thư Đo&agrave;n trường (phải ảnh) trao Giải Ba to&agrave;n đo&agrave;n cho c&aacute;c Li&ecirc;n Chi đo&agrave;n.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083145_img_0449.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083146_img_0454.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083147_img_0472.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083147_img_0474.jpg\" /></div>\r\n                    <div><em>D&acirc;n vũ - vũ kh&uacute;c thanh ni&ecirc;n &ldquo;Sẻ chia từng khoảnh khắc&rdquo; thể hiện sự s&aacute;ng tạo v&agrave; năng động của học sinh, sinh vi&ecirc;n ĐHQG TPHCM.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083141_img_0404.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083139_img_0395.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083140_img_0399.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083142_img_0406.jpg\" /></div>\r\n                    <div><em>Kh&ocirc;ng gian ngập tr&agrave;n sắc m&agrave;u tuổi trẻ với những cổng trại v&agrave; gian h&agrave;ng được trang tr&iacute; bắt mắt.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083115_4.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083114_2.jpg\" /></div>\r\n                    <div><em>C&aacute;c Li&ecirc;n Chi đo&agrave;n h&agrave;o hứng tham gia tr&ograve; chơi k&eacute;o co.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083116_6.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083120_19.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083118_13.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083120_21.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083123_25.jpg\" /></div>\r\n                    <div><em>Đ&ecirc;m Gala \"Giai điệu th&aacute;ng 3\" l&agrave; điểm nhấn của Hội trại khi c&aacute;c t&agrave;i năng sinh vi&ecirc;n được thể hiện qua c&aacute;c tiết mục nhảy hiện đại, đơn ca, tốp ca v&agrave; tr&igrave;nh diễn thời trang.</em></div>\r\n                    </div>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <p><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083131_44.jpg\" /></p>\r\n                    <p>&nbsp;</p>\r\n                    <p>&nbsp;</p>\r\n                    <div>\r\n                    <div><img style=\"width: 512px;\" src=\"http://www.dhsphue.edu.vn/media/db_tintuc/20190325083130_43.jpg\" /></div>\r\n                    <div><em>Ngọn lửa thanh ni&ecirc;n ch&aacute;y rực trong đ&ecirc;m lửa trại.</em></div>\r\n                    </div>\r\n                    </div>\r\n                    </div>', 1, 1, 5, 1, '2019-05-04 19:12:30', '2019-05-04 19:12:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_chus`
--

CREATE TABLE `trang_chus` (
  `id` int(10) UNSIGNED NOT NULL,
  `gioithieu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trang_chus`
--

INSERT INTO `trang_chus` (`id`, `gioithieu`, `created_at`, `updated_at`) VALUES
(1, '<div><strong>Giới thiệu</strong></div>\r\n            <div id=\"PAGE1\">\r\n            <div>\r\n            <p>Khoa Tin học Trường&nbsp;<a href=\"http://www.huce.vn/\" target=\"_blank\" rel=\"noopener\">Đại học ĐHQG TPHCM</a>&nbsp;được ch&iacute;nh thức th&agrave;nh lập v&agrave;o ng&agrave;y 15 th&aacute;ng 12 năm 1999 theo quyết định của Đại Học Huế số 398/QĐ-ĐHH-TCNS ng&agrave;y 10 th&aacute;ng 12 năm 1999 m&agrave; tiền th&acirc;n l&agrave; Bộ m&ocirc;n Tin học được th&agrave;nh lập theo quyết định số 09/QĐ-TC ng&agrave;y 8 th&aacute;ng 3 năm 1996 của Ban Gi&aacute;m hiệu trường&nbsp;<a href=\"http://www.huce.vn/\" target=\"_blank\" rel=\"noopener\">ĐHSP Huế</a>.</p>\r\n            <p>Trải qua&nbsp;hơn 20 năm x&acirc;y dựng v&agrave; ph&aacute;t triển, với nhiệm vụ Đ&agrave;o tạo gi&aacute;o vi&ecirc;n Tin học, đến nay Khoa Tin học đ&atilde; lớn mạnh về nhiều mặt từ đội ngũ c&aacute;n bộ&nbsp;giảng dạy&nbsp;đến qui m&ocirc; đ&agrave;o tạo, nghi&ecirc;n cứu khoa học v&agrave; chất lượng đ&agrave;o tạo được x&atilde; hội đ&aacute;nh gi&aacute; cao.</p>\r\n            <p>Bước đ&acirc;̀u thành l&acirc;̣p, B&ocirc;̣ m&ocirc;n Tin học với 8 cán b&ocirc;̣, đ&ecirc;́n nay, Khoa Tin học c&oacute;&nbsp;Khoa hi&ecirc;n c&oacute; 17 giảng vi&ecirc;n cơ hữu, 5 giảng vi&ecirc;n sinh hoạt chuy&ecirc;n m&ocirc;n ở Khoa, 4 nghi&ecirc;n cứu vi&ecirc;n. Với 6 tiến sĩ v&agrave; 20 thạc sĩ. Năm học n&agrave;y Khoa đ&atilde; c&oacute; một NCS bảo vệ th&agrave;nh c&ocirc;ng lu&acirc;n &aacute;n Tiến sĩ, một NCV tốt nghiệp Thac sĩ. Giảng vi&ecirc;n được đ&agrave;o tạo c&oacute; hệ thống, c&oacute; truyền thống nghi&ecirc;m t&uacute;c trong giảng dạy v&agrave; nghi&ecirc;n cứu khoa học; c&oacute; mối quan hệ,&nbsp;trao đổi chuy&ecirc;n m&ocirc;n với nhiều trung t&acirc;m nghi&ecirc;n cứu&nbsp;tin học v&agrave; trung t&acirc;m nghi&ecirc;n cứu gi&aacute;o dục&nbsp;ở tr&ecirc;n toàn qu&ocirc;́c.</p>\r\n            <p>Trong những năm gần đ&acirc;y, Khoa Tin học kh&ocirc;ng ngừng n&acirc;ng cao chất lượng dạy v&agrave; học để g&oacute;p phần cung cấp nguồn nh&acirc;n lực chất lượng cao cho c&aacute;c cơ sở gi&aacute;o dục v&agrave; c&aacute;c c&ocirc;ng ty phần mềm. Với những cố gắng vượt bậc của đội ngũ giảng vi&ecirc;n, nh&acirc;n vi&ecirc;n v&agrave; c&aacute;c sinh vi&ecirc;n, khoa Tin học đ&atilde; c&oacute; những bước ph&aacute;t triển mạnh mẽ. Khoa lu&ocirc;n x&aacute;c định v&agrave; tập trung v&agrave;o 4 nh&acirc;n tố ch&iacute;nh l&agrave;&nbsp;<strong>Cơ sở vật chất, chương tr&igrave;nh đ&agrave;o tạo, chất lượng đội ngũ v&agrave; th&aacute;i độ sinh vi&ecirc;n</strong>&nbsp;để n&acirc;ng cao chất lượng đ&agrave;o tạo v&agrave; điều chỉnh, x&acirc;y dựng c&aacute;c giải ph&aacute;p ph&aacute;t triển.</p>\r\n            <p><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc1.jpg\" /></p>\r\n            <p>Đội ngũ giảng vi&ecirc;n của Khoa t&iacute;ch cực tham gia nghi&ecirc;n cứu khoa học. Khoa đ&atilde; tổ chức&nbsp;<strong>c&aacute;c hội thảo Quốc tế SoICT 2015 v&agrave; KSE2017 v&agrave; Hội thảo Quốc gia 2018</strong>. Tr&ecirc;n lĩnh vực hoạt động giao lưu học thuật, sinh vi&ecirc;n của khoa cũng đ&atilde; đạt được&nbsp;<strong>nhiều giải thưởng tại c&aacute;c cuộc thi Olympic sinh vi&ecirc;n to&agrave;n quốc</strong>.</p>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/soit.jpg\" /></div>\r\n            <div class=\"adm-image-thumbnail\"><em><strong>Hội thảo Quốc tế SoICT 2015</strong></em></div>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/kse.jpg\" /></div>\r\n            <div class=\"adm-image-thumbnail\"><em><strong>Hội thảo Quốc tế KSE 2017</strong></em></div>\r\n            <p>&nbsp;</p>\r\n            <p>C&aacute;c hoạt động văn h&oacute;a văn nghệ thể dục thể thao của sinh vi&ecirc;n cũng được Khoa quan t&acirc;m v&agrave; sự tham gia nhiệt t&igrave;nh của sinh vi&ecirc;n.</p>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc3.jpg\" /></div>\r\n            <p>Năm học vừa qua đội b&oacute;ng đ&aacute; nữ sinh vi&ecirc;n của khoa đạt giải nhất trong giải b&oacute;ng đ&aacute; truyền thống sinh vi&ecirc;n Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">ĐHSP Huế</a>.</p>\r\n            <div class=\"adm-image-thumbnail\">\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc4.jpg\" /></div>\r\n            </div>\r\n            <p>Đội b&oacute;ng chuyền c&aacute;n bộ Khoa đạt giải nh&igrave; trong giải b&oacute;ng chuyền truyền thống C&aacute;n bộ vi&ecirc;n chức trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">ĐHSP Huế</a></p>\r\n            <div class=\"adm-image-thumbnail\">\r\n            <div class=\"adm-image-thumbnail\">\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc5.jpg\" /></div>\r\n            </div>\r\n            </div>\r\n            <p>Đội b&oacute;ng chuyền nam đạt giải nh&igrave; trong giải b&oacute;ng chuyền sinh vi&ecirc;n Trường&nbsp;<a href=\"http://www.dhsphue.edu.vn/\" target=\"_blank\" rel=\"noopener\">ĐHSP Huế</a></p>\r\n            <p><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/bong_chuyen_sv.jpg\" /></p>\r\n            <p>Sinh vi&ecirc;n của cũng được ch&uacute; trọng r&egrave;n luyện nghiệp vụ sư phạm v&agrave; c&aacute;c kỹ năng mềm</p>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc6.jpg\" /></div>\r\n            <p><em><strong>Trại Nghiệp vụ 26-03</strong></em></p>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinhoc7.jpg\" /></div>\r\n            <div class=\"adm-image-thumbnail\"><em><strong>Hội thi Nghiệp vụ Sư phạm cấp Khoa</strong></em></div>\r\n            <p>&nbsp;</p>\r\n            <p>B&ecirc;n cạnh nhiệm vụ học tập sinh vi&ecirc;n c&ograve;n tham gia c&aacute;c hoạt động thiện nguyện (lớp học t&igrave;nh thương Ph&uacute; c&aacute;t) v&agrave; c&aacute;c hoạt động t&igrave;nh nguyện</p>\r\n            <div class=\"adm-image-thumbnail\"><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/tinh_thuong.jpg\" /></div>\r\n            <p>Sinh vi&ecirc;n của Khoa sau khi tốt nghiệp rất nhiều cơ hội về việc l&agrave;m, ngo&agrave;i việc l&agrave;m tại c&aacute;c cơ sở gi&aacute;o dục c&ograve;n một nguồn lớn c&aacute;c cơ hội từ c&aacute;c c&ocirc;ng ty phần mềm. M&ocirc;n Tin học trở th&agrave;nh một m&ocirc;n học ch&iacute;nh trong chương tr&igrave;nh gi&aacute;o dục Phổ th&ocirc;ng mới cũng tạo điều kiện thuận lợi về cơ h&ocirc;i việc l&agrave;m cho sinh viện của Khoa trong những năm sắp đến.</p>\r\n            <p><img class=\"magnify\" src=\"http://www.dhsphue.edu.vn/media/db_html_cmp_3102/auto_extract_files/gameloft.jpg\" /></p>\r\n            <p>Trong những năm ti&ecirc;p theo, Khoa phấn đấu l&agrave; đơn vị đ&agrave;o tạo gi&aacute;o vi&ecirc;n Tin học chất lượng của v&ugrave;ng Duy&ecirc;n Hải miền Trung v&agrave; cả nước, th&agrave;nh lập 2 nh&oacute;m nghi&ecirc;n cứu mạnh để nghi&ecirc;n cứu v&agrave; chuyển giao c&ocirc;ng nghệ trong lĩnh vực CNTT. Tiếp tục ph&aacute;t triển đội ngũ c&oacute; tr&igrave;nh độ cao. Năm 2018 Khoa sẽ bắt đầu đ&agrave;o tạo Thạc sĩ chuy&ecirc;n ng&agrave;nh Hệ thống th&ocirc;ng tin.</p>\r\n            </div>\r\n            </div>', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `viewname`, `email`, `email_verified_at`, `password`, `permission`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Huỳnh Văn Thùy', 'huynhvanthuy1997@gmail.com', NULL, '$2y$10$OyVSUVllWXWKEZZnnt3DyultgEBwcKNvk6ayVwZsNnjSd5hQLc7Ga', 'Admin', 'avatar.jpg', 'pQHIjoifkBuEylYPYksY4Cs0NCmNKcTBawX48AK4XWzl5D6tB2aqvlQYBt3S', NULL, NULL),
(2, 'sinhvien', 'Sinh Viên', 'sinhvien@gmail.com', NULL, '$2y$10$KhrcPw.79GtRYnQGyj8n8e.2G9onQ2o3jl.u1DDGCoGEYUjZEB0yC', 'SinhVien', 'avatar.jpg', NULL, NULL, NULL),
(3, 'giangvien', 'Giảng Viên', 'giangvien@gmail.com', NULL, '$2y$10$nza1bxbZrH55w5nH5UPs1Odukk7Z6lBZEz9iXsA8OuYNmJ8QGQE8q', 'GiangVien', 'avatar.jpg', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binh_luans_id_user_foreign` (`id_user`),
  ADD KEY `binh_luans_id_tintuc_foreign` (`id_tintuc`);

--
-- Chỉ mục cho bảng `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chi_tiet_binh_luans_id_binhluan_foreign` (`id_binhluan`),
  ADD KEY `chi_tiet_binh_luans_id_user_foreign` (`id_user`);

--
-- Chỉ mục cho bảng `hop_thus`
--
ALTER TABLE `hop_thus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_kets`
--
ALTER TABLE `lien_kets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loai_tins`
--
ALTER TABLE `loai_tins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loai_tins_id_theloai_foreign` (`id_theloai`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `the_loais`
--
ALTER TABLE `the_loais`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thong_baos`
--
ALTER TABLE `thong_baos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tin_tucs_id_loaitin_foreign` (`id_loaitin`),
  ADD KEY `tin_tucs_id_user_foreign` (`id_user`);

--
-- Chỉ mục cho bảng `trang_chus`
--
ALTER TABLE `trang_chus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hop_thus`
--
ALTER TABLE `hop_thus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `lien_kets`
--
ALTER TABLE `lien_kets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `loai_tins`
--
ALTER TABLE `loai_tins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `the_loais`
--
ALTER TABLE `the_loais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `thong_baos`
--
ALTER TABLE `thong_baos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `trang_chus`
--
ALTER TABLE `trang_chus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD CONSTRAINT `binh_luans_id_tintuc_foreign` FOREIGN KEY (`id_tintuc`) REFERENCES `tin_tucs` (`id`),
  ADD CONSTRAINT `binh_luans_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `chi_tiet_binh_luans`
--
ALTER TABLE `chi_tiet_binh_luans`
  ADD CONSTRAINT `chi_tiet_binh_luans_id_binhluan_foreign` FOREIGN KEY (`id_binhluan`) REFERENCES `binh_luans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chi_tiet_binh_luans_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `loai_tins`
--
ALTER TABLE `loai_tins`
  ADD CONSTRAINT `loai_tins_id_theloai_foreign` FOREIGN KEY (`id_theloai`) REFERENCES `the_loais` (`id`);

--
-- Các ràng buộc cho bảng `tin_tucs`
--
ALTER TABLE `tin_tucs`
  ADD CONSTRAINT `tin_tucs_id_loaitin_foreign` FOREIGN KEY (`id_loaitin`) REFERENCES `loai_tins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tin_tucs_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
