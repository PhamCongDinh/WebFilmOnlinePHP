-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 17, 2024 lúc 11:17 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webphimonline`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `ID` int(11) NOT NULL,
  `NoiDung` varchar(50) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `ID_TapPhim` int(11) NOT NULL,
  `ID_TK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`ID`, `NoiDung`, `ThoiGian`, `ID_TapPhim`, `ID_TK`) VALUES
(17, 'phim rất là hay', '2024-05-17 09:56:41', 43, 1),
(18, 'phim hay', '2024-06-12 14:11:35', 43, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethdn`
--

CREATE TABLE `chitiethdn` (
  `ID` int(11) NOT NULL,
  `GiaPhim` int(11) DEFAULT NULL,
  `ID_PNK` int(11) DEFAULT NULL,
  `ID_TapPhim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethdn`
--

INSERT INTO `chitiethdn` (`ID`, `GiaPhim`, `ID_PNK`, `ID_TapPhim`) VALUES
(31, 10000, 28, 29),
(32, 10000, 29, 30),
(33, 10000, 30, 31),
(34, 10000, 31, 32),
(35, 10000, 31, 33),
(36, 10000, 31, 34),
(37, 10000, 31, 35),
(38, 10000, 32, 36),
(39, 10000, 32, 37),
(40, 10000, 32, 38),
(41, 10000, 32, 39),
(42, 10000, 32, 40),
(43, 10000, 32, 41),
(44, 10000, 32, 42),
(45, 10000, 33, 43),
(46, 10000, 33, 44),
(47, 10000, 33, 45),
(48, 10000, 33, 46),
(49, 10000, 34, 47),
(50, 10000, 34, 48),
(51, 10000, 34, 49),
(52, 10000, 34, 50),
(53, 10000, 34, 51),
(54, 10000, 35, 52),
(55, 10000, 35, 53),
(56, 10000, 36, 54),
(57, 10000, 36, 55),
(59, 10000, 37, 57),
(60, 10000, 37, 58),
(61, 10000, 38, 59),
(62, 10000, 38, 60),
(63, 10000, 39, 61),
(65, 10000000, 45, 63),
(66, 10000000, 45, 64),
(67, 10000000, 47, 65),
(68, 10000000, 47, 66),
(69, 11111110, 51, 67);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `ID` int(11) NOT NULL,
  `SoDiem` float DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `ID_TapPhim` int(11) NOT NULL,
  `ID_TK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`ID`, `SoDiem`, `ThoiGian`, `ID_TapPhim`, `ID_TK`) VALUES
(15, 3.5, '2024-06-16 09:25:58', 43, 1),
(16, 5, '2024-05-29 11:21:25', 44, 1),
(17, 3.5, '2024-06-12 14:11:26', 43, 15),
(18, 2.5, '2024-06-16 09:27:37', 29, 1);

--
-- Bẫy `danhgia`
--
DELIMITER $$
CREATE TRIGGER `trg_insert_danhgia_tapphim` AFTER INSERT ON `danhgia` FOR EACH ROW BEGIN
    DECLARE avg_rating FLOAT;

    -- Tính toán trung bình cộng của SoDiem từ bảng DanhGia cho ID_TapPhim cụ thể
    SELECT AVG(SoDiem) INTO avg_rating
    FROM danhgia
    WHERE ID_TapPhim = NEW.ID_TapPhim;

    -- Cập nhật trường DanhGia của bảng TapPhim
    UPDATE tapphim
    SET DanhGia = avg_rating
    WHERE ID = NEW.ID_TapPhim;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_update_danhgia_tapphim` AFTER UPDATE ON `danhgia` FOR EACH ROW BEGIN
    DECLARE avg_rating FLOAT;

    -- Tính toán trung bình cộng của SoDiem từ bảng DanhGia cho ID_TapPhim cụ thể
    SELECT AVG(SoDiem) INTO avg_rating
    FROM danhgia
    WHERE ID_TapPhim = NEW.ID_TapPhim;

    -- Cập nhật trường DanhGia của bảng TapPhim
    UPDATE tapphim
    SET DanhGia = avg_rating
    WHERE ID = NEW.ID_TapPhim;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangphim`
--

CREATE TABLE `hangphim` (
  `ID` int(11) NOT NULL,
  `Ten_HangPhim` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangphim`
--

INSERT INTO `hangphim` (`ID`, `Ten_HangPhim`) VALUES
(1, 'Trung Quốc'),
(2, 'Nhật Bản'),
(3, 'Mỹ'),
(4, 'Anh'),
(5, 'Thái Lan'),
(6, 'Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `ID` varchar(255) NOT NULL,
  `SoTien` int(11) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `ID_TK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`ID`, `SoTien`, `create_at`, `ID_TK`) VALUES
('1712889698', 10000, '2024-04-16 14:54:20', 13),
('1718164902', 10000, '2024-06-12 11:05:55', 15),
('1718176694', 10000, '2024-06-12 14:19:33', 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonnhap`
--

CREATE TABLE `hoadonnhap` (
  `ID` int(11) NOT NULL,
  `NgayNhap` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadonnhap`
--

INSERT INTO `hoadonnhap` (`ID`, `NgayNhap`) VALUES
(27, '2024-05-16 15:45:14'),
(28, '2024-05-16 15:50:51'),
(29, '2024-05-16 15:52:25'),
(30, '2024-05-16 15:53:01'),
(31, '2024-05-16 15:55:46'),
(32, '2024-05-16 16:06:27'),
(33, '2024-05-16 16:10:44'),
(34, '2024-05-16 16:15:35'),
(35, '2024-05-16 17:06:35'),
(36, '2024-05-16 17:10:03'),
(37, '2024-06-11 16:03:54'),
(38, '2024-06-11 16:54:12'),
(39, '2024-06-11 17:01:19'),
(45, '2024-06-16 10:17:01'),
(47, '2024-06-16 10:18:24'),
(48, '2024-06-17 10:45:21'),
(49, '2024-06-17 10:47:06'),
(50, '2024-06-17 10:49:34'),
(51, '2024-06-17 10:50:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsuphim`
--

CREATE TABLE `lichsuphim` (
  `ID` int(11) NOT NULL,
  `ID_Tapphim` int(11) DEFAULT NULL,
  `ID_TK` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsuphim`
--

INSERT INTO `lichsuphim` (`ID`, `ID_Tapphim`, `ID_TK`, `create_at`) VALUES
(22, 43, 1, '2024-05-17 09:55:28'),
(23, 29, 1, '2024-05-17 10:01:19'),
(24, 29, 1, '2024-05-17 10:01:35'),
(25, 54, 1, '2024-05-17 10:01:48'),
(26, NULL, 1, '2024-05-18 23:39:56'),
(27, NULL, 1, '2024-05-29 10:53:41'),
(28, 43, 1, '2024-05-29 11:00:57'),
(29, 44, 1, '2024-05-29 11:01:16'),
(30, 43, 1, '2024-05-29 11:05:53'),
(31, 43, 1, '2024-05-29 11:24:06'),
(32, 43, 1, '2024-05-29 11:24:10'),
(33, 44, 1, '2024-05-29 11:24:10'),
(34, 43, 1, '2024-05-29 11:25:12'),
(35, NULL, 1, '2024-06-04 23:14:21'),
(36, NULL, 1, '2024-06-04 23:14:32'),
(37, NULL, 1, '2024-06-04 23:14:45'),
(38, NULL, 1, '2024-06-04 23:15:15'),
(39, NULL, 1, '2024-06-04 23:16:14'),
(40, NULL, 1, '2024-06-04 23:16:31'),
(41, NULL, 1, '2024-06-04 23:16:58'),
(42, NULL, 1, '2024-06-04 23:17:04'),
(43, NULL, 1, '2024-06-04 23:20:53'),
(44, 36, NULL, '2024-06-04 23:21:48'),
(45, 36, 1, '2024-06-04 23:22:24'),
(46, NULL, 1, '2024-06-11 15:39:05'),
(47, NULL, 1, '2024-06-11 15:39:48'),
(48, 43, 1, '2024-06-11 15:40:07'),
(49, 47, 1, '2024-06-11 15:41:10'),
(50, 47, 1, '2024-06-11 16:04:16'),
(51, 57, 1, '2024-06-11 16:05:53'),
(52, 57, 1, '2024-06-11 17:01:35'),
(53, 61, NULL, '2024-06-11 17:06:56'),
(54, NULL, 15, '2024-06-12 13:56:42'),
(55, 43, 15, '2024-06-12 13:59:52'),
(56, NULL, 15, '2024-06-12 14:07:16'),
(57, 43, 15, '2024-06-12 14:10:53'),
(58, 43, 15, '2024-06-12 14:15:11'),
(59, NULL, 1, '2024-06-13 14:22:48'),
(60, 43, 1, '2024-06-13 14:38:43'),
(61, 43, 1, '2024-06-13 14:39:17'),
(62, 43, 1, '2024-06-13 14:40:48'),
(63, 43, 1, '2024-06-13 14:42:00'),
(64, 43, 1, '2024-06-13 14:42:58'),
(65, 43, 1, '2024-06-13 14:43:34'),
(66, 29, 1, '2024-06-13 14:46:10'),
(67, 29, 1, '2024-06-13 14:46:18'),
(68, 29, 1, '2024-06-13 14:47:51'),
(69, 29, 1, '2024-06-13 14:47:56'),
(70, 29, 1, '2024-06-13 14:48:02'),
(71, 29, 1, '2024-06-13 14:48:05'),
(72, 29, 1, '2024-06-13 14:48:10'),
(73, 29, 1, '2024-06-13 14:48:14'),
(74, 29, 1, '2024-06-13 14:49:05'),
(75, 29, 1, '2024-06-13 14:50:06'),
(76, 29, 1, '2024-06-13 14:50:12'),
(77, 29, 1, '2024-06-13 14:54:31'),
(78, 29, 1, '2024-06-13 14:54:40'),
(79, 29, 1, '2024-06-13 14:55:19'),
(80, 29, 1, '2024-06-13 14:56:04'),
(81, 29, 1, '2024-06-13 14:56:13'),
(82, 29, 1, '2024-06-13 14:56:34'),
(83, 29, 1, '2024-06-13 14:56:39'),
(84, 29, 1, '2024-06-13 14:57:14'),
(85, 29, 1, '2024-06-13 14:58:52'),
(86, 29, 1, '2024-06-13 14:59:17'),
(87, 29, 1, '2024-06-13 15:00:13'),
(88, 29, 1, '2024-06-13 15:00:40'),
(89, 29, 1, '2024-06-13 15:00:54'),
(90, 29, 1, '2024-06-13 15:01:58'),
(91, 29, 1, '2024-06-13 15:02:28'),
(92, 36, 1, '2024-06-13 15:02:35'),
(93, 36, 1, '2024-06-13 15:03:04'),
(94, 36, 1, '2024-06-13 15:03:19'),
(95, 43, 1, '2024-06-13 15:03:35'),
(96, 29, 1, '2024-06-13 15:04:04'),
(97, 29, 1, '2024-06-13 15:04:14'),
(98, 29, 1, '2024-06-13 15:04:25'),
(99, 30, 1, '2024-06-13 15:04:30'),
(100, NULL, 1, '2024-06-16 09:25:34'),
(101, 43, 1, '2024-06-16 09:26:05'),
(102, 43, 1, '2024-06-16 09:27:32'),
(103, 29, 1, '2024-06-16 09:27:40'),
(104, 29, 1, '2024-06-16 10:00:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaiphim`
--

CREATE TABLE `loaiphim` (
  `ID` int(11) NOT NULL,
  `Ten_LP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaiphim`
--

INSERT INTO `loaiphim` (`ID`, `Ten_LP`) VALUES
(1, 'Tu Tiên'),
(2, 'Trùng sinh'),
(3, 'Anime'),
(4, 'Hiện đại'),
(5, 'cổ trang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phim`
--

CREATE TABLE `phim` (
  `ID` int(11) NOT NULL,
  `Ten_Phim` varchar(50) NOT NULL,
  `Anh_Phim` varchar(50) NOT NULL,
  `NgayPhatHanh` datetime NOT NULL,
  `ThoiLuongPhim` varchar(10) DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `DanhGia` float DEFAULT NULL,
  `ID_HangPhim` int(11) DEFAULT NULL,
  `ID_LP` int(11) DEFAULT NULL,
  `TongSoTap` int(11) NOT NULL,
  `ID_TacGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phim`
--

INSERT INTO `phim` (`ID`, `Ten_Phim`, `Anh_Phim`, `NgayPhatHanh`, `ThoiLuongPhim`, `MoTa`, `DanhGia`, `ID_HangPhim`, `ID_LP`, `TongSoTap`, `ID_TacGia`) VALUES
(1, 'Nghịch Thiên Tà Thần', 'NghichThienTaThan.jpg', '2023-12-02 22:44:00', '20 phút', 'Trên đại lục Thương Vân, Đại Thổ Y Tông đã bị sát hại tàn nhẫn vì giữ một trong bảy viên Thần Dược Thiên Không. Việc này đã khiến cho cả thiên hạ đều thèm muốn viên Thần Dược này, dẫn đến cái chết đau đớn của ông. Người trò truyện của ông, Vân Triệt, đã', 4.25, 2, 2, 100, 1),
(2, 'Thái Cổ Tinh Thần Quyết', 'ThaiCoTinhThanQuyet.jpg', '2023-12-07 22:48:00', '20p', 'combat nhi', NULL, 6, 2, 100, 2),
(3, 'Thôn Phệ Tinh Không', 'ThonPheTinhKhong.jpg', '2023-12-05 22:49:00', '20p', 'rất hay', NULL, 2, 3, 100, 0),
(4, 'Tiên Nghịch', 'TienNghich.jpg', '2023-12-02 22:50:00', '20p', 'Đồ họa đẹp', 2.5, 1, 2, 100, 0),
(5, 'Tiên Võ Đế', 'TienVoDe.jpg', '2023-12-05 22:50:00', '20p', 'Nội dung h', NULL, 1, 1, 100, 0),
(6, 'Vạn Cổ Cuồng Đế', 'VanCoCuongDe.jpg', '2024-01-07 20:00:56', '20p', NULL, NULL, 1, 3, 100, 0),
(7, 'Đấu Phá Thương Khung', 'DauPhaThuongKhung.jpg', '2024-01-30 14:00:55', '20 phút', NULL, NULL, 4, 5, 100, 0),
(22, 'Vũ Động Càn Khôn', 'vudongcankhon.jpg', '2024-04-18 00:00:00', '20 phút', 'hay', NULL, 1, 1, 100, 0),
(23, 'Đại Chúa Tể', 'daichuate.jpg', '2024-05-12 17:02:00', '20 phút', NULL, NULL, 1, 1, 100, 0),
(24, 'Thợ Săn Yêu Tinh', 'thosanyeutinh.jpg', '2024-05-27 15:58:00', '20 phút', 'Số phận của cả yêu tinh lẫn loài người đều đang lâm nguy khi chương cuối bắt đầu. Liệu Gunmar có thành công trong khiến thế giới bị bao trùm trong bóng tối?', NULL, 3, 3, 100, 0),
(25, 'Già Thiên', 'giathien.jpg', '2024-06-03 16:31:00', '20 phút', 'combat nhiều lắm', NULL, 1, 2, 100, 0),
(26, 'KungFu PanDa: Hiệp SĨ Rồng', 'kungfupanda.jpg', '2024-06-06 16:59:00', '20 phút', 'Chiến binh huyền thoại Po bắt tay với một hiệp sĩ Anh ưu tú trong nhiệm vụ có quy mô toàn cầu để giành lại các vũ khí ma thuật, rửa sạch thanh danh và cứu thế giới!', NULL, 1, 2, 100, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tacgia`
--

CREATE TABLE `tacgia` (
  `ID` int(11) NOT NULL,
  `TenGia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tacgia`
--

INSERT INTO `tacgia` (`ID`, `TenGia`) VALUES
(1, 'Phạm Văn Khoa'),
(2, 'Phạm Văn Đồng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `ID` int(11) NOT NULL,
  `Ten_TK` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Loai_TK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`ID`, `Ten_TK`, `MatKhau`, `Email`, `Loai_TK`) VALUES
(1, 'Phạm Công Định', '$2y$12$62OwzyYrXvncIDOv24WAeelN.HhvLSbg8ra87vVeNLqCqz0Na7Ueq', 'pcd969361@gmail.com', 1),
(13, 'Phạm Việt Trung', '$2y$12$erm.4uQdbS3Q4JKuC/QOfOHRTqAto4J.tA6xg9kP97iQ0GzNmgmxu', 'trung@gmail.com', 1),
(15, 'Đoàn Thị Mai Anh', '$2y$12$p1l6TqMgnoQIIK164iRYEuaMoQpyoSfrBfcV0PURUXtu23Y66LM/S', 'Manh@gmail.com', 1),
(16, 'Việt anh', '$2y$12$whHsQ29tGM4brBBSGCYyf.XQKD6pwyTWnR1sX40yamt7yyuQDAbFO', 'anh@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tapphim`
--

CREATE TABLE `tapphim` (
  `ID` int(11) NOT NULL,
  `ThoiHan` datetime NOT NULL,
  `TapSo` int(11) NOT NULL,
  `ThoiGianChieu` datetime NOT NULL,
  `ThoiLuong` varchar(10) DEFAULT NULL,
  `URL_Phim` varchar(100) DEFAULT NULL,
  `URL_Trailer` varchar(100) DEFAULT NULL,
  `ID_Phim` int(11) DEFAULT NULL,
  `DanhGia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tapphim`
--

INSERT INTO `tapphim` (`ID`, `ThoiHan`, `TapSo`, `ThoiGianChieu`, `ThoiLuong`, `URL_Phim`, `URL_Trailer`, `ID_Phim`, `DanhGia`) VALUES
(29, '2024-05-19 15:44:00', 1, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', NULL, 4, 2.5),
(30, '2024-05-19 15:44:00', 2, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/A9X3FS94/index.m3u8', NULL, 4, 0),
(31, '2024-05-19 15:44:00', 3, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/vtJghN08/index.m3u8', NULL, 4, 0),
(32, '2024-05-19 15:53:00', 4, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/dXvsSgPW/index.m3u8', NULL, 4, 0),
(33, '2024-05-19 15:53:00', 5, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/gRZCuKSu/index.m3u8', NULL, 4, 0),
(34, '2024-05-19 15:53:00', 6, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/KRlDKRqd/index.m3u8', NULL, 4, 0),
(35, '2024-05-19 15:53:00', 8, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/h6aryBB5/index.m3u8', NULL, 4, 0),
(36, '2024-05-19 16:03:00', 1, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/xTtqfTtj/index.m3u8', NULL, 7, 0),
(37, '2024-05-19 16:03:00', 2, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/HyCDb9OX/index.m3u8', NULL, 7, 0),
(38, '2024-05-19 16:03:00', 3, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/XNc8Nkyl/index.m3u8', NULL, 7, 0),
(39, '2024-05-19 16:03:00', 4, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/zetmemXM/index.m3u8', NULL, 7, 0),
(40, '2024-05-19 16:03:00', 5, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/y6pKtVXo/index.m3u8', NULL, 7, 0),
(41, '2024-05-19 16:03:00', 6, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/qh239vUs/index.m3u8', NULL, 7, 0),
(42, '2024-05-19 16:03:00', 7, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/HmTsD1h7/index.m3u8', NULL, 7, 0),
(43, '2024-05-19 16:09:00', 1, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/Kl6YsRIK/index.m3u8', NULL, 1, 3.5),
(44, '2024-05-19 16:09:00', 2, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/17e6nlmR/index.m3u8', NULL, 1, 5),
(45, '2024-05-19 16:09:00', 3, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/haCAhdhV/index.m3u8', NULL, 1, 0),
(46, '2024-05-19 16:09:00', 4, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/RCiMaRLO/index.m3u8', NULL, 1, 0),
(47, '2024-05-05 16:13:00', 1, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/fSBaw4Lb/index.m3u8', NULL, 5, 0),
(48, '2024-05-05 16:13:00', 2, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/daNYpWSE/index.m3u8', NULL, 5, 0),
(49, '2024-05-05 16:13:00', 3, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/4tcWOKnu/index.m3u8', NULL, 5, 0),
(50, '2024-05-05 16:13:00', 4, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/5r9c05pL/index.m3u8', NULL, 5, 0),
(51, '2024-05-05 16:13:00', 5, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/4wWmIQ0Y/index.m3u8', NULL, 5, 0),
(52, '2024-05-12 17:05:00', 1, '2024-05-04 17:05:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/Qg9IHAdi/index.m3u8', NULL, 23, 0),
(53, '2024-05-12 17:05:00', 2, '2024-05-04 17:05:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/HP04nJse/index.m3u8', NULL, 23, 0),
(54, '2024-05-11 17:08:00', 1, '2024-05-01 17:08:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20240127/gLTUt3B4/index.m3u8', NULL, 22, 0),
(55, '2024-05-11 17:08:00', 2, '2024-05-01 17:08:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20240127/yd103QAd/index.m3u8', NULL, 22, 0),
(57, '2024-07-07 16:02:00', 1, '2024-06-13 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20231231/QMElOVIq/index.m3u8', NULL, 24, 0),
(58, '2024-07-07 16:02:00', 2, '2024-06-12 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20231231/3AnuStFR/index.m3u8', NULL, 24, 0),
(59, '2024-06-30 16:53:00', 1, '2024-06-06 16:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240411/n2i5u9Ux/index.m3u8', NULL, 25, 0),
(60, '2024-06-30 16:53:00', 2, '2024-06-05 16:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240411/QR9inWeS/index.m3u8', NULL, 25, 0),
(61, '2024-06-29 17:00:00', 1, '2024-06-06 17:00:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240413/aV642Td0/index.m3u8', NULL, 26, 0),
(63, '2024-06-29 10:10:00', 18, '2024-06-04 10:10:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', 'test', 1, 0),
(64, '2024-06-29 10:10:00', 17, '2024-06-04 10:10:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', 'test', 1, 0),
(65, '2024-06-29 10:10:00', 19, '2024-06-04 10:10:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', 'test', 1, 0),
(66, '2024-06-29 10:10:00', 20, '2024-06-04 10:10:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', 'test', 1, 0),
(67, '2024-06-20 10:49:00', 25, '2024-06-15 10:49:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', NULL, 1, 0);

--
-- Bẫy `tapphim`
--
DELIMITER $$
CREATE TRIGGER `trg_update_danhgia_phim` AFTER UPDATE ON `tapphim` FOR EACH ROW BEGIN
    DECLARE avg_rating FLOAT;

    -- Tính toán trung bình cộng của DanhGia từ bảng TapPhim cho ID_Phim cụ thể, chỉ lấy những giá trị DanhGia > 0
    SELECT AVG(DanhGia) INTO avg_rating
    FROM tapphim
    WHERE ID_Phim = NEW.ID_Phim AND DanhGia > 0;

    -- Cập nhật trường DanhGia của bảng Phim
    UPDATE phim
    SET DanhGia = avg_rating
    WHERE ID = NEW.ID_Phim;
END
$$
DELIMITER ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TapPhim` (`ID_TapPhim`),
  ADD KEY `ID_TK` (`ID_TK`);

--
-- Chỉ mục cho bảng `chitiethdn`
--
ALTER TABLE `chitiethdn`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PNK` (`ID_PNK`),
  ADD KEY `ID_TapPhim` (`ID_TapPhim`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TapPhim` (`ID_TapPhim`),
  ADD KEY `ID_TK` (`ID_TK`);

--
-- Chỉ mục cho bảng `hangphim`
--
ALTER TABLE `hangphim`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_TK` (`ID_TK`);

--
-- Chỉ mục cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `lichsuphim`
--
ALTER TABLE `lichsuphim`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Tapphim` (`ID_Tapphim`),
  ADD KEY `ID_TK` (`ID_TK`);

--
-- Chỉ mục cho bảng `loaiphim`
--
ALTER TABLE `loaiphim`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `phim`
--
ALTER TABLE `phim`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_HangPhim` (`ID_HangPhim`),
  ADD KEY `ID_LP` (`ID_LP`);

--
-- Chỉ mục cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tapphim`
--
ALTER TABLE `tapphim`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Phim` (`ID_Phim`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `chitiethdn`
--
ALTER TABLE `chitiethdn`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `hangphim`
--
ALTER TABLE `hangphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `lichsuphim`
--
ALTER TABLE `lichsuphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `loaiphim`
--
ALTER TABLE `loaiphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `phim`
--
ALTER TABLE `phim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `tacgia`
--
ALTER TABLE `tacgia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tapphim`
--
ALTER TABLE `tapphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`ID_TapPhim`) REFERENCES `tapphim` (`ID`),
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`ID_TK`) REFERENCES `taikhoan` (`ID`);

--
-- Các ràng buộc cho bảng `chitiethdn`
--
ALTER TABLE `chitiethdn`
  ADD CONSTRAINT `chitiethdn_ibfk_1` FOREIGN KEY (`ID_PNK`) REFERENCES `hoadonnhap` (`ID`),
  ADD CONSTRAINT `chitiethdn_ibfk_2` FOREIGN KEY (`ID_TapPhim`) REFERENCES `tapphim` (`ID`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`ID_TapPhim`) REFERENCES `tapphim` (`ID`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`ID_TK`) REFERENCES `taikhoan` (`ID`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`ID_TK`) REFERENCES `taikhoan` (`ID`);

--
-- Các ràng buộc cho bảng `lichsuphim`
--
ALTER TABLE `lichsuphim`
  ADD CONSTRAINT `lichsuphim_ibfk_1` FOREIGN KEY (`ID_Tapphim`) REFERENCES `tapphim` (`ID`),
  ADD CONSTRAINT `lichsuphim_ibfk_2` FOREIGN KEY (`ID_TK`) REFERENCES `taikhoan` (`ID`);

--
-- Các ràng buộc cho bảng `phim`
--
ALTER TABLE `phim`
  ADD CONSTRAINT `phim_ibfk_1` FOREIGN KEY (`ID_HangPhim`) REFERENCES `hangphim` (`ID`),
  ADD CONSTRAINT `phim_ibfk_2` FOREIGN KEY (`ID_LP`) REFERENCES `loaiphim` (`ID`);

--
-- Các ràng buộc cho bảng `tapphim`
--
ALTER TABLE `tapphim`
  ADD CONSTRAINT `tapphim_ibfk_1` FOREIGN KEY (`ID_Phim`) REFERENCES `phim` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
