-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 09, 2024 lúc 06:16 PM
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
(17, 'phim rất là hay', '2024-05-17 09:56:41', 43, 1);

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
(57, 10000, 36, 55);

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
(15, 3.5, '2024-05-29 10:53:58', 43, 1),
(16, 4, '2024-05-29 11:21:25', 44, 1);

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
('1712889698', 10000, '2024-04-16 14:54:20', 13);

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
(36, '2024-05-16 17:10:03');

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
(45, 36, 1, '2024-06-04 23:22:24');

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
  `TongSoTap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phim`
--

INSERT INTO `phim` (`ID`, `Ten_Phim`, `Anh_Phim`, `NgayPhatHanh`, `ThoiLuongPhim`, `MoTa`, `DanhGia`, `ID_HangPhim`, `ID_LP`, `TongSoTap`) VALUES
(1, 'Nghịch Thiên Tà Thần', 'NghichThienTaThan.jpg', '2023-12-02 22:44:00', '20p', 'Trên đại lục Thương Vân, Đại Thổ Y Tông đã bị sát hại tàn nhẫn vì giữ một trong bảy viên Thần Dược Thiên Không. Việc này đã khiến cho cả thiên hạ đều thèm muốn viên Thần Dược này, dẫn đến cái chết đau đớn của ông. Người trò truyện của ông, Vân Triệt, đã m', NULL, 1, 1, 100),
(2, 'Thái Cổ Tinh Thần Quyết', 'ThaiCoTinhThanQuyet.jpg', '2023-12-07 22:48:00', '20p', 'combat nhi', NULL, 6, 2, 100),
(3, 'Thôn Phệ Tinh Không', 'ThonPheTinhKhong.jpg', '2023-12-05 22:49:00', '20p', 'rất hay', NULL, 2, 3, 100),
(4, 'Tiên Nghịch', 'TienNghich.jpg', '2023-12-02 22:50:00', '20p', 'Đồ họa đẹp', NULL, 1, 2, 100),
(5, 'Tiên Võ Đế', 'TienVoDe.jpg', '2023-12-05 22:50:00', '20p', 'Nội dung h', NULL, 1, 1, 100),
(6, 'Vạn Cổ Cuồng Đế', 'VanCoCuongDe.jpg', '2024-01-07 20:00:56', '20p', NULL, NULL, 1, 3, 100),
(7, 'Đấu Phá Thương Khung', 'DauPhaThuongKhung.jpg', '2024-01-30 14:00:55', '20 phút', NULL, NULL, 4, 5, 100),
(22, 'Vũ Động Càn Khôn', 'vudongcankhon.jpg', '2024-04-18 00:00:00', '20 phút', 'hay', NULL, 1, 1, 100),
(23, 'Đại Chúa Tể', 'daichuate.jpg', '2024-05-12 17:02:00', '20 phút', NULL, NULL, 1, 1, 100);

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
(13, 'Phạm Việt Trung', '$2y$12$erm.4uQdbS3Q4JKuC/QOfOHRTqAto4J.tA6xg9kP97iQ0GzNmgmxu', 'trung@gmail.com', 1);

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
  `ID_Phim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tapphim`
--

INSERT INTO `tapphim` (`ID`, `ThoiHan`, `TapSo`, `ThoiGianChieu`, `ThoiLuong`, `URL_Phim`, `URL_Trailer`, `ID_Phim`) VALUES
(29, '2024-05-19 15:44:00', 1, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/SCf3ukLV/index.m3u8', NULL, 4),
(30, '2024-05-19 15:44:00', 2, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/A9X3FS94/index.m3u8', NULL, 4),
(31, '2024-05-19 15:44:00', 3, '2024-05-06 15:44:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/vtJghN08/index.m3u8', NULL, 4),
(32, '2024-05-19 15:53:00', 4, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/dXvsSgPW/index.m3u8', NULL, 4),
(33, '2024-05-19 15:53:00', 5, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/gRZCuKSu/index.m3u8', NULL, 4),
(34, '2024-05-19 15:53:00', 6, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/KRlDKRqd/index.m3u8', NULL, 4),
(35, '2024-05-19 15:53:00', 7, '2024-05-06 15:53:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20240118/h6aryBB5/index.m3u8', NULL, 4),
(36, '2024-05-19 16:03:00', 1, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/xTtqfTtj/index.m3u8', NULL, 7),
(37, '2024-05-19 16:03:00', 2, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/HyCDb9OX/index.m3u8', NULL, 7),
(38, '2024-05-19 16:03:00', 3, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/XNc8Nkyl/index.m3u8', NULL, 7),
(39, '2024-05-19 16:03:00', 4, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/zetmemXM/index.m3u8', NULL, 7),
(40, '2024-05-19 16:03:00', 5, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/y6pKtVXo/index.m3u8', NULL, 7),
(41, '2024-05-19 16:03:00', 6, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/qh239vUs/index.m3u8', NULL, 7),
(42, '2024-05-19 16:03:00', 7, '2024-05-05 16:02:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230929/HmTsD1h7/index.m3u8', NULL, 7),
(43, '2024-05-19 16:09:00', 1, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/Kl6YsRIK/index.m3u8', NULL, 1),
(44, '2024-05-19 16:09:00', 2, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/17e6nlmR/index.m3u8', NULL, 1),
(45, '2024-05-19 16:09:00', 3, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/haCAhdhV/index.m3u8', NULL, 1),
(46, '2024-05-19 16:09:00', 4, '2024-05-04 16:09:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/RCiMaRLO/index.m3u8', NULL, 1),
(47, '2024-05-05 16:13:00', 1, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/fSBaw4Lb/index.m3u8', NULL, 5),
(48, '2024-05-05 16:13:00', 2, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/daNYpWSE/index.m3u8', NULL, 5),
(49, '2024-05-05 16:13:00', 3, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/4tcWOKnu/index.m3u8', NULL, 5),
(50, '2024-05-05 16:13:00', 4, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/5r9c05pL/index.m3u8', NULL, 5),
(51, '2024-05-05 16:13:00', 5, '2024-05-03 16:12:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240326/4wWmIQ0Y/index.m3u8', NULL, 5),
(52, '2024-05-12 17:05:00', 1, '2024-05-04 17:05:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/Qg9IHAdi/index.m3u8', NULL, 23),
(53, '2024-05-12 17:05:00', 2, '2024-05-04 17:05:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231231/HP04nJse/index.m3u8', NULL, 23),
(54, '2024-05-11 17:08:00', 1, '2024-05-02 17:08:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20240127/gLTUt3B4/index.m3u8', NULL, 22),
(55, '2024-05-11 17:08:00', 2, '2024-05-02 17:08:00', '20 phút', 'https://player.phimapi.com/player/?url=https://s1.phim1280.tv/20240127/yd103QAd/index.m3u8', NULL, 22);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `chitiethdn`
--
ALTER TABLE `chitiethdn`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `hangphim`
--
ALTER TABLE `hangphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `lichsuphim`
--
ALTER TABLE `lichsuphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `loaiphim`
--
ALTER TABLE `loaiphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `phim`
--
ALTER TABLE `phim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tapphim`
--
ALTER TABLE `tapphim`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
