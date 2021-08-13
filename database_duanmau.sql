-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 13, 2021 lúc 02:42 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `database_duanmau`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_06_11_145812_create_tbl_admin_table', 1),
(22, '2019_06_17_161852_create_tbl_category_product', 1),
(23, '2019_06_19_152045_create_tbl_brand_product', 1),
(24, '2019_06_19_155204_create_tbl_product', 1),
(25, '2019_08_17_030852_tbl_customer', 1),
(26, '2019_08_17_044054_tbl_shipping', 2),
(30, '2019_08_28_142718_tbl_payment', 3),
(31, '2019_08_28_142750_tbl_order', 3),
(32, '2019_08_28_142810_tbl_order_details', 3),
(33, '2021_08_02_153614_tbl_slide', 4),
(34, '2021_08_03_191352_tbl_diachi', 5),
(35, '2021_08_03_192357_tbl_lienhe', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `avatar`, `created_at`, `updated_at`) VALUES
(4, 'hocnqph05581@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'hoc', '0983579812', 'backend/images/2.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_slug`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(2, 'BÁNH KEM PINK LADY', 'PINK LADY', 'Bánh Pink lady Fresh Garden có cốt bánh vani nhân kem vani, trang trí bánh macaron và hoa hồng khô', 0, NULL, NULL),
(3, 'Bánh Sừng Bò', 'banh-sung-bo', 'Bánh sừng bò còn được gọi là bánh croa-xăng (từ tiếng Pháp croissant), có nguồn gốc từ Áo, là một dạng bánh ăn sáng làm từ pâte feuilletée (bột xốp), được sản xuất từ bột mì, men, bơ, sữa, và muối.', 0, NULL, NULL),
(4, 'Khác', 'khac', 'Tổng hợp các sản phẩm thuộc thương hiệu khác', 0, NULL, NULL),
(5, 'Bánh Cà Phê', '20', 'Một món bánh cực xinh, ngon và rất thơm mùi cafe.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_category_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `slug_category_product`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Bánh mỳ', 'banh-my', 'Bánh mỳ nóng hổi kết hợp với nhiều loại đồ ăn kèm như: Thịt, trứng, chả, pate....', 0, NULL, NULL),
(2, 'Bánh Tráng Miệng', 'banh-trang-mieng', 'Món tráng miệng này là sự kết hợp hoàn hảo giữa vị béo ngậy của trứng và kem tươi và thạch hoa quả. Phía trên bánh có phủ lớp đường caramel socola tạo nên một hương vị rẩt tuyệt vời.', 0, NULL, NULL),
(3, 'Bánh Quy', 'banh-quy', 'Bánh quy (cookie) là thực phẩm được nướng hoặc làm chín có hình dạng nhỏ, phẳng và ngọt. Bánh thường chứa bột, đường và một số loại dầu hoặc chất béo. Món này có thể bao gồm các thành phần khác như nho khô, yến mạch, sô cô la chip, các loại hạt, v.v.', 0, NULL, NULL),
(4, 'Bánh Kem Tươi', 'banh-kem-tuoi', 'Bánh kem tươi  được làm từ những nguyên liệu chất lượng, tốt cho sức khỏe người dùng.', 0, NULL, NULL),
(5, 'Đồ Uống', 'do-uong', 'Các loại đồ uống phổ biến gồm nước uống, nước ép trái cây, sữa, cà phê, trà, sô-cô-la nóng, nước sinh tố và nước ngọt.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(9, 'quang hoc', 'hocnqph05581@fpt.edu.vn', '25f9e794323b453885f5181f1b624d0b', '0983579812', NULL, NULL),
(10, 'quang hoc2222', 'hocnqph11111@gmail.com', '123456', '013534836', NULL, NULL),
(11, 'quang hoc33', 'hocnqph333@gmail.com', '123456', '15848495', NULL, NULL),
(19, 'anh Học đẹp trai nhất', 'hocnqph05581@fpt.edu.vn', 'e10adc3949ba59abbe56e057f20f883e', '0983579812', NULL, NULL),
(20, 'sadas', 'hocnqph05581@fpt.edu.vn', 'e10adc3949ba59abbe56e057f20f883e', '548484855151', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_lienhe`
--

CREATE TABLE `tbl_lienhe` (
  `lienhe_id` int(10) UNSIGNED NOT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_lienhe`
--

INSERT INTO `tbl_lienhe` (`lienhe_id`, `diachi`, `std`, `email`, `map`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Mỹ Đình - Nam Từ Liêm - Hà Nội', '0983579812', 'anhhocdeptrai@fpt.edu.vn', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14896.507253029407!2d105.76031428709538!3d21.027611304812247!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454bab9b67e93%3A0xbbe16aced529963f!2zTeG7uSDEkMOsbmgsIE5hbSBU4burIExpw6ptLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1575908365977!5m2!1svi!2s', 'larger (1)94.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(14, 10, 11, 16, '28,000', 'Đang chờ xử lý', NULL, NULL),
(15, 11, 12, 17, '60,000', 'Đang chờ xử lý', NULL, NULL),
(16, 9, 13, 18, '90,000', 'Đang chờ xử lý', NULL, NULL),
(17, 9, 13, 19, '90,000', 'Đang chờ xử lý', NULL, NULL),
(18, 9, 14, 20, '35,000', 'Đang chờ xử lý', NULL, NULL),
(19, 11, 15, 21, '30,250.00', 'Đang chờ xử lý', NULL, NULL),
(20, 19, 17, 22, '998,250.00', 'Đang chờ xử lý', NULL, NULL),
(21, 19, 20, 26, '30,250.00', 'Đang chờ xử lý', NULL, NULL),
(22, 19, 20, 27, '0.00', 'Đang chờ xử lý', NULL, NULL),
(23, 19, 20, 28, '0.00', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 9, 16, 'Khoai tây chiên KFC', '25000', 1, NULL, NULL),
(2, 10, 16, 'Khoai tây chiên KFC', '25000', 4, NULL, NULL),
(3, 11, 16, 'Khoai tây chiên KFC', '25000', 4, NULL, NULL),
(4, 12, 16, 'Khoai tây chiên KFC', '25000', 4, NULL, NULL),
(5, 13, 13, 'Coca Nhật Bản', '20000', 1, NULL, NULL),
(6, 13, 15, 'Đùi gà KFC', '30000', 1, NULL, NULL),
(7, 14, 13, 'Coca Nhật Bản', '20000', 1, NULL, NULL),
(8, 14, 12, 'Coca chai', '8000', 1, NULL, NULL),
(9, 15, 13, 'Coca Nhật Bản', '20000', 3, NULL, NULL),
(10, 16, 15, 'Đùi gà KFC', '30000', 3, NULL, NULL),
(11, 17, 15, 'Đùi gà KFC', '30000', 3, NULL, NULL),
(12, 18, 35, 'BÁNH QUY BƠ DỪA', '35000', 1, NULL, NULL),
(13, 20, 50, 'anh học đẹp trai', '450000', 1, NULL, NULL),
(14, 20, 43, 'CÀ PHÊ CỐT DỪA', '25000', 1, NULL, NULL),
(15, 20, 29, 'BÁNH KEM PINK LADY', '350000', 1, NULL, NULL),
(16, 21, 43, 'CÀ PHÊ CỐT DỪA', '25000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(12, '1', 'Đang chờ xử lý', NULL, NULL),
(13, '3', 'Đang chờ xử lý', NULL, NULL),
(14, '2', 'Đang chờ xử lý', NULL, NULL),
(15, '2', 'Đang chờ xử lý', NULL, NULL),
(16, '2', 'Đang chờ xử lý', NULL, NULL),
(17, '2', 'Đang chờ xử lý', NULL, NULL),
(18, '1', 'Đang chờ xử lý', NULL, NULL),
(19, '2', 'Đang chờ xử lý', NULL, NULL),
(20, '2', 'Đang chờ xử lý', NULL, NULL),
(21, '2', 'Đang chờ xử lý', NULL, NULL),
(22, '2', 'Đang chờ xử lý', NULL, NULL),
(23, '2', 'Đang chờ xử lý', NULL, NULL),
(24, '2', 'Đang chờ xử lý', NULL, NULL),
(25, '2', 'Đang chờ xử lý', NULL, NULL),
(26, '2', 'Đang chờ xử lý', NULL, NULL),
(27, '2', 'Đang chờ xử lý', NULL, NULL),
(28, '2', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_slug`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(5, 'Bánh mỳ thập cẩm', 'banh-my-thap-cam', 1, 4, 'Thơm ngon bổ dưỡng', 'rất ngon, rất rẻ...', '30000', '267.jpg', 1, NULL, NULL),
(6, 'Bánh mỳ kẹp trứng', 'banh-my-kep-trung', 1, 4, 'bánh mỳ kẹp trứng thơm ngon', 'chất lượng tốt, giá cả hợp lý, rất phù hợp với sinh viên', '12000', '331.jpg', 0, NULL, NULL),
(7, 'Bánh mỳ kẹp xúc xích', 'banh-my-kep-xuc-xich', 1, 4, 'ngon', 'ngon', '25000', '113.jpg', 0, NULL, NULL),
(18, 'Bánh Sừng Bò MINI', 'banh-sung-bo-mini', 1, 3, 'Bánh sừng bò được xếp thành ngàn lớp, cuộn lại với nhau thành hình chiếc sừng bò ngộ nghĩnh. Mặt bánh phủ lớp vừng thêm phần thu hút.', 'Thành phần: Bột mỳ, bột bánh mỳ tươi, bột nở, đường, bơ, muối, vừng\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C\r\n\r\nHạn sử dụng 7 ngày. \r\nThời gian hủy 12h ngày cuối cùng trong ngày', '45000', 'banhsungbomini90.jpg', 0, NULL, NULL),
(19, 'BÁNH SỪNG BÒ CROISSANT', 'banh-sung-bo-croissant', 1, 3, 'Bánh sừng bò được xếp thành ngàn lớp, cuộn lại với nhau thành hình chiếc sừng bò ngộ nghĩnh.', 'Thành phần: Bột mỳ, men, muối, đường, trứng, sữa bột, bơ, nước\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '15000', 'banhsungbocroissant95.jpg', 0, NULL, NULL),
(20, 'BÁNH CÀ PHÊ NHÂN NHO ĐEN', 'banh-ca-phe-nhan-nho-den', 1, 5, 'Bánh cà phê nhân nho đen là sản phẩm đặc trưng theo phong cách của Mexico. Vỏ bánh mềm mịn, nhân bánh hương vị cà phê và nho đen giòn, ngọt.', 'Thành phần: Vỏ bánh (bột mỳ, men, trứng, sữa, đường, bơ, muối, nước, sữa bột, cà phê), sốt Mexico đen Nhân bánh (bột cà phê, nho đen, rượu rum, cà phê dứa (cà phê, nước, dứa, bột mỳ)\r\n\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '15000', 'banhcaphenhannhoden30.jpg', 0, NULL, NULL),
(21, 'BÁNH CÀ PHÊ NHÂN ĐẬU ĐỎ', 'banh-ca-phe-nhan-dau-do', 1, 5, 'Bánh cà phê nhân đậu đỏ là sản phẩm đặc trưng theo phong cách của Mexico. Vỏ bánh mềm mịn, nhân bánh hương vịdậu đỏ và nho đen giòn, ngọt.', 'Thành phần: Vỏ bánh (bột mỳ, men, trứng, sữa tươi, đường, bơ, muối, nước, sữa bột, cà phê), sốt Mexico trắng.\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '15000', 'banhcaphenhandaudo53.jpg', 0, NULL, NULL),
(22, 'SANDWICH GIĂM BÔNG PHOMAI', 'sandwich-giam-bong-pho-mai', 1, 6, 'Sandwich giăm bông phô mai thơm lừng vị phomai, cùng với miếng giăm bông đầy hấp dẫn.', 'Thành phần: Bột bánh mỳ gối (bột mỳ, men, muối, bơ, đường, trứng gà, nước), giăm bông, phomai, sốt ...\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '29000', 'sandwichgiambongphomai70.jpg', 0, NULL, NULL),
(23, 'SANDWICH CÁ NGỪ PHOMAI', 'sandwich-ca-ngu-phomai', 1, 6, 'Sandwich bao gồm nguyên liệu cá ngừ, phomai, sốt Mayonnaise và trứng gà, được hòa quyện với nhau tạo nên chiếc bánh sandwich cá ngừ phomai đầy hấp dẫn', 'Thành phần: Bột bánh mỳ gối (bột mỳ, men, muối, bơ, đường, trứng gà, nước), cá ngừ, phomai, sốt ...', '29000', 'sandwichgiambongphomai76.jpg', 0, NULL, NULL),
(24, 'SANDWICH GIĂM BÔNG', 'sandwich-giam-bong', 1, 6, 'Sandwich giăm bông được làm từ bột mì của bánh gối và được kết hợp giữa giăm bông, xà lách và cà chua cùng với sốt mayonnaise. Các nguyên liệu hòa quyện làm một tạo thành chiếc sandwich thơm ngon và béo ngậy', 'Thành phần: Bột bánh mỳ gối (bột mỳ, men, muối, bơ, đường, trứng gà, nước), giăm bông, rau xà lách, cà chua...\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '25000', 'sanwichgiambong22.jpg', 0, NULL, NULL),
(25, 'PIZZA GIĂM BÔNG NẤM', 'pizza-giam-bong-nam', 1, 7, 'Bánh pizza giăm bông nấm với những nguyên liệu từ nấm tươi ngon và hấp dẫn đối với những tín đồ sành ăn', 'Thành phần: Bột pizza (bột mỳ, muối, men, nước, đường, dầu), giăm bông, nấm, phomai, rau hỗn hợp, sốt cà chua...\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh sáng trực tiếp\r\nNhiệt độ: 26°C-28°C', '29000', 'pizzagiambongnam16.jpg', 0, NULL, NULL),
(26, 'PIZZA XÚC XÍCH NGÔ', 'pizza-xuc-xich-ngo', 1, 7, 'Bánh pizza làm từ bột mì cao cấp, nhân bánh pizza được làm từ xúc xích ngô với gia vị đặc trưng của Fresh Garden', 'Thành phần: Bột pizza (bột mỳ, muối, men, nước, đường, dầu), phomai, ngô ngọt, xúc xích, sốt cà chua', '29000', 'pizzaxucxichngo57.jpg', 0, NULL, NULL),
(27, 'BÁNH KEM BOSTON CHOCOLATE', 'banh-kem-boston-chocolate', 4, 4, 'Bánh Boston Chocolate Fresh Garden có cốt bánh socola 3 lớp nhân kem socola, mặt bánh phủ socola, trang trí macaron và socola bi', 'Thành phần: Bánh kem tươi cốt bánh socola 3 lớp nhân kem socola, mặt bánh phủ socola, trang trí macaron ...\r\n\r\nGiá bán : \r\nBánh size 8(21 cm):  350.000đ\r\nBánh size 10(25 cm): 490.000đ', '350000', 'BÁNH KEM BOSTON CHOCOLATE54.jpg', 0, NULL, NULL),
(28, 'BÁNH KEM CREAM & VANILLA', 'banh-kem-cream-vanilla', 4, 4, 'Bánh kem Cream & Vanilla Fresh Garden với sự đặc trưng từ kem lớp vanilla hòa trộn cùng cốt vanilla 3 lớp đặc trưng, trang trí thêm những lát hoa văn socola đẹp mắt tạo thêm những điểm chấm phá cho chiếc bánh thêm phần thu hút.', 'Thành phần: Bánh kem tươi cốt bánh vanilla 4 lớp, nhân kem vanilla, trang trí sô cô la trắng\r\n\r\nGiá bán:\r\nBánh size 8\" (21 cm)   : 250.000 VNĐ\r\nBanh size 10\" (25 cm) : 350.000 VNĐ\r\n\r\n- Bảo quản trong tủ gato kem tươi\r\n- Nhiệt độ: 2°C-5°C\r\n- Độ ẩm: 55% - 65%\r\n- Hạn sử dụng 3 ngày.', '250000', 'BÁNH KEM CREAM & VANILLA51.png', 0, NULL, NULL),
(29, 'BÁNH KEM PINK LADY', 'banh-kem-pink-lady', 4, 4, 'Bánh Pink lady Fresh Garden có cốt bánh vani nhân kem vani, trang trí bánh macaron và hoa hồng khô', 'Thành phần: Bánh kem tươi cốt bánh vani nhân kem vani, trang trí bánh macaron và hoa hồng khô', '350000', 'BÁNH KEM PINK LADY46.jpg', 0, NULL, NULL),
(30, 'BÁNH KEM RED VELVET', 'banh-kem-red-velvet', 4, 4, 'Chúng ta dễ dàng tìm thấy một công thức làm bánh Red Velvet ở bất kỳ đâu, nhưng nguyên liệu và tỷ lệ pha trộn nguyên liệu mới chính là yếu tố tiên quyết định danh một chiếc bánh hoàn hảo. Tại Fresh Garden, Red Velvet thực sự khác biệt bởi công thức riêng, rất cầu kỳ, tinh tế, được sáng tạo bằng đam mê của đầu bếp Nhật Bản Tsujimori Takehide.', 'Thành phần: Cốt bánh red velvet 4 lớp với nhân kem vanilla, trang trí bằng bánh macaron\r\n\r\nGiá bán:\r\n\r\nBánh size 6\'\' : 280.000 VND\r\nBánh size 8\'\': 480.000 VNĐ\r\nBánh size 10\'\': 680.000 VNĐ', '280000', 'BÁNH KEM RED VELVET78.png', 0, NULL, NULL),
(31, 'BÁNH KEM SWEET AUTUMN', 'banh-kem-sweet-autumn', 4, 4, 'Bánh Sweet Autumn Fresh Garden có cốt bánh vị sữa, mặt bánh phủ socola sệt, trang trí bánh macaron và socola bi', 'Thành phần: Bánh kem tươi cốt bánh vị sữa, mặt bánh phủ socola sệt, trang trí bánh macaron và socola bi\r\n\r\nGiá bán:\r\nBánh size 8 (21 cm): 350.000 VNĐ\r\nBánh size 10 (25 cm) : 490.000 VNĐ', '350000', 'BÁNH KEM SWEET AUTUMN4.jpg', 0, NULL, NULL),
(32, 'BÁNH KEM CARAMEL JELLY', 'banh-kem-caramel-jelly', 4, 4, 'Bánh kem cốt bánh vanilla 4 lớp, nhân thạch caramel, mặt bánh phủ socola trắng và bánh macaron', 'Giá bán:\r\nBánh size 8\" (21 cm)  : 280.000 VNĐ\r\nBánh size 10\" (25 cm) : 390.000 VNĐ\r\n- Bảo quản trong tủ gato kem tươi\r\n- Nhiệt độ: 2°C-5°C\r\n- Độ ẩm: 55% - 65%\r\n- Hạn sử dụng 3 ngày.', '280000', 'BÁNH KEM CARAMEL JELLY48.png', 0, NULL, NULL),
(33, 'BÁNH QUY PHOMAI QUE GIÒN', 'banh-quy-phomai-que-gion', 3, 4, 'Bánh phomai que giòn được làm từ nguyên liệu cao cấp. Bánh giòn tan, thơm ngậy vị phomai mặn', 'Thành phần: Bột mỳ, muối, dầu ăn, men, phomai, nước\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh nắng trực tiếp\r\nNhiệt độ: 26°C-28°C\r\n\r\nHạn sử dụng: 7 ngày\r\nThời gian hủy: 12h trưa ngày cuối cùng hạn sử dụng', '20000', 'BÁNH QUY PHOMAI QUE GIÒN99.jpg', 0, NULL, NULL),
(34, 'BÁNH QUY BƠ MỨT DÂU RỪNG', 'banh-quy-bo-mut-dau-rung', 3, 4, 'Bánh quy bơ mứt dâu rừng được làm từ nguyên liệu cao cấp. Bánh giòn xốp, hương vị béo ngậy của bơ hoà quyện với vị ngọt dâu rừng. Bánh quy phù hợp với buổi tiệc trà và cà phê.', 'Bảo quản ở nhiệt độ phòng, tránh ánh nắng trực tiếp\r\nNhiệt độ: 26°C-28°C\r\n\r\nHạn sử dụng: 60 ngày', '35000', 'BÁNH QUY BƠ MỨT DÂU RỪNG83.jpg', 0, NULL, NULL),
(35, 'BÁNH QUY BƠ DỪA', 'banh-quy-bo-dua', 3, 4, 'Bánh quy bơ dừa được làm từ nguyên liệu cao cấp. Bánh giòn xốp, hương thơm béo của dừa hoà quyện với vị ngậy từ bơ. Bánh quy phù hợp với buổi tiệc trà và cà phê.', 'Thành phần: Hạnh nhân bột, dừa bột, bơ, trứng, đường, bột mỳ, vani\r\n\r\nBảo quản ở nhiệt độ phòng, tránh ánh nắng trực tiếp Nhiệt độ: 26°C-28°C\r\n\r\nHạn sử dụng: 60 ngày', '35000', 'BÁNH QUY BƠ DỪA9.jpg', 0, NULL, NULL),
(36, 'BÁNH MIẾNG OPERA', 'banh-mieng-opera', 2, 4, 'Bánh miếng Opera thuộc dòng bánh Tiramisu, bánh là sự hòa quyện giữa các hương vị hoàn hảo tạo nên miếng chiếc mềm, mịn và ngọt ngào.', 'Thành phần: Bột mỳ, đường, trứng, bơ, cà phê, bột hạnh nhân, rượu Kahlua, kem bơ cà phê, socola ganache, socola ..\r\n\r\nBảo quản trong tủ gato kem tươi\r\nNhiệt độ: 2°C-5°C\r\nĐộ ẩm: 55% - 65%', '35000', 'BÁNH MIẾNG OPERA94.jpg', 0, NULL, NULL),
(37, 'MOUSSE CHANH LEO', 'mousse-chanh-leo', 2, 4, 'Mousse chanh leo dòng bánh đặc trưng cho hương vị mùa hè,bánh mềm mịn, mát lạnh và sự tan chảy của lớp kem hòa quyện lớp chanh leo trong miệng ngay lần đầu thưởng thức', 'Thành phần: Cốt bánh vani, lớp mouse mát lạnh vị chanh leo\r\n\r\nBảo quản trong tủ gato kem tươi\r\nNhiệt độ: 2°C-5°C\r\nĐộ ẩm: 55% - 65%\r\n\r\nHạn sử dụng: 3 ngày\r\nThời gian hủy 12h trưa ngày cuối cùng hạn sử dụng', '29000', 'MOUSSE CHANH LEO72.jpg', 0, NULL, NULL),
(38, 'MOUSSE TRÀ XANH', 'mousse-tra-xanh', 2, 4, 'Là dòng bánh đặc trưng cho hương vị mùa hè,bánh mềm mịn, mát lạnh và sự tan chảy của lớp kem hòa quyện lớp trà xanh trong miệng ngay lần đầu thưởng thức', 'Thành phần: Cốt bánh trà xanh, 2 lớp mouse mát lạnh\r\n\r\nBảo quản trong tủ gato kem tươi\r\nNhiệt độ: 2°C-5°C\r\nĐộ ẩm: 55% - 65%\r\n \r\nHạn sử dụng: 3 ngày\r\nThời gian hủy: 12h trưa ngày cuối cùng hạn sử dụng', '29000', 'MOUSSE TRÀ XANH4.jpg', 0, NULL, NULL),
(39, 'BÁNH MIẾNG DỨA', 'banh-mieng-dua', 2, 4, 'Bánh miếng dứa ược làm từ bột mỳ kết hợp cùng hương vị dứa. Mỗi miếng bánh là một hương vị tuyệt vời mà bạn không thể bỏ lỡ', 'Thành phần: Bột mỳ, đường kính, bơ, trứng, dứa, vani, đường caramen\r\n\r\nBảo quản trong tủ gato kem tươi Nhiệt độ: 2°C-5°C\r\nĐộ ẩm: 55% - 65%\r\n \r\nHạn sử dụng: 3 ngày. \r\nThời gian hủy: 12h trưa ngày cuối cùng hạn sử dụng', '30000', 'BÁNH MIẾNG DỨA25.jpg', 0, NULL, NULL),
(40, 'TRÀ DÂU', 'tra-dau', 5, 4, 'Trà dâu được làm từ nguyên liệu trà đen cao cấp kết hợp thạch thơm ngon mát lạnh', 'Thành phần: Trà dâu cùng thạch mát lạnh.\r\n\r\nBảo quản trong tủ mát.\r\nNhiệt độ: 4°C-8°C\r\n\r\nHạn sử dụng 3 ngày', '15000', 'trà dâu37.jfif', 0, NULL, NULL),
(41, 'CÀ PHÊ SỮA NÓNG', 'ca-phe-sua-nong', 5, 4, 'Cà phê sữa dành cho những người yêu thích và thường uống cà phê mỗi ngày.', 'Thành phần: Cà phê, sữa đặc', '20000', 'CÀ PHÊ SỮA NÓNG50.jpg', 0, NULL, NULL),
(42, 'MOCHA (LẠNH)', 'mocha-lanh', 5, 4, 'Mocha là sự hòa quyện hoàn hảo giữa Espresso và sữa cùng socola ngọt ngào', 'Thành phần: Cà phê bột, sữa tươi lạnh, sốt sô cô la, kem tươi, đá bi', '25000', 'MOCHA (LẠNH)68.jpg', 0, NULL, NULL),
(43, 'CÀ PHÊ CỐT DỪA', 'ca-phe-cot-dua', 5, 4, 'Cà phê cốt dừa được yêu thích bởi vị cà phê đặc trưng và nước cốt dừa thơm lừng, béo ngậy.', 'Thành phần: Cà phê, cốt dừa, sữa đặc, Đá', '25000', 'CÀ PHÊ CỐT DỪA22.jpg', 0, NULL, NULL),
(49, 'alo ooo', 'alo-ooo', 5, 5, 'dssaddsadsad', 'dsadadasdadwa', '450000', 'IMG_185992.JPG', 0, NULL, NULL),
(50, 'anh học đẹp trai', 'sadasd', 5, 5, 'đá', 'dsad', '450000', 'IMG_185959.JPG', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_notes`, `created_at`, `updated_at`) VALUES
(11, 'đăng', 'trịnh văn bô', '0112233445', 'dang1@gmail.com', '1234', NULL, NULL),
(12, 'trung', '1234', '0112223442', 'dangtrung1234@gmail.com', '1234', NULL, NULL),
(13, 'trung 123', '123123', '123123123', 'dangtrung1@gmail.com', '123123', NULL, NULL),
(14, 'trung', '123', '123123123', 'dangtrung1@gmail.com', '123', NULL, NULL),
(15, 'hoc', 'đông anh hà nội', '0983579812', 'rtewfrewdf', 'Ghi chú', NULL, NULL),
(16, 'anh học đẹp trai', 'đông anh hà nội', '0983579812', 'hocnqh@gmail.com', 'Ghi chú', NULL, NULL),
(17, 'anh Học', 'đông anh hà nội', '0983579812', 'hocnqph05581@fpt.edu.vn', 'Ghi chú aaaaa', NULL, NULL),
(18, 'ÁấSAsa', 'ấSAsaS', '0983579812', 'ádsaaDAsa@gmail.com', 'Ghi chúsa', NULL, NULL),
(19, 'anh học \\', 'đông anh hà nội', '0983579812', 'hocnqh@gmail.com', 'Ghi chú', NULL, NULL),
(20, 'anh Học đẹp trai nhất', 'đông anh hà nội', '0983579812', 'hocnqph05581@fpt.edu.vn', 'Ghi chú', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slide`
--

CREATE TABLE `tbl_slide` (
  `slide_id` int(10) UNSIGNED NOT NULL,
  `slide_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slide_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slide_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_slide`
--

INSERT INTO `tbl_slide` (`slide_id`, `slide_name`, `slide_image`, `slide_status`, `created_at`, `updated_at`) VALUES
(5, 'slide1', 'slide46267.jpg', 0, NULL, NULL),
(6, 'slide2', 'slide554.jpg', 0, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_lienhe`
--
ALTER TABLE `tbl_lienhe`
  ADD PRIMARY KEY (`lienhe_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `tbl_slide`
--
ALTER TABLE `tbl_slide`
  ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tbl_lienhe`
--
ALTER TABLE `tbl_lienhe`
  MODIFY `lienhe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tbl_slide`
--
ALTER TABLE `tbl_slide`
  MODIFY `slide_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
