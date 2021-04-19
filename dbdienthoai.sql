-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 19, 2021 lúc 07:57 AM
-- Phiên bản máy phục vụ: 10.4.10-MariaDB
-- Phiên bản PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbdienthoai`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bophan`
--

DROP TABLE IF EXISTS `bophan`;
CREATE TABLE IF NOT EXISTS `bophan` (
  `IDBP` int(11) NOT NULL AUTO_INCREMENT,
  `TenBP` varchar(255) NOT NULL,
  PRIMARY KEY (`IDBP`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctdonhang`
--

DROP TABLE IF EXISTS `ctdonhang`;
CREATE TABLE IF NOT EXISTS `ctdonhang` (
  `IDDH` int(11) NOT NULL,
  `IDSP` int(11) NOT NULL,
  `Gia` int(11) NOT NULL,
  `SoLuongMua` int(11) NOT NULL,
  PRIMARY KEY (`IDDH`,`IDSP`),
  KEY `ctdonhang_ibfk_1` (`IDSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctgiohang`
--

DROP TABLE IF EXISTS `ctgiohang`;
CREATE TABLE IF NOT EXISTS `ctgiohang` (
  `IDGH` int(11) NOT NULL,
  `IDSP` int(11) NOT NULL,
  `GiaBan` int(11) NOT NULL,
  `SoLuongMua` int(11) NOT NULL,
  PRIMARY KEY (`IDGH`,`IDSP`),
  KEY `IDSP` (`IDSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `IDDH` int(11) NOT NULL AUTO_INCREMENT,
  `TrangThaiDH` int(11) NOT NULL,
  `NgayGiaoHang` date NOT NULL,
  `SDTNguoiNhan` int(11) NOT NULL,
  `DiaChiNguoiNhan` varchar(255) NOT NULL,
  `TenNguoiNhan` varchar(255) NOT NULL,
  `NgayGioDatHang` datetime NOT NULL,
  `EmailNguoiDat` varchar(255) NOT NULL,
  `TongTien` int(11) NOT NULL,
  PRIMARY KEY (`IDDH`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

DROP TABLE IF EXISTS `giohang`;
CREATE TABLE IF NOT EXISTS `giohang` (
  `IDGH` int(11) NOT NULL AUTO_INCREMENT,
  `IDKH` int(11) NOT NULL,
  PRIMARY KEY (`IDGH`),
  KEY `MaKH` (`IDKH`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `IDKH` int(11) NOT NULL AUTO_INCREMENT,
  `TenKH` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `SDT` int(11) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `TrangThai` int(10) NOT NULL,
  PRIMARY KEY (`IDKH`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `IDKM` int(11) NOT NULL AUTO_INCREMENT,
  `TenKM` varchar(255) NOT NULL,
  `GiaTienKM` int(11) NOT NULL,
  PRIMARY KEY (`IDKM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `IDLoaiSP` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(255) NOT NULL,
  PRIMARY KEY (`IDLoaiSP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `IDNV` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `TenNV` varchar(255) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `SDT` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `IDBP` int(11) NOT NULL,
  `TrangThai` int(11) NOT NULL,
  PRIMARY KEY (`IDNV`),
  KEY `MaBP` (`IDBP`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `IDSP` int(11) NOT NULL AUTO_INCREMENT,
  `TenSP` varchar(255) NOT NULL,
  `NoiDungMoTa` varchar(1000) NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `Gia` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `IDLoaiSP` int(11) NOT NULL,
  `IDNV` int(11) NOT NULL,
  `IDKM` int(11) NOT NULL,
  PRIMARY KEY (`IDSP`),
  KEY `IDLoaiSP` (`IDLoaiSP`),
  KEY `IDNV` (`IDNV`),
  KEY `IDKM` (`IDKM`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `IDSlider` int(11) NOT NULL AUTO_INCREMENT,
  `TenSlider` int(11) NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  PRIMARY KEY (`IDSlider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

DROP TABLE IF EXISTS `tintuc`;
CREATE TABLE IF NOT EXISTS `tintuc` (
  `IDTT` int(11) NOT NULL AUTO_INCREMENT,
  `TenTT` varchar(255) NOT NULL,
  `TieuDe` varchar(255) NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `NoiDung` varchar(1000) NOT NULL,
  `IDNV` int(11) NOT NULL,
  PRIMARY KEY (`IDTT`),
  KEY `IDNV` (`IDNV`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ctdonhang`
--
ALTER TABLE `ctdonhang`
  ADD CONSTRAINT `ctdonhang_ibfk_1` FOREIGN KEY (`IDSP`) REFERENCES `sanpham` (`IDSP`),
  ADD CONSTRAINT `ctdonhang_ibfk_2` FOREIGN KEY (`IDDH`) REFERENCES `donhang` (`IDDH`);

--
-- Các ràng buộc cho bảng `ctgiohang`
--
ALTER TABLE `ctgiohang`
  ADD CONSTRAINT `ctgiohang_ibfk_1` FOREIGN KEY (`IDGH`) REFERENCES `giohang` (`IDGH`),
  ADD CONSTRAINT `ctgiohang_ibfk_2` FOREIGN KEY (`IDSP`) REFERENCES `sanpham` (`IDSP`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`IDKH`) REFERENCES `khachhang` (`IDKH`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`IDBP`) REFERENCES `bophan` (`IDBP`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`IDLoaiSP`) REFERENCES `loaisanpham` (`IDLoaiSP`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`IDNV`) REFERENCES `nhanvien` (`IDNV`),
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`IDKM`) REFERENCES `khuyenmai` (`IDKM`);

--
-- Các ràng buộc cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`IDNV`) REFERENCES `nhanvien` (`IDNV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
