-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 25, 2024 at 06:07 AM
-- Server version: 8.0.40-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tour-booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` binary(16) NOT NULL,
  `content` text,
  `created_at` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `admin_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_images`
--

CREATE TABLE `blog_images` (
  `blog_id` binary(16) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` binary(16) NOT NULL,
  `booking_date` datetime(6) DEFAULT NULL,
  `booking_status` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `discount_amount` int DEFAULT NULL,
  `final_price` int DEFAULT NULL,
  `num_people` int DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `total_price` int DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `promotion_id` binary(16) DEFAULT NULL,
  `tour_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `qr_base64` varchar(255) DEFAULT NULL,
  `ztranstion_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` binary(16) NOT NULL,
  `description` text,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `description`, `name`) VALUES
(0x54f0bd78e6ba4822a8d08062d13422fd, NULL, 'Du Ngoạn Chào Xuân'),
(0x994d294fdc7e45f18f413c3abaa9b854, NULL, 'Tour HOT Trong Nước'),
(0xb343d8fc88094a90a0ca30ba28eef254, NULL, 'Tour HOT Nước Ngoài'),
(0xc24c3286a1964cb2a33fc99b8678db82, NULL, 'Tours Theo Chủ Đề');

-- --------------------------------------------------------

--
-- Table structure for table `chat_session`
--

CREATE TABLE `chat_session` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` binary(16) DEFAULT NULL,
  `host_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chat_session`
--

INSERT INTO `chat_session` (`id`, `created_at`, `status`, `updated_at`, `created_by_id`, `host_id`) VALUES
(0x95bf810c221643cbb6a15fe58554f56b, '2024-12-22 08:37:09.511068', 'active', NULL, 0x136e711379fd49a98d741dee0bbff87d, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xc93e83f33ce642c5bda3bfec11fcca41, '2024-12-17 20:20:34.594710', 'active', NULL, 0x5deb768ff97643ad84c658c23bbc90ee, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xe1a032d1410049ad8d5dd312b9f73a88, '2024-12-21 21:48:43.190269', 'active', NULL, 0x660361a13e0744c38c7b2957bcb3d69a, 0x28dd5c02ef884a0ea2ab657a5a043206);

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tour_count` int DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `tour_count`, `url_image`) VALUES
(0x13958fa8335a43d59e124e73e7754ce2, 'Dubai', 1, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x32bae35fdf91490692d48b791ad337e1, 'Hồng Kông', 1, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x427685d0ddc54ee3a53092bdf15dc1fd, 'Miền Tây', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x6ab4ec2089b74fed904ce29fd017bfbc, 'Hàn Quốc', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x6f8f71f3cc0c41c192e85aed339bb0d6, 'Sapa', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x6f95229b367b4e7fb24dad90d407f6af, 'Hạ Long', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x7cf4b336061048f0b477dce914fa47d1, 'Đà Nẵng', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x858f9981f57344a6800d2f35a85fa9c2, 'Singapore', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0x8f74feb761d74810b57da023aa2a23a0, 'Nhật Bản', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0xbeac4ab4322540bb81f24ac8016cf319, 'Thái Lan', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0xc430cc30bbb34cd99e1649742c597ed4, 'Trung Quốc', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg'),
(0xc6a2149545f945a79fbbe27219d2688e, 'Bình Ba', NULL, 'https://goldensmiletravel.com/uploads/images/2024/02/23/du-lich-hong-kong-1-1708673508.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` binary(16) NOT NULL,
  `saved_at` datetime(6) DEFAULT NULL,
  `tour_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostregister`
--

CREATE TABLE `hostregister` (
  `id` binary(16) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url_company` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `host_registers`
--

CREATE TABLE `host_registers` (
  `id` binary(16) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` binary(16) NOT NULL,
  `content` text,
  `is_read` bit(1) DEFAULT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `chat_session_id` binary(16) DEFAULT NULL,
  `receiver_id` binary(16) DEFAULT NULL,
  `sender_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` binary(16) NOT NULL,
  `content` text,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` binary(16) NOT NULL,
  `amount` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `booking_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` binary(16) NOT NULL,
  `code` varchar(255) NOT NULL,
  `conditions` text,
  `description` text,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` decimal(38,2) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `code`, `conditions`, `description`, `discount_type`, `discount_value`, `end_date`, `start_date`) VALUES
(0x1b86c9a015394b289b45fad442504737, 'KHUYENMAI2024', 'Áp dụng cho các tour du lịch biển từ ngày 1 tháng 6 đến ngày 31 tháng 8 năm 2024. Không áp dụng chung với các khuyến mãi khác.', 'Giảm giá 20% cho các tour du lịch biển mùa hè 2024', 'Phần trăm', 20.00, '2024-12-28', '2024-12-16'),
(0x911b88c01918420099bf6341703e2bdf, 'test', 'ádsadasd', 'test', 'Phần trăm', 1.00, '2024-12-20', '2024-12-19'),
(0xfe9ba6cd519a4f84acc7159531842fb7, 'tes23', 'ádasdasdasd', 'Giảm giá 20% cho các tour du lịch biển mùa hè 2024', 'Phần trăm', 34.00, '2025-01-15', '2024-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `descriptionMismatch` bit(1) NOT NULL,
  `guideAttitude` bit(1) NOT NULL,
  `guideOther` bit(1) NOT NULL,
  `other` bit(1) NOT NULL,
  `otherReason` varchar(500) DEFAULT NULL,
  `overpricing` bit(1) NOT NULL,
  `scheduleMismatch` bit(1) NOT NULL,
  `tour_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `created_at`, `descriptionMismatch`, `guideAttitude`, `guideOther`, `other`, `otherReason`, `overpricing`, `scheduleMismatch`, `tour_id`, `user_id`) VALUES
(0x44f7205c82064a1eb49d21d984b77964, '2024-12-03 18:03:19.687577', b'1', b'0', b'0', b'1', 'ádasdsad', b'0', b'0', 0xa8f1c855278d4a94bcea995004596c96, 0xa01690f1bcc9499d9b02aee8c55162eb);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` binary(16) NOT NULL,
  `comment` text,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int NOT NULL,
  `tour_id` binary(16) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` binary(16) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(0x120c57c6feaf4304b676203a462345e6, 'ROLE_USER'),
(0x1839f14c1ccf4102abc8192f553b32b9, 'ROLE_HOST'),
(0x9d06643a5e6942b9bee13b21d87bda15, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `description` text,
  `duration_days` int DEFAULT NULL,
  `featured` bit(1) DEFAULT NULL,
  `max_peole` int DEFAULT NULL,
  `price` int NOT NULL,
  `starting_location` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tickets_remaining` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `transportation` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` binary(16) DEFAULT NULL,
  `destination_id` binary(16) DEFAULT NULL,
  `host_id` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `created_at`, `departure_date`, `description`, `duration_days`, `featured`, `max_peole`, `price`, `starting_location`, `status`, `tickets_remaining`, `title`, `transportation`, `updated_at`, `category_id`, `destination_id`, `host_id`) VALUES
(0x188694ade01d4713bba8173539d24010, '2024-12-09 02:16:28.570924', '2024-12-09', 'Vận Chuyển:\n\n- Phương tiện vận chuyển, xe đưa đón tham quan tại Nhật Bản.\n\n- Vé máy bay khứ hồi theo hãng hàng không Japan Airlines (Hành lý ký gửi 40kg (chia làm 2 kiện và 10kg xách tay)\n\nLưu Trú:\n\n- 03 đêm ở khách sạn tiêu chuẩn 3 - 4*(2-3 khách/1 phòng).\n\nKhác: \n\n- Ăn uống (sáng, trưa, chiều) theo chương trình.\n\n- Vé tham quan du lịch có trong chương trình.\n\n- Bảo hiểm du lịch, mức bồi hoàn tối đa 1.000.000.000 vnđ/ trường hợp.\n\n- Thuế VAT & phí phục vụ.\n\n- Hướng dẫn viên du lịch suốt tuyến.\n\n- Visa nhập cảnh Nhật Bản.\n\n- Tặng sim 4G (1G/1 ngày sử dụng tại Nhật).', 5, b'0', 20, 3900000, 'Hồ Chí Minh - Narita (Nghỉ Đêm Trên Máy Bay) 20:30 HDV của của công ty sẽ đón đoàn tại Ga đi Quốc tế, sân bay Tân Son Nhất.', 'APPROVED', 18, 'Tour Nhật Bản 5N5Đ (Tết Nguyên Đán): TP.HCM - Tokyo - Yamanashi - Toyohashi - Kyoto - Osaka - Kobe', 'Máy bay', '2024-12-09 02:23:23.712315', 0x54f0bd78e6ba4822a8d08062d13422fd, 0x8f74feb761d74810b57da023aa2a23a0, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x30efdb1714cb4f0c8d70038fc79f9946, '2024-12-03 12:05:14.152070', '2024-12-18', '\n\n- Tham quan Tokyo hiện đại - Trải nghiệm cuộc sống sôi động của thủ đô Nhật Bản, nơi hội tụ giữa truyền thống và hiện đại.\n\n- Khám phá Núi Phú Sĩ - Biểu tượng của Nhật Bản với phong cảnh thiên nhiên tuyệt đẹp, đặc biệt trong mùa đông.\n\n- Thưởng thức hoa anh đào ở Yamanashi - Chiêm ngưỡng những cảnh quan thơ mộng của hoa anh đào nở rộ tại vùng đất nổi tiếng này.\n\n- Tham quan Làng Oshino Hakkai - Tìm hiểu văn hóa và lối sống truyền thống của người dân địa phương.\n\n- Mua sắm tại các khu phố Tokyo sầm uất - Thưởng thức ẩm thực đường phố và mua sắm các sản phẩm thời trang độc đáo.\n', 4, b'1', 20, 28990000, 'Hướng dẫn viên sẽ đón Quý khách tại Cổng D2, Lầu 2, Ga đi quốc tế Tân Sơn Nhất ga đi Quốc tế, sân bay Tân Sơn Nhất. Làm thủ tục đáp chuyến bay của Vietjet Air VJ822 khởi hành đi Narita lúc 23h55. Đoàn nghỉ đêm trên máy bay.', 'APPROVED', 17, 'Tour Tết Nhật Bản 4N4Đ: Khám Phá Tokyo - Phú Sỹ - Yamanashi (Visa Đơn Giản)', 'Máy bay', '2024-12-03 17:40:16.827527', 0x54f0bd78e6ba4822a8d08062d13422fd, 0x8f74feb761d74810b57da023aa2a23a0, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x3706a03349bf4c6fb4da9befc8585533, '2024-12-09 02:35:43.636028', '2024-12-09', 'Khám phá vẻ đẹp hùng vĩ và lịch sử của miền Bắc Việt Nam qua hành trình 6 ngày 5 đêm, tham quan Hà Nội, Ninh Bình, Vịnh Hạ Long và Sapa. Khởi hành từ Hà Nội, du khách sẽ tham quan Văn Miếu, Hồ Hoàn Kiếm và khu phố cổ Hà Nội. Tiếp tục đến Ninh Bình, khám phá Tràng An với hệ thống hang động kỳ vĩ và chùa Bái Đính, ngôi chùa lớn nhất Việt Nam. Tại Vịnh Hạ Long, du khách sẽ du thuyền trên vịnh, ngắm nhìn cảnh quan thiên nhiên đẹp mê hồn với hàng nghìn đảo đá. Cuối cùng, hành trình đến Sapa, chiêm ngưỡng cảnh đẹp núi rừng Tây Bắc, thăm bản Cát Cát và chinh phục đỉnh Fansipan, \'nóc nhà Đông Dương\'. Cùng iVIVU khám phá ngay hôm nay!', 6, b'1', 30, 6600000, 'Xe đón Quý Khách tại sân bay Nội Bài đưa về Khách sạn nhận phòng, nghỉ ngơi.  Quý khách tự do khám phá thủ đô Hà Nội với 36 Phố Phường, tham quan tháp rùa, cầu Thê Húc, chùa Trấn Quốc, Lăng Bác, Văn Miếu Quốc Tử Giám,… ', 'APPROVED', 30, 'Tour Miền Bắc 6N5Đ (Khởi hành từ Hà Nội): Hà Nội - Ninh Bình - Vịnh Hạ Long - Sapa', 'Máy bay', '2024-12-09 02:36:21.068913', 0x994d294fdc7e45f18f413c3abaa9b854, 0x6f95229b367b4e7fb24dad90d407f6af, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x3da84760310a4e72b7e4a95993ff9094, '2024-12-09 01:37:59.083891', '2024-12-09', 'Vận chuyển:\n\n- Vé máy bay khứ hồi SGN – SIN/ KUL - SGN (Bao gồm 20kg hành lý ký gửi và 07kg xách tay).\n\n- Phí an ninh sân bay, bảo hiểm hàng không thuế phi trường 2 nước.\n\n- Xe máy lạnh vận chuyển suốt tuyến.\n\nLưu trú:\n\n- Khách sạn 3* và 4* tiêu chuẩn 2khách/phòng. Trường hợp lẻ nam/ nữ ghép phòng 3.\n\nKhác:\n\n- Vé tham quan như chương trình.\n\n- Phục vụ nước suối suốt hành trình tour.\n\n- Các bữa ăn theo chương trình.\n\n- Trưởng đoàn và HDV địa phương phục vụ suốt tuyến theo chương trình.\n\n- Bảo hiểm du lịch. \n\n- Quà tặng: Nón, bao da hộ chiếu.', 3, b'0', 20, 83900002, 'Quý khách tập trung tại sân bay Tân Sơn Nhất ga đi quốc tế, Trưởng Đoàn hướng dẫn làm thủ tục đi Singapore.', 'APPROVED', 20, 'Tour Singapore - Malaysia 4N3Đ: HCM - Kuala Lumpur - Malacca - Singapore', 'Máy bay', '2024-12-09 01:38:21.753903', 0xb343d8fc88094a90a0ca30ba28eef254, 0x858f9981f57344a6800d2f35a85fa9c2, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, '2024-12-09 01:57:15.739015', '2024-12-09', 'Vận Chuyển:\n\n- Vé máy bay khứ hồi HCM – Seoul - HCM. Hành lí gồm 07kg xách tay +  ký gởi 20kg.\n\n- Vận chuyển bằng xe máy lạnh hiện đại.\n\n Lưu Trú:\n\n- Nghỉ tại khách sạn 4 sao Hàn Quốc: tiêu chuẩn 2 người/phòng, nếu đoàn lẻ nam hoặc nữ thì ở phòng 3 giường.\n\nKhác:\n\n- Các bữa ăn theo chương trình.\n\n- Visa nhập cảnh Hàn Quốc.\n\n- Phí tham quan các điểm theo chương trình.\n\n- Hướng dẫn viên nhiệt tình, kinh nghiệm đi trọn tuyến.\n\n- Quà tặng: Nón, bao hộ chiếu.\n\n- Bảo hiểm du lịch không áp dụng cho người trên 70 tuổi, mức đền bù tối đa 10.000usd/khách', 3, b'0', 20, 16900000, 'Tối Hướng dẫn viên công ty du lịch đón đoàn tại sân bay Tân Sơn Nhất ga đi quốc tế, làm thủ tục đáp chuyến bay đi Hàn Quốc.', 'APPROVED', 20, 'Tour Tết Hàn Quốc 4N4Đ: HCM - Công Viên Lotte World - Trượt Tuyết Yangji Pine - Thư Viện Starfield', 'Máy bay', '2024-12-09 02:23:33.238611', 0x54f0bd78e6ba4822a8d08062d13422fd, 0x6ab4ec2089b74fed904ce29fd017bfbc, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x4b7f47ae88614439aae9ad55e4b27c36, '2024-12-03 12:19:50.629148', '2024-12-25', '- Tận hưởng sự tĩnh lặng tại Chùa Ba Vàng, nơi đất trời giao hòa.\n\n- Đứng trên đỉnh Fansipan, chạm tay vào \'Nóc nhà Đông Dương\'.\n\n- Len lỏi giữa non nước kỳ vĩ tại Tràng An, di sản thiên nhiên thế giới.\n\n- Du thuyền trên Vịnh Hạ Long, chiêm ngưỡng vẻ đẹp huyền bí đầy mê hoặc.\n\n- Dạo bước phố cổ Hà Nội, đắm mình trong hương vị ẩm thực và văn hóa ngàn năm.', 5, b'1', 20, 8290, 'Sân bay Tân Sơn Nhất', 'APPROVED', 17, 'Tour Miền Bắc 5N4Đ: HCM - Sapa - Ninh Bình - Hạ Long - Chùa Ba Vàng - Hà Nội', 'Máy bay', '2024-12-03 17:43:42.196525', 0x994d294fdc7e45f18f413c3abaa9b854, 0x6f8f71f3cc0c41c192e85aed339bb0d6, 0x438eda8872fe412598430466bfc713b1),
(0x4e41c24ac56c4cf398ff4789d9ac8893, '2024-12-09 02:22:27.071930', '2024-12-09', 'Vận Chuyến:\n\n- Vé máy bay khứ hồi SG - BK - SG (tùy ngày quý khách chọn).\n\n- Hành lý 07kg xách tay + 20kg hành lý ký gửi. Đã bao gồm các loại thuế phí phi trường hai nước…\n\n- Xe ô tô máy lạnh phục vụ riêng cho đoàn suốt tuyến.\n\nLưu Trú:\n\n- Khách sạn 3-4* Thái Lan, tiêu chuẩn 02 khách/phòng. Đối với khách đi một mình, công ty sẽ sắp xếp chia phòng với khách khác hoặc trưởng đoàn, tối đa 3 người/phòng cùng giới.\n\nKhác:\n\n- Ăn uống theo chương trình.\n\n- Vé tham quan một lần các điểm có trong chương trình.\n\n- Hướng dẫn viên tiếng Việt chăm sóc đoàn suốt tuyến từ Việt Nam.\n\n- Nước suối phục vụ hàng ngày, tiêu chuẩn 01 chai trên xe và 01 chai tại khách sạn.\n\n- Bảo hiểm du lịch với mức bồi thường tối đa 10.000usd/1 vụ.\n\n- Quà tặng nón Du Lịch.', 5, b'0', 20, 4790000, 'Sáng trưởng đoàn đón quý khách tại sân bay Tân Sơn Nhất', 'APPROVED', 20, 'Tour Thái Lan 5N4Đ: Bangkok - Pattaya - Công Viên Khủng Long (Bay Sáng, Trưa)', 'Máy bay', '2024-12-09 02:23:15.412173', 0xb343d8fc88094a90a0ca30ba28eef254, 0xbeac4ab4322540bb81f24ac8016cf319, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x512e3d05f06f4ef7b80bc056649db155, '2024-12-03 12:13:09.775518', '2024-12-19', '\n\nKhám phá tour Bình Ba 2 ngày 2 đêm sẽ đưa bạn vào hành trình đến một trong những hòn đảo đẹp nhất Việt Nam, nổi tiếng với danh xưng \'Vương quốc Tôm Hùm\'. Tại đây, bạn sẽ được lặn ngắm những rạn san hô đầy màu sắc, thưởng thức hải sản tươi ngon, và trải nghiệm cuộc sống ngư dân bình dị. Không chỉ có biển xanh và cát trắng, Bình Ba còn mê hoặc du khách bởi vẻ đẹp hoang sơ và yên bình, hứa hẹn một chuyến đi đầy thú vị và khó quên.\n\nCùng iVIVU khám phá ngay hôm nay!\n', 2, b'0', 30, 1790000, '22h00: Xe và hướng dẫn viên Công ty du lịch đón quý khách tại điểm hẹn, khởi hành đi Bình Ba.', 'APPROVED', 27, ' Tour Bình Ba 2N2Đ: Khám Phá Vương Quốc Tôm Hùm', 'Xe du lịch', '2024-12-03 18:09:02.896316', 0x994d294fdc7e45f18f413c3abaa9b854, 0xc6a2149545f945a79fbbe27219d2688e, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x66a5f094be6448188c5542f5a0a753eb, '2024-12-03 11:57:18.548984', '2024-12-07', '\n\n- Đại lộ Ngôi sao – Tham quan con đường vinh danh các ngôi sao điện ảnh nổi tiếng của Hong Kong và chiêm ngưỡng cảnh cảng Victoria.\n\n- Đỉnh núi Thái Bình (The Peak) – Ngắm toàn cảnh Hong Kong từ đỉnh núi cao nhất thành phố.\n\n- Chùa Wong Tai Sin – Viếng ngôi chùa linh thiêng nổi tiếng, nơi người dân và du khách thường đến để cầu may mắn và bình an.\n\n- Thiên đường mua sắm miễn thuế – Thỏa sức mua sắm các mặt hàng thời trang, điện tử tại các trung tâm mua sắm lớn.\n\n- Thưởng thức ẩm thực đường phố – Khám phá các món ăn đường phố nổi tiếng như dim sum, thịt nướng và bánh trứng.\n', 4, b'1', 20, 15990, 'Quý khách tập trung tại sân bay Tân Sơn Nhất, đoàn làm thủ tục cho đoàn đi Hong Kong.', 'APPROVED', 16, 'Tour Hồng Kông 4N3Đ: City Tour - Free Day - Mua Sắm Miễn Thuế', 'Máy bay', '2024-12-22 08:36:29.260339', 0xb343d8fc88094a90a0ca30ba28eef254, 0x32bae35fdf91490692d48b791ad337e1, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x6fc325169b434719a1d755907fcd3ec7, '2024-12-03 11:49:39.853897', '2024-12-12', '\n\n- Thăm Shangrila, nơi được ví như thiên đường với vẻ đẹp tự nhiên hùng vĩ.\n\n- Chinh phục Núi Tuyết Ngọc Long, nơi bạn có thể ngắm cảnh băng tuyết hùng vĩ.\n\n- Trải nghiệm văn hóa địa phương, từ ẩm thực đến các hoạt động văn hóa độc đáo.\n\n- Khám phá Thành cổ Đại Lý, nơi nổi tiếng với kiến trúc cổ kính và khung cảnh thơ mộng.\n\n- Chiêm ngưỡng vẻ đẹp huyền bí của Lệ Giang, một thị trấn cổ với những con đường đá và dòng sông êm đềm.\n', 5, b'1', 20, 13880, '10h00: Quý khách có mặt tại sân bay Tân Sơn Nhất ga đi quốc tế', 'APPROVED', 20, 'Tour Trung Quốc 5N4Đ: HCM - Thành Cổ Đại Lý - Lệ Giang - Shangrila - Núi Tuyết Ngọc Long', 'Máy bay', '2024-12-09 01:35:17.548094', 0xb343d8fc88094a90a0ca30ba28eef254, 0xc430cc30bbb34cd99e1649742c597ed4, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x9003db1f2bda4e488fe069c4dcbbae95, '2024-12-09 02:04:32.987815', '2024-12-09', 'Vận Chuyển:\n\n- Vé máy bay khứ hồi Sài Gòn – Nhật Bản - Sài Gòn đã bao gồm 20kg/chiều hành lý ký gửi.\n\n- Xe máy lạnh sử dụng theo chương trình.\n\nLưu Trú:\n\n- Khách sạn tiêu chuẩn 3-4* toàn hành trình (2 người/phòng, phòng ba sẽ được bố trí khi cần thiết).\n\nKhác:\n\n- Bảo hiểm du lịch quốc tế. Mức bồi thường tối đa 1.000.000.000 vnđ/trường hợp (không áp dụng cho người từ 75 tuổi trở lên).\n\n- Ăn uống các bữa ăn theo chương trình \n\n- Visa nhập cảnh Nhật Bản theo chương trình.\n\n- Vé thăm quan theo chương trình.\n\n- Hướng dẫn viên nhiệt tình, kinh nghiệm suốt tuyến.\n\n- Nước suối 01 chai/người/ngày.', 5, b'1', 20, 33900000, 'Sáng: Dự kiến 08h00 đoàn đến sân bay quốc tế Narita, làm thủ tục nhập cảnh', 'APPROVED', 18, 'Tour Nhật Bản 5N5Đ Tết Ta: HCM - Tokyo - Phú Sĩ - Nagoya - Kyoto - Osaka', 'Máy bay', '2024-12-09 02:23:00.827221', 0x54f0bd78e6ba4822a8d08062d13422fd, 0x8f74feb761d74810b57da023aa2a23a0, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x91a5e3b35c544534afb729d49001328d, '2024-12-09 01:31:05.093910', '2024-12-09', 'Ngày 01: Hà Nội - Dubai 21h00: Xe và HDV đón quý khách tại Nhà hát lớn ra sân bay Nội Bài, đáp chuyến bay đến Dubai (EK 395 HANDXB  0130 0505). Nghỉ đêm trên máy bay', 6, b'1', 20, 29990000, '21h00: Xe và HDV đón quý khách tại Nhà hát lớn ra sân bay Nội Bài, đáp chuyến bay đến Dubai (EK 395 HANDXB  0130 0505)', 'APPROVED', 20, 'Tour Dubai 6N5Đ: Hà Nội - Hành Trình Khám Phá Sa Mạc Safari - Vườn Hoa Miracle - Tháp Burj Khalifa', 'Máy bay', '2024-12-09 01:35:26.948583', 0xb343d8fc88094a90a0ca30ba28eef254, 0x13958fa8335a43d59e124e73e7754ce2, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0x9f3aa7e5539047c0b08b7969f728b370, '2024-12-09 01:35:02.078149', '2024-12-09', 'Tp. Hồ Chí Minh - Singapore (Ăn Sáng, Trưa Nhẹ, Tối)\n04h00: Quý khách tập trung tại sân bay Tân Sơn Nhất (Ga đi Quốc Tế) - cột số 9, HDV đón quý khách làm thủ tục khởi hành đi Singapore.\nQuý khách dùng bữa sáng tại sân bay, Hambuger hoặc Xôi.\n\nĐến sân bay Changi - Singapore, Check-in tại Jewel Changi, thác nước trong nhà cao nhất thế giới và khám phá thung lũng rừng Shiseido xanh tươi tuyệt đẹp.\n\nĐoàn ăn trưa nhẹ tại sân bay Singapore với món đặc sản Cơm Gà Hải Nam. Sau đó xe và hướng dẫn địa phương đón đoàn đi tham quan điểm đầu tiên trong chương trình:\n\nCông viên Sư Tử Biển “Merlion Park” biểu tượng đất nước Singapore.', 5, b'1', 20, 99900002, '04h00: Quý khách tập trung tại sân bay Tân Sơn Nhất (Ga đi Quốc Tế) - cột số 9, HDV đón quý khách làm thủ tục khởi hành đi Singapore.', 'APPROVED', 20, 'Tour Singapore - Malaysia 5N4Đ: Khám Phá Gardens By The Bay - Động Batu - Chùa Thiên Hậu', 'Máy bay', '2024-12-09 01:35:38.399026', 0xb343d8fc88094a90a0ca30ba28eef254, 0x858f9981f57344a6800d2f35a85fa9c2, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xa03a07051ff3434db46c8078b26b446b, '2024-12-09 02:49:35.258595', '2024-12-09', '- Khám phá văn hóa sông nước tại Chợ Nổi Cái Răng.\n\n- Tìm hiểu làm kẹo dừa và thưởng thức đặc sản ở Cồn Phụng.\n\n- Thưởng thức trái cây và đờn ca tài tử tại Cù Lao Tân Phong.\n\n- Chiêm ngưỡng kiến trúc hơn 180 năm tuổi của Nhà Cổ Ba Kiệt.\n\n- Tham quan Bến Ninh Kiều, biểu tượng thơ mộng của Cần Thơ.', 2, b'0', 30, 2300000, 'Tp.Hcm ', 'APPROVED', 30, 'Tour Miền Tây 2N1Đ: HCM - Cù Lao Tân Phong - Nhà Cổ Ba Kiệt - Cần Thơ - Cồn Phụng', 'Xe', '2024-12-09 02:50:17.828150', 0x994d294fdc7e45f18f413c3abaa9b854, 0x427685d0ddc54ee3a53092bdf15dc1fd, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xa8f1c855278d4a94bcea995004596c96, '2024-12-03 12:08:56.644765', '2024-12-17', '\n\nChiêm ngưỡng cảnh đẹp tuyệt vời tại Bà Nà Hills và Cầu Vàng – biểu tượng du lịch nổi tiếng của Đà Nẵng. Thư giãn tại bãi biển Mỹ Khê, một trong những bãi biển đẹp nhất Việt Nam với cát trắng và nước biển trong xanh. Khám phá Cố đô Huế với Đại Nội – Di sản văn hóa thế giới và viếng thăm Chùa Thiên Mụ cổ kính bên dòng sông Hương thơ mộng. Trải nghiệm thuyền trên sông Son để vào Động Phong Nha – một trong những kỳ quan thiên nhiên nổi tiếng của Việt Nam, với những hang động đá vôi kỳ ảo. Tản bộ qua Phố cổ Hội An, ngắm nhìn những con phố cổ kính, ngôi nhà cổ hàng trăm năm tuổi và thưởng thức ẩm thực địa phương độc đáo. Hành trình này kết hợp hài hòa giữa thiên nhiên, văn hóa và lịch sử, mang đến cho bạn những trải nghiệm tuyệt vời và đáng nhớ.\n\nCùng iVIVU khám phá ngay hôm nay! \n', 4, b'1', 30, 6590, '06:00  Nhân Viên CTY sẽ đón quý khách tai sân bay Tân Sơn Nhất, làm thủ tục khởi hành đi Đà Nẵng trên chuyến bay dự kiến  lúc 07:25.', 'APPROVED', 19, 'Tour Đà Nẵng 4N3Đ: HCM - Đà Nẵng - Bà Nà - Hội An - Động Phong Nha - Kinh Thành Huế', 'Máy bay', '2024-12-03 12:34:30.066325', 0x994d294fdc7e45f18f413c3abaa9b854, 0x7cf4b336061048f0b477dce914fa47d1, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xb3443d719bf341bbb3b6fe0d91648238, '2024-12-09 02:40:38.172491', '2024-12-09', '- Vườn trái cây Bến Tre: Thưởng thức trái cây tươi ngon ngay tại vườn.\n\n- Chợ nổi Cái Răng: Trải nghiệm mua sắm giữa sông nước, độc đáo và rực rỡ sắc màu.\n\n- Chùa Vĩnh Tràng: Chiêm ngưỡng ngôi chùa cổ kính với kiến trúc Đông - Tây độc đáo.\n\n- Lò kẹo dừa: Khám phá quy trình làm kẹo dừa thơm lừng, đặc sản ngọt ngào của Bến Tre.\n\n- Phố đêm Ninh Kiều: Dạo bước trên bến Ninh Kiều lung linh, thưởng thức ẩm thực hấp dẫn.', 2, b'1', 30, 1650000, '07h00: Xe khởi hành, bắt đầu chương trình tour miền Tây 1 ngày Mỹ Tho – Bến Tre (cách thành phố Hồ Chí Minh khoảng 80km).', 'APPROVED', 28, 'Tour Miền Tây 2N1Đ: Hành Trình Mỹ Tho - Bến Tre - Cần Thơ', 'Xe', '2024-12-21 21:48:14.990155', 0x994d294fdc7e45f18f413c3abaa9b854, 0x427685d0ddc54ee3a53092bdf15dc1fd, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xba978c668fb8462985f93040293bbccd, '2024-12-09 02:29:22.850009', '2024-12-09', '- Vé máy bay theo chương trình Hà Nội - Bắc Kinh//Thượng Hải - Hà Nội hàng không Air China\n\n- Vé tàu cao tốc chặng Bắc Kinh – Hàng Châu\n\n- Khách sạn theo chương trình tiêu chuẩn 4 sao địa phương (2 người / phòng tại khách sạn, lẻ khách ở 3 kê extra bed)\n\n- Ăn các bữa theo chương trình (mức 40NDT/bữa chính gồm 8 món + 1 canh)\n\n- Tặng 1 bữa lẩu đặc biệt tại Bắc Kinh\n\n- Tặng 1 đêm khách sạn có tắm khoáng nóng ở Bắc Kinh\n\n- Xe ô tô đưa đón theo chương trình.\n\n- Vé vào cửa các điểm thăm quan theo chương trình.\n\n- Visa vào Trung Quốc cho người Việt Nam (visa đoàn)\n\n- Trưởng đoàn và HDV theo chương trình.\n\n- Nước uống trên ô tô 1 chai/người/ngày.\n\n- Bảo hiểm du lịch với mức đền bù 10,000USD.\n\n- Quà tặng của công ty: Mũ', 7, b'1', 20, 20990000, '9h00: Xe và HDV đón đoàn tại điểm hẹn và đưa đoàn ra sân bay quốc tế Nội Bài đáp chuyến bay đi Bắc Kinh. Chuyến bay CA742 HANPEK ', 'APPROVED', 19, 'Tour Trung Quốc 7N6Đ: Hà Nội - Bắc Kinh - Trải Nghiệm Trượt Tuyết - Hàng Châu - Ô Trấn - Thượng Hải', 'Máy bay', '2024-12-09 02:36:11.932226', 0xb343d8fc88094a90a0ca30ba28eef254, 0xc430cc30bbb34cd99e1649742c597ed4, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xc6f885ace0d245cf85abdfeef273ecf3, '2024-12-09 01:42:50.553952', '2024-12-09', 'Vận Chuyển:\n\n- Vé máy bay khứ hồi theo đoàn hãng Vietjet Air (SGN-PUS-ICN-SGN). Hành lý:20kg ký gửi + 7kg xách tay.\n\n- Phí an ninh sân bay, bảo hiểm hàng không thuế phi trường 2 nước (có thể thay đổi lúc xuất vé).\n\n- Xe máy lạnh vận chuyển suốt tuyến.\n\nLưu Trú:\n\n- Khách sạn tiêu chuẩn 3-4* Hàn Quốc, tiêu chuẩn 2 người/phòng - phòng 3 người trường hợp đi lẻ nam hoặc nữ.\n\nDeagu 3*: QueenVell, Grand...\n\nSeoul 4*: Golden seoul, Sono Calm, Standford, Orakai Hotel...\n\nKhác:\n\n- Các bữa ăn như chương trình.\n\n- Visa nhập cảnh Hàn Quốc 1 lần.\n\n- Vé tham quan như chương trình.\n\n- Bảo hiểm du lịch Quốc tế suốt tuyến. \n\n- Phục vụ 1 chai nước suối/khách/ngày.\n\n- Trưởng đoàn và HDV địa phương phục vụ suốt tuyến theo chương trình.', 4, b'0', 20, 15990000, 'Đêm 1: Tp. Hcm - Busan (Nghỉ Đêm Trên Máy Bay) Quý khách tập trung tại sân bay Tân Sơn Nhất ga đi quốc tế', 'APPROVED', 20, 'Tour Hàn Quốc 4N4Đ: Khám Phá Busan - Daegu - Seoul - Công Viên E-World', 'Máy bay', '2024-12-09 02:22:53.513321', 0xb343d8fc88094a90a0ca30ba28eef254, 0x6ab4ec2089b74fed904ce29fd017bfbc, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xc8c2d669d5ea451281450fbd72c10da1, '2024-12-09 02:45:24.456959', '2024-12-09', '- Mũi Cà Mau: Ngắm nhìn vẻ đẹp hoang sơ, nơi đất liền gặp biển cả.\n\n- Cồn Lân Quy Phụng: Khám phá các cồn nổi trên sông Tiền, trải nghiệm văn hóa miệt vườn.\n\n- Chợ nổi Cái Răng: Mua sắm trên chợ nổi sông nước, trải nghiệm văn hóa giao thương độc đáo.\n\n- Nhà Công tử Bạc Liêu: Tham quan dinh thự xa hoa, nghe chuyện thú vị về vị công tử nổi tiếng.\n\n- Chùa Bà Chúa Xứ: Địa điểm tâm linh nổi tiếng ở Châu Đốc, nơi du khách cầu may và khám phá văn hóa tín ngưỡng miền Tây', 4, b'0', 30, 4250000, 'Tp.Hcm - Tiền Giang - Bến Tre - Châu Đốc (Ăn Sáng, Trưa, Tối) 07h00: Xe đón tại 219 Phạm Ngũ Lão, P. Phạm Ngũ Lão, Quận 1', 'APPROVED', 29, 'Tour Miền Tây 4N3Đ: Sài Gòn - Mỹ Tho - Châu Đốc - Cần Thơ - Sóc Trăng - Cà Mau - Bạc Liêu', 'Xe', '2024-12-09 02:50:07.874687', 0x994d294fdc7e45f18f413c3abaa9b854, 0x427685d0ddc54ee3a53092bdf15dc1fd, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xd1eb900fd2d240cbb91ac849709e051d, '2024-12-08 13:23:20.630939', '2024-12-19', '- Ngắm núi Phú Sĩ hùng vĩ: Thưởng ngoạn biểu tượng thiên nhiên của Nhật Bản từ trạm dừng chân thứ 5.\n\n- Dạo bước khu phố cổ Gion: Trải nghiệm văn hóa Kyoto với những con hẻm nhỏ, nhà gỗ cổ kính và cơ hội gặp Geisha.\n\n- Tham quan chùa Vàng Kinkakuji: Chiêm ngưỡng kiến trúc vàng lộng lẫy phản chiếu trên hồ nước tĩnh lặng, đầy thơ mộng.\n\n- Khám phá lâu đài Osaka: Tìm hiểu lịch sử huy hoàng và thưởng thức cảnh đẹp mùa xuân từ trên cao.\n\n- Mua sắm sầm uất tại Shinsaibashi: Thỏa sức lựa chọn các sản phẩm thời trang, mỹ phẩm và đặc sản địa phương nổi tiếng.', 5, b'1', 20, 33900000, 'Quý khách tập trung tại sân bay Tân Sơn Nhất làm thủ tục đáp chuyến bay VJ822 (23h20 – 08h00) đi Nhật Bản', 'APPROVED', 20, 'Tour Nhật Bản 5N5Đ Tết Ta: HCM - Tokyo - Phú Sĩ - Nagoya - Kyoto - Osaka', 'Máy bay', '2024-12-08 13:25:22.536103', 0xb343d8fc88094a90a0ca30ba28eef254, 0x8f74feb761d74810b57da023aa2a23a0, 0x28dd5c02ef884a0ea2ab657a5a043206),
(0xd327f99842d64bf1b0bd14ebc3e1db88, '2024-12-09 01:25:54.997717', '2024-12-09', 'Ngày 1: Hà Nội - Dubai (Nghỉ Đêm Trên Máy)21h30: Xe và hướng dẫn viên công ty đón Quý khách tại điểm hẹn đưa ra sân bay Nội Bài, đáp chuyến bay lúc EK395 (01h30 – 05h05) của hãng hàng không cao cấp 5* Emirates đi Dubai. Quý khách nghỉ đêm trên máy bay', 6, b'1', 20, 29900000, 'Hà Nội', 'APPROVED', 18, 'Tour Dubai 6N5Đ: Hà Nội - Khám Phá Các Tiểu Vương Quốc Ả Rập Huyền Bí', '21h30: Xe và hướng dẫn viên công ty đón Quý khách tại điểm hẹn đưa ra sân bay Nội Bài, đáp chuyến bay lúc EK395 (01h30 – 05h05) ', '2024-12-09 01:35:47.126533', 0xb343d8fc88094a90a0ca30ba28eef254, 0x13958fa8335a43d59e124e73e7754ce2, 0x28dd5c02ef884a0ea2ab657a5a043206);

-- --------------------------------------------------------

--
-- Table structure for table `tour_images`
--

CREATE TABLE `tour_images` (
  `tour_id` binary(16) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tour_images`
--

INSERT INTO `tour_images` (`tour_id`, `image_url`) VALUES
(0x6fc325169b434719a1d755907fcd3ec7, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201365/yc9rnbn6qpkdsqzbogqf.gif'),
(0x6fc325169b434719a1d755907fcd3ec7, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201365/r3jjnqqcvgecwwip08qg.gif'),
(0x6fc325169b434719a1d755907fcd3ec7, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201365/cs7yrqdr8jzlr9gdmt1t.jpg'),
(0x6fc325169b434719a1d755907fcd3ec7, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201366/zxusmppps48joerup9u7.gif'),
(0x66a5f094be6448188c5542f5a0a753eb, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201811/x4ufs7egkoynefomqrge.gif'),
(0x66a5f094be6448188c5542f5a0a753eb, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201812/q3v4yl5ypr708cf8h59d.gif'),
(0x66a5f094be6448188c5542f5a0a753eb, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201812/nchygxmbcvyesuoiu3pj.jpg'),
(0x66a5f094be6448188c5542f5a0a753eb, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201811/scl7rhdfev508xh5szse.gif'),
(0x66a5f094be6448188c5542f5a0a753eb, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733201811/odkzyicz4eq69yqzbaag.jpg'),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202295/znyah654sxwzvqgnnr1v.jpg'),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202295/xxcodszj6i4pde7ehpbp.jpg'),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202295/yf4mke2xfakgackynkak.jpg'),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202291/pvrz7ifmqqf3ge29r5xb.gif'),
(0xa8f1c855278d4a94bcea995004596c96, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202513/ih6rpmk1cgdm8bfpw5pa.gif'),
(0xa8f1c855278d4a94bcea995004596c96, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202509/veahdbjroeupprc66j9r.jpg'),
(0xa8f1c855278d4a94bcea995004596c96, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202511/gewhutarob9uhq1dhgxv.jpg'),
(0xa8f1c855278d4a94bcea995004596c96, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202511/okhdoniftz8qfogljwfw.jpg'),
(0x512e3d05f06f4ef7b80bc056649db155, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733202770/f249pzapssgdxdkpgezj.gif'),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733203182/aknkduwd0n7kbrollp66.jpg'),
(0xd1eb900fd2d240cbb91ac849709e051d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733638948/j2y8t0ittjs5jeeyocqp.gif'),
(0xd1eb900fd2d240cbb91ac849709e051d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733638949/emscfkeqisqju9ouzovv.jpg'),
(0xd1eb900fd2d240cbb91ac849709e051d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733638950/syx0khyq33remnykhmua.gif'),
(0xd1eb900fd2d240cbb91ac849709e051d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733638948/wm6prpgrvknrxtk3sikq.jpg'),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733681939/s7sbpf7q5vrdcewoydtx.jpg'),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733681939/nhzdxl8qgdxh7exbz48f.gif'),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733681940/yd9wwunuflifadpm4tok.gif'),
(0x91a5e3b35c544534afb729d49001328d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682323/no1m2zb8hldrjlf2ebhx.jpg'),
(0x91a5e3b35c544534afb729d49001328d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682323/ria0f7rglwkgdpxcrxff.jpg'),
(0x91a5e3b35c544534afb729d49001328d, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682323/inczwzizvpqgi0a3z7lg.jpg'),
(0x9f3aa7e5539047c0b08b7969f728b370, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682639/o7rpdj0odlrd7b4rocbm.gif'),
(0x9f3aa7e5539047c0b08b7969f728b370, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682641/bsaiq96ks4rnjpamngkr.gif'),
(0x9f3aa7e5539047c0b08b7969f728b370, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682642/nmnoajcqzudh7ifngp4d.gif'),
(0x3da84760310a4e72b7e4a95993ff9094, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733682731/meeol9aazuhkaa5p6ifg.gif'),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683137/p3uz5sbp8fnkin7ypwr6.jpg'),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683137/qtpfnhxrjo1tcpktxnb3.gif'),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683137/evgjeth8gbtwpvlq6svu.jpg'),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683771/uxa4ki5wzjeqkgzlc7su.gif'),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683769/nomtuxw0vm9uytxjidyp.gif'),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683489/zioaneidb81gqvnfq9vf.jpg'),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683772/hrosfmp3h4vp21eddgxh.gif'),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733683489/h08mkhhbdyn9b2p1ou03.gif'),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684450/shgyk128q9s6o6rm13so.jpg'),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684450/mzyhyrz5jv7xl4nzdj82.gif'),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684452/euacgjpgrkddrenkb29i.jpg'),
(0x188694ade01d4713bba8173539d24010, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684739/nn6hz91za3a8qzxpjjhc.jpg'),
(0x188694ade01d4713bba8173539d24010, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684739/hzaaaf7odcxsq6okt0rd.gif'),
(0x188694ade01d4713bba8173539d24010, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733684739/ehy1d8hfwtroog7ooanq.jpg'),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733685474/ih1qh8h2antb2b9pdlym.gif'),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733685475/onlsiu7rhfaxdexn7a1m.jpg'),
(0xba978c668fb8462985f93040293bbccd, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733685947/pdpy3yr6dhs3wfj9o7do.jpg'),
(0xba978c668fb8462985f93040293bbccd, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733685944/bk98ugb8pbjkb8l6gjeq.jpg'),
(0xba978c668fb8462985f93040293bbccd, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733685944/tke1d7gzk6zb9t7xcjx5.gif'),
(0x3706a03349bf4c6fb4da9befc8585533, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686322/bxap8qe7ivzb4nn65tat.gif'),
(0x3706a03349bf4c6fb4da9befc8585533, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686321/v7usoxb1sfbngczsixgs.gif'),
(0x3706a03349bf4c6fb4da9befc8585533, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686326/jake4mlkge79qv7zznmw.gif'),
(0xb3443d719bf341bbb3b6fe0d91648238, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686716/p4g94jh3dl6v5pn16r9f.gif'),
(0xb3443d719bf341bbb3b6fe0d91648238, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686712/atpm6rfiairtsicswggv.jpg'),
(0xb3443d719bf341bbb3b6fe0d91648238, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686711/tan26rirycholsbwuoon.gif'),
(0xc8c2d669d5ea451281450fbd72c10da1, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686955/ch9arsnjfowbaraxhhro.gif'),
(0xc8c2d669d5ea451281450fbd72c10da1, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686956/wrym1hgln4wqtfapnrbb.jpg'),
(0xc8c2d669d5ea451281450fbd72c10da1, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686957/tnlma9u40ecqtcsvdw0a.gif'),
(0xc8c2d669d5ea451281450fbd72c10da1, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733686954/vkrkxdwtqy9myppobtov.jpg'),
(0xa03a07051ff3434db46c8078b26b446b, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733687235/wm2t9lhtwqb2ofybt3an.jpg'),
(0xa03a07051ff3434db46c8078b26b446b, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733687235/x7fy3pwn9gimblhjt7cu.gif'),
(0xa03a07051ff3434db46c8078b26b446b, 'http://res.cloudinary.com/dcc239rej/image/upload/v1733687235/ibnw0em0m5pzxpphspx8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tour_itinerary`
--

CREATE TABLE `tour_itinerary` (
  `tour_id` binary(16) NOT NULL,
  `itinerary_step` text,
  `day_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tour_itinerary`
--

INSERT INTO `tour_itinerary` (`tour_id`, `itinerary_step`, `day_order`) VALUES
(0x188694ade01d4713bba8173539d24010, 'Ngày 01:Hồ Chí Minh - Narita (Nghỉ Đêm Trên Máy Bay) 20:30 HDV của của công ty sẽ đón đoàn tại Ga đi Quốc tế, sân bay Tân S¡n Nhất. Làm thủ tục đáp chuyến bay của hãng Japan Airline – hãng hàng không quốc gia Nhật Bản. Khởi hành đi Nhật Bản lúc 23:40 phút. Đoàn nghỉ đêm & ăn sáng trên máy bay.', 0),
(0x188694ade01d4713bba8173539d24010, 'Ngày 02: Tokyo - Yamanashi (Ăn Sáng, Trưa, Chiều)', 1),
(0x188694ade01d4713bba8173539d24010, 'Ngày 03:Yamanashi - Toyohashi (Ăn Sáng, Trưa, Chiều)', 2),
(0x188694ade01d4713bba8173539d24010, 'Ngày 04: Nagoya - Kyoto - Osaka - Kansai (Ăn Sáng, Trưa, Tối)', 3),
(0x188694ade01d4713bba8173539d24010, 'Ngày 05: Kansai – Tp.Hcm ( Ăn Sáng, Trưa Trên Máy Bay)', 4),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'Đêm 01 Hồ Chí Minh - Narita (Nghỉ Đêm Trên Máy Bay) Hướng dẫn viên sẽ đón Quý khách tại Cổng D2, Lầu 2, Ga đi quốc tế Tân Sơn Nhất ga đi Quốc tế, sân bay Tân Sơn Nhất. Làm thủ tục đáp chuyến bay của Vietjet Air VJ822 khởi hành đi Narita lúc 23h55. Đoàn nghỉ đêm trên máy bay.', 0),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'Ngày 01 Tokyo - Yamanashi (Ăn Sáng, Trưa, Chiều)', 1),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'Ngày 02 Yamanashi – Fuji – Tokyo (Ăn Sáng, Trưa, Chiều)', 2),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'Ngày 3 Tham Quan Tokyo - Narita (Ăn Sáng/trưa/tối)', 3),
(0x30efdb1714cb4f0c8d70038fc79f9946, 'Ngày 4 Narita - Tp.Hồ Chí Minh (Ăn Sáng/ Trưa)', 4),
(0x3706a03349bf4c6fb4da9befc8585533, 'Ngày 01: Đón Bay Nội Bài – Hà Nội Xe đón Quý Khách tại sân bay Nội Bài đưa về Khách sạn nhận phòng, nghỉ ngơi. Quý khách tự do khám phá thủ đô Hà Nội với 36 Phố Phường, tham quan tháp rùa, cầu Thê Húc, chùa Trấn Quốc, Lăng Bác, Văn Miếu Quốc Tử Giám,…', 0),
(0x3706a03349bf4c6fb4da9befc8585533, 'Ngày 02: Hà Nội - Chùa Bái Đính – Kdl Tràng An (Ăn Sáng, Trưa)', 1),
(0x3706a03349bf4c6fb4da9befc8585533, 'Ngày 03: Hà Nội - Vịnh Hạ Long - Chèo Thuyền Kayak (Ăn Sáng, Trưa, Tối)', 2),
(0x3706a03349bf4c6fb4da9befc8585533, 'Ngày 04:Khám Phá Thành Phố Hạ Long – Hà Nội (Ăn Sáng, Trưa)', 3),
(0x3706a03349bf4c6fb4da9befc8585533, 'Ngày 05,06:Sapa – Hà Nội (Ăn Sáng, Trưa)', 4),
(0x3da84760310a4e72b7e4a95993ff9094, 'Chương trình tour', 0),
(0x3da84760310a4e72b7e4a95993ff9094, 'NGÀY 1: TP.HCM - SINGAPORE - CITY TOUR - JOHOR BAHRU (Ăn 3 bữa) Quý khách tập trung tại sân bay Tân Sơn Nhất ga đi quốc tế, Trưởng Đoàn hướng dẫn làm thủ tục đi Singapore. Đến nơi, đoàn làm thủ tục nhập cảnh.', 1),
(0x3da84760310a4e72b7e4a95993ff9094, 'NGÀY 2: JOHOR BAHRU - PHỐ CỔ MALACA - KUALA LUMPUR (Ăn 3 bữa)', 2),
(0x3da84760310a4e72b7e4a95993ff9094, 'NGÀY 3: KUALA LUMPUR - CAO NGUYÊN GENTING - KUALA LUMPUR (Ăn 3 bữa)', 3),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'Tối ngày 1: Tp. Hcm - Seoul (Nghỉ Đêm Trên Máy Bay)', 0),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'Tối Hướng dẫn viên công ty du lịch đón đoàn tại sân bay Tân Sơn Nhất ga đi quốc tế, làm thủ tục đáp chuyến bay đi Hàn Quốc.Quý khách nghỉ đêm trên máy bay (không gồm bữa ăn trên máy bay).', 1),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'Ngày 01: Seoul - Cung Điện - Làng Cổ (Ăn Sáng, Trưa, Tối)', 2),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'Ngày 02: Trượt Tuyết - Show Nghệ Thuật (Ăn Sáng, Trưa, Tối)', 3),
(0x41ec19cb464e4553b5a9924e4ca3d6a0, 'Ngày 03: Shopping - Lotte World (Ăn Sáng, Trưa, Tối)', 4),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'Ngày 01 Tp Hồ Chí Minh - Hà Nội - Sapa (Ăn Trưa, Tối)', 0),
(0x4b7f47ae88614439aae9ad55e4b27c36, '04h00: Đón đoàn tại sân bay Tân Sơn Nhất, làm thủ tục bay đi Hà Nội trên chuyến bay VJ120 06:00. (Quý khách tự túc bữa sáng)', 1),
(0x4b7f47ae88614439aae9ad55e4b27c36, '08h00: Đến sân bay Nội Bài, xe khởi hành đưa đoàn đi Sapa.', 2),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'Ngày 02 Sapa - Fansipan - Bản Cát Cát (Ăn Sáng, Trưa)', 3),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'Ngày 03 Sapa - Hà Nội (Ăn Sáng, Trưa, Tối)', 4),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'Ngày 04 Hà Nội - Tràng An (Ninh Bình) - Hạ Long (Ăn Sáng, Trưa, Tối)', 5),
(0x4b7f47ae88614439aae9ad55e4b27c36, 'Ngày 05 Hạ Long - Sân Bay Nội Bài (Ăn Sáng, Trưa)', 6),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'Ngày 1: Sài Gòn - Bangkok (Ăn Trưa Nhẹ, Tối). Sáng trưởng đoàn đón quý khách tại sân bay Tân Sơn Nhất, làm thủ tục xuất cảnh đi Bangkok', 0),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'Ngày 2: Pattaya (Ăn Sáng, Trưa, Tối)', 1),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'Ngày 3: Pattaya - Bangkok (Ăn Sáng, Trưa, Tối)', 2),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'Ngày 4: Bangkok - Mua Sắm (Ăn Sáng, Trưa, Tối Tự Túc)', 3),
(0x4e41c24ac56c4cf398ff4789d9ac8893, 'Ngày 5: Bangkok - Sài Gòn (Ăn Sáng)', 4),
(0x512e3d05f06f4ef7b80bc056649db155, 'Lưu ý Chương Trình Không áp Dụng Cho Khách Nước Ngoài Và Người Có Quôc Tịch Nước Ngoài', 0),
(0x512e3d05f06f4ef7b80bc056649db155, 'co', 1),
(0x512e3d05f06f4ef7b80bc056649db155, 'Các điểm đón trả khách:', 2),
(0x512e3d05f06f4ef7b80bc056649db155, '- Nhà Văn Hóa Thanh Niên - Số 4 Phạm Ngọc Thạch, Quận 1.', 3),
(0x512e3d05f06f4ef7b80bc056649db155, '- Thuận Kiều Plaza, quận 5 (không có điểm gửi xe máy).', 4),
(0x512e3d05f06f4ef7b80bc056649db155, '- Vạn Phúc City, TP Thủ Đức (không có điểm gửi xe máy).', 5),
(0x512e3d05f06f4ef7b80bc056649db155, '- Ngã 4 Thủ Đức - Xa Lộ Hà Nội, TP Hồ Chí Minh (không có điểm gửi xe máy).', 6),
(0x512e3d05f06f4ef7b80bc056649db155, '- Ngã 4 Amata - Biên Hòa, Đồng Nai.', 7),
(0x512e3d05f06f4ef7b80bc056649db155, 'Đêm 01 Tp Hồ Chí Minh - Cam Ranh (Nghỉ Đêm Trên Xe) 22h00: Xe và hướng dẫn viên Công ty du lịch đón quý khách tại điểm hẹn, khởi hành đi Bình Ba.', 8),
(0x512e3d05f06f4ef7b80bc056649db155, 'Ngày 1 Vịnh Cam Ranh - Đảo Bình Ba (Ăn Sáng, Trưa, Tối)', 9),
(0x512e3d05f06f4ef7b80bc056649db155, 'Ngày 02 Đảo Bình Ba - Tp Hồ Chí Minh (Ăn Trưa)', 10),
(0x66a5f094be6448188c5542f5a0a753eb, 'Ngày 01: Tphcm - Hong Kong (Ăn Tối): Quý khách tập trung tại sân bay Tân Sơn Nhất, đoàn làm thủ tục cho đoàn đi Hong Kong. Đến sân bay Quốc Tế Chek Lap Kok, xe và HDV địa phương đón và đưa đoàn bắt đầu hành trình, trên đường đi qua Cầu Thanh Mã - Cầu treo đẹp nhất Châu Á.', 0),
(0x66a5f094be6448188c5542f5a0a753eb, 'Ngày 02: Hong Kong - City Tour (Ăn Sáng, Trưa, Tối)', 1),
(0x66a5f094be6448188c5542f5a0a753eb, 'Ngày 03 Hong Kong - Freeday (Ăn Sáng)', 2),
(0x66a5f094be6448188c5542f5a0a753eb, 'Ngày 04 Hongkong - Tp.Hcm (Ăn Sáng, Trưa Nhẹ)', 3),
(0x6fc325169b434719a1d755907fcd3ec7, 'Ngày 01: Tp. Hồ Chí Minh - Lệ Giang - Đại Lý (Ăn Tối): 10h00: Quý khách có mặt tại sân bay Tân Sơn Nhất ga đi quốc tế. Trưởng Đoàn hướng dẫn làm thủ tục chuyến VJ3796 13:00 - 17:30. HDV đón đoàn về khách sạn tại Đại Lý nhận phòng nghỉ ngơi, nghỉ đêm tại Đại Lý', 0),
(0x6fc325169b434719a1d755907fcd3ec7, 'Ngày 02:  Đại Lý - Shangrila (Ăn Sáng, Trưa, Tối)', 1),
(0x6fc325169b434719a1d755907fcd3ec7, 'Ngày 03: Shangrila - Lệ Giang (Ăn Sáng, Trưa, Tối)', 2),
(0x6fc325169b434719a1d755907fcd3ec7, 'Ngày 04: Lệ Giang (Ăn Sáng, Trưa, Tối)', 3),
(0x6fc325169b434719a1d755907fcd3ec7, 'Ngày 05: Lệ Giang - Tp. Hồ Chí Minh (Ăn Sáng, Trưa)', 4),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Ngày 1: Tokyo (Ăn Sáng Cầm Tay, Trưa, Tối)', 0),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Sáng: Dự kiến 08h00 đoàn đến sân bay quốc tế Narita, làm thủ tục nhập cảnh. HDV và xe đưa Quý khách về Tokyo tham quan', 1),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Ngày 2: Tokyo - Phú Sĩ (Ăn Sáng, Trưa, Tối)', 2),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Ngày 3: Phú Sĩ - Nagoya (Ăn Sáng, Trưa, Tối)', 3),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Ngày 4: Nagoya - Kyoto - Osaka - Kansai (Ăn Sáng, Trưa, Tối)', 4),
(0x9003db1f2bda4e488fe069c4dcbbae95, 'Ngày 5: Kansai – Tp.Hcm ( Ăn Sáng, Trưa Trên Máy Bay)', 5),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 01: Hà Nội - Dubai', 0),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 02: Sharjah (Ăn Sáng, Trưa, Tối)', 1),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 3: Dubai – Desert Safari ( Ăn Sáng, Trưa, Tối)', 2),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 4:Dubai – Abu Dhabi ( Ăn Sáng, Trưa, Tối)', 3),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 5: Dubai ( Ăn Sáng, Trưa, Tối)', 4),
(0x91a5e3b35c544534afb729d49001328d, 'Ngày 6: Dubai – Hà Nội', 5),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Ngày 01: Tp. Hồ Chí Minh - Singapore (Ăn Sáng, Trưa Nhẹ, Tối)', 0),
(0x9f3aa7e5539047c0b08b7969f728b370, '04h00: Quý khách tập trung tại sân bay Tân Sơn Nhất (Ga đi Quốc Tế) - cột số 9, HDV đón quý khách làm thủ tục khởi hành đi Singapore.', 1),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Quý khách dùng bữa sáng tại sân bay, Hambuger hoặc Xôi.', 2),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Đến sân bay Changi - Singapore, Check-in tại Jewel Changi, thác nước trong nhà cao nhất thế giới và khám phá thung lũng rừng Shiseido xanh tươi tuyệt đẹp.', 3),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Đoàn ăn trưa nhẹ tại sân bay Singapore với món đặc sản Cơm Gà Hải Nam. Sau đó xe và hướng dẫn địa phương đón đoàn đi tham quan điểm đầu tiên trong chương trình:', 4),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Công viên Sư Tử Biển “Merlion Park” biểu tượng đất nước Singapore.', 5),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Ngày 02: Singapore - Malaysia (Ăn Sáng, Trưa, Tối)', 6),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Ngày 03: Johor - Malacca - Kuala Lumpur (Ăn Sáng, Trưa, Tối)', 7),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Ngày 04: Hoàng Cung Malaysia - Tháp Đôi Petronas (Ăn Sáng, Trưa, Tối)', 8),
(0x9f3aa7e5539047c0b08b7969f728b370, 'Ngày 05: Malaysia - Tp. Hồ Chí Minh (Ăn Sáng, Trưa Nhẹ)', 9),
(0xa03a07051ff3434db46c8078b26b446b, 'Ngày 1: HCM - Cái Bè - Cần Thơ (Ăn Trưa) 07h30: Đón đoàn tại 112 Trần Hưng Đạo, Quận 1 khởi hành đi Miền Tây. Đến Mỹ Tho, thưởng thức bữa sáng với đặc sản Hủ tíu Mỹ Tho (chi phí tự túc). Đến Cái Bè đi thuyền dạo trên sông tham quan các làng nghề truyền thống của người dân địa phương nơi đây.', 0),
(0xa03a07051ff3434db46c8078b26b446b, 'Ngày 2: Cần Thơ - Chợ Nổi Cái Răng - Cồn Sơn - HCM (Ăn Sáng, Trưa)', 1),
(0xa8f1c855278d4a94bcea995004596c96, 'Ngày 1 Đà Nẵng - Bán Đảo Sơn Trà - Phố Cổ Hội An (Ăn Trưa) 06:00  Nhân Viên CTY sẽ đón quý khách tai sân bay Tân Sơn Nhất, làm thủ tục khởi hành đi Đà Nẵng trên chuyến bay dự kiến  lúc 07:25.', 0),
(0xa8f1c855278d4a94bcea995004596c96, 'Ngày 2 Kdl Bà Nà - Vịnh Lăng Cô - Cố Đô Huế (Ăn Sáng, Tối)', 1),
(0xa8f1c855278d4a94bcea995004596c96, 'Ngày 3 Thánh Địa La Vang - Cầu Hiền Lương - Động Phong Nha (Ăn Sáng, Trưa, Tối)', 2),
(0xa8f1c855278d4a94bcea995004596c96, 'Ngày 4 Đại Nội - Chùa Thiên Mụ (Ăn Sáng, Trưa)', 3),
(0xb3443d719bf341bbb3b6fe0d91648238, 'Ngày 1: Sài Gòn – Mỹ Tho – Bến Tre – Cần Thơ (Ăn Sáng, Trưa, Tối) 07h00: Xe khởi hành, bắt đầu chương trình tour miền Tây 1 ngày Mỹ Tho – Bến Tre (cách thành phố Hồ Chí Minh khoảng 80km). Trên đường đi đoàn dừng chân ăn sáng tại nhà hàng địa phương.', 0),
(0xb3443d719bf341bbb3b6fe0d91648238, 'Ngày 2: Cần Thơ – Sài Gòn (Ăn Sáng, Trưa)', 1),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 1: Hà Nội - Bắc Kinh ( Ăn tối) 09h00: Xe và HDV đón đoàn tại điểm hẹn và đưa đoàn ra sân bay quốc tế Nội Bài đáp chuyến bay đi Bắc Kinh. Chuyến bay CA742 HANPEK 13:25 – 17:55', 0),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 2: Bắc Kinh - Vạn Lý Trường Thành - Trượt Tuyết (Ăn Sáng, Trưa, Tối)', 1),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 3: Bắc Kinh - Tử Cấm Thành (Ăn sáng, Trưa, tối)', 2),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 4: Bắc Kinh - Hàng Châu (Ăn Sáng, Trưa, Tối)', 3),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 5: Hàng Châu - Ô Trấn (Ăn Sáng, Trưa, Tối)', 4),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 6: Ô Trấn - Thượng Hải (Ăn Sáng, Trưa, Tối)', 5),
(0xba978c668fb8462985f93040293bbccd, 'Ngày 7: Thượng Hải - Hà Nội (Ăn Sáng, Trưa)', 6),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'Đêm 1: Tp. Hcm - Busan (Nghỉ Đêm Trên Máy Bay) Quý khách tập trung tại sân bay Tân Sơn Nhất ga đi quốc tế, Trưởng đoàn làm thủ tục hàng không cho quý khách đáp chuyến bay VJ868 SGN-PUS 00:55 - 07:45 đi Hàn Quốc.', 0),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'Ngày 1: Busan - Deagu (Ăn Sáng, Trưa, Tối)', 1),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'Ngày 2: Deagu - Seoul (Ăn Sáng, Trưa, Tối)', 2),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'Ngày 3: Seoul - Cảnh Phúc Cung (Ăn Sáng, Trưa, Tối)', 3),
(0xc6f885ace0d245cf85abdfeef273ecf3, 'Ngày 4: Seoul - Tp. Hcm (Ăn Sáng, Trưa, Tối)', 4),
(0xc8c2d669d5ea451281450fbd72c10da1, 'Ngày 1: Tp.Hcm - Tiền Giang - Bến Tre - Châu Đốc (Ăn Sáng, Trưa, Tối) 07h00: Xe đón tại 219 Phạm Ngũ Lão, P. Phạm Ngũ Lão, Quận 1 khởi hành, bắt đầu chương trình. Trên đường đi đoàn dừng chân ăn sáng tại nhà hàng địa phương', 0),
(0xc8c2d669d5ea451281450fbd72c10da1, 'Ngày 2: Châu Đốc - Núi Sam - Trà Sư - Cần Thơ (Ăn Sáng, Trưa, Tối)', 1),
(0xc8c2d669d5ea451281450fbd72c10da1, 'Ngày 3: Cần Thơ - Sóc Trăng - Cà Mau (Ăn Sáng, Trưa, Tối)', 2),
(0xc8c2d669d5ea451281450fbd72c10da1, 'Ngày 4: Cà Mau - Bạc Liêu - Tp. Hcm (Ăn Sáng, Trưa)', 3),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Đêm NGÀY 1: Sài Gòn - Narita (Nghỉ Đêm Trên Máy Bay) Quý khách tập trung tại sân bay Tân Sơn Nhất làm thủ tục đáp chuyến bay VJ822 (23h20 – 08h00) đi Nhật Bản. Quý khách nghỉ đêm trên máy bay Quý khách nghỉ đêm trên máy bay.', 0),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Ngày 1: Tokyo (Ăn Sáng Cầm Tay, Trưa, Tối)', 1),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Ngày 2: Tokyo - Phú Sĩ (Ăn Sáng, Trưa, Tối)', 2),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Ngày 3: Phú Sĩ - Nagoya (Ăn Sáng, Trưa, Tối)', 3),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Ngày 4: Nagoya - Kyoto - Osaka - Kansai (Ăn Sáng, Trưa, Tối)', 4),
(0xd1eb900fd2d240cbb91ac849709e051d, 'Ngày 5: Kansai – Tp.Hcm ( Ăn Sáng, Trưa Trên Máy Bay)', 5),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 1: Hà Nội - Dubai (Nghỉ Đêm Trên Máy)21h30: Xe và hướng dẫn viên công ty đón Quý khách tại điểm hẹn đưa ra sân bay Nội Bài, đáp chuyến bay lúc EK395 (01h30 – 05h05) của hãng hàng không cao cấp 5* Emirates đi Dubai. Quý khách nghỉ đêm trên máy bay', 0),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 2: Tham Quan Dubai (Ăn Sáng, Trưa,Tối)', 1),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 3: Dubai - Bảo Tàng Tương Lai - Desert Safari (Ăn Sáng, Trưa, Tối)', 2),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 4: Dubai - Abu Dhabi (Ăn Sáng, Trưa, Tối)', 3),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 5: New City Dubao - Dubai Mail (Ăn Sáng, Trưa, Tối)', 4),
(0xd327f99842d64bf1b0bd14ebc3e1db88, 'Ngày 6: Dubai - Hà Nội ( Nghỉ Đêm Trên Máy Bay)', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` binary(16) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `verify_code` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `is_ban` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `user_id` binary(16) NOT NULL,
  `tour_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`user_id`, `tour_id`) VALUES
(0x660361a13e0744c38c7b2957bcb3d69a, 0x30efdb1714cb4f0c8d70038fc79f9946),
(0x136e711379fd49a98d741dee0bbff87d, 0x66a5f094be6448188c5542f5a0a753eb),
(0x253a330dbb9440838c7f2b43705f6c2b, 0x9003db1f2bda4e488fe069c4dcbbae95),
(0x5deb768ff97643ad84c658c23bbc90ee, 0x9003db1f2bda4e488fe069c4dcbbae95),
(0x660361a13e0744c38c7b2957bcb3d69a, 0x9003db1f2bda4e488fe069c4dcbbae95),
(0x660361a13e0744c38c7b2957bcb3d69a, 0xc8c2d669d5ea451281450fbd72c10da1),
(0x5deb768ff97643ad84c658c23bbc90ee, 0xd327f99842d64bf1b0bd14ebc3e1db88),
(0x660361a13e0744c38c7b2957bcb3d69a, 0xd327f99842d64bf1b0bd14ebc3e1db88);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` binary(16) NOT NULL,
  `role_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsixidcmek17khqhpm1tm57qdv` (`admin_id`);

--
-- Indexes for table `blog_images`
--
ALTER TABLE `blog_images`
  ADD KEY `FKru2r3nu4hofhm9hu9rf7rm1i8` (`blog_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk4byobgkjv3y3952wwpxyep7o` (`promotion_id`),
  ADD KEY `FKi21lisuytk5t7tlp7lv51ny2l` (`tour_id`),
  ADD KEY `FKeyog2oic85xg7hsu2je2lx3s6` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_session`
--
ALTER TABLE `chat_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKadwdtpdfxdjispq7bevcvwkl` (`created_by_id`),
  ADD KEY `FKnmon30e31b27iucml98wnld0l` (`host_id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmmamfjvnw2qm9kb1ke6tq25lc` (`tour_id`),
  ADD KEY `FKk7du8b8ewipawnnpg76d55fus` (`user_id`);

--
-- Indexes for table `hostregister`
--
ALTER TABLE `hostregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `host_registers`
--
ALTER TABLE `host_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7jqihjq9adt8h59l82v90aujy` (`chat_session_id`),
  ADD KEY `FKt05r0b6n0iis8u7dfna4xdh73` (`receiver_id`),
  ADD KEY `FK4ui4nnwntodh6wjvck53dbk9m` (`sender_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9y21adhxn0ayjhfocscqox7bh` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKnuscjm6x127hkb15kcb8n56wo` (`booking_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKjdho73ymbyu46p2hh562dk4kk` (`code`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrvl2k1xx2jy0u70v0ck8a3t3p` (`tour_id`),
  ADD KEY `FK2o32rer9hfweeylg7x8ut8rj2` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg95fdc12cdl5o06q6la9jh0dm` (`tour_id`),
  ADD KEY `FKcgy7qjc1r99dp117y9en6lxye` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4mwn5rnlqad3gi9lm0yddhoy4` (`category_id`),
  ADD KEY `FKnmqftag73fi1wok8f46cwc0dr` (`destination_id`),
  ADD KEY `FKp0mn2717v8my81c007b7eo2th` (`host_id`);

--
-- Indexes for table `tour_images`
--
ALTER TABLE `tour_images`
  ADD KEY `FKth1m2rd6q6ltp8kii2msvfi5d` (`tour_id`);

--
-- Indexes for table `tour_itinerary`
--
ALTER TABLE `tour_itinerary`
  ADD PRIMARY KEY (`tour_id`,`day_order`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK9q63snka3mdh91as4io72espi` (`phone_number`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`user_id`,`tour_id`),
  ADD KEY `FKpmkukk2nu6eakjh9vtepnr8q6` (`tour_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `FKsixidcmek17khqhpm1tm57qdv` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_images`
--
ALTER TABLE `blog_images`
  ADD CONSTRAINT `FKru2r3nu4hofhm9hu9rf7rm1i8` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `FKeyog2oic85xg7hsu2je2lx3s6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKi21lisuytk5t7tlp7lv51ny2l` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`),
  ADD CONSTRAINT `FKk4byobgkjv3y3952wwpxyep7o` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`);

--
-- Constraints for table `chat_session`
--
ALTER TABLE `chat_session`
  ADD CONSTRAINT `FKadwdtpdfxdjispq7bevcvwkl` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKnmon30e31b27iucml98wnld0l` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `FKk7du8b8ewipawnnpg76d55fus` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKmmamfjvnw2qm9kb1ke6tq25lc` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK4ui4nnwntodh6wjvck53dbk9m` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK7jqihjq9adt8h59l82v90aujy` FOREIGN KEY (`chat_session_id`) REFERENCES `chat_session` (`id`),
  ADD CONSTRAINT `FKt05r0b6n0iis8u7dfna4xdh73` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK9y21adhxn0ayjhfocscqox7bh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `FKrvl2k1xx2jy0u70v0ck8a3t3p` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKg95fdc12cdl5o06q6la9jh0dm` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `FK4mwn5rnlqad3gi9lm0yddhoy4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FKnmqftag73fi1wok8f46cwc0dr` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`),
  ADD CONSTRAINT `FKp0mn2717v8my81c007b7eo2th` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tour_images`
--
ALTER TABLE `tour_images`
  ADD CONSTRAINT `FKth1m2rd6q6ltp8kii2msvfi5d` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `tour_itinerary`
--
ALTER TABLE `tour_itinerary`
  ADD CONSTRAINT `FKa0o5dgvvltgycaf2ompjtek8b` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `FK4sv7b9w9adr0fjnc4u10exlwm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKpmkukk2nu6eakjh9vtepnr8q6` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
