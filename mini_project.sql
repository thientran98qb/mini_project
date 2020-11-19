-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 19, 2020 at 09:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `status`, `parent_id`) VALUES
(3, 'Laptop', 1, 0),
(17, 'Đồng hồ', 1, 0),
(19, 'Điện Thoại', 1, 0),
(46, 'PS4', 1, 0),
(47, 'Tai Nghe', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `customer_address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_address`, `customer_phone`) VALUES
(35, 'Thiện Đình', 'thientran98qb@gmail.com', 'Đà Nẵng', '0815858468'),
(36, 'Thiện Đình', 'thientran98qb@gmail.com', 'k27/7 Tiểu La ,Đà Nẵng', '0815858468'),
(37, 'Phong Trần', 'thientran98qb@gmail.com', 'Đà Nẵng', '0815858468');

-- --------------------------------------------------------

--
-- Table structure for table `orderss`
--

CREATE TABLE `orderss` (
  `orderr_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_order` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderss`
--

INSERT INTO `orderss` (`orderr_id`, `id`, `order_id`, `date_order`) VALUES
(31, 37, 33, '2020-11-19 02:32:43'),
(32, 38, 34, '2020-11-19 02:36:15'),
(33, 39, 35, '2020-11-19 02:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_customer`
--

CREATE TABLE `order_customer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `total_orders` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_customer`
--

INSERT INTO `order_customer` (`id`, `customer_id`, `note`, `payment_id`, `total_orders`, `status`) VALUES
(37, 35, '', 2, 10410000, 1),
(38, 36, '', 2, 4780000, 1),
(39, 37, '', 1, 25500000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `quantity`, `total_price`, `id`) VALUES
(33, 62, 1, 10410000, 37),
(34, 56, 1, 4780000, 38),
(35, 41, 1, 25500000, 39);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_name`) VALUES
(1, 'Thanh toán momo/banking'),
(2, 'Thanh toán tại nhà');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `product_img` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8_unicode_ci NOT NULL,
  `product_date_created` datetime DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_status` enum('1','0') COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_sale_price` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_img`, `product_content`, `product_description`, `product_date_created`, `product_price`, `product_status`, `product_sale_price`, `category_id`) VALUES
(38, 'Iphone 12 Pro Max', 'c33750936c9e8c426f1dda64c06df6ed.jpeg', '<p>Iphone 12 Pro Max</p>\r\n', 'Sản phẩm nổi bật', '2020-11-16 08:01:40', 31250000, '0', 31200000, 19),
(39, 'Tay cầm PS4', '422c0b7751a4e2cbbd296d75eee822a3.png', '<p>Tay cầm PS4</p>\r\n', 'Sản phẩm chơi game cao cấp', '2020-11-17 10:01:51', 2500000, '0', 2500000, 46),
(41, 'Laptop Macbook', '3680ca1b36c645ff0a57d35835ee390a.jpeg', '<p>Macbook</p>\r\n', 'Đẳng cấp thời thượng', '2020-11-16 04:16:31', 25600000, '0', 25500000, 3),
(52, 'Samsung Galaxy Note 20', '096222a931041452f99cd25e454f8f91.jpeg', '<p>Samsung Galaxy Note</p>\r\n', 'Dòng điện thoại mới nhất của Samsung', '2020-11-16 04:22:44', 23250000, '0', 23000000, 19),
(53, 'Laptop MSI', 'fabde7dbaa51d1150091de40ca68830b.jpg', '<p>Laptop MSI</p>\r\n', 'Sản phẩm chơi game cao cấp', '2020-11-17 10:09:35', 23500000, '0', 23500000, 3),
(54, 'Tai Nghe Bluetooth True Wireless Anker SoundCore Life P2 A3919 - Hàng Chính Hãng', '032a8623e02c034f3aa4bd2b626e3958.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Soundcore by Anker</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>6943433075310</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>&Acirc;m trường rộng hơn<br />\r\nChất lượng cuộc gọi đ&aacute;ng kinh ngạc<br />\r\nNghe nhạc tr&ecirc;n đường đi<br />\r\nKết nối mạnh mẽ<br />\r\nThiết kế vừa vặn<br />\r\nChống nước IPX7</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/83/3d/f9/4351148eb6fbc01cb96e5d73e810eebb.jpg\" style=\"height:1212px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/77/9c/92/255f4f89295f5602d0ec81ac9e59c82d.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/d1/d4/44/e2bb477d2df867f5f6243b03e01d2b8c.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/0f/25/bf/de693553aeb272892ed9f7e4f28addb2.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/2a/7d/1f/69811defea2e48c6b4f24c81011822e8.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/aa/96/2d/1e0044f677ad2e150324d4de6afdb665.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/74/da/1a/27fe888d46befd20026f0602bf2d34d1.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/e0/c7/5f/90b6dc8df5615c140eba1948dff52387.jpg\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Sản phẩm tai nghe cao cấp của Anker Sound Core', '2020-11-17 09:35:23', 1088000, '0', 1050000, 47),
(55, 'Đồng Hồ Thông Minh Apple Watch SE GPS Only Aluminum Case With Sport Band', 'fadd9fadfae99f1611d6e5acf9d16292.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Mỹ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại d&acirc;y</td>\r\n			<td>Cao su</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chống nước</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phụ kiện đi k&egrave;m</td>\r\n			<td>\r\n			<p>D&acirc;y c&aacute;p sạc</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>7407077721419</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>K&iacute;ch thước m&agrave;n h&igrave;nh: 40mm v&agrave; 44mm<br />\r\nChuẩn kh&aacute;ng nước 50m ISO 22810:2010<br />\r\nT&iacute;ch hợp GPS, GLONASS, Galileo v&agrave; QZSS<br />\r\nKết nối: Wi-Fi, Bluetooth 5.0<br />\r\nTương th&iacute;ch: model iPhone 6S trở l&ecirc;n với hệ điều iOS 14 trở l&ecirc;n<br />\r\nChức năng: Cảm bi&ecirc;́n nhịp tim, theo d&otilde;i sức khỏe v&agrave; tập luyện<br />\r\nTh&ocirc;ng b&aacute;o cuộc gọi, tin nhắn<br />\r\nC&oacute; thể nghe nhạc, xem bản đồ<br />\r\nThời gian sử dụng l&ecirc;n đến 18 giờ</p>\r\n\r\n<p>Thiết kế đơn giản - sang trọng</p>\r\n\r\n<p>Nh&igrave;n chung, Apple Watch SE kh&ocirc;ng c&oacute; qu&aacute; nhiều thay đổi kh&aacute;c lạ khi vẫn sở hữu th&acirc;n m&aacute;y h&igrave;nh vu&ocirc;ng vức quen thuộc, c&aacute;c g&oacute;c cạnh được bo cong nhẹ v&agrave; c&oacute; n&uacute;t Digital Crown ở b&ecirc;n phải. Apple Watch SE sẽ c&oacute; 2 phi&ecirc;n bản với k&iacute;ch thước 40 mm v&agrave; k&iacute;ch thước 44 mm. Được ho&agrave;n thiện từ chất liệu kim loại sang trọng v&agrave; c&oacute; mặt trước được bảo vệ bởi k&iacute;nh cường lực. Apple kh&ocirc;ng hề sơ s&agrave;i khi ho&agrave;n thiện thiết kế tổng thể một c&aacute;ch chỉn chu. Thiết kế của chiếc đồng hồ kh&ocirc;ng c&oacute; qu&aacute; nhiều chi tiết phức tạp n&ecirc;n nh&igrave;n kh&aacute; h&agrave;i h&ograve;a, th&iacute;ch mắt.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/80/7a/25/4354c4a3c114fd84284a880cac35f0d0.jpg\" style=\"height:431px; width:750px\" /></p>\r\n\r\n<p>Thiết kế hướng đến m&ocirc;i trường</p>\r\n\r\n<p>Apple Watch SE sở hữu thiết kế được ho&agrave;n thiện từ kim loại t&aacute;i chế.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/aa/b6/a2/77316d7d60702d704cd1d52695e0d9b5.jpg\" style=\"height:421px; width:750px\" /></p>\r\n\r\n<p>Đa chức năng</p>\r\n\r\n<p>Mặc d&ugrave; l&agrave; phi&ecirc;n bản r&uacute;t gọn nhưng Apple Watch SE vẫn được trang bị m&agrave;n h&igrave;nh Retina mang đến độ s&aacute;ng cao để d&ugrave;ng ở ngo&agrave;i trời v&agrave; độ tương phản tốt c&ugrave;ng khả năng hiển thị chi tiết sắc n&eacute;t. Bề mặt m&agrave;n h&igrave;nh được bảo vệ bởi k&iacute;nh cường lực gi&uacute;p bạn y&ecirc;n t&acirc;m hơn khi đeo đồng hồ tr&ecirc;n tay.</p>\r\n\r\n<p>Thật đ&aacute;ng khen khi Apple Watch SE được trang bị chip xử l&yacute; Apple S5, với hiệu năng nhanh hơn 2 lần so với chip Apple S3. Chiếc m&aacute;y được t&iacute;ch hợp đầy đủ c&aacute;c t&iacute;nh năng cần thiết bao gồm: Li&ecirc;n lạc, gọi khẩn cấp,</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/54/5e/8e/c557883c5155ef71c50fe7bfe884326d.jpg\" style=\"height:421px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/17/6e/54/6abe07eb43f1942c9b23c4ca96b23b70.jpg\" style=\"height:1261px; width:750px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Viền Nhôm & Dây Cao Su - Hàng Chính Hãng VN/A', '2020-11-17 09:37:31', 7690000, '0', 7650000, 17),
(56, 'Đồng Hồ Thông Minh Apple Watch Series 3', 'e9a4102a4bb3ac7078666decce02853b.jpeg', '<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Chuẩn kh&aacute;ng nước ISO 22810:2010<br />\r\nKết nối: Bluetooth 4.2, Wi-Fi 802.11 b/g/n<br />\r\nTương th&iacute;ch: iPhone<br />\r\nChức năng: Theo d&otilde;i nhịp tim, vận động<br />\r\nTrợ l&yacute; ảo Siri hiệu quả<br />\r\nTh&ocirc;ng b&aacute;o cuộc gọi, tin nhắn<br />\r\nC&oacute; thể nghe nhạc, xem bản đồ<br />\r\nPin: 279mAh cho thời gian sử dụng l&ecirc;n đến 18 giờ</p>\r\n\r\n<p>Thiết kế sang trọng, đẳng cấp</p>\r\n\r\n<p>Đồng Hồ Th&ocirc;ng Minh Apple Watch Series 3 GPS Space Gray Aluminum Case With Black Sport Band&nbsp;sở hữu thiết kế sang trọng, đẳng cấp với những cạnh bo tr&ograve;n mềm mại, tinh tế kết hợp d&acirc;y đeo chắc chắn, mạnh mẽ gi&uacute;p tự tin thể hiện đẳng cấp. Kh&ocirc;ng chỉ sở hữu vẻ đẹp tinh tế, nổi bật Apple Watch Series 3 c&ograve;n g&acirc;y ấn tượng với những chức năng th&ocirc;ng minh, tiện dụng đ&aacute;p ứng tối đa nhu cầu giải tr&iacute;, tập luyện, giải quyết c&ocirc;ng việc của bạn mọi l&uacute;c, mọi nơi.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/16/8a/46/125a0a5dcf5ddc73a39215cb93808fec.jpg\" style=\"height:422px; width:750px\" /></p>\r\n', 'Đồng Hồ Thông Minh Apple Watch Series 3 GPS Aluminum Case With Sport Band - Nhập Khẩu Chính Hãng', '2020-11-17 09:39:46', 4790000, '0', 4780000, 17),
(57, 'Điện Thoại Realme C3 - Hàng Chính Hãng', '6a2d50bfdd55f78ccd19c8ceeaf8d4ee.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Realme</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phụ kiện đi k&egrave;m</td>\r\n			<td>\r\n			<p>Sạc, HDSD</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n			<td>IPS LCD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>6.5 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>HD+ (720 x 1600 pixels)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước</td>\r\n			<td>5 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau</td>\r\n			<td>Ch&iacute;nh 12 MP &amp; Phụ 2 MP, 2 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>T&iacute;nh năng camera</td>\r\n			<td>L&agrave;m đẹp (Selfie A.I Beauty), Quay video HD, Nhận diện khu&ocirc;n mặt, Quay video Full HD, Tự động lấy n&eacute;t (AF), HDR</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đ&egrave;n Flash</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Video call</td>\r\n			<td>Hỗ trợ VideoCall th&ocirc;ng qua ứng dụng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim</td>\r\n			<td>Quay phim HD 720p@30fps, Quay phim FullHD 1080p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>3 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ROM</td>\r\n			<td>32 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ khả dụng</td>\r\n			<td>Khoảng 16 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ thẻ nhớ ngo&agrave;i</td>\r\n			<td>MicroSD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ thẻ tối đa</td>\r\n			<td>Tối đa 256 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>195 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<p>D&agrave;i 164.4 mm - Ngang 75 mm - D&agrave;y 8.95 mm</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip set</td>\r\n			<td>MediaTek Helio G70 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tốc độ CPU</td>\r\n			<td>2 nh&acirc;n 2.0 GHz &amp; 6 nh&acirc;n 1.7 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip đồ họa (GPU)</td>\r\n			<td>Mali-G52 MC2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung lượng pin</td>\r\n			<td>5000 mAh</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại pin</td>\r\n			<td>Pin chuẩn Li-Ion</td>\r\n		</tr>\r\n		<tr>\r\n			<td>H&ocirc;̃ trợ 4G</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại Sim</td>\r\n			<td>SIM Nano</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi</td>\r\n			<td>Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>GPS</td>\r\n			<td>A-GPS, GLONASS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>LE, A2DP, v5.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối kh&aacute;c</td>\r\n			<td>OTG</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng sạc</td>\r\n			<td>Micro USB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Jack tai nghe</td>\r\n			<td>3.5mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xem phim</td>\r\n			<td>3GP, MP4, AVI, WMV</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nghe nhạc</td>\r\n			<td>Midi, AMR, MP3, WAV, AAC, OGG, FLAC</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ghi &acirc;m</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>FM radio</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chức năng kh&aacute;c</td>\r\n			<td>Trợ l&yacute; ảo Google Assistant, Đ&egrave;n pin, Ghi &acirc;m cuộc gọi, Chặn cuộc gọi, Chặn tin nhắn, Mặt k&iacute;nh 2.5D, Nh&acirc;n bản ứng dụng, Đa cửa sổ (chia đ&ocirc;i m&agrave;n h&igrave;nh), Kh&ocirc;ng gian tr&ograve; chơi</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>8829957720432</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>M&agrave;n h&igrave;nh: IPS LCD, 6.5&quot;, HD+<br />\r\nHệ điều h&agrave;nh: Android 10<br />\r\nCamera sau: Ch&iacute;nh 12 MP &amp; Phụ 2 MP, 2 MP<br />\r\nCamera trước: 5 MP<br />\r\nCPU: MediaTek Helio G70 8 nh&acirc;n<br />\r\nRAM: 3 GB<br />\r\nBộ nhớ trong: 32 GB<br />\r\nThẻ nhớ: MicroSD, hỗ trợ tối đa 256 GB<br />\r\nThẻ SIM: 2 Nano SIM, Hỗ trợ 4G<br />\r\nDung lượng pin: 5000 mAh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bộ 3 camera cho khả năng chụp ảnh ấn tượng</p>\r\n\r\n<p><strong>Điện Thoại Realme C3</strong>&nbsp;sở hữu bộ 3 camera sau với camera ch&iacute;nh c&oacute; độ ph&acirc;n giải 12MP, camera macro g&oacute;c si&ecirc;u cận 4cm c&ugrave;ng camera chụp ch&acirc;n dung x&oacute;a ph&ocirc;ng với độ ph&acirc;n giải 2MP. Cụm camera n&agrave;y được trang bị đầy đủ c&aacute;c t&iacute;nh năng như chụp ảnh x&oacute;a ph&ocirc;ng, chụp ảnh g&oacute;c rộng, HDR,&hellip; gi&uacute;p bạn c&oacute; để chụp được những bức ảnh với độ n&eacute;t cao c&ugrave;ng m&agrave;u sắc tươi tắn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/f2/cc/ce/1b0b53d01a5d780e87212dc0d63c51e4.jpg\" style=\"height:543px; width:750px\" /></p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, Realme C3 sở hữu camera selfie độ ph&acirc;n giải 5MP, tuy kh&ocirc;ng cao nhưng nhờ t&iacute;ch hợp c&ocirc;ng nghệ l&agrave;m đẹp A.I n&ecirc;n những bức ảnh selfie lu&ocirc;n c&oacute; được độ s&aacute;ng tốt, đồng thời tối ưu h&igrave;nh ảnh gi&uacute;p bạn kh&ocirc;ng cần phải chỉnh sửa nhiều đối với những bức h&igrave;nh chụp bởi camera trước.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/a3/38/86/9f201a5b9a28eedf8874602d3baa54c5.jpg\" style=\"height:579px; width:750px\" /></p>\r\n\r\n<p>Hiệu năng mạnh mẽ với chip Helio G70 &amp; Hệ điều h&agrave;nh Realme UI</p>\r\n\r\n<p>Đặc biệt, Realme C3 được trang bị con chip&nbsp;<strong>Helio G70</strong>&nbsp;mới nhất của MediaTek cho xung nhịp 2.0 GHz kết hợp với GPU Mali-G52 2EEMC2 gi&uacute;p m&aacute;y ho&agrave;n to&agrave;n c&oacute; thể chơi được những tựa game nặng nhưng chỉ đạt mức cấu h&igrave;nh thấp. Với con chip n&agrave;y m&aacute;y của bạn sẽ sở hữu hiệu năng mạnh mẽ gi&uacute;p những nhu cầu như đọc b&aacute;o, xem phim, hay lướt web rất mượt m&agrave; v&agrave; ổn định.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/34/96/0f/1e43042a39a0b121ea7b97537fa623c5.jpg\" style=\"height:496px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/18/f0/16/e2c3b570cee488ca5480ab9ff7ed81f2.jpg\" style=\"height:385px; width:750px\" /></p>\r\n\r\n<p>RAM 3GB v&agrave; bộ nhớ trong 32GB c&ugrave;ng khả năng hỗ trợ thẻ nhớ l&ecirc;n đến 256GB gi&uacute;p bạn c&oacute; thể thoải m&aacute;i lưu trữ h&igrave;nh ảnh, video, tải c&aacute;c ứng dụng nặng v&ocirc; c&ugrave;ng dễ d&agrave;ng. Realme C3 được trang bị sẵn hệ điều h&agrave;nh&nbsp;<strong>Realme UI</strong>&nbsp;với nhiều năng cấp nhằm gi&uacute;p tăng cường trải nghiệm của người d&ugrave;ng đồng thời hạn chế việc ti&ecirc;u tốn năng lượng kh&ocirc;ng cần thiết cho bạn thời gian sử dụng l&acirc;u hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/37/46/50/9298c7ac97e06a62c1dbc7c62d7f4aa0.jpg\" style=\"height:404px; width:750px\" /></p>\r\n\r\n<p>M&agrave;n h&igrave;nh giọt nước tr&agrave;n cạnh</p>\r\n\r\n<p>Realme C3 sở hữu thiết kế nguy&ecirc;n khối với khung v&agrave; mặt lưng nhựa tương tự Realme C2. Thiết kế n&agrave;y vừa tạo cho người d&ugrave;ng cảm gi&aacute;c chắc chắn nhưng vẫn rất gọn nhẹ khi sử dụng. M&agrave;n h&igrave;nh với k&iacute;ch thước 6.5 inch c&ugrave;ng độ ph&acirc;n giản HD+ (1600 x 720) với tấm nền LCD cho bạn kh&ocirc;ng gian hiển thị lớn v&agrave; độ sắc n&eacute;t h&igrave;nh ảnh cao.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/ff/8f/42/6570177641ad4b4de36114c7a3316228.jpg\" style=\"height:529px; width:750px\" /></p>\r\n\r\n<p>Mặt trước của Realme C3 sử dụng thiết kế giọt nước tr&agrave;n cạnh gi&uacute;p n&acirc;ng tổng diện t&iacute;ch hiển thị của m&agrave;n h&igrave;nh l&ecirc;n đến 89.8%, từng chi tiết sẽ được hiển thị r&otilde; r&agrave;ng trước mắt bạn.</p>\r\n\r\n<p>Dung lượng pin 5000 mAh - Sử dụng thả ga</p>\r\n\r\n<p>Chiếc điện thoại n&agrave;y được cung cấp năng lượng bởi vi&ecirc;n pin lớn c&oacute; dung lượng l&ecirc;n đến 5000 mAh. Với mức pin n&agrave;y khi sạc đầy bạn ho&agrave;n to&agrave;n c&oacute; thể sử dụng điện thoại đến ng&agrave;y tiếp theo m&agrave; kh&ocirc;ng cần phải sạc lại, điểm n&agrave;y sẽ v&ocirc; c&ugrave;ng tiện lợi cho những ai c&oacute; nhu cầu di chuyển nhiều v&agrave; sử dụng điện thoại li&ecirc;n tục.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/74/d5/17/6aeeb0cef8d812fa7f39154459717613.jpg\" style=\"height:359px; width:750px\" /></p>\r\n\r\n<p>Ngo&agrave;i ra, smartphone c&ograve;n được Realme trang bị khả năng sạc nhanh 10W với cổng sạc Micro USB phổ biến, nhờ đ&oacute; bạn c&oacute; thể dễ d&agrave;ng t&igrave;m kiếm v&agrave; thay thế khi hư hỏng m&agrave; kh&ocirc;ng gặp kh&oacute; khăn g&igrave;.</p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Điện thoại mới nhất của Realme có nhiều tính năng nổi bật và đột phá.', '2020-11-17 09:44:15', 2990000, '0', 2450000, 19),
(58, 'Điện Thoại Samsung Galaxy M31 (128GB/6GB) - Hàng Chính Hãng', '2a194dfd864c7ae2ed7f42aad07e47ec.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Samsung</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>H&agrave;n Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Việt Nam / H&agrave;n Quốc / Ấn Độ / Trung Quốc,...</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td>M31</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phụ kiện đi k&egrave;m</td>\r\n			<td>M&aacute;y, Sạc, S&aacute;ch Hướng Dẫn, Hộp</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n			<td>Super AMOLED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>6.4 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>Full HD+ (1080 x 2400 Pixels)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera trước</td>\r\n			<td>32 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera sau</td>\r\n			<td>Ch&iacute;nh 64 MP &amp; Phụ 12 MP, 5 MP, 5 MP</td>\r\n		</tr>\r\n		<tr>\r\n			<td>T&iacute;nh năng camera</td>\r\n			<td>Ban đ&ecirc;m (Night Mode), Xo&aacute; ph&ocirc;ng, G&oacute;c si&ecirc;u rộng (Ultrawide), G&oacute;c rộng (Wide), Tự động lấy n&eacute;t (AF), Chạm lấy n&eacute;t, Nhận diện khu&ocirc;n mặt, HDR, To&agrave;n cảnh (Panorama), L&agrave;m đẹp (Beautify)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đ&egrave;n Flash</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Video call</td>\r\n			<td>Hỗ trợ VideoCall th&ocirc;ng qua ứng dụng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Quay phim</td>\r\n			<td>Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>6 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ROM</td>\r\n			<td>128GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ thẻ nhớ ngo&agrave;i</td>\r\n			<td>MicroSD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ thẻ tối đa</td>\r\n			<td>Hỗ trợ tối đa 512 GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>191 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<p>D&agrave;i 159.2 mm - Ngang 75.1 mm - D&agrave;y 8.9 mm</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip set</td>\r\n			<td>Exynos 9611 8 nh&acirc;n</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tốc độ CPU</td>\r\n			<td>4 nh&acirc;n 2.3 Ghz &amp; 4 nh&acirc;n 1.7 GHz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip đồ họa (GPU)</td>\r\n			<td>Mali-G72 MP3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung lượng pin</td>\r\n			<td>6000 mAh</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại pin</td>\r\n			<td>Pin chuẩn Li-Po</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pin c&oacute; thể th&aacute;o rời</td>\r\n			<td>Pin liền</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối dữ liệu</td>\r\n			<td>Bluetooth, Wifi, 3G, 2G, 4G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>H&ocirc;̃ trợ 4G</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại Sim</td>\r\n			<td>Nano Sim</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số sim</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi</td>\r\n			<td>Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot</td>\r\n		</tr>\r\n		<tr>\r\n			<td>GPS</td>\r\n			<td>A-GPS, GLONASS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>A2DP, LE, v5.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng sạc</td>\r\n			<td>USB Type-C</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Jack tai nghe</td>\r\n			<td>3.5 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xem phim</td>\r\n			<td>MP4, AVI, WMV</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nghe nhạc</td>\r\n			<td>MP3, WAV, WMA</td>\r\n		</tr>\r\n		<tr>\r\n			<td>FM radio</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>1510492616997</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>H&agrave;ng ch&iacute;nh h&atilde;ng Samsung Việt Nam, Nguy&ecirc;n seal, Mới 100%, Chưa Active<br />\r\nM&agrave;n h&igrave;nh: Super AMOLED, 6.4&quot;, độ ph&acirc;n giải 2340 x 1080 (FHD+)<br />\r\nHệ điều h&agrave;nh: Android 10<br />\r\nCamera sau: 64.0 MP + 8.0 MP + 5.0 MP + 5.0 MP<br />\r\nCamera trước: 32.0 MP<br />\r\nCPU: Exynos 9611<br />\r\nRAM: 6 GB<br />\r\nBộ nhớ trong: 128 GB<br />\r\nThẻ nhớ: MicroSD, hỗ trợ tối đa 512 GB<br />\r\nThẻ SIM: 2 Nano SIM<br />\r\nDung lượng pin: 6000 mAh<br />\r\nT&iacute;nh năng kh&aacute;c: Chặn cuộc gọi, Sạc pin nhanh, Đ&egrave;n pin, Dolby Audio, Chặn tin nhắn</p>\r\n\r\n<p>Mở Rộng Kh&ocirc;ng Gian Trải Nghiệm Với M&agrave;n H&igrave;nh Infinity-U</p>\r\n\r\n<p>Thỏa th&iacute;ch l&agrave;m mọi điều bạn muốn với m&agrave;n h&igrave;nh Infinity-U 6.4 inch ấn tượng từ&nbsp;<strong>Điện Thoại Samsung Galaxy M31</strong>. C&ocirc;ng nghệ Super AMOLED FHD+ truyền tải chi tiết mọi nội dung, mang đến trải nghiệm xem sống động chưa từng c&oacute; d&ugrave; bạn đang coi phim, chơi game hay l&agrave;m việc.</p>\r\n\r\n<p><img alt=\"Điện Thoại Samsung Galaxy M31 (128GB/6GB) - Hàng Chính Hãng\" src=\"https://salt.tikicdn.com/ts/tmp/87/be/b3/43a1032102ec0207f697367da2813890.jpg\" style=\"height:584px; width:750px\" /></p>\r\n\r\n<p>Thiết Kế Hiện Đại V&agrave; Sang Trọng</p>\r\n\r\n<p>Nổi bật tr&ecirc;n tay với thiết kế 2.5D hiện đại c&ugrave;ng vẻ ngo&agrave;i b&oacute;ng bẩy, thời thượng của Galaxy M31. Th&acirc;n m&aacute;y được chế t&aacute;c ho&agrave;n hảo, vừa vặn, mang lại cảm gi&aacute;c thoải m&aacute;i khi cầm nắm. Chọn ngay sắc m&agrave;u bạn th&iacute;ch: đen, đỏ hoặc xanh để thể hiện chất t&ocirc;i ri&ecirc;ng biệt.</p>\r\n\r\n<p><img alt=\"Điện Thoại Samsung Galaxy M31 (128GB/6GB) - Hàng Chính Hãng\" src=\"https://salt.tikicdn.com/ts/tmp/77/c1/75/397e3443e553dd0b45c316dc2403a148.jpg\" style=\"height:475px; width:750px\" /></p>\r\n', 'Top 100 dòng điện thoại bán chạy nhất tháng', '2020-11-17 09:45:38', 4690000, '0', 4500000, 19),
(59, 'Tai nghe không dây Sony WH-CH510 ', '85784ea1afee417b1ee2753bdd3ba7a2.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Sony</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Nhật Bản</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td>WH-CH510</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>1154286852392</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Thiết kế gọn nhẹ, nghe kh&ocirc;ng d&acirc;y thật l&acirc;u với thời lượng pin l&ecirc;n đến 35 giờ<br />\r\nKhả năng sạc nhanh 10 ph&uacute;t cho 90 ph&uacute;t sử dụng qua cổng USB Type-C<br />\r\nPh&aacute;t nhạc kh&ocirc;ng d&acirc;y trực tiếp qua kết nối Bluetooth 5.0<br />\r\nT&iacute;ch hợp n&uacute;t điều khiển tr&ecirc;n tai gi&uacute;p bạn nghe thật dễ d&agrave;ng<br />\r\nMang &acirc;m nhạc đến bất cứ nơi đ&acirc;u bằng thiết kế v&agrave;nh tai kiểu gập, dễ cất gọn trong t&uacute;i<br />\r\nTương th&iacute;ch với trợ l&iacute; ảo qua điện thoại th&ocirc;ng minh qua một n&uacute;t bấm<br />\r\nTr&ograve; chuyện kh&ocirc;ng gi&aacute;n đoạn với khả năng gọi rảnh tay dễ d&agrave;ng qua microphone t&iacute;ch hợp tr&ecirc;n tai<br />\r\nNghe &acirc;m thanh chi tiết hơn nhờ m&agrave;ng loa 30mm<br />\r\n&nbsp;</p>\r\n\r\n<p>Tai nghe kh&ocirc;ng d&acirc;y Sony WH-CH510 c&oacute; thiết kế mới tr&ograve;n trịa v&agrave; mềm mại hơn phi&ecirc;n bản WH-CH500 trước đ&acirc;y c&ugrave;ng với thời lượng pin cực kỳ ấn tượng l&ecirc;n đến 35 tiếng sử dụng li&ecirc;n tục. Thời gian sạc đầy trong v&ograve;ng 4,5 tiếng th&ocirc;ng qua cổng USB-C. WH-CH510 cũng c&oacute; khả năng sạc nhanh chỉ cần 10 ph&uacute;t l&agrave; c&oacute; thể d&ugrave;ng đến 90 ph&uacute;t.</p>\r\n\r\n<p><img alt=\"Tai nghe không dây Sony WH-CH510\" src=\"https://salt.tikicdn.com/cache/w750/ts/product/63/9f/b6/2703af5ad049310314a4099cf4857098.jpg\" style=\"height:746px; width:750px\" /></p>\r\n', 'Tai nghe không dây hót hòn họt của Sony làm mưa làm gió trên thị trường', '2020-11-17 09:56:26', 841700, '0', 0, 47),
(60, 'AirPods Pro Apple', '232e3c5df74417339c09283b3220805d.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Apple</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Mỹ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<table cellspacing=\"0\">\r\n				<tbody>\r\n					<tr>\r\n						<td>\r\n						<ul>\r\n							<li>Tai nghe: 30.9 - 21.8 - 24.0 mm</li>\r\n							<li>Hộp sạc: 45.2 - 60.6 - 21.7 mm</li>\r\n						</ul>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td>MWP22</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hỗ trợ đ&agrave;m thoại</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>c&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thời gian sử dụng</td>\r\n			<td>\r\n			<p>5 giờ</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>Tai nghe: 5.4 g. Hộp sạc: 45.6 g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>9485358955836</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Thiết kế thời trang v&agrave; nhỏ gọn<br />\r\nKhả năng chống ồn &ndash; xử l&yacute; &acirc;m thanh vượt bậc<br />\r\nT&aacute;i tạo &acirc;m thanh chi tiết, sống động<br />\r\nKết nối kh&ocirc;ng d&acirc;y Bluetooth tiện lợi<br />\r\nTrang bị t&iacute;nh năng theo d&otilde;i sức khỏe<br />\r\nThời lượng pin cải thiện, l&ecirc;n đến 24 tiếng<br />\r\nTương th&iacute;ch tối đa c&aacute;c thiết bị của Apple</p>\r\n\r\n<p><strong>AirPods Pro sở hữu thiết kế nhỏ gọn</strong></p>\r\n\r\n<p>Tai Nghe Bluetooth Apple AirPods Pro True Wireless - MWP22 được thiết kế như một tai nghe in-ear thay v&igrave; earbud to&agrave;n khung nhựa 100% như ở c&aacute;c phi&ecirc;n bản cũ, trọng lượng chỉ 5.4g v&agrave; 45,6 gram cả hộp.</p>\r\n\r\n<p><img alt=\"Tai Nghe Bluetooth Apple AirPods Pro True Wireless - MWP22 - Hàng Chính Hãng VN/A\" src=\"https://salt.tikicdn.com/ts/tmp/4d/8d/be/bf504619471cb446d2e147a1536aeddd.JPG\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p>C&ugrave;ng với 3 m&uacute;t silicon mềm gi&uacute;p AirPods Pro kh&ocirc;ng chỉ gi&uacute;p tai nghe trở n&ecirc;n sang trọng hơn v&agrave; c&ograve;n gi&uacute;p tai nghe b&aacute;m chắc v&agrave;o tai, khả năng c&aacute;ch &acirc;m tốt cũng như ph&ugrave; hợp với nhiều k&iacute;ch thước tai kh&aacute;c nhau.</p>\r\n\r\n<p><img alt=\"Tai Nghe Bluetooth Apple AirPods Pro True Wireless - MWP22 - Hàng Chính Hãng VN/A\" src=\"https://salt.tikicdn.com/ts/tmp/1a/dd/88/994494ac0e40ff460238b98c03d35402.JPG\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p>&Acirc;m thanh r&otilde; n&eacute;t với c&ocirc;ng nghệ khử tiếng ồn chủ động</p>\r\n\r\n<p>AirPods Pro thiết kế một micro hướng ra ngo&agrave;i gi&uacute;p ph&aacute;t hiện &acirc;m thanh. Sau khi ph&aacute;t hiện &acirc;m thanh, AirPods Pro ngay lập tức sẽ loại bỏ &acirc;m thanh b&ecirc;n ngo&agrave;i đ&oacute; trước khi bạn nghe thấy n&oacute;. Một micr&ocirc; hướng v&agrave;o b&ecirc;n trong gi&uacute;p lắng nghe những &acirc;m thanh b&ecirc;n trong tai bạn. Tương tự với micro hướng ra b&ecirc;n ngo&agrave;i, micro b&ecirc;n trong cũng kiểm tra những &acirc;m thanh kh&ocirc;ng mong muốn v&agrave; loại bỏ ch&uacute;ng.</p>\r\n\r\n<p>T&iacute;nh năng khử tiếng ồn được điểu chỉnh li&ecirc;n tục với tần suất 200 lần mỗi gi&acirc;y. Nhờ vậy &acirc;m thanh cuối c&ugrave;ng bạn nghe được sẽ l&agrave; những &acirc;m thanh trong trẻo, chất lượng nhất.</p>\r\n\r\n<p><img alt=\"Tai Nghe Bluetooth Apple AirPods Pro True Wireless - MWP22 - Hàng Chính Hãng VN/A\" src=\"https://salt.tikicdn.com/ts/tmp/fc/67/80/a8300b0ac1bddfd3414fd3b8f34e7187.JPG\" style=\"height:750px; width:750px\" /></p>\r\n\r\n<p>Một t&iacute;nh năng th&ocirc;ng minh của AirPods Pro đ&oacute; chỉnh l&agrave; sử chuyển đổi giữa chế độ khử tiếng ồn chủ động v&agrave; chế độ trong suốt. Với những l&uacute;c bạn c&oacute; nhu cầu nghe cả những &acirc;m thanh đang xảy ra xung quanh. Việc đơn giản bạn cần l&agrave;m l&agrave; nhấn giữ cảm biến lực tr&ecirc;n th&acirc;n tai nghe để chuyển đổi giữa hai chế độ. Với chế độ trong suốt, bạn c&oacute; thể nghe được c&ugrave;ng l&uacute;c &acirc;m thanh b&ecirc;n trong cũng như &acirc;m thanh b&ecirc;n ngo&agrave;i, thoải m&aacute;i n&oacute;i chuyện với mọi người xung quanh.</p>\r\n', 'Tai nghe tốt nhất của Apple thời điểm hiện tại.', '2020-11-17 10:07:15', 4500000, '0', 4320000, 47),
(61, 'Laptop ASUS TUF Gaming A15 FA506II-AL016T', 'd55f354431495c71e678477b7374b475.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Asus</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>Đ&agrave;i Loan</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<p>359.8 x 256 x 22.8 ~24.9 cm</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>3816390154394</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>2.3 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU</td>\r\n			<td>AMD Ryzen 7 4800H 2.9GHz up to 4.2GHz 8MB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tốc độ CPU</td>\r\n			<td>2.9GHz up to 4.2GHz 8MB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh</td>\r\n			<td>Windows 10 Home</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>15.6 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>Full HD (1920 x 1080)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n			<td>IPS, 144Hz, Non-Glare, Wide View, Narrow Bezel</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Card đồ họa</td>\r\n			<td>NVIDIA GeForce GTX 1650Ti 4GB GDDR6 + AMD Radeon Graphics</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bộ nhớ đồ họa</td>\r\n			<td>4GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung lượng ổ cứng</td>\r\n			<td>512GB SSD M.2 PCIE G3X2, 1x slot SATA3 2.5&quot;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại ổ đĩa</td>\r\n			<td>SSD</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>8GB DDR4 3200MHzHz (2x SO-DIMM socket, up to 32GB SDRAM)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại RAM</td>\r\n			<td>DDR4</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera</td>\r\n			<td>HD 720p CMOS module</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n			<td>DTS:X Ultra</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối</td>\r\n			<td>2x Type-A USB 3.2 (Gen 1) 1x Type-C USB 3.2 (Gen 2) with display supportDP1.4 1x Type-A USB2.0 1x RJ-45 LAN 1x HDMI 1x COMBO audio jack</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng internet (LAN)</td>\r\n			<td>10/100/1000/Gigabits Base T</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi</td>\r\n			<td>802.11AC (2X2)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>v5.0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại pin</td>\r\n			<td>3 Cell 48WHr</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>CPU :AMD Ryzen 7 &ndash; 4800H<br />\r\nHệ điều h&agrave;nh :Windows 10 SL 64 Bit<br />\r\nRAM :DDR4 8GB (1 x 8GB) 3200MHz; 2 slots, up to 32GB<br />\r\nGPU :Geforce GTX 1650Ti 4GB<br />\r\nM&agrave;n h&igrave;nh :15.6&#39; FHD (1920&times;1080) IPS, 144Hz 3ms<br />\r\nỔ cứng SSD :512GB SSD NVMe M.2 PCIe Gen 3 x 4<br />\r\nỔ cứng HDD :1 slot HDD 2.5&#39;</p>\r\n\r\n<p><strong>Laptop ASUS TUF Gaming A15 FA506II-AL016T</strong>&nbsp;sẽ thay đổi c&aacute;ch bạn nh&igrave;n v&agrave;o laptop chơi game. Được trang bị phần cứng ấn tượng, thiết kế gọn nhưng mạnh mẽ. Trang bị&nbsp;CPU R7 4800H, hỗ trợ ram tối đa 32GB, VGA GTX 16 series, m&agrave;n h&igrave;nh&nbsp;IPS 144Hz&nbsp;với b&agrave;n ph&iacute;m c&oacute; đ&egrave;n nền RGB.</p>\r\n\r\n<p><strong>ASUS TUF&nbsp;FA506II-AL016T</strong>&nbsp;c&oacute; b&agrave;n ph&iacute;m chuy&ecirc;n dụng&nbsp;chơi game với c&aacute;c ph&iacute;m&nbsp;RGB-backlit, cụm ph&iacute;m&nbsp;WASD&nbsp;nổi bật v&agrave; c&ocirc;ng nghệ&nbsp;Overstroke&nbsp;để thao t&aacute;c nhanh v&agrave; ch&iacute;nh x&aacute;c.&nbsp;Với m&agrave;n h&igrave;nh&nbsp;NanoEdge IPS&nbsp;cấp độ ti&ecirc;n tiến, v&agrave; độ bền được chứng nhận kiểm tra&nbsp;MIL-STD-810G.&nbsp;Sẽ&nbsp;mang đến trải nghiệm chơi game phong ph&uacute; mọi l&uacute;c mọi nơi!</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/cache/w750/ts/product/87/c5/d4/e9cee63242dce5c227999260c120df43.jpg\" style=\"height:378px; width:750px\" /></p>\r\n', 'Laptop ASUS TUF Gaming A15 FA506II-AL016T (AMD Ryzen R7-4800H/ 8GB DDR4 3200MHz/ 512GB SSD M.2 PCIE G3X2/ GTX 1650Ti 4GB/ Win10) - Hàng Chính Hãng', '2020-11-17 10:09:28', 23990000, '0', 22669000, 3),
(62, 'Laptop Asus Vivobook A412DA-EK346T AMD', 'c66f8257e34566b63c93b71037174d00.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Asus</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>4161904133402</td>\r\n		</tr>\r\n		<tr>\r\n			<td>CPU</td>\r\n			<td>AMD Ryzen 3</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tốc độ CPU</td>\r\n			<td>2.6GHz up to 3.5GHz 4MB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chip set</td>\r\n			<td>AMD Ryzen 3-3200U</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh</td>\r\n			<td>Windows 10 Home</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>14 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>Full HD (1920 x 1080)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n			<td>Anti-Glare with 45% NTSC, NanoEdge</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung lượng ổ cứng</td>\r\n			<td>512GB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại ổ đĩa</td>\r\n			<td>SSD M.2 PCIE G3X2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>RAM</td>\r\n			<td>4GB DDR4 2400MHz (1x SO-DIMM socket, up to 16GB SDRAM)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại RAM</td>\r\n			<td>16GB SDRAM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Camera</td>\r\n			<td>HD Web Camera</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n			<td>ASUS SonicMaster</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối</td>\r\n			<td>2 x USB 2.0, 1 x USB 3.0, 1 x Type C USB 3.1, HDMI, Finger Print</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng internet (LAN)</td>\r\n			<td>None</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi</td>\r\n			<td>802.11 AC (2x2)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bluetooth</td>\r\n			<td>v4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại pin</td>\r\n			<td>2 Cells 37WHrs</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>CPU: AMD Ryzen 3-3200U 2.6GHz up to 3.5GHz 4MB<br />\r\nRAM: 4GB DDR4 2400MHz (1x SO-DIMM socket, up to 16GB SDRAM)<br />\r\n&Ocirc;̉ cứng: 512GB SSD M.2 PCIE G3X2<br />\r\nCard đồ họa: Radeon Vega 3 Graphics<br />\r\nM&agrave;n h&igrave;nh: 14&quot; FHD (1920 x 1080) Anti-Glare with 45% NTSC, NanoEdge<br />\r\nCổng giao tiếp: 2 x USB 2.0, 1 x USB 3.0, 1 x Type C USB 3.1, HDMI, Finger Print<br />\r\nAudio: ASUS SonicMaster<br />\r\nĐọc thẻ nhớ: MicroSD card reader<br />\r\nWebca: HD Web Camera<br />\r\nHệ điều h&agrave;nh: Windows 10 Home<br />\r\nPin: 2 Cells 37WHrs</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/75/2c/0f/5178f1a2acf07f025fc51721326fe898.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>Mở tầm nh&igrave;n, thỏa x&ecirc; dịch</p>\r\n\r\n<p>Laptop Asus Vivobook A412DA-EK346T AMD R3-3200U/ Win10 (14 FHD) - Silver - Mẫu Ultrabook 15&rdquo; m&agrave;u sắc nhỏ nhất thế giới.</p>\r\n\r\n<p>Bất kể l&agrave; d&agrave;nh cho c&ocirc;ng việc hay giải tr&iacute;, ASUS VivoBook A412DA-EK346T lu&ocirc;n l&agrave; mẫu Laptop mỏng nhẹ l&agrave;m bạn đắm ch&igrave;m trong mọi t&igrave;nh huống sử dụng. M&agrave;n h&igrave;nh NanoEdge kh&ocirc;ng viền tr&ecirc;n bốn cạnh mới tự h&agrave;o với viền si&ecirc;u mỏng 5,7mm, đem đến tỷ lệ m&agrave;n h&igrave;nh tr&ecirc;n th&acirc;n m&aacute;y 88% đầy ấn tượng cho h&igrave;nh ảnh đắm ch&igrave;m vượt trội.</p>\r\n\r\n<p>Thiết kế bản lề ErgoLift mới c&ograve;n n&acirc;ng b&agrave;n ph&iacute;m l&ecirc;n tới vị tr&iacute; g&otilde; ph&iacute;m thoải m&aacute;i hơn. VivoBook 14 với nguồn sức mạnh đến từ bộ vi xử l&yacute; Ryzen 3-3200U mới nhất c&ugrave;ng với card đồ họa rời NVIDIA v&agrave; ổ lưu trữ k&eacute;p sẽ gi&uacute;p bạn ho&agrave;n th&agrave;nh mọi t&aacute;c vụ một c&aacute;c đơn giản nhất. Hơn thế nữa, mẫu m&aacute;y t&iacute;nh n&agrave;y c&ograve;n c&oacute; sẵn theo bốn m&agrave;u sắc ho&agrave;n thiện độc đ&aacute;o để ph&ugrave; hợp với phong c&aacute;ch của bạn.</p>\r\n\r\n<p>M&agrave;n h&igrave;nh hiển thị NanoEdge</p>\r\n\r\n<p><strong>Đắm ch&igrave;m kh&ocirc;ng giới hạn</strong></p>\r\n\r\n<p>ASUS VivoBook 14 A412DA-EK346T&nbsp;x&oacute;a tan mọi giới hạn về năng lực, khơi nguồn cảm hứng cho bạn ph&aacute; vỡ những ranh giới mới. Thiết kế NanoEdge kh&ocirc;ng viền tr&ecirc;n bốn cạnh mới mang đến cho&nbsp;VivoBook 14 2019&nbsp;một m&agrave;n h&igrave;nh gần như kh&ocirc;ng c&oacute; viền đen với diện t&iacute;ch hiển thị lớn v&agrave; trải nghiệm h&igrave;nh ảnh cực kỳ sống động cho cả l&agrave;m việc v&agrave; giải tr&iacute;. Ngay cả với viền si&ecirc;u mỏng, th&igrave; viền tr&ecirc;n vẫn kh&ocirc;ng thể thiếu đi camera HD đầy cảm hứng để bạn tr&ograve; chuyện video với gia đ&igrave;nh v&agrave; bạn b&egrave; tr&ecirc;n khắp thế giới.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/4f/11/7d/2ce3bfa46f28b8bd7ee0ed78591441b3.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/2a/8f/25/4661b56200b7a78a15afd67833641ea2.png\" style=\"height:128px; width:600px\" /></p>\r\n\r\n<p>K&iacute;ch thước nhỏ gọn</p>\r\n\r\n<p>M&agrave;n h&igrave;nh NanoEdge kh&ocirc;ng viền tr&ecirc;n bốn cạnh mới gi&uacute;p thu gọn k&iacute;ch thước xuống tối thiểu, mang đến cho&nbsp;VivoBook 14&nbsp;một th&acirc;n h&igrave;nh nhỏ hơn đ&aacute;ng kể so với thế hệ tiền nhiệm. Do đ&oacute; chiếc&nbsp;Laptop mỏng nhẹ&nbsp;n&agrave;y chiếm &iacute;t kh&ocirc;ng gian b&agrave;n l&agrave;m việc hơn, để lại cho bạn khoảng trống rộng r&atilde;i hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/f3/af/10/128003ddb1dd9c378fefa7a78ba780a3.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p>C&ugrave;ng bạn đến bất cứ nơi đ&acirc;u</p>\r\n\r\n<p>Cuộc sống diễn ra hối hả v&agrave; bạn sẽ cần một chiếc m&aacute;y t&iacute;nh x&aacute;ch tay kh&ocirc;ng l&agrave;m bạn th&ecirc;m g&aacute;nh nặng.&nbsp;Asus vivobook 14&nbsp;c&oacute; k&iacute;ch thước nhỏ gọn, th&acirc;n thiện với di chuyển v&agrave; nhẹ đến kinh ngạc &ndash; bạn chỉ việc đặt v&agrave;o t&uacute;i x&aacute;ch v&agrave; tận hưởng trải nghiệm m&aacute;y t&iacute;nh đ&iacute;ch thực mọi l&uacute;c mọi nơi.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/6e/68/2d/b9d83102a2ba2fd28ebd22e0723739d4.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>M&agrave;u sắc thể hiện c&aacute; t&iacute;nh</p>\r\n\r\n<p>VivoBook 14 c&oacute; sẵn theo nhiều m&agrave;u ho&agrave;n thiện kh&aacute;c nhau để ph&ugrave; hợp với phong c&aacute;ch của bạn. M&agrave;u Bạc trong mang đến diện mạo b&oacute;ng bẩy v&agrave; tinh tế, hoặc h&atilde;y chọn m&agrave;u X&aacute;m đ&aacute; để tinh tế theo kiểu trầm lắng hơn. Bắt đầu một xu hướng mới với m&agrave;u Xanh l&ocirc;ng c&ocirc;ng đổi m&agrave;u đặc biệt: một lựa chọn độc đ&aacute;o c&oacute; thể thay đổi m&agrave;u sắc khi nh&igrave;n từ những g&oacute;c độ kh&aacute;c nhau. Nếu thực sự muốn nổi bật, bạn c&oacute; thể chọn m&agrave;u Hồng san h&ocirc; với lớp ho&agrave;n thiện tươi s&aacute;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/64/79/f3/5edbcf420a28468005de13a53bdff4dc.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>ErgoLift - N&acirc;ng tầm trải nghiệm</p>\r\n\r\n<p>Mở ra&nbsp;VivoBook14&nbsp;với khả năng v&agrave; năng suất v&ocirc; hạn. Bản lề gia c&ocirc;ng ch&iacute;nh x&aacute;c ErgoLift mang tới t&aacute;c dụng k&eacute;p v&ocirc; c&ugrave;ng &ecirc;m &aacute;i, vừa giữ cố định m&agrave;n h&igrave;nh ở mọi g&oacute;c độ vừa n&acirc;ng b&agrave;n ph&iacute;m cao hơn 2 độ đến vị tr&iacute; g&otilde; ph&iacute;m ho&agrave;n hảo ph&ugrave; hợp với mọi điều kiện.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/b3/9b/53/dc6a4f5f222b636702767007ca1b9c4d.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>Hiệu năng tuyệt vời, chinh phục mọi giới hạn</p>\r\n\r\n<p>Tương lai l&agrave; do bạn tạo dựng n&ecirc;n v&agrave;&nbsp;VivoBook 14&nbsp;sẽ l&agrave; h&agrave;nh trang b&ecirc;n bạn tr&ecirc;n từng bước đường. Với bộ vi xử l&yacute; Ryzen 3-3200U mới nhất v&agrave; card đồ họa rời NVIDIA t&ugrave;y theo nhu cầu cấu h&igrave;nh, bạn sẽ lu&ocirc;n sẵn s&agrave;ng cho mọi thử th&aacute;ch ph&iacute;a trước nhờ khả năng l&agrave;m việc đa nhiệm, chỉnh sửa đa phương tiện v&agrave; chơi game phổ th&ocirc;ng. V&agrave; với Wi-Fi 802.11ac hai băng tần, bạn sẽ được tận hưởng trải nghiệm trực tuyến si&ecirc;u nhanh với tốc độ l&ecirc;n đến 867Mbps.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/16/0e/e3/0ea1faab145410ef9b3795e4535e98a7.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p>Thời gian tải nhanh hơn, dung lượng lưu trữ lớn hơn</p>\r\n\r\n<p>VivoBook 14&nbsp;sở hữu thiết kế ổ lưu trữ k&eacute;p mang đến cho bạn hiệu năng xử l&yacute; dữ liệu si&ecirc;u nhanh v&agrave; dung lượng lưu trữ lớn. C&agrave;i đặt tất cả c&aacute;c ứng dụng tr&ecirc;n SSD để c&oacute; thời gian phản hồi v&agrave; tải ứng dụng si&ecirc;u nhanh, đồng thời sử dụng HDD để lưu trữ c&aacute;c tệp tin lớn như phim, thư viện nhạc v&agrave; album ảnh.&nbsp;ASUS A412DA-EK163T&nbsp;c&ograve;n trang bị c&ocirc;ng nghệ bộ nhớ Intel Optane gi&uacute;p tải ứng dụng nhanh hơn v&agrave; xử l&yacute; đa nhiệm mượt m&agrave; hơn. Bạn sẽ nhận được những lợi &iacute;ch lớn nhất từ hai c&ocirc;ng nghệ, đ&oacute; l&agrave; mức hiệu năng tương đương với tr&ecirc;n SSD v&agrave; dung lượng lưu trữ lớn c&oacute; được từ ổ đĩa cứng truyền thống.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/63/ec/53/61a4367a4f154a25d9006d618b3c89de.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/ac/7e/e0/06a2c502cf33f59dd3cd68595052910a.png\" style=\"height:117px; width:600px\" /></p>\r\n\r\n<p>Đăng nhập một chạm với Windows Hello</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/31/d4/ac/19a50cca607906fe2ce697ab41ac2e4b.png\" style=\"height:180px; width:180px\" /></p>\r\n\r\n<p>Mở kh&oacute;a m&aacute;y t&iacute;nh x&aacute;ch tay dễ d&agrave;ng v&agrave; bảo mật hơn bao giờ hết. Nhờ cảm biến v&acirc;n tay t&iacute;ch hợp trong b&agrave;n di chuột của&nbsp;VivoBook 14&nbsp;c&ugrave;ng với Windows Hello, bạn sẽ kh&ocirc;ng cần nhập mật khẩu mỗi khi đăng nhập, chỉ cần một lần chạm l&agrave; đủ!</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/42/48/59/bb346bad967f03b90e90be426b1ec42b.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>G&otilde; ph&iacute;m ch&iacute;nh x&aacute;c hơn</p>\r\n\r\n<p>Cấu tr&uacute;c liền khối cứng c&aacute;p, thiết kế mũ ph&iacute;m l&otilde;m c&ocirc;ng th&aacute;i học v&agrave; h&agrave;nh tr&igrave;nh ph&iacute;m 1,4mm mang đến trải nghiệm g&otilde; ph&iacute;m thoải m&aacute;i &ndash; v&agrave; c&ograve;n được đặt ở một g&oacute;c độ ho&agrave;n hảo nhờ bản lề ErgoLift. Mũ ph&iacute;m đ&atilde; trải qua thử nghiệm khắt khe sử dụng l&ecirc;n đến 100.000.000 lần nhấn &ndash; n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về độ bền của&nbsp;Asus Vivobook 2019 A412!</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/69/60/11/1878889f71d9e6d6c51b00bc475b4c3a.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p>Khả năng kết nối mạnh mẽ</p>\r\n\r\n<p>ASUS A412DA&nbsp;được trang bị cổng USB Type-C (USB-C) cho ph&eacute;p kết nối hai chiều, hỗ trợ thiết kế hai mặt khiến cho việc kết nối c&aacute;c thiết bị trở n&ecirc;n dễ d&agrave;ng nhất c&oacute; thể USB-C c&ograve;n đem đến tốc độ truyền dữ liệu nhanh hơn đến 10 lần so với c&aacute;c chuẩn kết nối USB 2.0 trước đ&acirc;y! Ngo&agrave;i ra c&ograve;n c&oacute; cổng USB 3.1 thế hệ 1 v&agrave; USB 2.0, đầu ra HDMI v&agrave; đầu đọc thẻ microSD &ndash; cho ph&eacute;p bạn kết nối dễ d&agrave;ng với tất cả c&aacute;c thiết bị ngoại vi hiện tại, m&agrave;n h&igrave;nh v&agrave; m&aacute;y chiếu m&agrave; kh&ocirc;ng gặp một ch&uacute;t phiền phức.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/30/2a/65/579b88ef7d8e292ab4a2a9dc468e9a25.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p>Pin hoạt động năng suất cả ng&agrave;y d&agrave;i</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/a3/08/96/b0a0a6350b80394318c1b225c501d067.png\" style=\"height:132px; width:600px\" /></p>\r\n\r\n<p>ASUS A412DA&nbsp;gi&uacute;p bạn di chuyển l&acirc;u hơn nhờ pin Lithium-polymer chất lượng cao cho cả ng&agrave;y sử dụng m&aacute;y t&iacute;nh. C&ocirc;ng nghệ ASUS Battery Health Charging t&iacute;ch hợp độc quyền của ASUS gi&uacute;p bảo vệ pin kh&ocirc;ng bị sạc qu&aacute; mức, nhờ đ&oacute; k&eacute;o d&agrave;i tuổi thọ pin v&agrave; giảm khả năng hư hại do phồng pin, đảm bảo pin lu&ocirc;n ở t&igrave;nh trạng tuyệt vời.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/c4/9c/d6/15117d919a6c9ddf44798acab8baba9b.jpg\" style=\"height:369px; width:600px\" /></p>\r\n\r\n<p>Mang tới &acirc;m thanh truyền cảm</p>\r\n\r\n<p>ASUS SonicMaster l&agrave; sự kết hợp ho&agrave;n hảo giữa phần cứng, phần mềm v&agrave; khả năng tinh chỉnh &acirc;m thanh được thiết kế nhằm đem đến cho bạn trải nghiệm &acirc;m thanh tốt nhất. Bộ m&atilde; codec cấp chuy&ecirc;n gia đảm bảo m&atilde; h&oacute;a v&agrave; giải m&atilde; &acirc;m thanh ch&iacute;nh x&aacute;c, trong khi đ&oacute;, c&aacute;c bộ khuếch đại v&agrave; c&aacute;c loa c&ocirc;ng suất lớn c&ugrave;ng với c&aacute;c buồng cộng hưởng ph&ugrave; hợp ho&agrave;n hảo với&nbsp;ASUS A412DA&nbsp;đảm bảo mang đến &acirc;m thanh mạnh mẽ v&agrave; &acirc;m trầm s&acirc;u hơn. Qu&aacute; tr&igrave;nh xử l&yacute; v&agrave; tinh chỉnh t&iacute;n hiệu tăng cường gi&uacute;p điều chỉnh từng chi tiết tinh tế nhất, lọc bỏ tiếng ồn v&agrave; n&acirc;ng cao độ r&otilde; n&eacute;t của &acirc;m thanh để bạn thực sự đắm ch&igrave;m trong kh&ocirc;ng gian &acirc;m thanh.</p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/86/4c/65/e1816384f5a4ca79608d521515cffc14.jpg\" style=\"height:368px; width:600px\" /></p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Laptop Asus Vivobook A412DA-EK346T AMD R3-3200U/ Win10 (14 FHD) - Silver - Hàng Chính Hãng', '2020-11-17 10:10:44', 10410000, '0', 0, 3);
INSERT INTO `products` (`product_id`, `product_name`, `product_img`, `product_content`, `product_description`, `product_date_created`, `product_price`, `product_status`, `product_sale_price`, `category_id`) VALUES
(63, 'Tay Bấm Gaming Logitech F310 - Hàng Chính', '647d03c07a6588121a533f42a61455fe.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Logitech</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<p>D&acirc;y d&agrave;i: 1.8m</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td>940-000112</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Chất liệu</td>\r\n			<td>Nhựa</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>1457896146210</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Hỗ trợ tr&ograve; chơi mở rộng<br />\r\nBố cục quen thuộc tương tự m&aacute;y chơi game console<br />\r\n4 ph&iacute;m di chuyển D-pad ri&ecirc;ng<br />\r\nC&oacute; thể t&ugrave;y chỉnh c&aacute;c n&uacute;t theo phần mềm quản l&iacute;<br />\r\nD&acirc;y c&aacute;p d&agrave;i: 1.8m</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Thiết kế tiện lợi</p>\r\n\r\n<p><strong>Tay Bấm Gaming Logitech F310</strong>&nbsp;c&oacute; c&aacute;c ph&iacute;m được bố tr&iacute; đầy đủ v&agrave; quen thuộc gi&uacute;p bạn thao t&aacute;c nhanh, kh&ocirc;ng bỏ lỡ một cơ hội n&agrave;o trong khi chơi. C&aacute;c n&uacute;t di chuyển được thiết kế chuyển tiếp với nhau gi&uacute;p bạn trượt nhanh tr&ecirc;n c&aacute;c n&uacute;t một c&aacute;ch dễ d&agrave;ng khi chơi c&aacute;c tr&ograve; chơi h&agrave;nh động, đ&ograve;i hỏi tốc độ nhanh.</p>\r\n\r\n<p>Tay bấm c&ograve;n trang bị đệm cao su mềm gi&uacute;p tay b&aacute;m chắc hơn, bạn c&oacute; thể chơi l&acirc;u m&agrave; kh&ocirc;ng bị mỏi v&agrave; d&acirc;y c&aacute;p d&agrave;i để bạn c&oacute; thể ngồi xa thoải m&aacute;i hơn trong khi chơi game.<br />\r\n<br />\r\n<img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/55/da/3a/1d7891bc9012a822d80f6b224a853777.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>Hỗ trợ tr&ograve; chơi mở rộng</p>\r\n\r\n<p>Chơi c&aacute;c tr&ograve; thể thao điều khiển bằng bộ điều khiển ri&ecirc;ng hoặc sử dụng vị tr&iacute; thoải m&aacute;i hơn trong khi vẫn tận hưởng tr&ograve; chơi tr&ecirc;n m&aacute;y t&iacute;nh. F310 rất dễ để c&agrave;i đặt v&agrave; sử dụng với c&aacute;c tr&ograve; chơi ưa th&iacute;ch của bạn nhờ XInput/DirectInput *&mdash;hai ti&ecirc;u chuẩn đầu v&agrave;o phổ biến nhất.</p>\r\n\r\n<p>*Y&ecirc;u cầu c&agrave;i đặt phần mềm để sử dụng chế độ DirectInput.</p>\r\n\r\n<p><img alt=\"\" src=\"https://vcdn.tikicdn.com/media/catalog/product/l/o/logitech-f310---gaming_2.u3059.d20170910.t142942.969495.jpg\" style=\"height:667px; width:1000px\" /></p>\r\n\r\n<p>Chơi tr&ecirc;n chiếc TV của bạn</p>\r\n\r\n<p>Gh&eacute;p cặp F310 với Big Picture v&agrave; điều hướng Steam, lướt web, chơi game v&agrave; nhiều hơn nữa từ tr&ecirc;n ghế sofa một c&aacute;ch thoải m&aacute;i. H&atilde;y mang to&agrave;n bộ thư viện tr&ograve; chơi Steam của bạn v&agrave;o ph&ograve;ng kh&aacute;ch, cầm lấy chiếc F310, ngồi xuống v&agrave; thưởng thức.</p>\r\n\r\n<p><img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/cc/d6/d2/3710288704f768866333550d36e68f4f.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>Bố cục tương tự m&aacute;y chơi game console</p>\r\n\r\n<p>Bản năng sẽ hướng dẫn c&aacute;c thao t&aacute;c của bạn tr&ecirc;n bố cục quen thuộc. Bạn sẽ sẵn s&agrave;ng để chơi ngay lập tức. Được thiết kế để c&oacute; trải nghiệm điều khiển tương tự m&aacute;y chơi game console v&agrave; đổi mới từ thiết kế truyền thống, F310 vừa vặn như một chiếc găng tay.</p>\r\n\r\n<p><img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/ef/06/aa/766dcd87484770fbceeac511a4be07c7.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>4 ph&iacute;m di chuyển D-pad ri&ecirc;ng</p>\r\n\r\n<p>C&aacute;c ph&iacute;m D-pad ti&ecirc;u chuẩn nằm tr&ecirc;n một điểm trục c&oacute; thể khiến điều khiển kh&ocirc;ng ch&iacute;nh x&aacute;c. B&agrave;n di chuyển D-pad F310 lướt qua bốn ph&iacute;m ri&ecirc;ng tạo ra cảm gi&aacute;c nhạy v&agrave; trực quan hơn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/82/5c/bb/d907112457bccd89e2b387913432484d.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>Phần mềm quản l&iacute;</p>\r\n\r\n<p>Đối với tr&ograve; chơi kh&ocirc;ng hỗ trợ cho tay cầm bản ngữ, bạn c&oacute; thể t&ugrave;y chỉnh c&aacute;c n&uacute;t tr&ecirc;n tay cầm sao cho ph&ugrave; hợp để chơi tr&ecirc;n c&aacute;c tr&ograve; chơi đ&oacute;.&nbsp;Thay đổi c&aacute;c lệnh ti&ecirc;u chuẩn hoặc sử dụng F310 để chơi tựa game kh&ocirc;ng được hỗ trợ bằng c&aacute;ch sử dụng phần mềm cấu h&igrave;nh của Logitech. C&aacute;c n&uacute;t v&agrave; ph&iacute;m điều khiển ho&agrave;n to&agrave;n c&oacute; thể lập tr&igrave;nh v&agrave; thậm ch&iacute; c&oacute; thể m&ocirc; phỏng c&aacute;c lệnh b&agrave;n ph&iacute;m v&agrave; chuột.<br />\r\n<br />\r\n<img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/16/a9/5b/1b81fc2b9d51d21cc21dea2204010aab.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>Hỗ trợ TV chạy tr&ecirc;n Android</p>\r\n\r\n<p>Bộ điều khiển chơi game của ch&uacute;ng t&ocirc;i hỗ trợ c&aacute;c TV Sony Android&trade;. Với ph&iacute;m bộ điều khiển ở chế độ XID, bố cục kiểu m&aacute;y chơi game console sẽ mang lại lợi thế cho bạn khi thi đấu. C&aacute;c đường cong mượt m&agrave; v&agrave; tay cầm bọc cao su sẽ mang lại c&aacute;c cuộc chơi l&acirc;u d&agrave;i, thoải m&aacute;i. C&aacute;c n&uacute;t điều khiển TV Android chuẩn - sử dụng qua n&uacute;t Logo Logitech tr&ecirc;n tay cầm c&ugrave;ng với ph&iacute;m Back (Quay lại) tr&ecirc;n bộ điều khiển - cho ph&eacute;p bạn điều khiển TV Android đồng thời.</p>\r\n\r\n<p><img alt=\"\" src=\"https://vcdn.tikicdn.com/ts/tmp/d6/19/00/79eb52eb9d74b8f74d97b7e401772271.jpg\" style=\"height:567px; width:850px\" /></p>\r\n\r\n<p>Th&ocirc;ng số kỹ thuật:</p>\r\n\r\n<ul>\r\n	<li>Input mode:\r\n	<ul>\r\n		<li>N&uacute;t : A, B, X, Y, LB, RB , Left , right triggers, Start v&agrave; Back</li>\r\n		<li>2 clickable analog mini-joysticks</li>\r\n		<li>8-way D-pad</li>\r\n		<li>N&uacute;t: Home, Sports mode</li>\r\n	</ul>\r\n	</li>\r\n	<li>Directinput mode:\r\n	<ul>\r\n		<li>10 n&uacute;t lập tr&igrave;nh được</li>\r\n		<li>Left v&agrave; right triggers lập tr&igrave;nh được</li>\r\n		<li>2 mini-joysticks lập tr&igrave;nh được</li>\r\n		<li>8-way D-pad lập tr&igrave;nh được</li>\r\n		<li>Sports mode</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Đứng thứ 2 trong Top 1000 Tay Bấm Game - Thiết Bị Điều Khiển bán chạy tháng này', '2020-11-17 11:27:37', 371900, '0', 0, 46),
(64, 'Tay Cầm PlayStation PS4 Sony Dualshock 4 (Màu Xanh Đen) - Hàng Chính Hãng', '1ec8676c7c8b60b0ff091bf6b6402e2e.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Sony</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Trung Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>6427941195635</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Thiết kế tay cầm thuận tiện<br />\r\nT&iacute;ch hợp bộ rung<br />\r\nT&iacute;ch hợp loa ngo&agrave;i v&agrave; cổng tai nghe 3.5<br />\r\nChia sẻ thuận ti&ecirc;n hơn với n&uacute;t &quot;SHARE&quot;</p>\r\n\r\n<ul>\r\n	<li><strong>Tay Cầm PlayStation PS4 Sony Dualshock 4 (M&agrave;u Xanh Đen)</strong>&nbsp;d&agrave;nh cho PlayStation 4.</li>\r\n	<li>Thiết kế tay cầm thuận tiện với c&aacute;c n&uacute;t bấm nhạy, cảm ứng hiện đại.</li>\r\n	<li>T&iacute;ch hợp bộ rung cho trải nghiệm game ch&acirc;n thật.</li>\r\n	<li>T&iacute;ch hợp loa ngo&agrave;i v&agrave; cổng tai nghe 3.5 cho thưởng thức &acirc;m thanh thuận tiện hơn.</li>\r\n	<li>Chia sẻ thuận ti&ecirc;n hơn với n&uacute;t &quot;&quot;SHARE&quot;&quot; tr&ecirc;n tay cầm.</li>\r\n	<li>Hỗ trợ khả năng truyền t&iacute;n hiệu qua Bluetooth v&agrave; c&aacute;p microUSB.</li>\r\n</ul>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Thương hiệu: Sony Đứng thứ 8 trong Top 1000 Tay Bấm Game - Thiết Bị Điều Khiển bán chạy tháng này', '2020-11-17 11:28:42', 1150000, '0', 1100000, 46),
(65, 'Tay cầm chơi game cho Fifa online 4 trên pc, laptop - U606', '3591ebc5c60716de3d3c399c0ceb7af3.jpg', '<p>TH&Ocirc;NG TIN CHI TIẾT</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>OEM</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước</td>\r\n			<td>\r\n			<p>20x15x5</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>3573762629606</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Thiết kế bắt mắt<br />\r\nTay game c&oacute; nhiều n&uacute;t mode khi chơi<br />\r\nHỗ trợ FO4, FO3 chơi dễ d&agrave;ng<br />\r\nGắn v&agrave;o l&agrave; kết nối<br />\r\nHỗ trợ pc, laptop từ window 7 trở l&ecirc;n<br />\r\nĐầu gắn usb</p>\r\n\r\n<ul>\r\n	<li>Thiết kế bắt mắt</li>\r\n	<li>Tay game c&oacute; nhiều n&uacute;t mode khi chơi</li>\r\n	<li>Hỗ trợ FO4, FO3 chơi dễ d&agrave;ng</li>\r\n	<li>Gắn v&agrave;o l&agrave; kết nối</li>\r\n	<li>Hỗ trợ pc, laptop từ window 7 trở l&ecirc;n</li>\r\n	<li>Đầu gắn usb</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/f2/7b/3c/bdf031a0d8f25d82ac3d4cd75e12b7e8.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/b2/d0/47/193acd3e8a60f4173e20834a1e4c70d3.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/37/6b/14/0fedbaa793aa37d137e3a9be3deb9b7f.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/4a/2e/10/6d9f90250d6997eb513aa441bb7f89a9.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/48/94/d0/3992834db6da16a15b2602c61d17961a.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/9e/59/6f/dccd10c3150e57be21f10c2d4e09c3c7.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"https://salt.tikicdn.com/ts/tmp/9d/3a/6a/19e4786733489d894fcb94e6a1edd72d.jpg\" style=\"height:422px; width:750px\" /></p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. Tuy nhi&ecirc;n tuỳ v&agrave;o từng loại sản phẩm hoặc phương thức, địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, ...</p>\r\n', 'Thương hiệu: OEM Đứng thứ 8 trong Top 1000 Tay Bấm Game - Thiết Bị Điều Khiển bán chạy tháng này', '2020-11-17 11:29:57', 130000, '0', 125000, 46);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_fullname` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_img` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_fullname`, `user_pass`, `user_img`, `user_phone`, `user_address`, `role_id`) VALUES
(21, 'thientran98qbs', 'Thiện Đình', 'f4c53ec82871c04c7ca22ddccaef18d8', NULL, NULL, NULL, 1),
(22, 'Ngoc123', 'Ngọc Như', '515f59ba0903d5a881d487de3b7b6ba8', NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orderss`
--
ALTER TABLE `orderss`
  ADD PRIMARY KEY (`orderr_id`),
  ADD KEY `fk_order_cus` (`id`),
  ADD KEY `fk_order_user` (`order_id`);

--
-- Indexes for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_order` (`customer_id`),
  ADD KEY `fk_payment` (`payment_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_product` (`product_id`),
  ADD KEY `fk_id` (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_role_user` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `orderss`
--
ALTER TABLE `orderss`
  MODIFY `orderr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_customer`
--
ALTER TABLE `order_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderss`
--
ALTER TABLE `orderss`
  ADD CONSTRAINT `fk_order_cus` FOREIGN KEY (`id`) REFERENCES `order_customer` (`id`),
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`order_id`) REFERENCES `order_product` (`order_id`);

--
-- Constraints for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `order_customer` (`id`),
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
