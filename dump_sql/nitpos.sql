-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-03-2020 a las 12:20:26
-- Versión del servidor: 5.5.62-0+deb8u1
-- Versión de PHP: 5.6.40-0+deb8u8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sede03_nitpos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `name`, `created_at`) VALUES
(1, 'CEREALES', '2020-01-16 20:36:03'),
(2, 'DESECHABLES', '2020-01-16 20:36:03'),
(3, 'EMBUTIDOS', '2020-01-16 20:36:03'),
(4, 'LACTEOS', '2020-01-16 20:36:03'),
(5, 'PAN', '2020-01-16 20:36:03'),
(6, 'PAPA', '2020-01-16 20:36:03'),
(7, 'SALSAS', '2020-01-16 20:36:03'),
(8, 'SURTICOM', '2020-01-16 20:36:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_date`) VALUES
(1, '3A', '2020-01-16 20:39:18'),
(2, 'ALQUERIA', '2020-01-16 20:39:18'),
(3, 'ANGELES', '2020-01-16 20:39:18'),
(4, 'ATIKAS', '2020-01-16 20:39:18'),
(5, 'BENNY', '2020-01-16 20:39:18'),
(6, 'CHEF CHOICE', '2020-01-16 20:39:18'),
(7, 'CIAL SAS', '2020-01-16 20:39:18'),
(8, 'COUNTRY', '2020-01-16 20:39:18'),
(9, 'DARNEL', '2020-01-16 20:39:18'),
(10, 'DELCASINO', '2020-01-16 20:39:18'),
(11, 'EL SOL', '2020-01-16 20:39:18'),
(12, 'ESTUPASTA', '2020-01-16 20:39:18'),
(13, 'FAMILIA', '2020-01-16 20:39:18'),
(14, 'FAVORITA', '2020-01-16 20:39:18'),
(15, 'FRIGOSAN', '2020-01-16 20:39:18'),
(16, 'HAMBURGUER', '2020-01-16 20:39:18'),
(17, 'HOUSE', '2020-01-16 20:39:18'),
(18, 'ITALPAN', '2020-01-16 20:39:18'),
(19, 'KRUMER SHIPS', '2020-01-16 20:39:18'),
(20, 'MACCAIN', '2020-01-16 20:39:18'),
(21, 'MARTSANG', '2020-01-16 20:39:18'),
(22, 'MIO', '2020-01-16 20:39:18'),
(23, 'NAZARETH', '2020-01-16 20:39:18'),
(24, 'NUTRESA', '2020-01-16 20:39:18'),
(25, 'NUTRIGRANOLA', '2020-01-16 20:39:18'),
(26, 'PAPA CHEF', '2020-01-16 20:39:18'),
(27, 'PICOLLO', '2020-01-16 20:39:18'),
(28, 'POPULAR', '2020-01-16 20:39:18'),
(29, 'PRACTI PASTA', '2020-01-16 20:39:18'),
(30, 'PRIMAVERA', '2020-01-16 20:39:18'),
(31, 'RICA', '2020-01-16 20:39:18'),
(32, 'SABORE', '2020-01-16 20:39:18'),
(33, 'SETAS DE CUIVÁ', '2020-01-16 20:39:18'),
(34, 'SURTICOM', '2020-01-16 20:39:18'),
(35, 'TAMI', '2020-01-16 20:39:18'),
(36, 'TOLIBOY', '2020-01-16 20:39:18'),
(37, 'TOMATICO', '2020-01-16 20:39:18'),
(38, 'TUC', '2020-01-16 20:39:18'),
(39, 'VBC', '2020-01-16 20:39:18'),
(40, 'ZENU', '2020-01-16 20:39:18'),
(41, 'LUTOSA', '2020-02-25 15:55:49'),
(42, 'PULMAN', '2020-02-25 19:56:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalog_expences`
--

CREATE TABLE IF NOT EXISTS `catalog_expences` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catalog_expences`
--

INSERT INTO `catalog_expences` (`id`, `name`, `created_date`) VALUES
(4, 'Personal', '2019-07-27 01:17:27'),
(5, 'Servicios', '2019-07-27 01:17:38'),
(6, 'Transporte', '2019-07-27 01:17:52'),
(7, 'Mantenimiento', '2019-07-27 01:18:13'),
(8, 'Viaticos', '2019-09-16 23:31:41'),
(1, 'Compras', '2019-10-30 14:05:05'),
(9, 'Factura anulada', '2020-01-06 13:37:32'),
(10, 'Compras', '2020-02-25 14:08:29'),
(11, 'Vales', '2020-02-25 14:08:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(9) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_date`) VALUES
(1, 'ALUMINIO', '2020-01-16 20:31:42'),
(3, 'BOLSAS', '2020-01-16 20:31:42'),
(4, 'CEREALES', '2020-01-16 20:31:42'),
(5, 'CHORIZO', '2020-01-16 20:31:42'),
(6, 'CREMAS DE LECHE', '2020-01-16 20:31:42'),
(7, 'CUBIERTOS', '2020-01-16 20:31:42'),
(8, 'ENLATADOS', '2020-01-16 20:31:42'),
(9, 'GRANOS', '2020-01-16 20:31:42'),
(10, 'HAMBURGUESAS', '2020-01-16 20:31:42'),
(11, 'ICOPOR', '2020-01-16 20:31:42'),
(12, 'JAMONES', '2020-01-16 20:31:42'),
(13, 'PAN', '2020-01-16 20:31:42'),
(14, 'PAPA', '2020-01-16 20:31:42'),
(15, 'PITILLOS', '2020-01-16 20:31:42'),
(16, 'QUESO', '2020-01-16 20:31:42'),
(17, 'SALCHICHAS', '2020-01-16 20:31:42'),
(18, 'SALCHICHON', '2020-01-16 20:31:42'),
(19, 'SALSAS', '2020-01-16 20:31:42'),
(20, 'TOCINETA', '2020-01-16 20:31:42'),
(21, 'VASOS', '2020-01-16 20:31:42'),
(22, 'YOGURTH', '2020-01-16 20:31:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combo_items`
--

CREATE TABLE IF NOT EXISTS `combo_items` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`id` int(11) NOT NULL,
  `typedoc` int(2) NOT NULL,
  `numdoc` varchar(50) NOT NULL,
  `firstname1` varchar(50) NOT NULL,
  `firstname2` varchar(50) DEFAULT NULL,
  `lastname1` varchar(50) NOT NULL,
  `lastname2` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `movil` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `daybirthday` int(2) DEFAULT NULL,
  `monthbirthday` int(2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `regime` int(2) NOT NULL,
  `type` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `typedoc`, `numdoc`, `firstname1`, `firstname2`, `lastname1`, `lastname2`, `phone`, `adresse`, `city`, `movil`, `email`, `daybirthday`, `monthbirthday`, `discount`, `regime`, `type`, `created_at`) VALUES
(1, 1, '44444444', 'SUSEJ', '', 'BELIZARIO', '', '', '', '', '', '', 0, 0, 0.00, 1, 0, '2020-03-11 23:48:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucions`
--

CREATE TABLE IF NOT EXISTS `devolucions` (
`id` int(11) NOT NULL,
  `texto` varchar(2000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caja` varchar(50) NOT NULL,
  `cajero` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store` varchar(200) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expences`
--

CREATE TABLE IF NOT EXISTS `expences` (
`id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(150) NOT NULL,
  `note` text,
  `amount` float NOT NULL,
  `attachment` varchar(200) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL,
  `register_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `expences`
--

INSERT INTO `expences` (`id`, `date`, `reference`, `note`, `amount`, `attachment`, `created_date`, `category_id`, `register_id`, `store_id`, `created_by`) VALUES
(1, '2020-02-25', '049594', 'Compra de bolsas transparentes para empacar.\r\n', 6500, '', '2020-02-25 14:37:58', 10, 4, 1, 3),
(2, '2020-02-25', '00023902', 'Factura 00023902', 45700, '', '2020-02-25 15:25:06', 9, 1, 1, 2),
(3, '2020-02-25', '1', 'onces para Ingeniero de  Sistemas', 6400, '', '2020-02-25 16:13:32', 8, 1, 1, 2),
(4, '2020-02-25', '2', 'Prestamos a don Carlos.', 25000, '', '2020-02-25 17:37:20', 4, 1, 1, 2),
(5, '2020-02-25', '00023923', 'Factura 00023923', 293100, '', '2020-02-25 20:33:49', 9, 6, 1, 5),
(6, '2020-02-25', '00023930', 'Factura 00023930', 329400, '', '2020-02-25 20:45:56', 9, 6, 1, 5),
(7, '2020-02-25', '0511', 'compra de caja de pollo apanado para LINA SIERRA', 36000, '', '2020-02-25 20:58:26', 10, 6, 1, 5),
(8, '2020-02-25', '049700', 'COMPRA PALILLOS ', 8000, '', '2020-02-25 22:47:19', 10, 6, 1, 5),
(9, '2020-02-26', '0972', 'compra de jabones para aseo', 7300, '', '2020-02-26 14:08:53', 5, 9, 1, 2),
(10, '2020-02-26', '01', 'compra de dos tintos para don Carlos\r\n', 1200, '', '2020-02-26 14:31:26', 4, 9, 1, 2),
(11, '2020-02-26', '23415295', 'pago   Encomienda don Carlos\r\n', 26500, '', '2020-02-26 14:49:12', 4, 9, 1, 2),
(12, '2020-02-26', '02', 'compra de 1 tinto  2 panes don Carlos\r\n', 1200, '', '2020-02-26 14:54:09', 4, 9, 1, 2),
(13, '2020-02-26', '0052', 'compra huevos codorniz\r\n\r\n', 151200, '', '2020-02-26 17:13:43', 10, 9, 1, 2),
(14, '2020-02-26', '4764', 'compra SIM CARD\r\n\r\n', 3000, '', '2020-02-26 17:39:59', 10, 9, 1, 2),
(15, '2020-02-26', '03', 'COMPRA DE TARJETA INGENIERO\r\n\r\n', 40000, '', '2020-02-26 19:05:45', 4, 9, 1, 2),
(16, '2020-02-26', '00024003', 'Factura 00024003', 70400, '', '2020-02-26 21:54:01', 9, 12, 1, 5),
(17, '2020-02-26', '00024008', 'Factura 00024008', 52800, '', '2020-02-26 22:55:27', 9, 12, 1, 5),
(18, '2020-02-27', '073542', 'pago revision  coservicios', 27000, '', '2020-02-27 21:43:07', 5, 13, 1, 2),
(19, '2020-02-27', '01', '', 1100000, '', '2020-02-27 22:10:26', 4, 13, 1, 2),
(20, '2020-02-27', '025', 'compra  bolsa aji', 800, '', '2020-02-27 22:29:37', 10, 14, 1, 2),
(21, '2020-02-28', '18859', 'compra champiñones\r\n', 49600, '', '2020-02-28 15:29:40', 10, 17, 1, 2),
(22, '2020-02-28', '2276', 'COMPRA PRACTIPASTA\r\n', 255500, '', '2020-02-28 17:04:43', 10, 17, 1, 2),
(23, '2020-02-28', '00024169', 'Factura 00024169', 67400, '', '2020-02-28 23:51:53', 9, 18, 1, 5),
(24, '2020-03-01', '00023978', 'Factura 00023978', 14650, '', '2020-03-01 22:29:39', 9, 9, 1, 1),
(25, '2020-03-01', '00023979', 'Factura 00023979', 14650, '', '2020-03-01 22:29:57', 9, 9, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holds`
--

CREATE TABLE IF NOT EXISTS `holds` (
`id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `time` varchar(10) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `user_id` int(9) NOT NULL,
  `store_id` int(9) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE IF NOT EXISTS `licencias` (
`id` int(11) NOT NULL,
  `licencia` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `date_activo` timestamp NULL DEFAULT NULL,
  `in_activo` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`id`, `licencia`, `text`, `date_activo`, `in_activo`) VALUES
(1, 'NIT 0031', '984fd87b9d8803d10ec86a84709b17ab', '2020-02-25 14:18:32', 2),
(2, 'NIT 0032', 'ada0003b6a4d51929fa06ce848c7573d', NULL, 1),
(3, 'NIT 0033', '8638c279beb6583bb82cdc637d9f2c58', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payements`
--

CREATE TABLE IF NOT EXISTS `payements` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `paid` float NOT NULL,
  `paidmethod` varchar(300) CHARACTER SET latin1 NOT NULL,
  `created_by` varchar(60) CHARACTER SET latin1 NOT NULL,
  `register_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payements`
--

INSERT INTO `payements` (`id`, `date`, `paid`, `paidmethod`, `created_by`, `register_id`, `sale_id`) VALUES
(9, '2020-02-25 23:48:52', 69750, '3', 'Thalia  Gonzalez', 6, 39),
(10, '2020-02-26 01:49:18', 25050, '0', 'Thalia  Gonzalez', 6, 61),
(11, '2020-02-26 01:50:14', 143050, '0', 'Thalia  Gonzalez', 6, 55),
(12, '2020-02-26 01:57:21', 192100, '0', 'Thalia  Gonzalez', 6, 5),
(13, '2020-02-26 02:01:26', 277000, '0', 'Thalia  Gonzalez', 6, 51),
(14, '2020-02-26 21:21:44', 328350, '0', 'Thalia  Gonzalez', 12, 36),
(15, '2020-02-29 23:03:19', 75000, '3', 'Thalia  Gonzalez', 21, 347),
(16, '2020-03-01 23:03:24', 50400, '0', 'Thalia  Gonzalez', 22, 347);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
`id` int(11) NOT NULL,
  `texto` varchar(2000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `caja` varchar(50) NOT NULL,
  `cajero` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_items`
--

CREATE TABLE IF NOT EXISTS `pedido_items` (
`id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qt` decimal(10,2) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posales`
--

CREATE TABLE IF NOT EXISTS `posales` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `taxvalue` float NOT NULL,
  `qt` float NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `user_id` int(2) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentations`
--

CREATE TABLE IF NOT EXISTS `presentations` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presentations`
--

INSERT INTO `presentations` (`id`, `name`, `created_date`) VALUES
(1, 'UNIDAD', '2019-09-12 23:49:39'),
(2, 'KILOS', '2020-01-17 18:48:02'),
(3, 'LITROS', '2020-01-17 18:48:02'),
(4, 'METROS', '2020-01-17 18:48:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) NOT NULL,
  `code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `reference` varchar(100) NOT NULL,
  `name` varchar(500) CHARACTER SET latin1 NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `cost_nt` float NOT NULL,
  `cost_yt` float NOT NULL,
  `tax_sale_id` int(11) NOT NULL,
  `tax_purchase_id` int(11) NOT NULL,
  `base` float NOT NULL,
  `taxamount` float NOT NULL,
  `price` float NOT NULL,
  `description` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `price_major` float NOT NULL,
  `price_credit` float NOT NULL,
  `utility` decimal(10,2) NOT NULL,
  `utility_major` decimal(10,2) NOT NULL,
  `utility_credit` decimal(10,2) NOT NULL,
  `photo` varchar(200) CHARACTER SET latin1 NOT NULL,
  `photothumb` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `color` varchar(10) CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `type` int(4) DEFAULT '0',
  `alertqt` int(10) DEFAULT NULL,
  `st_max` int(9) DEFAULT NULL,
  `st_min` int(9) NOT NULL,
  `supplier` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` int(9) NOT NULL,
  `unit` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `taxmethod` tinyint(4) DEFAULT NULL,
  `h_stores` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `desc_prog` int(2) DEFAULT NULL,
  `start_date_desc` date DEFAULT NULL,
  `end_date_desc` date DEFAULT NULL,
  `commission_desc` decimal(10,2) DEFAULT NULL,
  `presentation_id` int(11) NOT NULL,
  `fractional` int(2) NOT NULL,
  `identifier` int(2) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `cardtype_id` int(9) DEFAULT NULL,
  `combo_id` int(9) DEFAULT NULL,
  `last_date_sale` date DEFAULT NULL,
  `last_date_purchase` date DEFAULT NULL,
  `sale_by_quantity` int(2) DEFAULT NULL,
  `min_1` int(4) DEFAULT NULL,
  `max_1` int(4) DEFAULT NULL,
  `price_1` float DEFAULT NULL,
  `utility_1` decimal(10,2) NOT NULL,
  `min_2` int(4) DEFAULT NULL,
  `max_2` int(4) DEFAULT NULL,
  `price_2` float DEFAULT NULL,
  `utility_2` decimal(10,2) DEFAULT NULL,
  `min_3` int(4) DEFAULT NULL,
  `max_3` int(4) DEFAULT NULL,
  `price_3` float DEFAULT NULL,
  `utility_3` decimal(10,2) DEFAULT NULL,
  `in_activo` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=699 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(1, 'P000001', '000000000000', 'PAPA FROZZEN *2.5 SURTICOM', 14, 34, 6, '', 10672, 12700, 1, 0, 10672.3, 2027.73, 12700, 'PAPA FROZZEN *2.5 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-02-25 19:31:41', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(2, 'P000002', '00058', 'AREQUIPE *150 BENNY', 4, 5, 1, NULL, 1723, 2050, 1, 0, 1723, 327, 2050, 'AREQUIPE *150 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'P000003', '001', 'ARANDANOS *250 SURTICOM', 4, 34, 1, '', 5042, 6000, 1, 0, 5042, 958, 6000, 'ARANDANOS *250 SURTICOM', 5800, 6500, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-18 19:47:18', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(4, 'P000004', '002', 'LINAZA MOLIDA *250 SURTICOM', 4, 34, 1, NULL, 3300, 3300, 3, 0, 3300, 0, 3300, 'LINAZA MOLIDA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 'P000005', '004', 'ALUM TUC* 100 MTS SURTICOM', 5, 34, 3, NULL, 15966, 19000, 1, 0, 17647, 3034, 21000, 'ALUM TUC* 100 MTS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 'P000006', '005', 'ALUMINIO MIO *100M MIO', 1, 22, 2, NULL, 16387, 19500, 1, 0, 16387, 3113, 19500, 'ALUMINIO MIO *100M MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'P000007', '00582', 'PISTACHOS *500 SURTICOM', 4, 34, 1, NULL, 26000, 26000, 3, 0, 26000, 0, 26000, 'PISTACHOS *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 'P000008', '006', 'ALUMINIO TUC 16 MTS SURTICOM', 5, 34, 3, NULL, 3109, 3700, 1, 0, 3109, 591, 3700, 'ALUMINIO TUC 16 MTS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 'P000009', '0060', 'AJONJOLI *250 ATIKAS', 4, 4, 1, NULL, 2400, 2400, 3, 0, 2400, 0, 2400, 'AJONJOLI *250 ATIKAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, 'P000010', '007', 'ALUMINIO* 100 TUC SURTICOM', 5, 34, 3, NULL, 17647, 21000, 1, 0, 17647, 3353, 21000, 'ALUMINIO* 100 TUC SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 'P000011', '009', 'AREQUIPE BENNY *70G SURTICOM', 5, 34, 3, NULL, 2400, 2400, 3, 0, 2400, 0, 2400, 'AREQUIPE BENNY *70G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, 'P000012', '010', 'AREQUIPE PEQUEÑO SURTICOM', 5, 34, 3, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'AREQUIPE PEQUEÑO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 'P000013', '011', 'AREQUIPE TARRO *250 BENNY', 4, 5, 1, NULL, 2950, 2950, 3, 0, 2950, 0, 2950, 'AREQUIPE TARRO *250 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(14, 'P000014', '0110645667099669', 'VINIPEL DARNEL *1500 DARNEL', 21, 9, 2, NULL, 54412, 64750, 1, 0, 54412, 10338, 64750, 'VINIPEL DARNEL *1500 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(15, 'P000015', '0110645667223750', 'PORTACOMIDA B 1 PACA *500 DARNEL', 11, 9, 2, NULL, 63697, 75800, 1, 0, 63697, 12103, 75800, 'PORTACOMIDA B 1 PACA *500 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, 'P000016', '0117702458001300', 'BANDEJA N3 PACA*500 DARNEL', 11, 9, 2, NULL, 24370, 29000, 1, 0, 24370, 4630, 29000, 'BANDEJA N3 PACA*500 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 'P000017', '0117702458011156', 'PORTACOMIDA J2 PACA *200 DARNEL', 7, 9, 2, NULL, 33571, 39950, 1, 0, 33571, 6379, 39950, 'PORTACOMIDA J2 PACA *200 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 'P000018', '012', 'HAMBURGUESA IMPERIAL *10 SURTICOM', 10, 34, 3, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'HAMBURGUESA IMPERIAL *10 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 'P000019', '013', 'BARQUILLO CORTO SURTICOM', 5, 34, 3, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'BARQUILLO CORTO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(20, 'P000020', '014', 'BOLSA MANIJA 20 K SURTICOM', 3, 34, 2, NULL, 5714, 6800, 1, 0, 5714, 1086, 6800, 'BOLSA MANIJA 20 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:34', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(21, 'P000021', '015', 'BOLSA ALUMINIO P-25 PIZZA SURTICOM', 3, 34, 2, NULL, 2647, 3150, 1, 0, 2647, 503, 3150, 'BOLSA ALUMINIO P-25 PIZZA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(22, 'P000022', '016', 'CAJA CONTENEDOR 16 ONZAS *25 SURTICOM', 5, 34, 3, NULL, 126303, 150300, 1, 0, 126303, 23997, 150300, 'CAJA CONTENEDOR 16 ONZAS *25 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(23, 'P000023', '018', 'CHIPS DE COLORES *500 SURTICOM', 5, 34, 3, NULL, 7983, 9500, 1, 0, 7983, 1517, 9500, 'CHIPS DE COLORES *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(24, 'P000024', '0182', 'LECHE CONDENSADA DULCERITA *380 SURTICOM', 19, 34, 7, NULL, 2857, 3400, 1, 0, 2857, 543, 3400, 'LECHE CONDENSADA DULCERITA *380 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 'P000025', '019', 'MIX UVAS+CEREAL *250 NUTRIGRANOLA', 4, 25, 1, NULL, 4034, 4800, 1, 0, 4034, 766, 4800, 'MIX UVAS+CEREAL *250 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 'P000026', '020', 'CIRUELA 200 GRS SURTICOM', 5, 34, 3, NULL, 1345, 1600, 1, 0, 1345, 255, 1600, 'CIRUELA 200 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 'P000027', '021', 'CIRUELA SALSA 1000* SURTICOM', 5, 34, 3, NULL, 4034, 4800, 1, 0, 4034, 766, 4800, 'CIRUELA SALSA 1000* SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(28, 'P000028', '022', 'CONTENEDOR 16 ONZAS PLASTICO TRANSPARENTE SURTICOM', 5, 34, 3, NULL, 500, 500, 3, 0, 500, 0, 500, 'CONTENEDOR 16 ONZAS PLASTICO TRANSPARENTE SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 'P000029', '023', 'COPA VENECIANA 5 oz *20 DARNEL', 21, 9, 2, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'COPA VENECIANA 5 oz *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(30, 'P000030', '024', 'GELATINA SABORES X 125GR SURTICOM', 5, 34, 3, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'GELATINA SABORES X 125GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(31, 'P000031', '025', 'GUANTES SEPARADOS SURTICOM', 5, 34, 3, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'GUANTES SEPARADOS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(32, 'P000032', '026', 'HABAS *500 NUTRIGRANOLA', 4, 25, 1, NULL, 6000, 6000, 3, 0, 6000, 0, 6000, 'HABAS *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, 'P000033', '027', 'HAMBURGUESA PRECOCIDA *6 SURTICOM', 5, 34, 3, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'HAMBURGUESA PRECOCIDA *6 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(34, 'P000034', '0275', 'SALCHICHA MANGUERA ECO *15 HAMBURGUER', 17, 16, 3, NULL, 5042, 6000, 1, 0, 5042, 958, 6000, 'SALCHICHA MANGUERA ECO *15 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(35, 'P000035', '028', 'ROSADA SOBRES DELCASINO *100 DELCASINO', 19, 10, 7, NULL, 4454, 5300, 1, 0, 4454, 846, 5300, 'ROSADA SOBRES DELCASINO *100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(36, 'P000036', '029', 'HUEVO AA SURTICOM', 5, 34, 3, NULL, 8500, 8500, 3, 0, 8500, 0, 8500, 'HUEVO AA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(37, 'P000037', '030', 'IMPUESTO A LA BOLSA SURTICOM', 5, 34, 3, NULL, 50, 50, 3, 0, 50, 0, 50, 'IMPUESTO A LA BOLSA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(38, 'P000038', '031', 'PAN HAMBURGUESA KAREN *900 SURTICOM', 13, 34, 5, NULL, 3800, 3800, 3, 0, 3800, 0, 3800, 'PAN HAMBURGUESA KAREN *900 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(39, 'P000039', '032', 'ITALPAN HAMBURGUESA ECO 600 GRS SURTICOM', 5, 34, 3, NULL, 3400, 3400, 3, 0, 3400, 0, 3400, 'ITALPAN HAMBURGUESA ECO 600 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(40, 'P000040', '033', 'ITALPAN PERRO 800 GRS SURTICOM', 5, 34, 3, NULL, 4000, 4000, 3, 0, 4000, 0, 4000, 'ITALPAN PERRO 800 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(41, 'P000041', '034', 'PAPRICA *250 SURTICOM', 19, 34, 7, NULL, 5100, 5100, 3, 0, 5100, 0, 5100, 'PAPRICA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(42, 'P000042', '035', 'HAMBURGUESA APANADA *48 UND SURTICOM', 5, 34, 3, NULL, 58824, 70000, 1, 0, 58824, 11176, 70000, 'HAMBURGUESA APANADA *48 UND SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(43, 'P000043', '036', 'ARANDANOS *500 SURTICOM', 4, 34, 1, NULL, 11800, 11800, 3, 0, 11800, 0, 11800, 'ARANDANOS *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(44, 'P000044', '037', 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 19, 34, 7, '', 2101, 2500, 1, 0, 2353, 447, 2800, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2800, 2800, 12.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-28 16:54:00', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(45, 'P000045', '038', 'LECHE CONDENSADA 80GRS ALQUERIA SURTICOM', 5, 34, 3, NULL, 1555, 1850, 1, 0, 1555, 295, 1850, 'LECHE CONDENSADA 80GRS ALQUERIA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(46, 'P000046', '039', 'JAMON MIXTO BAVIERA *500 SURTICOM', 12, 34, 3, NULL, 2311, 2750, 1, 0, 2311, 439, 2750, 'JAMON MIXTO BAVIERA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(47, 'P000047', '042', 'MANI TRITURADO *250GR SURTICOM', 5, 34, 3, NULL, 3000, 3000, 3, 0, 3000, 0, 3000, 'MANI TRITURADO *250GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(48, 'P000048', '043', 'MANI TRITURADO *500GR SURTICOM', 5, 34, 3, NULL, 5900, 5900, 3, 0, 5900, 0, 5900, 'MANI TRITURADO *500GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(49, 'P000049', '044', 'MIEL SOBRES DELCASINO *100 DELCASINO', 19, 10, 7, NULL, 4454, 5300, 1, 0, 4454, 846, 5300, 'MIEL SOBRES DELCASINO *100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(50, 'P000050', '045', 'OBLEA BENNY MEDIANA *25 BENNY', 4, 5, 1, NULL, 4100, 4100, 3, 0, 4250, 0, 4250, 'OBLEA BENNY MEDIANA *25 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(51, 'P000051', '046', 'XXXXXXXXXXXXXXXX SURTICOM', 5, 34, 3, NULL, 3700, 3700, 3, 0, 3700, 0, 3700, 'XXXXXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(52, 'P000052', '047', 'SALCHICHON PONDEROSA *1200 MARTSANG', 18, 21, 3, NULL, 11429, 12000, 4, 0, 11429, 571, 12000, 'SALCHICHON PONDEROSA *1200 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(53, 'P000053', '048', 'PACA BANDEJA Nº 1 DARNEL', 11, 9, 2, NULL, 18235, 21700, 1, 0, 18235, 3465, 21700, 'PACA BANDEJA Nº 1 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(54, 'P000054', '049', 'PACA BANDEJA Nº 17 DARNEL', 11, 9, 2, NULL, 29832, 35500, 1, 0, 29832, 5668, 35500, 'PACA BANDEJA Nº 17 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(55, 'P000055', '05', 'PIÑA TROZOS CAMPIFRUTAS *500 SURTICOM', 19, 34, 7, '', 1176, 1400, 1, 0, 1681, 319, 2000, 'PIÑA TROZOS CAMPIFRUTAS *500 SURTICOM', 2000, 2000, 42.86, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-28 16:54:25', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(56, 'P000056', '050', 'PACA BOLNDA # 26 SURTICOM', 5, 34, 3, NULL, 30000, 30000, 3, 0, 30000, 0, 30000, 'PACA BOLNDA # 26 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(57, 'P000057', '051', 'PORTACOMIDA K 1 PACA *500 DARNEL', 11, 9, 2, NULL, 28319, 33700, 1, 0, 28319, 5381, 33700, 'PORTACOMIDA K 1 PACA *500 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(58, 'P000058', '052', 'PORTACOMIDA C1 PACA *500 DARNEL', 11, 9, 2, NULL, 50588, 60200, 1, 0, 50588, 9612, 60200, 'PORTACOMIDA C1 PACA *500 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(59, 'P000059', '053', 'PORTACOMIDA J1 PACA *200 DARNEL', 11, 9, 2, NULL, 33571, 39950, 1, 0, 33571, 6379, 39950, 'PORTACOMIDA J1 PACA *200 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(60, 'P000060', '054', 'PORTACOMIDA P1 PACA *200 DARNEL', 11, 9, 2, NULL, 39076, 46500, 1, 0, 39076, 7424, 46500, 'PORTACOMIDA P1 PACA *200 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(61, 'P000061', '055', 'PORTACOMIDA T 1 PACA *200 DARNEL', 11, 9, 2, NULL, 78319, 93200, 1, 0, 78319, 14881, 93200, 'PORTACOMIDA T 1 PACA *200 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(62, 'P000062', '056', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx MARTSANG', 17, 21, 3, NULL, 0, 0, 1, 0, 0, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(63, 'P000063', '057', 'PAVO MARTSANG SURTICOM', 5, 34, 3, NULL, 26891, 32000, 1, 0, 26891, 5109, 32000, 'PAVO MARTSANG SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(64, 'P000064', '058', 'XXXXXXXXXXXXX SURTICOM', 5, 34, 3, NULL, 0, 0, 1, 0, 0, 0, 0, 'XXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(65, 'P000065', '059', 'PERNIL DE CERDO KILO SURTICOM', 5, 34, 3, NULL, 30252, 36000, 1, 0, 30252, 5748, 36000, 'PERNIL DE CERDO KILO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(66, 'P000066', '060', 'PITILLO *500 EMPACADO DARNEL', 11, 9, 2, NULL, 5042, 6000, 1, 0, 5042, 958, 6000, 'PITILLO *500 EMPACADO DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(67, 'P000067', '061', 'PATACON PRECO *1000 SURTICOM', 14, 34, 6, NULL, 4622, 5500, 1, 0, 4622, 878, 5500, 'PATACON PRECO *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(68, 'P000068', '0614143818271', 'SALCHICHA MAXIDOG  *24 *1300 FRIGOSAN', 17, 15, 3, NULL, 7059, 8400, 1, 0, 7059, 1341, 8400, 'SALCHICHA MAXIDOG  *24 *1300 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(69, 'P000069', '0614143818837', 'JAMON PIZZA *500 FRIGOSAN', 12, 15, 3, '', 3025, 3600, 1, 0, 3697, 703, 4400, 'JAMON PIZZA *500 FRIGOSAN', 0, 0, 22.22, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 16:27:30', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(70, 'P000070', '062', 'PORTACOMIDA K-1 *50 DARNEL', 11, 9, 2, NULL, 2941, 3500, 1, 0, 2941, 559, 3500, 'PORTACOMIDA K-1 *50 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(71, 'P000071', '063', 'Q SURTICOM', 5, 34, 3, NULL, 0, 0, 3, 0, 0, 0, 0, 'Q SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(72, 'P000072', '066', 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 5, 34, 3, '', 13500, 13500, 3, 0, 14000, 0, 14000, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 14000, 3.70, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-22 15:18:44', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(73, 'P000073', '067', 'QUESO MEDIO BLOQUE TAJADO SURTICOM', 5, 34, 3, '', 13500, 13500, 3, 0, 13750, 0, 13750, 'QUESO MEDIO BLOQUE TAJADO SURTICOM', 13750, 13750, 1.85, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-27 18:19:18', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(74, 'P000074', '068', 'QUESO NAZARET *450 NAZARETH', 16, 23, 4, NULL, 6000, 6000, 3, 0, 6000, 0, 6000, 'QUESO NAZARET *450 NAZARETH', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(75, 'P000075', '069', 'DELIPIÑA 2500 SURTICOM', 19, 34, 7, '', 4454, 5300, 1, 0, 4453.78, 846.219, 5300, 'DELIPIÑA 2500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 19:48:54', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(76, 'P000076', '070', 'SALCHICHA MANGUERA *1 MARTSANG', 17, 21, 3, NULL, 840, 1000, 1, 0, 1008, 160, 1200, 'SALCHICHA MANGUERA *1 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(77, 'P000077', '071', 'SALSA AREQUIPE *1000 GR SURTICOM', 5, 34, 3, NULL, 3300, 3300, 3, 0, 3300, 0, 3300, 'SALSA AREQUIPE *1000 GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(78, 'P000078', '072', 'SALSA DE FRESA*1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA DE FRESA*1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(79, 'P000079', '073', 'SALSA DE MARACUYA*1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA DE MARACUYA*1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(80, 'P000080', '074', 'SALSA GLASSE SURTICOM', 5, 34, 3, NULL, 3361, 4000, 1, 0, 3361, 639, 4000, 'SALSA GLASSE SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(81, 'P000081', '075', 'AVELLANA *500 NUTRIGRANOLA', 4, 25, 1, NULL, 33000, 33000, 3, 0, 33000, 0, 33000, 'AVELLANA *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(82, 'P000082', '076', 'SALSERO MEDIANO SURTICOM', 5, 34, 3, NULL, 1500, 1500, 3, 0, 1500, 0, 1500, 'SALSERO MEDIANO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(83, 'P000083', '077', 'TAPAS VAS 7 ONZAS SURTICOM', 5, 34, 3, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'TAPAS VAS 7 ONZAS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(84, 'P000084', '078', 'NUEZ COMÚN *500 NUTRIGRANOLA', 4, 25, 1, NULL, 17700, 17700, 3, 0, 17700, 0, 17700, 'NUEZ COMÚN *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(85, 'P000085', '079', 'TENEDOR TUC GRANDE SURTICOM', 5, 34, 3, NULL, 2731, 3250, 1, 0, 2731, 519, 3250, 'TENEDOR TUC GRANDE SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(86, 'P000086', '080', 'TOMATE SOBRES SALSERIN *100 DELCASINO', 19, 10, 7, NULL, 2941, 3500, 1, 0, 2941, 559, 3500, 'TOMATE SOBRES SALSERIN *100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(87, 'P000087', '081', 'TOMATE SOBRES DELCASINO *100 DELCASINO', 19, 10, 7, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'TOMATE SOBRES DELCASINO *100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(88, 'P000088', '082', 'VASO 9 Oz *50 VBC', 21, 39, 2, '', 1765, 2100, 1, 0, 1933, 399, 2300, 'VASO 9 Oz *50 VBC', 2500, 2500, 19.05, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-29 14:48:23', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(89, 'P000089', '083', 'VASO ECONÓMICO 3.3 SURTICOM', 21, 34, 2, NULL, 924, 1100, 1, 0, 924, 176, 1100, 'VASO ECONÓMICO 3.3 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(90, 'P000090', '084', 'VASO T 12 OZ *50 UNI SURTICOM', 5, 34, 3, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'VASO T 12 OZ *50 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(91, 'P000091', '085', 'NUEZ NOGAL *500 NUTRIGRANOLA', 4, 25, 1, NULL, 30700, 30700, 3, 0, 30700, 0, 30700, 'NUEZ NOGAL *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(92, 'P000092', '086', 'GUANTES VINITRILO NEGROS *UND EL SOL', 21, 11, 2, NULL, 500, 500, 3, 0, 500, 0, 500, 'GUANTES VINITRILO NEGROS *UND EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(93, 'P000093', '087', 'VINAGRE FRUTAS DEL CASINO*500 SURTICOM', 5, 34, 3, NULL, 1050, 1250, 1, 0, 1050, 200, 1250, 'VINAGRE FRUTAS DEL CASINO*500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(94, 'P000094', '088', 'CACAHUATE *500 SURTICOM', 4, 34, 1, NULL, 9450, 9450, 3, 0, 9450, 0, 9450, 'CACAHUATE *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(95, 'P000095', '089', 'MARAÑÓN *500 NUTRIGRANOLA', 4, 25, 1, NULL, 34200, 34200, 3, 0, 34200, 0, 34200, 'MARAÑÓN *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(96, 'P000096', '090', 'AJONJOLÍ *500 NUTRIGRANOLA', 4, 25, 1, NULL, 7100, 7100, 3, 0, 7100, 0, 7100, 'AJONJOLÍ *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(97, 'P000097', '7707296931126', 'SALSA TERIYAKI *500', 19, 34, 7, '', 10000, 10000, 1, 0, 3445.38, 654.622, 4100, 'SALSA TERIYAKI *500', 0, 0, -59.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-27 00:44:58', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(98, 'P000098', '092', 'ACEITE HIDRIGENADO *15 K SURTICOM', 19, 34, 7, NULL, 57143, 68000, 1, 0, 57143, 10857, 68000, 'ACEITE HIDRIGENADO *15 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(99, 'P000099', '10', 'AREQUIPE BOLSA *1000gr BENNY', 4, 5, 1, NULL, 5000, 5000, 3, 0, 5000, 0, 5000, 'AREQUIPE BOLSA *1000gr BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(100, 'P000100', '100', 'CHORIZO SANTAROSEÑO *12 CIAL SAS', 5, 7, 3, NULL, 7563, 9000, 1, 0, 7563, 1437, 9000, 'CHORIZO SANTAROSEÑO *12 CIAL SAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(101, 'P000101', '1000', 'j SURTICOM', 5, 34, 3, NULL, 100, 100, 3, 0, 100, 0, 100, 'j SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(102, 'P000102', '101', 'MOLDE LASAÑA *24 Oz SURTICOM', 21, 34, 2, NULL, 294, 350, 1, 0, 294, 56, 350, 'MOLDE LASAÑA *24 Oz SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(103, 'P000103', '10117702458011156', 'PORTACOMIDA J-2 *20 DARNEL', 11, 9, 2, '', 3445, 4100, 1, 0, 3445, 655, 4100, 'PORTACOMIDA J-2 *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-24 13:25:46', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(104, 'P000104', '102', 'SALSA KIWI  *1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA KIWI  *1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(105, 'P000105', '103', 'SALSA DE LIMON*1000g SURTICOM', 5, 34, 3, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA DE LIMON*1000g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(106, 'P000106', '104', 'CHIPS DE CORES*500 SURTICOM', 5, 34, 3, NULL, 6050, 7200, 1, 0, 6050, 1150, 7200, 'CHIPS DE CORES*500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(107, 'P000107', '11', 'QUINUA EN GRANO *500 SURTICOM', 4, 34, 1, NULL, 5800, 5800, 3, 0, 5800, 0, 5800, 'QUINUA EN GRANO *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(108, 'P000108', '115', 'PORTA PIZZA*UNID SURTICOM', 5, 34, 3, NULL, 38, 45, 1, 0, 38, 7, 45, 'PORTA PIZZA*UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(109, 'P000109', '12', 'BANDEJA Nº 17 * 50 UNID SURTICOM', 5, 34, 3, NULL, 2983, 3550, 1, 0, 3025, 567, 3600, 'BANDEJA Nº 17 * 50 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(110, 'P000110', '120', 'VINIPEL  PLASVIMAS * 50 mts SURTICOM', 5, 34, 3, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'VINIPEL  PLASVIMAS * 50 mts SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(111, 'P000111', '121', 'VINIPEL PLASVIMAS *20 mts SURTICOM', 5, 34, 3, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'VINIPEL PLASVIMAS *20 mts SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(112, 'P000112', '123', 'YOGURTH SIBEMA *12 UNID SURTICOM', 5, 34, 3, NULL, 3650, 3650, 3, 0, 3650, 0, 3650, 'YOGURTH SIBEMA *12 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(113, 'P000113', '124', 'SALCHICHA MIXTA POLLO RES *36 SURTICOM', 17, 34, 3, NULL, 5798, 6900, 1, 0, 5798, 1102, 6900, 'SALCHICHA MIXTA POLLO RES *36 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(114, 'P000114', '127', 'SALCHICHON MARTSANG *950 MARTSANG', 18, 21, 3, NULL, 4571, 4800, 4, 0, 4571, 229, 4800, 'SALCHICHON MARTSANG *950 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(115, 'P000115', '128', 'HAMBURGUESA MARTSANG *10 UNIDA SURTICOM', 5, 34, 3, '', 3950, 4700, 1, 0, 4202, 798, 5000, 'HAMBURGUESA MARTSANG *10 UNIDA SURTICOM', 5000, 5000, 6.38, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-21 14:43:23', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(116, 'P000116', '13', 'BANDEJA Nº1 *50 UNID SURTICOM', 5, 34, 3, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'BANDEJA Nº1 *50 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(117, 'P000117', '130', 'BOLSA MANIJA 25 K SURTICOM', 3, 34, 2, NULL, 7983, 9500, 1, 0, 7983, 1517, 9500, 'BOLSA MANIJA 25 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(118, 'P000118', '135', 'SALSA CEREZA *1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA CEREZA *1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(119, 'P000119', '14', 'ACEITE BIDON *20 LITROS SURTICOM', 5, 34, 3, NULL, 73950, 88000, 1, 0, 73950, 14050, 88000, 'ACEITE BIDON *20 LITROS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(120, 'P000120', '15', 'BOLSA ALUMINIO P-20 PIZZA SURTICOM', 3, 34, 2, NULL, 2731, 3250, 1, 0, 2521, 519, 3000, 'BOLSA ALUMINIO P-20 PIZZA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(121, 'P000121', '155', 'SALSA DE LECHE CONDENSADA *1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA DE LECHE CONDENSADA *1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(122, 'P000122', '158', 'PERA DE CERDO *1 KI SURTICOM', 5, 34, 3, NULL, 26667, 28000, 4, 0, 26667, 1333, 28000, 'PERA DE CERDO *1 KI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(123, 'P000123', '16', 'BOLSA ALUMINIO L-17 SURTICOM', 3, 34, 2, NULL, 1092, 1300, 1, 0, 1303, 208, 1550, 'BOLSA ALUMINIO L-17 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(124, 'P000124', '17', 'BOLSA ALUMINIO L-21 SURTICOM', 3, 34, 2, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'BOLSA ALUMINIO L-21 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(125, 'P000125', '171', 'SALCHICHA MANGUERA MARTSANG*15 UNIDA MARTSANG', 17, 21, 3, NULL, 12017, 14300, 1, 0, 13109, 2283, 15600, 'SALCHICHA MANGUERA MARTSANG*15 UNIDA MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(126, 'P000126', '175', 'CONO CONETIN 10 UNID SURTICOM', 5, 34, 3, NULL, 1891, 2250, 1, 0, 1891, 359, 2250, 'CONO CONETIN 10 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(127, 'P000127', '17702120003359', 'SERVILLETA CAJA FAVORITA SURTICOM', 5, 34, 3, NULL, 36134, 43000, 1, 0, 36134, 6866, 43000, 'SERVILLETA CAJA FAVORITA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(128, 'P000128', '18', 'BOLSA ALUMINIO L-25 SURTICOM', 3, 34, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'BOLSA ALUMINIO L-25 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(129, 'P000129', '19', 'BOLSA ALUMINIO L-35 SURTICOM', 3, 34, 2, NULL, 4160, 4950, 1, 0, 4160, 790, 4950, 'BOLSA ALUMINIO L-35 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(130, 'P000130', '199', 'BARQUILLOS KARCHY *30 UN PICOLLO', 4, 27, 1, NULL, 3361, 4000, 1, 0, 3445, 639, 4100, 'BARQUILLOS KARCHY *30 UN PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(131, 'P000131', '2', 'JAMON MARTSANG 10x10 *450 MARTSANG', 12, 21, 3, '', 3361, 4000, 1, 0, 3529, 671, 4200, 'JAMON MARTSANG 10x10 *450 MARTSANG', 4200, 4200, 5.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-21 14:45:54', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(132, 'P000132', '20', 'BOLSA ALUMINIO L-19 SURTICOM', 21, 34, 2, NULL, 1765, 2100, 1, 0, 1765, 335, 2100, 'BOLSA ALUMINIO L-19 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(133, 'P000133', '22', 'BOLSA PAPEL 1/2 LIBRA SURTICOM', 3, 34, 2, NULL, 966, 1150, 1, 0, 966, 184, 1150, 'BOLSA PAPEL 1/2 LIBRA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(134, 'P000134', '23', 'BOLSA ALUMINIO L-23 SURTICOM', 3, 34, 2, NULL, 2269, 2700, 1, 0, 2269, 431, 2700, 'BOLSA ALUMINIO L-23 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(135, 'P000135', '25', 'BOLSA PAPEL 2 LIBRAS SURTICOM', 3, 34, 2, NULL, 1950, 1950, 3, 0, 1950, 0, 1950, 'BOLSA PAPEL 2 LIBRAS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(136, 'P000136', '27', 'BOLSA MANIJA 1.5 K SURTICOM', 3, 34, 2, NULL, 1092, 1300, 1, 0, 1218, 208, 1450, 'BOLSA MANIJA 1.5 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(137, 'P000137', '28', 'BOLSA MANIJA 10 K SURTICOM', 3, 34, 2, NULL, 3277, 3900, 1, 0, 3529, 623, 4200, 'BOLSA MANIJA 10 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(138, 'P000138', '29', 'BOLSA MANIJA 15 K SURTICOM', 3, 34, 2, NULL, 4538, 5400, 1, 0, 4538, 862, 5400, 'BOLSA MANIJA 15 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(139, 'P000139', '30', 'BOLSA MANIJA 2 K SURTICOM', 3, 34, 2, NULL, 1345, 1600, 1, 0, 1345, 255, 1600, 'BOLSA MANIJA 2 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(140, 'P000140', '32', 'BOLSA MANIJA 3 K SURTICOM', 3, 34, 2, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'BOLSA MANIJA 3 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(141, 'P000141', '33', 'BOLSA MANIJA 5 K SURTICOM', 3, 34, 2, NULL, 2773, 3300, 1, 0, 2941, 527, 3500, 'BOLSA MANIJA 5 K SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(142, 'P000142', '34', 'BOLSA PAPEL 3 LIBRAS SURTICOM', 3, 34, 2, NULL, 2400, 2400, 3, 0, 2400, 0, 2400, 'BOLSA PAPEL 3 LIBRAS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(143, 'P000143', '35', 'BOLSA PAPEL  1 LIBRA SURTICOM', 3, 34, 2, NULL, 1450, 1450, 3, 0, 1500, 0, 1500, 'BOLSA PAPEL  1 LIBRA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(144, 'P000144', '38', 'BOLSA PAPEL 4 LIBRAS SURTICOM', 5, 34, 3, NULL, 2950, 2950, 3, 0, 2950, 0, 2950, 'BOLSA PAPEL 4 LIBRAS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(145, 'P000145', '40', 'ROLLO PAPEL PARAFINADO *20M SURTICOM', 5, 34, 3, NULL, 4100, 4100, 3, 0, 4100, 0, 4100, 'ROLLO PAPEL PARAFINADO *20M SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(146, 'P000146', '41', 'BOLSA PARAFINADA *100 SURTICOM', 3, 34, 2, NULL, 5462, 6500, 1, 0, 5042, 1038, 6000, 'BOLSA PARAFINADA *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(147, 'P000147', '5', 'ACEITE HIDROGENADO *500 g SURTICOM', 8, 34, 1, NULL, 1933, 2300, 1, 0, 2269, 367, 2700, 'ACEITE HIDROGENADO *500 g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(148, 'P000148', '50', 'DULCES DE MIEL  *20 UNID BENNY', 4, 5, 1, NULL, 1400, 1400, 3, 0, 1600, 0, 1600, 'DULCES DE MIEL  *20 UNID BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(149, 'P000149', '58', 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 9, 34, 8, '', 3500, 3500, 3, 0, 3500, 0, 3500, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 18:38:21', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(150, 'P000150', '60', 'LINAZA  MOLIDA *500 gr SURTICOM', 5, 34, 3, NULL, 6600, 6600, 3, 0, 6600, 0, 6600, 'LINAZA  MOLIDA *500 gr SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(151, 'P000151', '61', 'LINAZA  ENTERA *250 NUTRIGRANOLA', 4, 25, 1, NULL, 1900, 1900, 3, 0, 1900, 0, 1900, 'LINAZA  ENTERA *250 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(152, 'P000152', '614143818158', 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 12, 15, 3, '', 3429, 3600, 4, 0, 3429, 171, 3600, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 14:38:19', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(153, 'P000153', '614143818721', 'SALCHICHON SANTA RITA 900 GR SURTICOM', 18, 34, 3, NULL, 3429, 3600, 4, 0, 3429, 171, 3600, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(154, 'P000154', '614143818790', 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 17, 15, 3, '', 9244, 11000, 1, 0, 9412, 1788, 11200, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 0, 0, 1.82, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 16:25:36', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(155, 'P000155', '614143818981', 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 17, 15, 3, '', 10588, 12600, 1, 0, 10588.2, 2011.76, 12600, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 19:54:02', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(156, 'P000156', '614143819117', 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 18, 15, 3, NULL, 3429, 3600, 4, 0, 3429, 171, 3600, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(157, 'P000157', '62', 'LINAZA ENTERA *500 GRS SURTICOM', 5, 34, 3, NULL, 2150, 2150, 3, 0, 2150, 0, 2150, 'LINAZA ENTERA *500 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(158, 'P000158', '63', 'MANI  NUTRI *250 grs SURTICOM', 5, 34, 3, NULL, 2900, 2900, 3, 0, 2900, 0, 2900, 'MANI  NUTRI *250 grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(159, 'P000159', '64', 'MANI NUTRI  * 500gr NUTRIGRANOLA', 4, 25, 1, NULL, 5600, 5600, 3, 0, 5600, 0, 5600, 'MANI NUTRI  * 500gr NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(160, 'P000160', '645667059307', 'TENEDOR DARNEL *20 SURTICOM', 5, 34, 3, NULL, 588, 700, 1, 0, 588, 112, 700, 'TENEDOR DARNEL *20 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(161, 'P000161', '645667059369', 'TENEDOR TAMI PONQUE *100 UNI SURTICOM', 5, 34, 3, NULL, 2269, 2700, 1, 0, 2269, 431, 2700, 'TENEDOR TAMI PONQUE *100 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(162, 'P000162', '645667070821', 'VASO ICOPOR 10oz *20 DARNEL', 11, 9, 2, NULL, 1471, 1750, 1, 0, 1471, 279, 1750, 'VASO ICOPOR 10oz *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(163, 'P000163', '645667091925', 'VASO ESPUMADO 5 ONZAS SURTICOM', 5, 34, 3, NULL, 840, 1000, 1, 0, 840, 160, 1000, 'VASO ESPUMADO 5 ONZAS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(164, 'P000164', '645667094537', 'PLATO HONDO 16 ONZ X20 UNI DARNEL', 11, 9, 2, NULL, 1807, 2150, 1, 0, 1807, 343, 2150, 'PLATO HONDO 16 ONZ X20 UNI DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(165, 'P000165', '645667106971', 'PAPEL ALUMINIO DARNEL *13 DARNEL', 1, 9, 2, NULL, 3235, 3850, 1, 0, 3235, 615, 3850, 'PAPEL ALUMINIO DARNEL *13 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(166, 'P000166', '645667158758', 'TAPAS PARA COPA 1 Oz DARNEL', 3, 9, 2, NULL, 2605, 3100, 1, 0, 2605, 495, 3100, 'TAPAS PARA COPA 1 Oz DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(167, 'P000167', '645667176455', 'TENEDOR TAMI *20 SURTICOM', 5, 34, 3, NULL, 756, 900, 1, 0, 756, 144, 900, 'TENEDOR TAMI *20 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(168, 'P000168', '645667176462', 'TENEDOR GRANDE *100 TAMI', 7, 35, 2, NULL, 3277, 3900, 1, 0, 3277, 623, 3900, 'TENEDOR GRANDE *100 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(169, 'P000169', '645667176479', 'CUCHILLOS  TAMI*20 SURTICOM', 5, 34, 3, NULL, 714, 850, 1, 0, 840, 136, 1000, 'CUCHILLOS  TAMI*20 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(170, 'P000170', '645667176486', 'CUCHILLO  TAMI  *100 UNI SURTICOM', 5, 34, 3, NULL, 3277, 3900, 1, 0, 3277, 623, 3900, 'CUCHILLO  TAMI  *100 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(171, 'P000171', '645667176493', 'CUCHARA POSTRE TAMI X20 UNI DARNEL', 11, 9, 2, NULL, 630, 750, 1, 0, 630, 120, 750, 'CUCHARA POSTRE TAMI X20 UNI DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(172, 'P000172', '645667176509', 'CUCHARA POSTRE TAMI *100 SURTICOM', 5, 34, 3, NULL, 2395, 2850, 1, 0, 2395, 455, 2850, 'CUCHARA POSTRE TAMI *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(173, 'P000173', '645667176516', 'CUCHARA TAMI SOPA  *20 UNI SURTICOM', 5, 34, 3, NULL, 840, 1000, 1, 0, 840, 160, 1000, 'CUCHARA TAMI SOPA  *20 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(174, 'P000174', '645667176523', 'CUCHARA SOPERA TAMI*100 DARNEL', 7, 9, 2, NULL, 3697, 4400, 1, 0, 3697, 703, 4400, 'CUCHARA SOPERA TAMI*100 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(175, 'P000175', '645667220042', 'MEZCLADORES DARNEL *1000 SURTICOM', 5, 34, 3, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'MEZCLADORES DARNEL *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(176, 'P000176', '645667227799', 'COPA 1/2 ON DARNEL *100 UNID DARNEL', 21, 9, 2, NULL, 2311, 2750, 1, 0, 2311, 439, 2750, 'COPA 1/2 ON DARNEL *100 UNID DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(177, 'P000177', '645667227812', 'COPA DARNEL 1 oz DARNEL', 21, 9, 2, NULL, 2311, 2750, 1, 0, 2311, 439, 2750, 'COPA DARNEL 1 oz DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(178, 'P000178', '645667227836', 'COPA DARNEL 1.1/2* 50UNIDADES DARNEL', 5, 9, 3, NULL, 2563, 3050, 1, 0, 2563, 487, 3050, 'COPA DARNEL 1.1/2* 50UNIDADES DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(179, 'P000179', '645667229328', 'PITILLOS DARNEL *500 SURTICOM', 5, 34, 3, NULL, 6891, 8200, 1, 0, 6891, 1309, 8200, 'PITILLOS DARNEL *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(180, 'P000180', '645667241498', 'COPA VENECIANA FLEX 5 oz *50 DARNEL', 21, 9, 2, NULL, 9328, 11100, 1, 0, 9328, 1772, 11100, 'COPA VENECIANA FLEX 5 oz *50 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(181, 'P000181', '645667241504', 'COPA VENECIANA FLEX 3oz *50 DARNEL', 21, 9, 2, NULL, 7773, 9250, 1, 0, 7773, 1477, 9250, 'COPA VENECIANA FLEX 3oz *50 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(182, 'P000182', '645667247988', 'PITILLOS TAMI *200 SURTICOM', 5, 34, 3, NULL, 630, 750, 1, 0, 630, 120, 750, 'PITILLOS TAMI *200 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(183, 'P000183', '645667269546', 'CUCHARITA TAMI * 100 SURTICOM', 5, 34, 3, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'CUCHARITA TAMI * 100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(184, 'P000184', '645667269553', 'TENEDORES PEQUEÑOS TAMI *100 SURTICOM', 5, 34, 3, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'TENEDORES PEQUEÑOS TAMI *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(185, 'P000185', '65', 'MEZCLADORES *100 UNID SURTICOM', 21, 34, 2, NULL, 756, 900, 1, 0, 756, 144, 900, 'MEZCLADORES *100 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(186, 'P000186', '66', 'MOLDE LAGÑA No. 3 SURTICOM', 5, 34, 3, NULL, 336, 400, 1, 0, 336, 64, 400, 'MOLDE LAGÑA No. 3 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(187, 'P000187', '67', 'MOLDE LASAÑA #1 SURTICOM', 5, 34, 3, NULL, 252, 300, 1, 0, 252, 48, 300, 'MOLDE LASAÑA #1 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(188, 'P000188', '68', 'MOLDE LASAÑA 16 Oz UNID SURTICOM', 21, 34, 2, NULL, 252, 300, 1, 0, 252, 48, 300, 'MOLDE LASAÑA 16 Oz UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(189, 'P000189', '708075610973', 'AZUCAR PULVERIZADA *500 SURTICOM', 4, 34, 1, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'AZUCAR PULVERIZADA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(190, 'P000190', '7460000080229', 'PAÑO ABSORBENTE SUPER CLEAN SURTICOM', 3, 34, 2, NULL, 2605, 3100, 1, 0, 2605, 495, 3100, 'PAÑO ABSORBENTE SUPER CLEAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(191, 'P000191', '75', 'PAPA PRECOCIDA PORCIONADA*20 UNI SURTICOM', 14, 34, 6, NULL, 17647, 21000, 1, 0, 16807, 3353, 20000, 'PAPA PRECOCIDA PORCIONADA*20 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(192, 'P000192', '77', 'BOLSA POLIPR 3X8 *100 SURTICOM', 3, 34, 2, NULL, 2185, 2600, 1, 0, 2185, 415, 2600, 'BOLSA POLIPR 3X8 *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(193, 'P000193', '7700604043719', 'CREMA DE LECHE CASTILLO *2000 SURTICOM', 6, 34, 4, NULL, 18000, 18000, 3, 0, 18000, 0, 18000, 'CREMA DE LECHE CASTILLO *2000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(194, 'P000194', '7700604045348', 'SEMILLAS DE CHIA *250 NUTRIGRANOLA', 4, 25, 1, NULL, 4300, 4300, 3, 0, 4300, 0, 4300, 'SEMILLAS DE CHIA *250 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(195, 'P000195', '7701101245873', 'SALCHICHA SUPERPERRO *2 NUTRESA', 17, 24, 3, NULL, 2437, 2900, 1, 0, 2689, 463, 3200, 'SALCHICHA SUPERPERRO *2 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(196, 'P000196', '7701101246283', 'TOCINETA AHUMADA *400 ZENU SURTICOM', 5, 34, 3, NULL, 12269, 14600, 1, 0, 14034, 2331, 16700, 'TOCINETA AHUMADA *400 ZENU SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(197, 'P000197', '7701101246757', 'SALCHICHA SUPER PERRO *18 NUTRESA', 17, 24, 3, NULL, 20588, 24500, 1, 0, 18908, 3912, 22500, 'SALCHICHA SUPER PERRO *18 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(198, 'P000198', '7701101247112', 'SALCHICHA RANCHERA *3 NUTRESA', 17, 24, 3, NULL, 1975, 2350, 1, 0, 1975, 375, 2350, 'SALCHICHA RANCHERA *3 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(199, 'P000199', '7701101250310', 'SALCHICHON CERVERONI *1200 NUTRESA', 18, 24, 3, '', 16190, 17000, 4, 0, 16190, 810, 17000, 'SALCHICHON CERVERONI *1200 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-02-25 17:39:34', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(200, 'P000200', '7701101260623', 'SALCHICHA RANCHERA TRIPACK SURTICOM', 5, 34, 3, NULL, 1807, 2150, 1, 0, 1807, 343, 2150, 'SALCHICHA RANCHERA TRIPACK SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(201, 'P000201', '7701101261019', 'SALCHICHA RACHERA *5 UNIDADES NUTRESA', 17, 24, 3, NULL, 2815, 3350, 1, 0, 2899, 535, 3450, 'SALCHICHA RACHERA *5 UNIDADES NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(202, 'P000202', '7701101261170', 'SALCHICHA LONG ZENU *10 NUTRESA', 17, 24, 3, NULL, 6555, 7800, 1, 0, 6555, 1245, 7800, 'SALCHICHA LONG ZENU *10 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(203, 'P000203', '7701101261187', 'SALCHICHA LONG *20 *1100 ZENU', 17, 40, 3, NULL, 11933, 14200, 1, 0, 11933, 2267, 14200, 'SALCHICHA LONG *20 *1100 ZENU', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(204, 'P000204', '7701101261453', 'SALCHICHA ZENU TRADICIONAL *2 NUTRESA', 17, 24, 3, NULL, 1345, 1600, 1, 0, 1345, 255, 1600, 'SALCHICHA ZENU TRADICIONAL *2 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(205, 'P000205', '7701101261507', 'SALCHICHA SUPER PERRO ZENU *8 SURTICOM', 5, 34, 3, NULL, 9916, 11800, 1, 0, 9916, 1884, 11800, 'SALCHICHA SUPER PERRO ZENU *8 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:35', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(206, 'P000206', '7701101280164', 'CHORIZO COCTEL *500 HAMBURGUER', 5, 16, 3, NULL, 5210, 6200, 1, 0, 5210, 990, 6200, 'CHORIZO COCTEL *500 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(207, 'P000207', '7701101280638', 'LONJA MEDIA ARROBA SURTICOM', 5, 34, 3, NULL, 22000, 22000, 3, 0, 22000, 0, 22000, 'LONJA MEDIA ARROBA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(208, 'P000208', '7701101280645', 'SALCHICHA SUPER DOG *14 SURTICOM', 5, 34, 3, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'SALCHICHA SUPER DOG *14 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(209, 'P000209', '7701101290910', 'SALAMI DE CERDO *100GR SURTICOM', 5, 34, 3, NULL, 7647, 9100, 1, 0, 7647, 1453, 9100, 'SALAMI DE CERDO *100GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(210, 'P000210', '7701101300176', 'HAMBURGUESA ZENU *30 SURTICOM', 5, 34, 3, NULL, 37899, 45100, 1, 0, 36134, 7201, 43000, 'HAMBURGUESA ZENU *30 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(211, 'P000211', '7701101310427', 'PORTACOMIDA B-1 *50 DARNEL', 11, 9, 2, NULL, 6513, 7750, 1, 0, 6513, 1237, 7750, 'PORTACOMIDA B-1 *50 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(212, 'P000212', '7701101356456', 'CHORIZO TERNERA 480G ZENU ZENU', 5, 40, 3, NULL, 7647, 9100, 1, 0, 7983, 1453, 9500, 'CHORIZO TERNERA 480G ZENU ZENU', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(213, 'P000213', '7701101357415', 'SALCHICHON CERVECERO RICA *950 NUTRESA', 18, 24, 3, NULL, 8524, 8950, 4, 0, 8524, 426, 8950, 'SALCHICHON CERVECERO RICA *950 NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(214, 'P000214', '7702020020015', 'HARINA DE TRIGO *500 LA AMERICANA SURTICOM', 5, 34, 3, NULL, 952, 1000, 4, 0, 952, 48, 1000, 'HARINA DE TRIGO *500 LA AMERICANA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(215, 'P000215', '7702020115100', 'PASTA PARA LASAGNA*200 G SURTICOM', 5, 34, 3, NULL, 3109, 3700, 1, 0, 3109, 591, 3700, 'PASTA PARA LASAGNA*200 G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(216, 'P000216', '7702020212052', 'PORTAPERRO ZENU SURTICOM', 5, 34, 3, NULL, 55, 65, 1, 0, 55, 10, 65, 'PORTAPERRO ZENU SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(217, 'P000217', '7702026020163', 'SERVILLETA FAMILIA CAFETERIA *100 FAMILIA', 11, 13, 2, NULL, 2143, 2550, 1, 0, 2143, 407, 2550, 'SERVILLETA FAMILIA CAFETERIA *100 FAMILIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(218, 'P000218', '7702026020927', 'SERVILLETA FAMILIA 1a1 *150 FAMILIA', 7, 13, 2, NULL, 1387, 1650, 1, 0, 1387, 263, 1650, 'SERVILLETA FAMILIA 1a1 *150 FAMILIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(219, 'P000219', '7702026060404', 'TOALLAS DE COCINA FAMILIIA *1 SURTICOM', 5, 34, 3, NULL, 2059, 2450, 1, 0, 2059, 391, 2450, 'TOALLAS DE COCINA FAMILIIA *1 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(220, 'P000220', '7702026183806', 'SERVILLETA FAMILIA *300 SURTICOM', 1, 34, 2, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'SERVILLETA FAMILIA *300 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(221, 'P000221', '7702026206956', 'SERVILLETAS FAMILIA PARTIDA*450 FAMILIA', 7, 13, 2, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'SERVILLETAS FAMILIA PARTIDA*450 FAMILIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(222, 'P000222', '7702037502801', 'GUANTE ETERNA CALIBRE 35 SURTICOM', 3, 34, 2, NULL, 3697, 4400, 1, 0, 3697, 703, 4400, 'GUANTE ETERNA CALIBRE 35 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(223, 'P000223', '7702069201673', 'SALCHICHA AMERICANA DUO SURTICOM', 5, 34, 3, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'SALCHICHA AMERICANA DUO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(224, 'P000224', '7702069400526', 'TOCINETA AHUMADA *500 PROCARSAN SURTICOM', 20, 34, 3, NULL, 6723, 8000, 1, 0, 6723, 1277, 8000, 'TOCINETA AHUMADA *500 PROCARSAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(225, 'P000225', '7702103008749', 'FROOT LOOPS DE KELLOGGS *105 g SURTICOM', 5, 34, 3, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'FROOT LOOPS DE KELLOGGS *105 g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(226, 'P000226', '7702116000129', 'ACEITE LA GARZA *3000CC SURTICOM', 5, 34, 3, NULL, 14034, 16700, 1, 0, 14034, 2666, 16700, 'ACEITE LA GARZA *3000CC SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(227, 'P000227', '7702120003352', 'SERVILLETA FAVORITA *320 UNI FAVORITA', 21, 14, 2, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'SERVILLETA FAVORITA *320 UNI FAVORITA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(228, 'P000228', '7702127212023', 'AZUCAR SOBRES *100 SURTICOM', 4, 34, 1, '', 3950, 4700, 1, 0, 3950, 750, 4700, 'AZUCAR SOBRES *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-25 15:06:20', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(229, 'P000229', '7702144220742', 'VASO TUC 7 OZ  BLANCO *50 SURTICOM', 5, 34, 3, NULL, 1261, 1500, 1, 0, 1471, 240, 1750, 'VASO TUC 7 OZ  BLANCO *50 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(230, 'P000230', '7702144221244', 'VASO TUC 12 oz *50 TAMI', 21, 35, 2, NULL, 2605, 3100, 1, 0, 2605, 495, 3100, 'VASO TUC 12 oz *50 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(231, 'P000231', '7702144850734', 'VASO TUC 7 Oz *25 TUC', 21, 38, 2, NULL, 714, 850, 1, 0, 714, 136, 850, 'VASO TUC 7 Oz *25 TUC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(232, 'P000232', '7702144850741', 'VASO TUC 7 ONZ *50 UNIDADES TUC', 21, 38, 2, NULL, 1429, 1700, 1, 0, 1429, 271, 1700, 'VASO TUC 7 ONZ *50 UNIDADES TUC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(233, 'P000233', '7702144850949', 'VASO TUC 9OZ *50 SURTICOM', 5, 34, 3, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'VASO TUC 9OZ *50 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(234, 'P000234', '7702177003572', 'CREMA DE LECHE  ALQUERIA *200 ALQUERIA', 6, 2, 4, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'CREMA DE LECHE  ALQUERIA *200 ALQUERIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(235, 'P000235', '7702177009123', 'CREMA DE LECHE ALQUERIA *900 ALQUERIA', 6, 2, 4, NULL, 9000, 9000, 3, 0, 9200, 0, 9200, 'CREMA DE LECHE ALQUERIA *900 ALQUERIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(236, 'P000236', '7702177020029', 'CREMA DE LECHE ALQUERIA *450 ALQUERIA', 6, 2, 4, NULL, 4286, 5100, 1, 0, 4370, 814, 5200, 'CREMA DE LECHE ALQUERIA *450 ALQUERIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(237, 'P000237', '7702251011745', 'VASO DOMINGO 16 ONZAS *25 UNI SURTICOM', 5, 34, 3, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'VASO DOMINGO 16 ONZAS *25 UNI SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(238, 'P000238', '7702251012971', 'VASO BAR 3.3 *50 TUC', 21, 38, 2, NULL, 1429, 1700, 1, 0, 1429, 271, 1700, 'VASO BAR 3.3 *50 TUC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(239, 'P000239', '7702251018126', 'VASO DOMINGO 12 oz *50 TAMI', 21, 35, 2, NULL, 1765, 2100, 1, 0, 1765, 335, 2100, 'VASO DOMINGO 12 oz *50 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(240, 'P000240', '7702251042534', 'ALUMINIO REPUESTO TUC 40 MTS SURTICOM', 5, 34, 3, NULL, 6303, 7500, 1, 0, 6303, 1197, 7500, 'ALUMINIO REPUESTO TUC 40 MTS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(241, 'P000241', '7702251042541', 'PAPEL ALUMINIO TUC *100 TUC', 1, 38, 2, NULL, 15966, 19000, 1, 0, 15966, 3034, 19000, 'PAPEL ALUMINIO TUC *100 TUC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(242, 'P000242', '7702251042565', 'ALUMINIO *300M TUC SURTICOM', 5, 34, 3, NULL, 44958, 53500, 1, 0, 44958, 8542, 53500, 'ALUMINIO *300M TUC SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(243, 'P000243', '7702251042961', 'CUCHARA RUMBA *10 SURTICOM', 3, 34, 2, NULL, 3067, 3650, 1, 0, 3067, 583, 3650, 'CUCHARA RUMBA *10 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(244, 'P000244', '7702251042985', 'CUCHILLO RUMBA *10 SURTICOM', 3, 34, 2, NULL, 3067, 3650, 1, 0, 3067, 583, 3650, 'CUCHILLO RUMBA *10 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(245, 'P000245', '7702251046013', 'CUCHILLO TUC GRANDE *100 SURTICOM', 5, 34, 3, NULL, 2731, 3250, 1, 0, 2731, 519, 3250, 'CUCHILLO TUC GRANDE *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(246, 'P000246', '7702398001401', 'MORTADELA RICA *250g NUTRESA', 12, 24, 3, NULL, 3095, 3250, 4, 0, 3286, 155, 3450, 'MORTADELA RICA *250g NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(247, 'P000247', '7702398001449', 'MORTADELA RICA *450 g NUTRESA', 12, 24, 3, NULL, 4381, 4600, 4, 0, 4619, 219, 4850, 'MORTADELA RICA *450 g NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(248, 'P000248', '7702398016368', 'HAMBURGUESA RICA *20 UNID SURTICOM', 5, 34, 3, NULL, 29622, 35250, 1, 0, 29622, 5628, 35250, 'HAMBURGUESA RICA *20 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(249, 'P000249', '7702398017877', 'JAMON IDEAL  RICA *230 SURTICOM', 5, 34, 3, NULL, 3824, 4550, 1, 0, 4370, 726, 5200, 'JAMON IDEAL  RICA *230 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(250, 'P000250', '7702398017914', 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 17, 24, 3, '', 5588, 6650, 1, 0, 5588.24, 1061.76, 6650, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-25 19:55:35', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(251, 'P000251', '7702398018508', 'SALCHICHON POLLO RICA *750g SURTICOM', 5, 34, 3, NULL, 7095, 7450, 4, 0, 7238, 355, 7600, 'SALCHICHON POLLO RICA *750g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(252, 'P000252', '7702398024059', 'MORTADELA POLLO *600g NUTRESA', 12, 24, 3, NULL, 7667, 8050, 4, 0, 8286, 383, 8700, 'MORTADELA POLLO *600g NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(253, 'P000253', '7702398025650', 'SALCHICHA LLANERA *16 UNIDA NUTRESA', 17, 24, 3, NULL, 6723, 8000, 1, 0, 7017, 1277, 8350, 'SALCHICHA LLANERA *16 UNIDA NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(254, 'P000254', '7702398026534', 'HAMBURGUESA*4 PREASADA SURTICOM', 5, 34, 3, NULL, 7563, 9000, 1, 0, 7563, 1437, 9000, 'HAMBURGUESA*4 PREASADA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(255, 'P000255', '7702398026992', 'QUESO PERA *2500 NAZARETH', 16, 23, 4, '', 35000, 35000, 3, 0, 36000, 0, 36000, 'QUESO PERA *2500 NAZARETH', 36000, 36000, 2.86, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-27 18:20:07', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(256, 'P000256', '7702398028620', 'JAMON RICACHEF*500g NUTRESA', 12, 24, 3, NULL, 6723, 8000, 1, 0, 6849, 1277, 8150, 'JAMON RICACHEF*500g NUTRESA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(257, 'P000257', '7702398028835', 'HAMBURGUESA RICA *10 UNIDADES RICA', 10, 31, 3, NULL, 7689, 9150, 1, 0, 7773, 1461, 9250, 'HAMBURGUESA RICA *10 UNIDADES RICA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(258, 'P000258', '7702400000378', 'ALMENDRA *250 3A', 4, 1, 1, NULL, 12500, 12500, 3, 0, 12000, 0, 12000, 'ALMENDRA *250 3A', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(259, 'P000259', '7702400000385', 'NUEZ PARTIDA *250 SURTICOM', 4, 34, 1, '', 8403, 10000, 1, 0, 8403, 1597, 10000, 'NUEZ PARTIDA *250 SURTICOM', 10000, 10000, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-28 16:55:17', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(260, 'P000260', '7702400001627', 'CIRUELA PASA *250 SURTICOM', 5, 34, 3, NULL, 3782, 4500, 1, 0, 3782, 718, 4500, 'CIRUELA PASA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(261, 'P000261', '7702400001634', 'UVA PASA *250 SURTICOM', 5, 34, 3, NULL, 2800, 2800, 3, 0, 3000, 0, 3000, 'UVA PASA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(262, 'P000262', '7702432002456', 'CHICHARRIN MISTURA SURTICOM', 4, 34, 1, NULL, 2857, 3400, 1, 0, 2857, 543, 3400, 'CHICHARRIN MISTURA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(263, 'P000263', '7702458000016', 'VASO ESPUMADO 4 Oz *20 UNIDADES DARNEL', 21, 9, 2, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'VASO ESPUMADO 4 Oz *20 UNIDADES DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(264, 'P000264', '7702458000023', 'VASO ESPUMADO 6 Oz *20 UNI DARNEL', 21, 9, 2, NULL, 1092, 1300, 1, 0, 1092, 208, 1300, 'VASO ESPUMADO 6 Oz *20 UNI DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(265, 'P000265', '7702458000030', 'VASO ESPUMADO *8 Oz *20 UNI DARNEL', 21, 9, 2, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'VASO ESPUMADO *8 Oz *20 UNI DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(266, 'P000266', '7702458000054', 'VASO ICOPOR 12 OZ *20 DARNEL', 11, 9, 2, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'VASO ICOPOR 12 OZ *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(267, 'P000267', '7702458000115', 'CONTENEDOR 8 ONZAS SIN TAPA *20 SURTICOM', 5, 34, 3, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'CONTENEDOR 8 ONZAS SIN TAPA *20 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(268, 'P000268', '7702458000139', 'CONTENEDOR DARNE 12 ONZ SIN TAPA DARNEL', 11, 9, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'CONTENEDOR DARNE 12 ONZ SIN TAPA DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(269, 'P000269', '7702458001945', 'VASO TAMI 9 oz *25 TAMI', 21, 35, 2, NULL, 1471, 1750, 1, 0, 1471, 279, 1750, 'VASO TAMI 9 oz *25 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(270, 'P000270', '7702458001952', 'VASO TAMI 12 oz *25 TAMI', 21, 35, 2, NULL, 1807, 2150, 1, 0, 1807, 343, 2150, 'VASO TAMI 12 oz *25 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(271, 'P000271', '7702458002256', 'CONTENEDOR DARNEL 8 ONZ*20 UNID SURTICOM', 5, 34, 3, NULL, 3571, 4250, 1, 0, 3571, 679, 4250, 'CONTENEDOR DARNEL 8 ONZ*20 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(272, 'P000272', '7702458002270', 'CONTENEDOR 12 Oz *20 DARNEL', 11, 9, 2, NULL, 4034, 4800, 1, 0, 4034, 766, 4800, 'CONTENEDOR 12 Oz *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(273, 'P000273', '7702458002287', 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 11, 9, 2, NULL, 5000, 5950, 1, 0, 5210, 950, 6200, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(274, 'P000274', '7702458002959', 'PLATO PANDO 20 cm *20 DARNEL', 11, 9, 2, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'PLATO PANDO 20 cm *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(275, 'P000275', '7702458002966', 'PLATO 30 Oz DARNEL', 11, 9, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'PLATO 30 Oz DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(276, 'P000276', '7702458003048', 'VASO MURANO 7 oz *12 DARNEL', 21, 9, 2, NULL, 2353, 2800, 1, 0, 2353, 447, 2800, 'VASO MURANO 7 oz *12 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(277, 'P000277', '7702458014242', 'PLATO HONDO  25oz *20 DARNEL', 11, 9, 2, NULL, 2269, 2700, 1, 0, 2689, 431, 3200, 'PLATO HONDO  25oz *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(278, 'P000278', '7702458019933', 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 11, 9, 2, NULL, 5336, 6350, 1, 0, 5798, 1014, 6900, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(279, 'P000279', '7702458024210', 'COPA MURANO 3 oz *12 DARNEL', 21, 9, 2, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'COPA MURANO 3 oz *12 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(280, 'P000280', '7702458027945', 'VASO ICOPOR 14 OZ *20 DARNEL', 11, 9, 2, NULL, 1975, 2350, 1, 0, 1975, 375, 2350, 'VASO ICOPOR 14 OZ *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(281, 'P000281', '7702458226836', 'SERVILLETA TAMI 320 FAMILIA', 7, 13, 2, NULL, 2353, 2800, 1, 0, 2605, 447, 3100, 'SERVILLETA TAMI 320 FAMILIA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(282, 'P000282', '7702458245004', 'PLATO PANDO 12 cm *20 DARNEL', 11, 9, 2, NULL, 630, 750, 1, 0, 672, 120, 800, 'PLATO PANDO 12 cm *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(283, 'P000283', '7702458245011', 'PLATO HONDO 5 OZ *20 UNIDAD DARNEL', 11, 9, 2, NULL, 672, 800, 1, 0, 672, 128, 800, 'PLATO HONDO 5 OZ *20 UNIDAD DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(284, 'P000284', '7702458245103', 'PLATO 15.5 PANDO *20 UNID DARNEL', 11, 9, 2, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'PLATO 15.5 PANDO *20 UNID DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(285, 'P000285', '7702458245110', 'PLATO HONDO 12  ONZ SURTICOM', 5, 34, 3, NULL, 1176, 1400, 1, 0, 1176, 224, 1400, 'PLATO HONDO 12  ONZ SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(286, 'P000286', '7702458245202', 'PLATO PANDO 18cm *20 DARNEL', 11, 9, 2, NULL, 1218, 1450, 1, 0, 1218, 232, 1450, 'PLATO PANDO 18cm *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(287, 'P000287', '7702458245301', 'PLATO PANDO 23cm *20 DARNEL', 11, 9, 2, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'PLATO PANDO 23cm *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(288, 'P000288', '7702458245400', 'PLATO PANDO 26cm *20 DARNEL', 11, 9, 2, NULL, 2857, 3400, 1, 0, 2521, 543, 3000, 'PLATO PANDO 26cm *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(289, 'P000289', '7702477112615', 'CREMA DE LECHE ALGARRA *900 ML SURTICOM', 5, 34, 3, NULL, 8050, 8050, 3, 0, 8050, 0, 8050, 'CREMA DE LECHE ALGARRA *900 ML SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(290, 'P000290', '7702477114121', 'CREMA DE LECHE CREMAX * 125ML SURTICOM', 5, 34, 3, NULL, 1300, 1300, 3, 0, 1300, 0, 1300, 'CREMA DE LECHE CREMAX * 125ML SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(291, 'P000291', '7702518030311', 'SERVILLETA POPULAR *320 POPULAR', 11, 28, 2, NULL, 2353, 2800, 1, 0, 2353, 447, 2800, 'SERVILLETA POPULAR *320 POPULAR', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(292, 'P000292', '7702555000117', 'AROS FRUTADOS *250 grs SURTICOM', 5, 34, 3, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'AROS FRUTADOS *250 grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(293, 'P000293', '7702555000346', 'AROS FRUTADOS *500 grs SURTICOM', 5, 34, 3, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'AROS FRUTADOS *500 grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(294, 'P000294', '7702555908314', 'ARROZ ACHOCOLATADO *500grs SURTICOM', 4, 34, 1, NULL, 5882, 7000, 1, 0, 5882, 1118, 7000, 'ARROZ ACHOCOLATADO *500grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(295, 'P000295', '7702560038129', 'PAÑO ABSORBENTE YES SURTICOM', 3, 34, 2, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'PAÑO ABSORBENTE YES SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(296, 'P000296', '7702584186509', 'ZUCARITAS *250 SURTICOM', 5, 34, 3, NULL, 2437, 2900, 1, 0, 2437, 463, 2900, 'ZUCARITAS *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(297, 'P000297', '7702617024495', 'VINAGRE BLANCO CALIFORNIA *250 SURTICOM', 5, 34, 3, NULL, 829, 986, 1, 0, 829, 157, 986, 'VINAGRE BLANCO CALIFORNIA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(298, 'P000298', '7702617024501', 'VINAGRE BLANCO *500 CALIFORNIA SURTICOM', 5, 34, 3, NULL, 1267, 1508, 1, 0, 1267, 241, 1508, 'VINAGRE BLANCO *500 CALIFORNIA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(299, 'P000299', '7702617024556', 'VINAGRE DE FRUTAS CALIFORNIA *500 SURTICOM', 5, 34, 3, NULL, 1267, 1508, 1, 0, 1267, 241, 1508, 'VINAGRE DE FRUTAS CALIFORNIA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(300, 'P000300', '7702766098057', 'PORTA SALCHIPAPA SURTICOM', 5, 34, 3, NULL, 29, 35, 1, 0, 29, 6, 35, 'PORTA SALCHIPAPA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(301, 'P000301', '7702766098071', 'AJI DELCASINO SOBRES *100 DELCASINO', 19, 10, 7, NULL, 6134, 7300, 1, 0, 6134, 1166, 7300, 'AJI DELCASINO SOBRES *100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(302, 'P000302', '7702766098095', 'ALMENDRAS *250 SURTICOM', 5, 34, 3, NULL, 12500, 12500, 3, 0, 12500, 0, 12500, 'ALMENDRAS *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(303, 'P000303', '7702766098118', 'PORTA AREPA SURTICOM', 15, 34, 2, NULL, 35, 35, 3, 0, 35, 0, 35, 'PORTA AREPA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(304, 'P000304', '7702910351427', 'ATUN LOMITOS SOBERANA *170 SURTICOM', 8, 34, 1, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'ATUN LOMITOS SOBERANA *170 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(305, 'P000305', '7703252001230', 'PALO PINCHO FESTIVAL 25cm *100 SURTICOM', 5, 34, 3, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'PALO PINCHO FESTIVAL 25cm *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(306, 'P000306', '7703252035716', 'MEZCLADOR MADERA *500 EL SOL', 6, 11, 4, NULL, 2731, 3250, 1, 0, 2731, 519, 3250, 'MEZCLADOR MADERA *500 EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(307, 'P000307', '7703681045614', 'OBLEAS BENY *50 BENNY', 4, 5, 1, NULL, 8500, 8500, 3, 0, 8800, 0, 8800, 'OBLEAS BENY *50 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(308, 'P000308', '7704918100083', 'VASO 3.5 TRAN *50 VBC', 21, 39, 2, NULL, 1345, 1600, 1, 0, 1345, 255, 1600, 'VASO 3.5 TRAN *50 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(309, 'P000309', '7704918103213', 'GUANTE VINILO TRANSP *100 SURTICOM', 7, 34, 2, NULL, 8571, 10200, 1, 0, 8571, 1629, 10200, 'GUANTE VINILO TRANSP *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(310, 'P000310', '7704918237031', 'VASO 3.5 BLANCO *50 VBC', 21, 39, 2, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'VASO 3.5 BLANCO *50 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(311, 'P000311', '7704918251426', 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 17, 34, 3, NULL, 1513, 1800, 1, 0, 1681, 287, 2000, 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(312, 'P000312', '7704918407021', 'VASO T 10 ONZ *50 UNID SURTICOM', 5, 34, 3, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'VASO T 10 ONZ *50 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(313, 'P000313', '7705326016423', 'TORTILLAS WRAPS BIMBO ** SURTICOM', 13, 34, 5, NULL, 7605, 9050, 1, 0, 7605, 1445, 9050, 'TORTILLAS WRAPS BIMBO ** SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(314, 'P000314', '7705326079152', 'PONQUE VAINILLA BIMBO *220 SURTICOM', 5, 34, 3, NULL, 2227, 2650, 1, 0, 2227, 423, 2650, 'PONQUE VAINILLA BIMBO *220 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(315, 'P000315', '7705999090539', 'UVA PASA *500gr 3A', 4, 1, 1, NULL, 5150, 5150, 3, 0, 5600, 0, 5600, 'UVA PASA *500gr 3A', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(316, 'P000316', '7705999090546', 'CIRUELA PASA* 500 SURTICOM', 5, 34, 3, NULL, 6891, 8200, 1, 0, 6891, 1309, 8200, 'CIRUELA PASA* 500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(317, 'P000317', '7705999090577', 'ALMENDRA *500 SURTICOM', 5, 34, 3, NULL, 18487, 22000, 1, 0, 18487, 3513, 22000, 'ALMENDRA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(318, 'P000318', '7705999090584', 'AJONJOLI DESCORTEZADO*500 SURTICOM', 5, 34, 3, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'AJONJOLI DESCORTEZADO*500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(319, 'P000319', '7706160000043', 'VINAGRE MANZANA CIDRA SURTICOM', 5, 34, 3, NULL, 5042, 6000, 1, 0, 5042, 958, 6000, 'VINAGRE MANZANA CIDRA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(320, 'P000320', '7706516001359', 'COPA OZA SAMBA SURTICOM', 5, 34, 3, NULL, 1050, 1250, 1, 0, 1050, 200, 1250, 'COPA OZA SAMBA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(321, 'P000321', '7707015506093', 'PALILLO CORRIENTE EL SOL *180 UNI EL SOL', 15, 11, 2, NULL, 462, 550, 1, 0, 462, 88, 550, 'PALILLO CORRIENTE EL SOL *180 UNI EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(322, 'P000322', '7707015506291', 'PALO PINCHO  20 CM *100 SURTICOM', 5, 34, 3, NULL, 1345, 1600, 1, 0, 1597, 255, 1900, 'PALO PINCHO  20 CM *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(323, 'P000323', '7707015506307', 'PALO PINCHO 25 CM *100 UNIDADES SURTICOM', 5, 34, 3, NULL, 1765, 2100, 1, 0, 1765, 335, 2100, 'PALO PINCHO 25 CM *100 UNIDADES SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(324, 'P000324', '7707015506314', 'PALO PINCHO *30 CM 100 UNIDA SURTICOM', 5, 34, 3, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'PALO PINCHO *30 CM 100 UNIDA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(325, 'P000325', '7707015506321', 'PINCHUZO 25 CM 100 UNIDADES EL SOL', 11, 11, 2, NULL, 1933, 2300, 1, 0, 1933, 367, 2300, 'PINCHUZO 25 CM 100 UNIDADES EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(326, 'P000326', '7707015506338', 'PINCHUZO 30 CM 100 UNIDADES EL SOL', 11, 11, 2, NULL, 2479, 2950, 1, 0, 2479, 471, 2950, 'PINCHUZO 30 CM 100 UNIDADES EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(327, 'P000327', '7707015506475', 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 11, 11, 2, NULL, 840, 1000, 1, 0, 840, 160, 1000, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(328, 'P000328', '7707015507090', 'MEZCLADOR MADERA *1000 EL SOL', 7, 11, 2, NULL, 5462, 6500, 1, 0, 5462, 1038, 6500, 'MEZCLADOR MADERA *1000 EL SOL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(329, 'P000329', '7707110100363', 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 4, 33, 1, NULL, 7000, 7000, 3, 0, 7200, 0, 7200, 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(330, 'P000330', '7707110100370', 'CHAMPIÑON BLANCO *250 SETAS DE CUIVÁ', 4, 33, 1, NULL, 3800, 3800, 3, 0, 3800, 0, 3800, 'CHAMPIÑON BLANCO *250 SETAS DE CUIVÁ', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(331, 'P000331', '7707110101087', 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 4, 33, 1, NULL, 13000, 13000, 3, 0, 13500, 0, 13500, 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(332, 'P000332', '7707116600171', 'VINIPEL *300 SURTICOM', 7, 34, 2, NULL, 8824, 10500, 1, 0, 8824, 1676, 10500, 'VINIPEL *300 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(333, 'P000333', '7707116600423', 'YOGURT  BOTELLA *1000 SURTICOM', 5, 34, 3, NULL, 5000, 5000, 3, 0, 5000, 0, 5000, 'YOGURT  BOTELLA *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(334, 'P000334', '7707116601222', 'YOGURTH LONCHERO SIX PACK *6 ANGELES', 22, 3, 4, NULL, 3697, 4400, 1, 0, 4286, 703, 5100, 'YOGURTH LONCHERO SIX PACK *6 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(335, 'P000335', '7707151601751', 'SERVILLETA NUBE *320 DARNEL', 7, 9, 2, NULL, 2353, 2800, 1, 0, 2353, 447, 2800, 'SERVILLETA NUBE *320 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(336, 'P000336', '7707151602284', 'TOALLA DE MANOS *150 MT SURTICOM', 3, 34, 2, NULL, 18193, 21650, 1, 0, 18193, 3457, 21650, 'TOALLA DE MANOS *150 MT SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(337, 'P000337', '7707151602321', 'TOALLAS DE MANO *150 SURTICOM', 7, 34, 2, NULL, 6134, 7300, 1, 0, 6134, 1166, 7300, 'TOALLAS DE MANO *150 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(338, 'P000338', '7707175540500', 'ALUMINIO MIXTER CHEF *40 MIO', 1, 22, 2, NULL, 6134, 7300, 1, 0, 6134, 1166, 7300, 'ALUMINIO MIXTER CHEF *40 MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(339, 'P000339', '7707175540531', 'SALSA TOMATE CHEF CHOCICE *4200 CHEF CHOICE', 19, 6, 7, NULL, 16807, 20000, 1, 0, 16807, 3193, 20000, 'SALSA TOMATE CHEF CHOCICE *4200 CHEF CHOICE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(340, 'P000340', '7707175540807', 'CHAMPIÑON CHEF CHOICE *2840 3A', 8, 1, 1, NULL, 22689, 27000, 1, 0, 22689, 4311, 27000, 'CHAMPIÑON CHEF CHOICE *2840 3A', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(341, 'P000341', '7707175540821', 'CHAMPIÑON TAJADO *400 SURTICOM', 5, 34, 3, NULL, 4160, 4950, 1, 0, 4160, 790, 4950, 'CHAMPIÑON TAJADO *400 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(342, 'P000342', '7707175541620', 'PASTA TOMATE FRUZAN *4100 CHEF CHOICE', 19, 6, 7, NULL, 22437, 26700, 1, 0, 22437, 4263, 26700, 'PASTA TOMATE FRUZAN *4100 CHEF CHOICE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(343, 'P000343', '7707175542436', 'MAYONESA MIXTER CHEF *3785 CHEF CHOICE', 19, 6, 7, NULL, 27731, 33000, 1, 0, 27731, 5269, 33000, 'MAYONESA MIXTER CHEF *3785 CHEF CHOICE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(344, 'P000344', '7707175548766', 'DURAZNOS EN MITADES *820 3A', 8, 1, 1, NULL, 3697, 4400, 1, 0, 3697, 703, 4400, 'DURAZNOS EN MITADES *820 3A', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(345, 'P000345', '7707176500022', 'JAMON MARTSANG 12*12 MARTSANG', 12, 21, 3, NULL, 3361, 4000, 1, 0, 3361, 639, 4000, 'JAMON MARTSANG 12*12 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(346, 'P000346', '7707176500039', 'XXXXXXXXXXXXXXXXXXXXX MARTSANG', 12, 21, 3, NULL, 4190, 4400, 4, 0, 4190, 210, 4400, 'XXXXXXXXXXXXXXXXXXXXX MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(347, 'P000347', '7707176500046', 'XXXXXXXXXXXXXXXXXXXX SURTICOM', 5, 34, 3, NULL, 4000, 4200, 4, 0, 4000, 200, 4200, 'XXXXXXXXXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(348, 'P000348', '7707176500060', 'MAIZ TOSTAO *500 NUTRIGRANOLA', 4, 25, 1, NULL, 9450, 9450, 3, 0, 9450, 0, 9450, 'MAIZ TOSTAO *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(349, 'P000349', '7707176500091', 'SALCHICHA  MARTSANG *13 UNIDA MARTSANG', 17, 21, 3, NULL, 3487, 4150, 1, 0, 3824, 663, 4550, 'SALCHICHA  MARTSANG *13 UNIDA MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(350, 'P000350', '7707176500114', 'TOCINETA AHUMADA MARTSANG*500g SURTICOM', 5, 34, 3, NULL, 9580, 11400, 1, 0, 7143, 1820, 8500, 'TOCINETA AHUMADA MARTSANG*500g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(351, 'P000351', '7707176500138', 'CHORIZO *11 *1460 MARTSANG', 5, 21, 3, NULL, 9580, 11400, 1, 0, 9580, 1820, 11400, 'CHORIZO *11 *1460 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(352, 'P000352', '7707176500152', 'HAMBURGUESA MARTSANG * 6 UNI MARTSANG', 10, 21, 3, '', 3950, 4700, 1, 0, 4202, 798, 5000, 'HAMBURGUESA MARTSANG * 6 UNI MARTSANG', 5000, 5000, 6.38, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-21 14:44:21', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(353, 'P000353', '7707176500183', 'JAMON CERDO AHUMADO *450 MARTSANG', 12, 21, 3, '', 5756, 6850, 1, 0, 5756.3, 1093.7, 6850, 'JAMON CERDO AHUMADO *450 MARTSANG', 7200, 7200, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-25 19:58:44', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(354, 'P000354', '7707176500190', 'JAMON TRADICIONAL *450 MARTSANG', 12, 21, 3, NULL, 5294, 6300, 1, 0, 5294, 1006, 6300, 'JAMON TRADICIONAL *450 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(355, 'P000355', '7707176500206', 'SALCHICHA KENTUCKY MARTSANG *10 MARTSANG', 17, 21, 3, NULL, 8319, 9900, 1, 0, 8319, 1581, 9900, 'SALCHICHA KENTUCKY MARTSANG *10 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(356, 'P000356', '7707176500213', 'SALCHICHA HOT DOG *15 UNID MARTSANG', 17, 21, 3, NULL, 6092, 7250, 1, 0, 6723, 1158, 8000, 'SALCHICHA HOT DOG *15 UNID MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(357, 'P000357', '7707176500220', 'SALCHICHA MARTSANG *32 MARTSANG', 17, 21, 3, '', 7773, 9250, 1, 0, 8067, 1533, 9600, 'SALCHICHA MARTSANG *32 MARTSANG', 9600, 9600, 3.78, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-21 14:47:32', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(358, 'P000358', '7707176500251', 'SALCHICHA ROMANA *1350 MARTSANG', 17, 21, 3, '', 15798, 18800, 1, 0, 16555, 3145, 19700, 'SALCHICHA ROMANA *1350 MARTSANG', 19700, 19700, 4.79, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-21 14:40:46', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(359, 'P000359', '7707176500282', 'CABANO TAJADO MARTSANG *500 MARTSANG', 5, 21, 3, '', 5042, 6000, 1, 0, 5294, 1006, 6300, 'CABANO TAJADO MARTSANG *500 MARTSANG', 6300, 6300, 5.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-21 14:45:18', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(360, 'P000360', '7707176500305', 'CHORIZO MARTSANG *12 UND MARTSANG', 5, 21, 3, '', 9244, 11000, 1, 0, 9243.7, 1756.3, 11000, 'CHORIZO MARTSANG *12 UND MARTSANG', 11500, 11500, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-25 19:53:34', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(361, 'P000361', '7707176500329', 'CHORIZO MINI  *11 MARTSANG', 5, 21, 3, '', 6555, 7800, 1, 0, 6891, 1309, 8200, 'CHORIZO MINI  *11 MARTSANG', 8200, 8200, 5.13, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-02-21 14:48:39', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(362, 'P000362', '7707176500404', 'JAMON CERDO AHUMADO *225 GR MARTSANG', 12, 21, 3, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'JAMON CERDO AHUMADO *225 GR MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(363, 'P000363', '7707176500497', 'TOCINETA BACON *500 MARTSANG', 20, 21, 3, NULL, 6597, 7850, 1, 0, 7143, 1253, 8500, 'TOCINETA BACON *500 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(364, 'P000364', '7707176500572', 'CHORIZO SANTARROSANO *500 MARTSANG', 5, 21, 3, NULL, 6303, 7500, 1, 0, 6597, 1197, 7850, 'CHORIZO SANTARROSANO *500 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(365, 'P000365', '7707176501227', 'COSTILLA DE CERDO *500 MARTSANG', 5, 21, 3, NULL, 9076, 10800, 1, 0, 9076, 1724, 10800, 'COSTILLA DE CERDO *500 MARTSANG', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(366, 'P000366', '7707176501265', 'CHORIZO DE CERDO*450 GR SURTICOM', 5, 34, 3, NULL, 6555, 7800, 1, 0, 6555, 1245, 7800, 'CHORIZO DE CERDO*450 GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(367, 'P000367', '7707177170019', 'TOMATE DELCASINO GAL FRA *4100 DELCASINO', 19, 10, 7, NULL, 16555, 19700, 1, 0, 16555, 3145, 19700, 'TOMATE DELCASINO GAL FRA *4100 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(368, 'P000368', '7707177170033', 'MAYONESA DELCASINO GAL FRA *3700 DELCASINO', 19, 10, 7, NULL, 21176, 25200, 1, 0, 21176, 4024, 25200, 'MAYONESA DELCASINO GAL FRA *3700 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(369, 'P000369', '7707177170125', 'VINAGRE BLANCO DELCASINO*3800 DELCASINO', 19, 10, 7, NULL, 6008, 7150, 1, 0, 6008, 1142, 7150, 'VINAGRE BLANCO DELCASINO*3800 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(370, 'P000370', '7707177170132', 'SALSA NEGRA DELCASINO *3800 DELCASINO', 19, 10, 7, NULL, 9580, 11400, 1, 0, 9580, 1820, 11400, 'SALSA NEGRA DELCASINO *3800 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(371, 'P000371', '7707177170156', 'AJI DEL CASINO *160 G DELCASINO', 19, 10, 7, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'AJI DEL CASINO *160 G DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(372, 'P000372', '7707177170187', 'ROSADA DELCASINO GAL FRA *3900 DELCASINO', 19, 10, 7, NULL, 17185, 20450, 1, 0, 17185, 3265, 20450, 'ROSADA DELCASINO GAL FRA *3900 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(373, 'P000373', '7707177170255', 'MIEL DELCASINO *500 DELCASINO', 19, 10, 7, NULL, 3193, 3800, 1, 0, 3193, 607, 3800, 'MIEL DELCASINO *500 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(374, 'P000374', '7707177170262', 'MIEL DELCASINO *1000 DELCASINO', 19, 10, 7, NULL, 5630, 6700, 1, 0, 5630, 1070, 6700, 'MIEL DELCASINO *1000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(375, 'P000375', '7707177170286', 'AJI DELCASINO GALON DELCASINO', 19, 10, 7, NULL, 20168, 24000, 1, 0, 20168, 3832, 24000, 'AJI DELCASINO GALON DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(376, 'P000376', '7707177170705', 'MAYONESA ACOMER *3800 DELCASINO', 19, 10, 7, NULL, 14748, 17550, 1, 0, 14748, 2802, 17550, 'MAYONESA ACOMER *3800 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(377, 'P000377', '7707177170712', 'MOSTAZA DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 9118, 10850, 1, 0, 9580, 1732, 11400, 'MOSTAZA DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:36', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(378, 'P000378', '7707177170729', 'TOMATE DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 14244, 16950, 1, 0, 14244, 2706, 16950, 'TOMATE DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(379, 'P000379', '7707177170774', 'ROSADA DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 15252, 18150, 1, 0, 15252, 2898, 18150, 'ROSADA DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(380, 'P000380', '7707177170804', 'TARTARA DEL CASINO BOLSA GALON SURTICOM', 5, 34, 3, NULL, 12815, 15250, 1, 0, 12815, 2435, 15250, 'TARTARA DEL CASINO BOLSA GALON SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(381, 'P000381', '7707177170811', 'TOMATE ACOMER BOLSA *4000 DELCASINO', 19, 10, 7, NULL, 11092, 13200, 1, 0, 11092, 2108, 13200, 'TOMATE ACOMER BOLSA *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(382, 'P000382', '7707177170842', 'PASTA DE TOMATE DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 20588, 24500, 1, 0, 20588, 3912, 24500, 'PASTA DE TOMATE DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(383, 'P000383', '7707177171009', 'BBQ DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 14370, 17100, 1, 0, 14370, 2730, 17100, 'BBQ DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(384, 'P000384', '7707177171047', 'SALSA SOYA DELCASINO *3750 DELCASINO', 19, 10, 7, NULL, 12353, 14700, 1, 0, 12353, 2347, 14700, 'SALSA SOYA DELCASINO *3750 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(385, 'P000385', '7707177172105', 'MAYONESA DELCASINO *4000 DELCASINO', 19, 10, 7, NULL, 20294, 24150, 1, 0, 20294, 3856, 24150, 'MAYONESA DELCASINO *4000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(386, 'P000386', '7707177172310', 'SALSA NEGRA DEL CASINO *3000 DELCASINO', 19, 10, 7, NULL, 6807, 8100, 1, 0, 6807, 1293, 8100, 'SALSA NEGRA DEL CASINO *3000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(387, 'P000387', '7707177172327', 'SALSA SOYA DEL CASINO *3000 SURTICOM', 5, 34, 3, NULL, 9832, 11700, 1, 0, 9832, 1868, 11700, 'SALSA SOYA DEL CASINO *3000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(388, 'P000388', '7707177172334', 'VINAGRE BLANCO DELCASINO *3000 DELCASINO', 19, 10, 7, NULL, 4202, 5000, 1, 0, 4202, 798, 5000, 'VINAGRE BLANCO DELCASINO *3000 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(389, 'P000389', '7707177172341', 'VINAGRE DE FRUTAS DELCASINO *3000 SURTICOM', 19, 34, 7, NULL, 4412, 5250, 1, 0, 4412, 838, 5250, 'VINAGRE DE FRUTAS DELCASINO *3000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(390, 'P000390', '7707177172938', 'VINAGRE DE MANZANA DEL CASINO  *500 DELCASINO', 19, 10, 7, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'VINAGRE DE MANZANA DEL CASINO  *500 DELCASINO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(391, 'P000391', '7707177700247', 'GUANTES NEGRO SOL SURTICOM', 3, 34, 2, NULL, 2647, 3150, 1, 0, 2647, 503, 3150, 'GUANTES NEGRO SOL SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(392, 'P000392', '7707177800015', 'GUANTES AMARILLO SOL SURTICOM', 3, 34, 2, NULL, 2647, 3150, 1, 0, 2647, 503, 3150, 'GUANTES AMARILLO SOL SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(393, 'P000393', '7707177900050', 'GUANTES BICOLOR GLOBAL SURTICOM', 3, 34, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'GUANTES BICOLOR GLOBAL SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(394, 'P000394', '7707186880091', 'GALLETA KARCHY *160  GRS PICOLLO', 4, 27, 1, NULL, 2689, 3200, 1, 0, 2689, 511, 3200, 'GALLETA KARCHY *160  GRS PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(395, 'P000395', '7707186880206', 'BARQUILLOS ROLLED CAJA SURTICOM', 5, 34, 3, NULL, 4412, 5250, 1, 0, 4412, 838, 5250, 'BARQUILLOS ROLLED CAJA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(396, 'P000396', '7707186880336', 'AVELLANA *250 SURTICOM', 4, 34, 1, NULL, 14286, 17000, 1, 0, 14286, 2714, 17000, 'AVELLANA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(397, 'P000397', '7707339930772', 'ALUMINIO GOLDEN *100', 7, 34, 2, '', 1300, 1300, 1, 0, 16386.6, 3113.45, 19500, 'ALUMINIO GOLDEN *100', 0, 0, 1400.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-27 00:33:48', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(398, 'P000398', '7707187320084', 'AREPA CON SAL *12 SURTICOM', 5, 34, 3, NULL, 1300, 1300, 3, 0, 1300, 0, 1300, 'AREPA CON SAL *12 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(399, 'P000399', '7707191090430', 'SALCHICHA MANGUERA SABORE *8 SABORE', 17, 32, 3, NULL, 4538, 5400, 1, 0, 4538, 862, 5400, 'SALCHICHA MANGUERA SABORE *8 SABORE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(400, 'P000400', '7707191090447', 'HAMBURGUESA VALENCIA *500 ', 10, 34, 3, '', 3655, 4350, 1, 0, 3655, 695, 4350, 'HAMBURGUESA VALENCIA *500 ', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 19:59:41', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(401, 'P000401', '7707191090454', 'SALCHICHA SUPER DOG * 24 SURTICOM', 17, 34, 3, '', 5462, 6500, 1, 0, 5462.19, 1037.82, 6500, 'SALCHICHA SUPER DOG * 24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 19:55:08', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(402, 'P000402', '7707191090522', 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 17, 34, 3, '', 13866, 16500, 1, 0, 14285.7, 2714.29, 17000, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 0, 0, 3.03, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 19:48:13', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(403, 'P000403', '7707191090751', 'JAMON FROSTER *500 SURTICOM', 12, 34, 3, NULL, 3361, 4000, 1, 0, 3361, 639, 4000, 'JAMON FROSTER *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(404, 'P000404', '7707191091055', 'CHORIZO MINI PAISA *500 CIAL SAS', 5, 7, 3, '', 4622, 5500, 1, 0, 4622, 926, 5500, 'CHORIZO MINI PAISA *500 CIAL SAS', 5800, 5800, 5.45, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-28 18:08:36', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(405, 'P000405', '7707191091086', 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 5, 34, 3, '', 11765, 14000, 1, 0, 11764.7, 2235.29, 14000, 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 19:51:49', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(406, 'P000406', '7707191091109', 'CHORIZO PAISA *12 SURTICOM', 5, 34, 3, '', 10084, 12000, 1, 0, 10084, 1915.97, 12000, 'CHORIZO PAISA *12 SURTICOM', 12600, 12600, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 19:51:07', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(407, 'P000407', '7707194390506', 'MARGARINA INDUSTRIAL *500 TOLIBOY', 19, 36, 7, NULL, 1681, 2000, 1, 0, 1681, 319, 2000, 'MARGARINA INDUSTRIAL *500 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(408, 'P000408', '7707194390551', 'SALSA MELOCOTON *1000 TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA MELOCOTON *1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(409, 'P000409', '7707194390552', 'SALSA CHICLE *1000 GRS TOLIBOY', 19, 36, 7, NULL, 2773, 3300, 1, 0, 3025, 527, 3600, 'SALSA CHICLE *1000 GRS TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(410, 'P000410', '7707194390575', 'SALCHICHA MIXTA POLLO Y RES *15 ATIKAS', 17, 4, 3, NULL, 5798, 6900, 1, 0, 5798, 1102, 6900, 'SALCHICHA MIXTA POLLO Y RES *15 ATIKAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(411, 'P000411', '7707194390674', 'AZUCAR SOBRES ECONOMICA *100 SURTICOM', 21, 34, 2, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'AZUCAR SOBRES ECONOMICA *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(412, 'P000412', '7707199346652', 'SERVILLETA ELITE*320 SURTICOM', 5, 34, 3, NULL, 1723, 2050, 1, 0, 1723, 327, 2050, 'SERVILLETA ELITE*320 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(413, 'P000413', '7707203351689', 'RAPI PAPA 9x9 *2000 MACCAIN', 14, 20, 6, NULL, 9832, 11700, 1, 0, 9832, 1868, 11700, 'RAPI PAPA 9x9 *2000 MACCAIN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(414, 'P000414', '7707204570256', 'PAPA LOS LANCEROS *250G SURTICOM', 5, 34, 3, NULL, 5200, 5200, 3, 0, 5700, 0, 5700, 'PAPA LOS LANCEROS *250G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(415, 'P000415', '7707204570263', 'PAPA LOS LANCEROS SURTIDA *320 G SURTICOM', 5, 34, 3, NULL, 5800, 5800, 3, 0, 5800, 0, 5800, 'PAPA LOS LANCEROS SURTIDA *320 G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(416, 'P000416', '7707204570287', 'PAPA LOS LANCEROS ENTERA *500 GRS SURTICOM', 5, 34, 3, NULL, 10250, 10250, 3, 0, 10250, 0, 10250, 'PAPA LOS LANCEROS ENTERA *500 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(417, 'P000417', '7707204570348', 'PAPA LOS LANCEROS SURTIDA *600g SURTICOM', 5, 34, 3, NULL, 9400, 9400, 3, 0, 9400, 0, 9400, 'PAPA LOS LANCEROS SURTIDA *600g SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(418, 'P000418', '7707204570546', 'PAPA LOS LANCEROS FOSFORITO * 250 SURTICOM', 5, 34, 3, NULL, 5600, 5600, 3, 0, 5600, 0, 5600, 'PAPA LOS LANCEROS FOSFORITO * 250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(419, 'P000419', '7707204570553', 'PAPA LOS LANCEROS FOSFORO *500GR SURTICOM', 5, 34, 3, NULL, 9400, 9400, 3, 0, 9400, 0, 9400, 'PAPA LOS LANCEROS FOSFORO *500GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(420, 'P000420', '7707209144070', 'LONJA BOCADILLOS DIANITA *300 SURTICOM', 4, 34, 1, NULL, 1400, 1400, 3, 0, 1400, 0, 1400, 'LONJA BOCADILLOS DIANITA *300 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(421, 'P000421', '7707209144087', 'LONJA DE BOCADILLO *500 GRS SURTICOM', 4, 34, 1, NULL, 2100, 2100, 3, 0, 2100, 0, 2100, 'LONJA DE BOCADILLO *500 GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(422, 'P000422', '7707210500056', 'PRACTIPASTA EMPANADA *450 PRACTI PASTA', 13, 29, 5, NULL, 2500, 2500, 3, 0, 2600, 0, 2600, 'PRACTIPASTA EMPANADA *450 PRACTI PASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(423, 'P000423', '7707210500087', 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 13, 29, 5, NULL, 2667, 2800, 4, 0, 2667, 133, 2800, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(424, 'P000424', '7707210500124', 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 13, 29, 5, '', 2667, 2800, 4, 0, 2666.67, 133.333, 2800, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-28 18:38:39', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(425, 'P000425', '7707210500209', 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 13, 29, 5, '', 2571, 2700, 4, 0, 2571.43, 128.571, 2700, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-28 18:37:16', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(426, 'P000426', '7707210500216', 'PRACTIPASTA FLAUTA *500 PRACTI PASTA', 13, 29, 5, '', 2571, 2700, 4, 0, 2571.43, 128.571, 2700, 'PRACTIPASTA FLAUTA *500 PRACTI PASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-28 18:37:57', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(427, 'P000427', '7707227380146', 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 16, 34, 4, NULL, 5800, 5800, 3, 0, 5800, 0, 5800, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(428, 'P000428', '7707227380147', 'MANTEQUILLA NAZARETH *500 NAZARETH', 16, 23, 4, NULL, 6500, 6500, 3, 0, 6500, 0, 6500, 'MANTEQUILLA NAZARETH *500 NAZARETH', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(429, 'P000429', '7707229492359', 'PORTA PERRO ZENU SURTICOM', 11, 34, 2, NULL, 50, 60, 1, 0, 50, 10, 60, 'PORTA PERRO ZENU SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(430, 'P000430', '7707229492663', 'TOCINETA AHUMADA *250 SANTANA SURTICOM', 20, 34, 3, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'TOCINETA AHUMADA *250 SANTANA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(431, 'P000431', '7707229493318', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx SURTICOM', 5, 34, 3, NULL, 10294, 12250, 1, 0, 10294, 1956, 12250, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(432, 'P000432', '7707229495398', 'CAJA PIZZA 50 X 50 SURTICOM', 7, 34, 2, NULL, 1681, 2000, 1, 0, 1681, 319, 2000, 'CAJA PIZZA 50 X 50 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(433, 'P000433', '7707229496104', 'SALCHICHA MANGUERA HAMB *18 HAMBURGUER', 17, 16, 3, NULL, 9202, 10950, 1, 0, 9202, 1748, 10950, 'SALCHICHA MANGUERA HAMB *18 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(434, 'P000434', '7707229496128', 'XXXXXXXXXXXXXXXXXXXXXXXXXXX SURTICOM', 5, 34, 3, NULL, 2479, 2950, 1, 0, 2479, 471, 2950, 'XXXXXXXXXXXXXXXXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(435, 'P000435', '7707229496203', 'QUESO CAMPESINO GAMEZA*480 SURTICOM', 16, 34, 4, NULL, 5500, 5500, 3, 0, 5500, 0, 5500, 'QUESO CAMPESINO GAMEZA*480 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(436, 'P000436', '7707229496227', 'XXXXXXXXXXXXXXX SURTICOM', 5, 34, 3, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'XXXXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(437, 'P000437', '7707229499105', 'BOLSA POLIPR 4X8 *100 SURTICOM', 3, 34, 2, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'BOLSA POLIPR 4X8 *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(438, 'P000438', '7707234991571', 'VASO TRANSP 7 oz *50 ESPECIAL SURTICOM', 21, 34, 2, NULL, 1381, 1450, 4, 0, 1381, 69, 1450, 'VASO TRANSP 7 oz *50 ESPECIAL SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(439, 'P000439', '7707242750429', 'YUCA FROZZEN *100 SURTICOM', 14, 34, 6, NULL, 3277, 3900, 1, 0, 3277, 623, 3900, 'YUCA FROZZEN *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(440, 'P000440', '7707242750702', 'MAIZ DULCE DESGRANADO *1000 SURTICOM', 8, 34, 1, NULL, 7227, 8600, 1, 0, 7227, 1373, 8600, 'MAIZ DULCE DESGRANADO *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(441, 'P000441', '7707248430080', 'TOCINETA AHUMADA *250 PROCARSAN SURTICOM', 20, 34, 3, NULL, 3782, 4500, 1, 0, 3992, 718, 4750, 'TOCINETA AHUMADA *250 PROCARSAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(442, 'P000442', '7707267560065', 'SALCHICHON HUNGARO *1400 FRIGOSAN', 18, 15, 3, NULL, 6143, 6450, 4, 0, 6143, 307, 6450, 'SALCHICHON HUNGARO *1400 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(443, 'P000443', '7707267560300', 'MORTADELA RES FRIGOSAN *250 FRIGOSAN', 12, 15, 3, NULL, 1714, 1800, 4, 0, 1714, 86, 1800, 'MORTADELA RES FRIGOSAN *250 FRIGOSAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(444, 'P000444', '7707267560393', 'SEMILLA DE GIRASOL *500 NUTRIGRANOLA', 4, 25, 1, NULL, 8250, 8250, 3, 0, 8250, 0, 8250, 'SEMILLA DE GIRASOL *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(445, 'P000445', '7707267560478', 'KIT CUCHARA+CUCHILLO+TENEDOR+SERVILLETA SURTICOM', 3, 34, 2, NULL, 168, 200, 1, 0, 168, 32, 200, 'KIT CUCHARA+CUCHILLO+TENEDOR+SERVILLETA SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(446, 'P000446', '7707269790019', 'QUESO DC *2500 ENTERO ANGELES', 16, 3, 4, '', 26000, 26000, 3, 0, 26000, 0, 26000, 'QUESO DC *2500 ENTERO ANGELES', 27500, 27500, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 16:26:05', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 1, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(447, 'P000447', '7707269790033', 'QUESO DC *250 ENT ANGELES', 16, 3, 4, NULL, 3450, 3450, 3, 0, 3450, 0, 3450, 'QUESO DC *250 ENT ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(448, 'P000448', '7709937898515', 'JAMON PULMAN *500', 12, 3, 3, '', 7500, 7500, 3, 0, 4250, 0, 4250, 'JAMON PULMAN *500', 0, 0, -43.33, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 20:32:59', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(449, 'P000449', '7707269790057', 'QUESO DC *500 ENT ANGELES', 16, 3, 4, NULL, 6400, 6400, 3, 0, 6400, 0, 6400, 'QUESO DC *500 ENT ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(450, 'P000450', '7707269790064', 'QUESO DC *2500 TAJ ANGELES', 16, 3, 4, '', 27000, 27000, 3, 0, 27000, 0, 27000, 'QUESO DC *2500 TAJ ANGELES', 28500, 28500, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-26 23:36:43', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(451, 'P000451', '7707269790088', 'QUESO DC *250 TAJ ANGELES', 16, 3, 4, NULL, 3300, 3300, 3, 0, 3300, 0, 3300, 'QUESO DC *250 TAJ ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(452, 'P000452', '7707269790118', 'QUESO DC *1000 ANGELES', 16, 3, 4, NULL, 12000, 12000, 3, 0, 12000, 0, 12000, 'QUESO DC *1000 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(453, 'P000453', '7707269790132', 'QUESO CAMPESINO ANGELES *500 ANGELES', 16, 3, 4, NULL, 5200, 5200, 3, 0, 5200, 0, 5200, 'QUESO CAMPESINO ANGELES *500 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(454, 'P000454', '7707269790149', 'QUESO DC PRIMAVERA *500 PRIMAVERA', 16, 30, 4, '', 5700, 5700, 3, 0, 6700, 0, 6700, 'QUESO DC PRIMAVERA *500 PRIMAVERA', 6700, 6700, 17.54, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-28 00:00:19', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(455, 'P000455', '7707269790156', 'QUESO PERA ANGELES *480 ANGELES', 16, 3, 4, NULL, 7900, 7900, 3, 0, 7900, 0, 7900, 'QUESO PERA ANGELES *480 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(456, 'P000456', '7707269790507', 'YOGURT GARRAFA *1750 ANGELES', 22, 3, 4, NULL, 7269, 8650, 1, 0, 7689, 1381, 9150, 'YOGURT GARRAFA *1750 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(457, 'P000457', '7707269790606', 'QUESO COSTEÑO *500 ANGELES', 16, 3, 4, NULL, 7200, 7200, 3, 0, 7200, 0, 7200, 'QUESO COSTEÑO *500 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(458, 'P000458', '7707269790804', 'YOGURT BOLSA *1000 ANGELES', 22, 3, 4, NULL, 2815, 3350, 1, 0, 2815, 535, 3350, 'YOGURT BOLSA *1000 ANGELES', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(459, 'P000459', '7707270364728', 'GUANTE D´KAUCHO SURTICOM', 3, 34, 2, NULL, 2479, 2950, 1, 0, 2479, 471, 2950, 'GUANTE D´KAUCHO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(460, 'P000460', '7707272490043', 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 13, 8, 5, NULL, 3000, 3000, 3, 0, 3000, 0, 3000, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(461, 'P000461', '7707272490395', 'PAN HAMBUR COUNTRY *750 SURTICOM', 13, 34, 5, NULL, 4000, 4000, 3, 0, 4300, 0, 4300, 'PAN HAMBUR COUNTRY *750 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(462, 'P000462', '7707272490579', 'PAN PERRO *6 COUNTRY', 13, 8, 5, NULL, 2000, 2000, 3, 0, 2300, 0, 2300, 'PAN PERRO *6 COUNTRY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(463, 'P000463', '7707272490616', 'MIGA PAN CONTRY *500 COUNTRY', 13, 8, 5, NULL, 2350, 2350, 3, 0, 2500, 0, 2500, 'MIGA PAN CONTRY *500 COUNTRY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(464, 'P000464', '7707272490944', 'PAN HAMBURGUESA x 6 COUNTRY', 13, 8, 5, NULL, 2000, 2000, 3, 0, 2300, 0, 2300, 'PAN HAMBURGUESA x 6 COUNTRY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(465, 'P000465', '7707282990168', 'TAPABOCAS CAJA *50 SURTICOM', 3, 34, 2, '', 7227, 8600, 1, 0, 19831.9, 3768.07, 23600, 'TAPABOCAS CAJA *50 SURTICOM', 0, 0, 174.42, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-29 00:54:38', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(466, 'P000466', '7707283880208', 'LONJA BOCADILLO COMBINADO SURTICOM', 5, 34, 3, NULL, 2200, 2200, 3, 0, 2200, 0, 2200, 'LONJA BOCADILLO COMBINADO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(467, 'P000467', '7707285870146', 'GELATINA CHICLE *500 PICOLLO', 4, 27, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA CHICLE *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(468, 'P000468', '7707285870177', 'GELATINA FRESA PICCOLO *500 SURTICOM', 4, 34, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA FRESA PICCOLO *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(469, 'P000469', '7707285870221', 'GELATINA DURAZNO *500 PICOLLO', 4, 27, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA DURAZNO *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(470, 'P000470', '7707285870245', 'GELATINA LIMON *500 PICOLLO', 4, 27, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA LIMON *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(471, 'P000471', '7707285870504', 'GRAJEAS *500 GRS PICOLLO', 4, 27, 1, NULL, 3025, 3600, 1, 0, 3025, 575, 3600, 'GRAJEAS *500 GRS PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(472, 'P000472', '7707285870511', 'GRAJEAS * 250 GR PICOLLO', 4, 27, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'GRAJEAS * 250 GR PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(473, 'P000473', '7707285870528', 'GRAJEAS *125 GR PICOLLO', 4, 27, 1, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'GRAJEAS *125 GR PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(474, 'P000474', '7707285872027', 'GELATINA SIN SABOR *500 PICOLLO', 19, 27, 7, NULL, 14622, 17400, 1, 0, 14622, 2778, 17400, 'GELATINA SIN SABOR *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(475, 'P000475', '7707285872034', 'GELATINA SIN SABOR *250 PICOLLO', 4, 27, 1, NULL, 7353, 8750, 1, 0, 7353, 1397, 8750, 'GELATINA SIN SABOR *250 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(476, 'P000476', '7707285873116', 'GELATINA SABORES X250GR SURTICOM', 5, 34, 3, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'GELATINA SABORES X250GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(477, 'P000477', '7707292830034', 'CUCHARA DECO *100 VBC', 7, 39, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'CUCHARA DECO *100 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(478, 'P000478', '7707292831000', 'TENEDOR GRANDE DECO *100 SURTICOM', 7, 34, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'TENEDOR GRANDE DECO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(479, 'P000479', '7707292831505', 'TENEDOR PEQUEÑO DECO *100 SURTICOM', 7, 34, 2, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'TENEDOR PEQUEÑO DECO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(480, 'P000480', '7707292832007', 'CUCHARA DEKO *100 SURTICOM', 7, 34, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'CUCHARA DEKO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(481, 'P000481', '7707292832502', 'CUCHARA DEKO DULCERA *100 SURTICOM', 7, 34, 2, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'CUCHARA DEKO DULCERA *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(482, 'P000482', '7707292833004', 'CUCHILLO DECO *100 VBC', 7, 39, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'CUCHILLO DECO *100 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(483, 'P000483', '7707292835008', 'VASO WHISKY CRISTAL *25 UNID SURTICOM', 5, 34, 3, NULL, 4750, 4750, 3, 0, 4750, 0, 4750, 'VASO WHISKY CRISTAL *25 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(484, 'P000484', '7707296930129', 'TOMATE TOMATICO BOLSA *4000 TOMATICO', 19, 37, 7, NULL, 10672, 12700, 1, 0, 10756, 2028, 12800, 'TOMATE TOMATICO BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(485, 'P000485', '7707296930136', 'MOSTAZA TOMATICO *4000 TOMATICO', 19, 37, 7, NULL, 7563, 9000, 1, 0, 8319, 1437, 9900, 'MOSTAZA TOMATICO *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(486, 'P000486', '7707296930143', 'MAYONESA TOMATICO BOLSA *4000 TOMATICO', 19, 37, 7, NULL, 15378, 18300, 1, 0, 15504, 2922, 18450, 'MAYONESA TOMATICO BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(487, 'P000487', '7707296930150', 'ROSADA TOMATICO *4000 TOMATICO', 19, 37, 7, NULL, 11849, 14100, 1, 0, 12185, 2251, 14500, 'ROSADA TOMATICO *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(488, 'P000488', '7707296930167', 'TARTARA TOMATICO *4000 TOMATICO', 19, 37, 7, NULL, 14118, 16800, 1, 0, 14118, 2682, 16800, 'TARTARA TOMATICO *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(489, 'P000489', '7707296930174', 'MAYO AJO BOLSA *4000 TOMATICO', 19, 37, 7, NULL, 12017, 14300, 1, 0, 12269, 2283, 14600, 'MAYO AJO BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(490, 'P000490', '7707296930181', 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 19, 37, 7, '', 10084, 12000, 1, 0, 10084, 1915.97, 12000, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-02-25 18:38:42', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(491, 'P000491', '7707296930198', 'MORA TOMATICO BOLSA *4000 TOMATICO', 19, 37, 7, NULL, 10336, 12300, 1, 0, 10336, 1964, 12300, 'MORA TOMATICO BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(492, 'P000492', '7707296930204', 'PASTA DE TOMATE TOMATICO *4000 TOMATICO', 19, 37, 7, NULL, 16387, 19500, 1, 0, 16597, 3113, 19750, 'PASTA DE TOMATE TOMATICO *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(493, 'P000493', '7707296930211', 'TOMATE ESPAÑOLA *4000 TOMATICO', 19, 37, 7, NULL, 7731, 9200, 1, 0, 7983, 1469, 9500, 'TOMATE ESPAÑOLA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(494, 'P000494', '7707296930228', 'MAYONESA ESPAÑOLA *4000 TOMATICO', 19, 37, 7, NULL, 10252, 12200, 1, 0, 10546, 1948, 12550, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(495, 'P000495', '7707296930235', 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 19, 37, 7, NULL, 4118, 4900, 1, 0, 4202, 782, 5000, 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(496, 'P000496', '7707296930242', 'VINAGRE FRUTAS *3000 SURTICOM', 5, 34, 3, NULL, 3319, 3950, 1, 0, 3319, 631, 3950, 'VINAGRE FRUTAS *3000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(497, 'P000497', '7707296930259', 'AJI TOMATICO *3000cc TOMATICO', 19, 37, 7, NULL, 11176, 13300, 1, 0, 11176, 2124, 13300, 'AJI TOMATICO *3000cc TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(498, 'P000498', '7707296930266', 'SALSA NEGRA TOMATICO *3000cc TOMATICO', 19, 37, 7, NULL, 6387, 7600, 1, 0, 6387, 1213, 7600, 'SALSA NEGRA TOMATICO *3000cc TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(499, 'P000499', '7707296930280', 'MOSTAZA TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 2185, 2600, 1, 0, 2353, 415, 2800, 'MOSTAZA TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(500, 'P000500', '7707296930303', 'ROSADA TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 3361, 4000, 1, 0, 3613, 639, 4300, 'ROSADA TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(501, 'P000501', '7707296930310', 'TARTARA TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 3866, 4600, 1, 0, 3950, 734, 4700, 'TARTARA TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(502, 'P000502', '7707296930327', 'MAYO AJO *1000 TOMATICO', 19, 37, 7, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'MAYO AJO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(503, 'P000503', '7707296930334', 'PIÑA TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'PIÑA TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(504, 'P000504', '7707296930341', 'MORA TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 2773, 3300, 1, 0, 2983, 527, 3550, 'MORA TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(505, 'P000505', '7707296930358', 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 4538, 5400, 1, 0, 4706, 862, 5600, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(506, 'P000506', '7707296930365', 'TOMATE ESPAÑOLA *1000 TOMATICO', 19, 37, 7, NULL, 2101, 2500, 1, 0, 2269, 399, 2700, 'TOMATE ESPAÑOLA *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(507, 'P000507', '7707296930372', 'MAYONESA ESPAÑOLA *1000 TOMATICO', 19, 37, 7, NULL, 2983, 3550, 1, 0, 3109, 567, 3700, 'MAYONESA ESPAÑOLA *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(508, 'P000508', '7707296930396', 'MOSTAZA TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1345, 1600, 1, 0, 1429, 255, 1700, 'MOSTAZA TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(509, 'P000509', '7707296930419', 'ROSADA TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1933, 2300, 1, 0, 1975, 367, 2350, 'ROSADA TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(510, 'P000510', '7707296930426', 'TARTARA TOMATICO *500GR TOMATICO', 19, 37, 7, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'TARTARA TOMATICO *500GR TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(511, 'P000511', '7707296930440', 'PIÑA TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1681, 2000, 1, 0, 1765, 319, 2100, 'PIÑA TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(512, 'P000512', '7707296930457', 'MORA TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1597, 1900, 1, 0, 1765, 303, 2100, 'MORA TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(513, 'P000513', '7707296930464', 'PASTA DE TOMATE TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 2437, 2900, 1, 0, 2437, 463, 2900, 'PASTA DE TOMATE TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(514, 'P000514', '7707296930471', 'TOMATE ESPAÑOLA *500 TOMATICO', 19, 37, 7, NULL, 1303, 1550, 1, 0, 1429, 247, 1700, 'TOMATE ESPAÑOLA *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(515, 'P000515', '7707296930488', 'MAYONESA ESPAÑOLA  *500 TOMATICO', 19, 37, 7, NULL, 1723, 2050, 1, 0, 1723, 327, 2050, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(516, 'P000516', '7707296930495', 'VINAGRE TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1176, 1400, 1, 0, 1176, 224, 1400, 'VINAGRE TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(517, 'P000517', '7707296930501', 'VINAGRE FRUTAS *500 SURTICOM', 5, 34, 3, NULL, 882, 1050, 1, 0, 882, 168, 1050, 'VINAGRE FRUTAS *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(518, 'P000518', '7707296930518', 'SALSA NEGRA TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1597, 1900, 1, 0, 1681, 303, 2000, 'SALSA NEGRA TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(519, 'P000519', '7707296930525', 'TOMATE SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 3697, 4400, 1, 0, 3782, 703, 4500, 'TOMATE SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(520, 'P000520', '7707296930532', 'MOSTAZA SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 3571, 4250, 1, 0, 3571, 679, 4250, 'MOSTAZA SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(521, 'P000521', '7707296930549', 'MAYONESA SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 5126, 6100, 1, 0, 5126, 974, 6100, 'MAYONESA SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(522, 'P000522', '7707296930556', 'ROSADA SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'ROSADA SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(523, 'P000523', '7707296930563', 'MIEL SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 3782, 4500, 1, 0, 3866, 718, 4600, 'MIEL SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(524, 'P000524', '7707296930570', 'AJI TOMATICO  *165 CC TOMATICO', 19, 37, 7, NULL, 1387, 1650, 1, 0, 1597, 263, 1900, 'AJI TOMATICO  *165 CC TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(525, 'P000525', '7707296930587', 'SALSA NEGRA TOMATICO *165 TOMATICO', 19, 37, 7, NULL, 1092, 1300, 1, 0, 1092, 208, 1300, 'SALSA NEGRA TOMATICO *165 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(526, 'P000526', '7707296930686', 'MIEL MOSTAZA *1000 TOMATICO', 19, 37, 7, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'MIEL MOSTAZA *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(527, 'P000527', '7707296930709', 'BBQ TOMATICO *4000 TOMATICO', 19, 37, 7, NULL, 11765, 14000, 1, 0, 12101, 2235, 14400, 'BBQ TOMATICO *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(528, 'P000528', '7707296930716', 'BBQ TOMATICO *1000 TOMATICO', 19, 37, 7, NULL, 3319, 3950, 1, 0, 3445, 631, 4100, 'BBQ TOMATICO *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(529, 'P000529', '7707296930723', 'BBQ TOMATICO *500 TOMATICO', 19, 37, 7, NULL, 1891, 2250, 1, 0, 1975, 359, 2350, 'BBQ TOMATICO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(530, 'P000530', '7707296930754', 'MIEL TOMATICO*1000g TOMATICO', 19, 37, 7, NULL, 4118, 4900, 1, 0, 4118, 782, 4900, 'MIEL TOMATICO*1000g TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(531, 'P000531', '7707296930778', 'SALSA SOYA TOMATICO *3000 TOMATICO', 19, 37, 7, NULL, 9244, 11000, 1, 0, 9244, 1756, 11000, 'SALSA SOYA TOMATICO *3000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(532, 'P000532', '7707296930785', 'SALSA SOYA TOMATICO *500 CC TOMATICO', 19, 37, 7, NULL, 2185, 2600, 1, 0, 2269, 415, 2700, 'SALSA SOYA TOMATICO *500 CC TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(533, 'P000533', '7707296930792', 'SALSA SOYA TOMATICO *165 TOMATICO', 19, 37, 7, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'SALSA SOYA TOMATICO *165 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(534, 'P000534', '7707296930846', 'BBQ SOBRES TOMATICO *100 TOMATICO', 19, 37, 7, NULL, 3697, 4400, 1, 0, 3697, 703, 4400, 'BBQ SOBRES TOMATICO *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(535, 'P000535', '7707296930877', 'SALSA CIRUELA *200 TOMATICO', 19, 37, 7, NULL, 1681, 2000, 1, 0, 1681, 319, 2000, 'SALSA CIRUELA *200 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(536, 'P000536', '7707296930891', 'MIEL TOMATICO*4000 SURTICOM', 5, 34, 3, NULL, 12941, 15400, 1, 0, 12941, 2459, 15400, 'MIEL TOMATICO*4000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:37', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(537, 'P000537', '7707296930907', 'MIEL BOTELLA TOMATICO *1000 SURTICOM', 5, 34, 3, NULL, 4622, 5500, 1, 0, 4622, 878, 5500, 'MIEL BOTELLA TOMATICO *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(538, 'P000538', '7707296930914', 'MIEL TOMATICO *500 GRS TOMATICO', 19, 37, 7, NULL, 2437, 2900, 1, 0, 2689, 463, 3200, 'MIEL TOMATICO *500 GRS TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(539, 'P000539', '7707296930921', 'SALSA NEGRA TOMATICO *1000 SURTICOM', 5, 34, 3, NULL, 2437, 2900, 1, 0, 2437, 463, 2900, 'SALSA NEGRA TOMATICO *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(540, 'P000540', '7707296930945', 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 19, 37, 7, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(541, 'P000541', '7707296931010', 'MAYO MOSTAZA *1000 TOMATICO', 19, 37, 7, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'MAYO MOSTAZA *1000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(542, 'P000542', '7707296931034', 'MAYO MOSTAZA *500 TOMATICO', 19, 37, 7, NULL, 2143, 2550, 1, 0, 2143, 407, 2550, 'MAYO MOSTAZA *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(543, 'P000543', '7707296931041', 'MAYO MOSTAZA BOLSA *4000 TOMATICO', 19, 37, 7, NULL, 13908, 16550, 1, 0, 14034, 2642, 16700, 'MAYO MOSTAZA BOLSA *4000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(544, 'P000544', '7707296931072', 'SALSA HUMO *165 TOMATICO', 19, 37, 7, NULL, 1008, 1200, 1, 0, 1092, 192, 1300, 'SALSA HUMO *165 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(545, 'P000545', '7707296931089', 'SALSA HUMO *500 TOMATICO', 19, 37, 7, NULL, 1555, 1850, 1, 0, 1555, 295, 1850, 'SALSA HUMO *500 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(546, 'P000546', '7707296931102', 'SALSA HUMO *3000 TOMATICO', 19, 37, 7, NULL, 8151, 9700, 1, 0, 8151, 1549, 9700, 'SALSA HUMO *3000 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(547, 'P000547', '7707296931133', 'SALSA TERIYAKI *165 TOMATICO', 19, 37, 7, NULL, 1639, 1950, 1, 0, 1639, 311, 1950, 'SALSA TERIYAKI *165 TOMATICO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(548, 'P000548', '7707297380749', 'MIGA DE PAN REPAN *400 SURTICOM', 13, 34, 5, NULL, 2100, 2100, 3, 0, 2100, 0, 2100, 'MIGA DE PAN REPAN *400 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(549, 'P000549', '7707299070020', 'GRANOLA DIETETICA DCAPAN *500 NUTRIGRANOLA', 4, 25, 1, NULL, 6300, 6300, 3, 0, 6300, 0, 6300, 'GRANOLA DIETETICA DCAPAN *500 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(550, 'P000550', '7707300260044', 'AREPA BLANCA *12 SURTICOM', 13, 34, 5, NULL, 2400, 2400, 3, 0, 1350, 0, 1350, 'AREPA BLANCA *12 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(551, 'P000551', '0022', 'HAMBURGUESA COLCARNES *500', 10, 34, 3, '', 2500, 2500, 1, 0, 3865.55, 734.454, 4600, 'HAMBURGUESA COLCARNES *500', 0, 0, 84.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-27 22:01:41', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 2, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(552, 'P000552', '7707300560045', 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 5, 34, 3, NULL, 11765, 14000, 1, 0, 11765, 2235, 14000, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(553, 'P000553', '7707301560150', 'xxxxxxxxxxxxxxxxxxxxxxxx PAPA CHEF', 14, 26, 6, NULL, 0, 0, 1, 0, 0, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxxx PAPA CHEF', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(554, 'P000554', '7707303730025', 'GRANOLA * 500grs NUTRIGRANOLA', 4, 25, 1, NULL, 3782, 4500, 1, 0, 3782, 718, 4500, 'GRANOLA * 500grs NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(555, 'P000555', '7707303730032', 'GRANOLA *250 GR NUTRIGRANOLA', 4, 25, 1, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'GRANOLA *250 GR NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(556, 'P000556', '7707303730049', 'ZUCARITAS * 250grs SURTICOM', 4, 34, 1, NULL, 2437, 2900, 1, 0, 2437, 463, 2900, 'ZUCARITAS * 250grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(557, 'P000557', '7707303730056', 'CHOCAPIC *250 grs SURTICOM', 5, 34, 3, NULL, 3613, 4300, 1, 0, 3613, 687, 4300, 'CHOCAPIC *250 grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(558, 'P000558', '7707303730070', 'CHOCOCRISPI* 250grs SURTICOM', 5, 34, 3, NULL, 3800, 3800, 3, 0, 3800, 0, 3800, 'CHOCOCRISPI* 250grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(559, 'P000559', '7707303730100', 'GUDIZ * 250gr SURTICOM', 5, 34, 3, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'GUDIZ * 250gr SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(560, 'P000560', '7707303730179', 'ZUCARITAS * 500grs SURTICOM', 5, 34, 3, NULL, 4118, 4900, 1, 0, 4118, 782, 4900, 'ZUCARITAS * 500grs SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(561, 'P000561', '7707303730209', 'GUDIZ  * 500g r SURTICOM', 5, 34, 3, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'GUDIZ  * 500g r SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(562, 'P000562', '7707308550338', 'PALILLO TIPO SANDWICH *35 gr SURTICOM', 5, 34, 3, NULL, 756, 900, 1, 0, 756, 144, 900, 'PALILLO TIPO SANDWICH *35 gr SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(563, 'P000563', '7707312104039', 'VINIPEL DANELDA *100 mts SURTICOM', 7, 34, 2, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'VINIPEL DANELDA *100 mts SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(564, 'P000564', '7707320620040', 'ALUMINIO REPUESTO HOUSE *40 HOUSE', 1, 17, 2, NULL, 6176, 7350, 1, 0, 6176, 1174, 7350, 'ALUMINIO REPUESTO HOUSE *40 HOUSE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(565, 'P000565', '7707320620057', 'ALUMINIO HOUSE *300 HOUSE', 7, 17, 2, NULL, 41933, 49900, 1, 0, 41933, 7967, 49900, 'ALUMINIO HOUSE *300 HOUSE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(566, 'P000566', '7707320620064', 'ALUMINIO HOUSE *100 SURTICOM', 7, 34, 2, NULL, 16387, 19500, 1, 0, 16387, 3113, 19500, 'ALUMINIO HOUSE *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(567, 'P000567', '7707320620248', 'VASO PAPEL 9 Oz *40 HOUSE', 21, 17, 2, NULL, 3571, 4250, 1, 0, 3782, 679, 4500, 'VASO PAPEL 9 Oz *40 HOUSE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(568, 'P000568', '7707320620835', 'VASO PAPEL 4 Oz *50 HOUSE', 21, 17, 2, NULL, 2395, 2850, 1, 0, 2395, 455, 2850, 'VASO PAPEL 4 Oz *50 HOUSE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(569, 'P000569', '7707320620842', 'VASO PAPEL 6 Oz *50 HOUSE', 21, 17, 2, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'VASO PAPEL 6 Oz *50 HOUSE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(570, 'P000570', '7707328080020', 'AREQUIPE TARRO *1000 BENNY', 4, 5, 1, NULL, 5000, 5950, 1, 0, 5000, 950, 5950, 'AREQUIPE TARRO *1000 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(571, 'P000571', '7707328380030', 'AREQUIPE TARRO *500 BENNY', 4, 5, 1, NULL, 3529, 4200, 1, 0, 3613, 671, 4300, 'AREQUIPE TARRO *500 BENNY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(572, 'P000572', '7707331830049', 'ALUMINIO MIO * 7 mts MIO', 1, 22, 2, NULL, 1765, 2100, 1, 0, 1765, 335, 2100, 'ALUMINIO MIO * 7 mts MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(573, 'P000573', '7707331830056', 'ALUMINIO MIO *16 mts MIO', 1, 22, 2, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'ALUMINIO MIO *16 mts MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(574, 'P000574', '7707331830063', 'ALUMINIO MIO*40 MIO', 1, 22, 2, NULL, 6975, 8300, 1, 0, 6975, 1325, 8300, 'ALUMINIO MIO*40 MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(575, 'P000575', '7707331830797', 'VASO PAPEL 4 ONZ MIO SURTICOM', 5, 34, 3, NULL, 2605, 3100, 1, 0, 2605, 495, 3100, 'VASO PAPEL 4 ONZ MIO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(576, 'P000576', '7707331830803', 'VASO PAPEL 6 Oz *50 MIO', 21, 22, 2, NULL, 3782, 4500, 1, 0, 3782, 718, 4500, 'VASO PAPEL 6 Oz *50 MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(577, 'P000577', '7707331832463', 'ALUMINIO MIO *40 MIO', 6, 22, 4, NULL, 6050, 7200, 1, 0, 6050, 1150, 7200, 'ALUMINIO MIO *40 MIO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(578, 'P000578', '7707331832487', 'ALUMINIO MIO *300 MTS SURTICOM', 5, 34, 3, NULL, 46807, 55700, 1, 0, 42017, 8893, 50000, 'ALUMINIO MIO *300 MTS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(579, 'P000579', '7707334539048', 'VASO MAMBO 3.3 *50 UNID SURTICOM', 5, 34, 3, NULL, 1008, 1200, 1, 0, 1008, 192, 1200, 'VASO MAMBO 3.3 *50 UNID SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(580, 'P000580', '7707334539130', 'VASO 12 Oz *50 VBC', 21, 39, 2, NULL, 1891, 2250, 1, 0, 1891, 359, 2250, 'VASO 12 Oz *50 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(581, 'P000581', '7707337000156', 'DULCES DE MIEL *50 SURTICOM', 4, 34, 1, NULL, 2521, 3000, 1, 0, 2689, 479, 3200, 'DULCES DE MIEL *50 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(582, 'P000582', '7707339930277', 'TENEDOR *100 CHEVERE SURTICOM', 7, 34, 2, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'TENEDOR *100 CHEVERE SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(583, 'P000583', '7707348270029', 'CUCHARA SOYD POSTRE *100 SURTICOM', 5, 34, 3, NULL, 1513, 1800, 1, 0, 1513, 287, 1800, 'CUCHARA SOYD POSTRE *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(584, 'P000584', '7707356210192', 'COCO RALLADO *500 SURTICOM', 4, 34, 1, NULL, 5798, 6900, 1, 0, 5798, 1102, 6900, 'COCO RALLADO *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(585, 'P000585', '7708075610003', 'GELATINA UVA *500 PICOLLO', 4, 27, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA UVA *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(586, 'P000586', '7708075610102', 'COBERTURA DE CHOCOLATE BLANCO *500 PICOLLO', 4, 27, 1, NULL, 5042, 6000, 1, 0, 5210, 958, 6200, 'COBERTURA DE CHOCOLATE BLANCO *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(587, 'P000587', '7708075610133', 'GELATINA CEREZA *500 PICOLLO', 4, 27, 1, NULL, 3866, 4600, 1, 0, 3866, 734, 4600, 'GELATINA CEREZA *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(588, 'P000588', '7708075610782', 'COBERTURA DE CHOCOLATE NEGRA  *500 PICOLLO', 4, 27, 1, NULL, 5042, 6000, 1, 0, 5210, 958, 6200, 'COBERTURA DE CHOCOLATE NEGRA  *500 PICOLLO', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(589, 'P000589', '7708104360909', 'BOLSA POLIPR 3X6 *100 SURTICOM', 3, 34, 2, NULL, 2017, 2400, 1, 0, 2017, 383, 2400, 'BOLSA POLIPR 3X6 *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(590, 'P000590', '7708900957006', 'PAPA CABELLO ANGEL MEGA *1000 ', 14, 19, 6, '', 4160, 4950, 1, 0, 4159.66, 790.336, 4950, 'PAPA CABELLO ANGEL MEGA *1000 ', 5300, 5300, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 21:49:38', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(591, 'P000591', '7708900957044', 'PAPA MEGA *500 SURTICOM', 14, 34, 6, NULL, 2227, 2650, 1, 0, 2227, 423, 2650, 'PAPA MEGA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(592, 'P000592', '7708901753607', 'AREPA CON QUESO *4 SURTICOM', 13, 34, 5, NULL, 2550, 2550, 3, 0, 2550, 0, 2550, 'AREPA CON QUESO *4 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(593, 'P000593', '7708931384543', 'JAMON LORD FINO *500 HAMBURGUER', 12, 16, 3, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'JAMON LORD FINO *500 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(594, 'P000594', '7708932029863', 'COPA 1 ONZA X 50 SURTICOM', 5, 34, 3, NULL, 1050, 1250, 1, 0, 1050, 200, 1250, 'COPA 1 ONZA X 50 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(595, 'P000595', '7708984578524', 'GUANTE VINILO NEGRO *100 SURTICOM', 7, 34, 2, NULL, 16639, 19800, 1, 0, 16639, 3161, 19800, 'GUANTE VINILO NEGRO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(596, 'P000596', '7709023005131', 'CHORIZO MADRIGAL *10 SURTICOM', 5, 34, 3, '', 7563, 9000, 1, 0, 7815.13, 1484.87, 9300, 'CHORIZO MADRIGAL *10 SURTICOM', 0, 0, 3.33, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 19:51:23', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(597, 'P000597', '7709040759888', 'MEZCLADORES *500 SURTICOM', 7, 34, 2, NULL, 756, 900, 1, 0, 840, 144, 1000, 'MEZCLADORES *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(598, 'P000598', '7709055389544', 'MASA LISTA EMPANADAS 450 GR SURTICOM', 5, 34, 3, NULL, 2667, 2800, 4, 0, 2667, 133, 2800, 'MASA LISTA EMPANADAS 450 GR SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(599, 'P000599', '7709055389575', 'ESTUPASTA FLAUTA *600 ESTUPASTA', 13, 12, 5, NULL, 2571, 2700, 4, 0, 2571, 129, 2700, 'ESTUPASTA FLAUTA *600 ESTUPASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(600, 'P000600', '7709055389599', 'ESTUPASTA EMPANADA *525 ESTUPASTA', 13, 12, 5, NULL, 2571, 2700, 4, 0, 2571, 129, 2700, 'ESTUPASTA EMPANADA *525 ESTUPASTA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(601, 'P000601', '7709100953720', 'CHORIZO PARRILLERO MINI *500 HAMBURGUER', 5, 16, 3, NULL, 5210, 6200, 1, 0, 5210, 990, 6200, 'CHORIZO PARRILLERO MINI *500 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(602, 'P000602', '7709146949848', 'JAMON CASERO HAMBURGUER *500 ', 12, 16, 3, '', 4286, 5100, 1, 0, 4286, 814, 5100, 'JAMON CASERO HAMBURGUER *500 ', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 19:58:21', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(603, 'P000603', '7709146949893', 'SALCHICHA MANGUERA KL *7 HAMBURGUER', 17, 16, 3, NULL, 4118, 4900, 1, 0, 4118, 782, 4900, 'SALCHICHA MANGUERA KL *7 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(604, 'P000604', '7709172157279', 'SALCHICHON PORTEÑO *1000 CIAL SAS', 18, 7, 3, NULL, 4095, 4300, 4, 0, 4095, 205, 4300, 'SALCHICHON PORTEÑO *1000 CIAL SAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(605, 'P000605', '7709174732801', 'VASOS CARIBE 3.3 OZ SURTICOM', 5, 34, 3, NULL, 1261, 1500, 1, 0, 1261, 240, 1500, 'VASOS CARIBE 3.3 OZ SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(606, 'P000606', '7709174732818', 'VASO VBC 5.5 Oz VBC', 21, 39, 2, '', 1261, 1500, 1, 0, 1261, 239, 1500, 'VASO VBC 5.5 Oz VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 17:35:13', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(607, 'P000607', '7709174732825', 'VASO VBC 7 oz*50 VBC', 21, 39, 2, NULL, 1176, 1400, 1, 0, 1261, 224, 1500, 'VASO VBC 7 oz*50 VBC', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(608, 'P000608', '7709174732849', 'VASO VBC 14 Oz *50 ATIKAS', 21, 4, 2, NULL, 3067, 3650, 1, 0, 3067, 583, 3650, 'VASO VBC 14 Oz *50 ATIKAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(609, 'P000609', '7709174732870', 'VASO VBC 10 Oz *50 ATIKAS', 21, 4, 2, NULL, 1807, 2150, 1, 0, 1807, 343, 2150, 'VASO VBC 10 Oz *50 ATIKAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(610, 'P000610', '7709174732894', 'VASO VBC 9 Oz *50 ATIKAS', 21, 4, 2, NULL, 1807, 2150, 1, 0, 1807, 343, 2150, 'VASO VBC 9 Oz *50 ATIKAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(611, 'P000611', '7709236593708', 'AZUCAR PULVERIZADA *250 SURTICOM', 5, 34, 3, NULL, 800, 800, 3, 0, 800, 0, 800, 'AZUCAR PULVERIZADA *250 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(612, 'P000612', '7709236593791', 'ACEITE SUPER A *3000 SURTICOM', 8, 34, 1, NULL, 11555, 13750, 1, 0, 12773, 2195, 15200, 'ACEITE SUPER A *3000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(613, 'P000613', '7709247011772', 'CERVECERO FINO *1250 HAMBURGUER', 18, 16, 3, NULL, 8000, 8400, 4, 0, 8000, 400, 8400, 'CERVECERO FINO *1250 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(614, 'P000614', '7709247011796', 'JAMON CASERO *250 HAMBURGUER', 12, 16, 3, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'JAMON CASERO *250 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(615, 'P000615', '7709277618705', 'QUESO TAJ NAZARET *480 NAZARETH', 16, 23, 4, NULL, 6350, 6350, 3, 0, 6550, 0, 6550, 'QUESO TAJ NAZARET *480 NAZARETH', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(616, 'P000616', '7709277618712', 'QUESO CAMPESINO NAZARETH 500GRS SURTICOM', 5, 34, 3, NULL, 5200, 5200, 3, 0, 5200, 0, 5200, 'QUESO CAMPESINO NAZARETH 500GRS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(617, 'P000617', '7709277618729', 'QUESO PERA NAZARETH *500G SURTICOM', 5, 34, 3, '', 7200, 7200, 3, 0, 7700, 0, 7700, 'QUESO PERA NAZARETH *500G SURTICOM', 7500, 7500, 4.17, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-27 23:58:07', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(618, 'P000618', '7709277618743', 'QUESO TAJADO PRIMAVERA *250 PRIMAVERA', 16, 30, 4, NULL, 3100, 3100, 3, 0, 3100, 0, 3100, 'QUESO TAJADO PRIMAVERA *250 PRIMAVERA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(619, 'P000619', '7709277618750', 'QUESO DC NAZARET TAJ *2500 NAZARETH', 16, 23, 4, '', 27000, 27000, 3, 0, 28500, 0, 28500, 'QUESO DC NAZARET TAJ *2500 NAZARETH', 28500, 28500, 5.56, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-27 18:23:14', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(620, 'P000620', '7709277618798', 'QUESO DC *2500 NAZARET NAZARETH', 16, 23, 4, '', 26500, 26500, 3, 0, 27500, 0, 27500, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 27500, 3.77, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-27 18:21:35', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(621, 'P000621', '770936064723', 'ACEITE BIDON SURAPALMA *20 LT SURTICOM', 8, 34, 1, NULL, 78151, 93000, 1, 0, 78151, 14849, 93000, 'ACEITE BIDON SURAPALMA *20 LT SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(622, 'P000622', '7709383721818', 'COSTILLA PROCARSAN *250 SURTICOM', 20, 34, 3, '', 3361, 4000, 1, 0, 3697.48, 702.521, 4400, 'COSTILLA PROCARSAN *250 SURTICOM', 0, 0, 10.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 19:49:15', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(623, 'P000623', '7709383721825', 'COSTILLA PROCARSAN *500 SURTICOM', 20, 34, 3, NULL, 6723, 8000, 1, 0, 6723, 1277, 8000, 'COSTILLA PROCARSAN *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(624, 'P000624', '7709383721849', 'COSTILLA PROCARSAN *350 SURTICOM', 20, 34, 3, NULL, 4874, 5800, 1, 0, 4874, 926, 5800, 'COSTILLA PROCARSAN *350 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(625, 'P000625', '7709682244711', 'AROMATICA FRUTOS MIX *24 SURTICOM', 4, 34, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'AROMATICA FRUTOS MIX *24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(626, 'P000626', '7709682244742', 'AROMATICA FRUTOS ROJOS *24 SURTICOM', 4, 34, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'AROMATICA FRUTOS ROJOS *24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(627, 'P000627', '7709682244766', 'AROMATICA LIMON HIERBABUENA *24 SURTICOM', 4, 34, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'AROMATICA LIMON HIERBABUENA *24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(628, 'P000628', '7709682244780', 'AROMATICA MARACUYA *24 SURTICOM', 4, 34, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'AROMATICA MARACUYA *24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(629, 'P000629', '7709682244797', 'AROMATICA CIDRON *24 SURTICOM', 4, 34, 1, NULL, 1849, 2200, 1, 0, 1849, 351, 2200, 'AROMATICA CIDRON *24 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(630, 'P000630', '7709693020908', 'CUCHARA DULCERA TRANSPARENTE *100 SURTICOM', 5, 34, 3, NULL, 1900, 1900, 3, 0, 1900, 0, 1900, 'CUCHARA DULCERA TRANSPARENTE *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(631, 'P000631', '7709693020915', 'CUCHARA SURAPLAS *100 SURTICOM', 5, 34, 3, NULL, 2773, 3300, 1, 0, 2773, 527, 3300, 'CUCHARA SURAPLAS *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(632, 'P000632', '7709693020991', 'TENEDOR GRANDE  SURAPLAS *100 SURTICOM', 5, 34, 3, NULL, 3300, 3300, 3, 0, 3300, 0, 3300, 'TENEDOR GRANDE  SURAPLAS *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(633, 'P000633', '7709766189402', 'PAPA CRIOLLA *500 SURTICOM', 14, 34, 6, NULL, 2437, 2900, 1, 0, 2437, 463, 2900, 'PAPA CRIOLLA *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(634, 'P000634', '7709766189488', 'PAPA FROZZEN *1000G SURTICOM', 14, 34, 6, NULL, 4370, 5200, 1, 0, 4202, 830, 5000, 'PAPA FROZZEN *1000G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(635, 'P000635', '7709775887962', 'CROQUETAS DE YUCA FROZZEN *1000 SURTICOM', 14, 34, 6, NULL, 3277, 3900, 1, 0, 4034, 623, 4800, 'CROQUETAS DE YUCA FROZZEN *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(636, 'P000636', '7709775887993', 'PIÑA CAMPI FRUT * 2500 SURTICOM', 19, 34, 7, NULL, 4538, 5400, 1, 0, 4538, 862, 5400, 'PIÑA CAMPI FRUT * 2500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(637, 'P000637', '7709778603316', 'MAIZ FROZZEN *500 SURTICOM', 9, 34, 8, NULL, 3697, 4400, 1, 0, 3697, 703, 4400, 'MAIZ FROZZEN *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(638, 'P000638', '7709778603361', 'MAIZ FROZZEN *1000 SURTICOM', 9, 34, 8, NULL, 7143, 8500, 1, 0, 7395, 1357, 8800, 'MAIZ FROZZEN *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(639, 'P000639', '7709778603378', 'PAPA FROZZEN *500 SURTICOM', 14, 34, 6, NULL, 2269, 2700, 1, 0, 2101, 431, 2500, 'PAPA FROZZEN *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(640, 'P000640', '7709829599346', 'SERVILLETA SARITA CAFETERIA *100 SURTICOM', 5, 34, 3, NULL, 1092, 1300, 1, 0, 1092, 208, 1300, 'SERVILLETA SARITA CAFETERIA *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(641, 'P000641', '7709917227618', 'ACEITE 900 PAL FRITO SURTICOM', 5, 34, 3, NULL, 3782, 4500, 1, 0, 3782, 718, 4500, 'ACEITE 900 PAL FRITO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(642, 'P000642', '7709917330929', 'PAPA PRECO TOCANITA *2500 PAPA CHEF', 14, 26, 6, NULL, 11765, 14000, 1, 0, 12101, 2235, 14400, 'PAPA PRECO TOCANITA *2500 PAPA CHEF', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(643, 'P000643', '7709937898539', 'CHORIZO PARRILLERO *12 HAMBURGUER', 5, 16, 3, NULL, 8697, 10350, 1, 0, 8697, 1653, 10350, 'CHORIZO PARRILLERO *12 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(644, 'P000644', '7709937898546', 'CABANO HAMBURGUER *500 HAMBURGUER', 17, 16, 3, NULL, 3950, 4700, 1, 0, 3950, 750, 4700, 'CABANO HAMBURGUER *500 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(645, 'P000645', '7709937898577', 'JAMON YORK ECO HAMBURGUER *500 HAMBURGUER', 12, 16, 3, NULL, 2857, 3400, 1, 0, 2857, 543, 3400, 'JAMON YORK ECO HAMBURGUER *500 HAMBURGUER', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(646, 'P000646', '7709990018615', 'SALCHICHON MADRIGAL * 1100 SURTICOM', 18, 34, 3, '', 3905, 4100, 4, 0, 4571, 229, 4800, 'SALCHICHON MADRIGAL * 1100 SURTICOM', 0, 0, 17.07, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-25 17:38:24', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(647, 'P000647', '7709990115406', 'PAPA GLORIA TRITURADA *1000 KRUMER SHIPS', 14, 19, 6, NULL, 4202, 5000, 1, 0, 4202, 798, 5000, 'PAPA GLORIA TRITURADA *1000 KRUMER SHIPS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(648, 'P000648', '7709990115703', 'HAMBURGUESA PREMIUM *10 CIAL SAS', 10, 7, 3, NULL, 2101, 2500, 1, 0, 2101, 399, 2500, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(649, 'P000649', '7709990115734', 'XXXXXXXXXXXXXXXX CIAL SAS', 12, 7, 3, NULL, 4095, 4300, 4, 0, 4095, 205, 4300, 'XXXXXXXXXXXXXXXX CIAL SAS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(650, 'P000650', '7709990135763', 'PAN HAMBURGUESA JIMEZPAN *720 *12 CHEF CHOICE', 13, 6, 5, NULL, 3500, 3500, 3, 0, 3500, 0, 3500, 'PAN HAMBURGUESA JIMEZPAN *720 *12 CHEF CHOICE', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(651, 'P000651', '7709990182323', 'MAIZ DEL CAMPO COLFRAN *500 SURTICOM', 14, 34, 6, NULL, 3571, 4250, 1, 0, 3571, 679, 4250, 'MAIZ DEL CAMPO COLFRAN *500 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(652, 'P000652', '7709990182330', 'MAIZ TIERNO COLFRAN *1000 SURTICOM', 8, 34, 1, NULL, 7227, 8600, 1, 0, 7227, 1373, 8600, 'MAIZ TIERNO COLFRAN *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(653, 'P000653', '7709990182354', 'xxxxxxxxxxxxxxxxxxxxxxx SURTICOM', 14, 34, 6, NULL, 0, 0, 1, 0, 0, 0, 0, 'xxxxxxxxxxxxxxxxxxxxxxx SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(654, 'P000654', '7709990196030', 'PAPA GLORIA TRITURADA *500 GRS KRUMER SHIPS', 14, 19, 6, NULL, 2269, 2700, 1, 0, 2647, 431, 3150, 'PAPA GLORIA TRITURADA *500 GRS KRUMER SHIPS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(655, 'P000655', '7709990196054', 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 14, 19, 6, NULL, 2521, 3000, 1, 0, 2647, 479, 3150, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(656, 'P000656', '7709990353648', 'PAN PERRO JIMEZPAN *730 *12 ITALPAN', 13, 18, 5, NULL, 3500, 3500, 3, 0, 3500, 0, 3500, 'PAN PERRO JIMEZPAN *730 *12 ITALPAN', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(657, 'P000657', '7709990364620', 'PAN PERRO *850 REPAN SURTICOM', 13, 34, 5, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'PAN PERRO *850 REPAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(658, 'P000658', '7709990364651', 'PAN HAMBURGUESA *850 REPAN SURTICOM', 13, 34, 5, NULL, 3529, 4200, 1, 0, 3529, 671, 4200, 'PAN HAMBURGUESA *850 REPAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(659, 'P000659', '7709990399417', 'PAPA CABELLO ANGEL KRU *1000 KRUMER SHIPS', 14, 19, 6, NULL, 4790, 5700, 1, 0, 5042, 910, 6000, 'PAPA CABELLO ANGEL KRU *1000 KRUMER SHIPS', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(660, 'P000660', '7709990480399', 'VASO 7 Oz VACAN *50 TAMI', 21, 35, 2, NULL, 1050, 1250, 1, 0, 1050, 200, 1250, 'VASO 7 Oz VACAN *50 TAMI', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(661, 'P000661', '7709990544848', 'LECHE CONDENSADA * 390G SURTICOM', 5, 34, 3, NULL, 3600, 3600, 3, 0, 3600, 0, 3600, 'LECHE CONDENSADA * 390G SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(662, 'P000662', '7709990554779', 'MANI CON UVAS *250 NUTRIGRANOLA', 4, 25, 1, NULL, 2521, 3000, 1, 0, 2521, 479, 3000, 'MANI CON UVAS *250 NUTRIGRANOLA', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(663, 'P000663', '7709990734515', 'PAN PERRO *750 REPAN SURTICOM', 13, 34, 5, NULL, 3025, 3600, 1, 0, 3025, 575, 3600, 'PAN PERRO *750 REPAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(664, 'P000664', '7709990734553', 'PAN HAMBURGUESA *750 REPAN SURTICOM', 13, 34, 5, NULL, 3025, 3600, 1, 0, 3025, 575, 3600, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(665, 'P000665', '7709990734591', 'REPAN TAJADO EXTRA *550 SURTICOM', 13, 34, 5, NULL, 2750, 2750, 3, 0, 2750, 0, 2750, 'REPAN TAJADO EXTRA *550 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(666, 'P000666', '7709990797145', 'ALUMINIO POLAR  REPUESTO 40 MTS SURTICOM', 5, 34, 3, NULL, 5882, 7000, 1, 0, 5882, 1118, 7000, 'ALUMINIO POLAR  REPUESTO 40 MTS SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(667, 'P000667', '7709995003944', 'QUESADILLO SURTICOM', 16, 34, 4, NULL, 1800, 1800, 3, 0, 1800, 0, 1800, 'QUESADILLO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(668, 'P000668', '7713042134437', 'GUANTES MANIPULACION SURTICOM', 8, 34, 1, NULL, 2000, 2000, 3, 0, 2000, 0, 2000, 'GUANTES MANIPULACION SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(669, 'P000669', '7755267000012', 'TENEDOR INKA  PONQUE*100 UNIDADES SURTICOM', 5, 34, 3, NULL, 1176, 1400, 1, 0, 1176, 224, 1400, 'TENEDOR INKA  PONQUE*100 UNIDADES SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(670, 'P000670', '7801380101522', 'DURAZNOS DOS CABALLOS *820 SURTICOM', 8, 34, 1, NULL, 5210, 6200, 1, 0, 5210, 990, 6200, 'DURAZNOS DOS CABALLOS *820 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(671, 'P000671', '7808770500477', 'MAIZ TIERNO KILO SURTICOM', 5, 34, 3, NULL, 11261, 13400, 1, 0, 11261, 2140, 13400, 'MAIZ TIERNO KILO SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(672, 'P000672', '7861158700302', 'BOLSA POLIPR 4X10 *100 SURTICOM', 3, 34, 2, NULL, 3277, 3900, 1, 0, 3277, 623, 3900, 'BOLSA POLIPR 4X10 *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(673, 'P000673', '79', 'PITILLOS *500 UNIDA DARNEL', 11, 9, 2, NULL, 1597, 1900, 1, 0, 1597, 303, 1900, 'PITILLOS *500 UNIDA DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(674, 'P000674', '80', 'PORT PIZZA* UNIDAD SURTICOM', 11, 34, 2, NULL, 34, 40, 1, 0, 34, 6, 40, 'PORT PIZZA* UNIDAD SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(675, 'P000675', '82', 'PORTA HAMBURGUES * UNIDAD SURTICOM', 11, 34, 2, '', 29, 35, 1, 0, 29.4118, 5.58824, 35, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-26 23:37:38', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(676, 'P000676', '83', 'PORTA PERRO *UNIDAD SURTICOM', 11, 34, 2, '', 29, 35, 1, 0, 29.4118, 5.58824, 35, 'PORTA PERRO *UNIDAD SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-02-26 23:37:14', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(677, 'P000677', '84', 'PATACON PRECO *1000 SURTICOM', 14, 34, 6, NULL, 4622, 5500, 1, 0, 4622, 878, 5500, 'PATACON PRECO *1000 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(678, 'P000678', '86', 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 11, 9, 2, NULL, 5210, 6200, 1, 0, 5210, 990, 6200, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `products` (`id`, `code`, `reference`, `name`, `category_id`, `brand_id`, `area_id`, `barcode`, `cost_nt`, `cost_yt`, `tax_sale_id`, `tax_purchase_id`, `base`, `taxamount`, `price`, `description`, `price_major`, `price_credit`, `utility`, `utility_major`, `utility_credit`, `photo`, `photothumb`, `color`, `created_at`, `modified_at`, `type`, `alertqt`, `st_max`, `st_min`, `supplier`, `supplier_id`, `unit`, `taxmethod`, `h_stores`, `desc_prog`, `start_date_desc`, `end_date_desc`, `commission_desc`, `presentation_id`, `fractional`, `identifier`, `quantity`, `commission`, `cardtype_id`, `combo_id`, `last_date_sale`, `last_date_purchase`, `sale_by_quantity`, `min_1`, `max_1`, `price_1`, `utility_1`, `min_2`, `max_2`, `price_2`, `utility_2`, `min_3`, `max_3`, `price_3`, `utility_3`, `in_activo`) VALUES
(679, 'P000679', '87', 'PORTACOMIDA J-1 *20 DARNEL', 11, 9, 2, NULL, 3445, 4100, 1, 0, 3445, 655, 4100, 'PORTACOMIDA J-1 *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(680, 'P000680', '8710679157388', 'XXXXXXXXXXXXXXXXXXX SURTICOM', 14, 34, 6, NULL, 0, 0, 1, 0, 0, 0, 0, 'XXXXXXXXXXXXXXXXXXX SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(681, 'P000681', '88', 'PORTACOMIDA P-1 *20 DARNEL', 11, 9, 2, NULL, 3992, 4750, 1, 0, 4118, 758, 4900, 'PORTACOMIDA P-1 *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(682, 'P000682', '89', 'PORTACOMIDA T-1 *20 DARNEL', 11, 9, 2, NULL, 8067, 9600, 1, 0, 8067, 1533, 9600, 'PORTACOMIDA T-1 *20 DARNEL', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(683, 'P000683', '9', 'ALMENDRA *125 SURTICOM', 5, 34, 3, NULL, 6500, 6500, 3, 0, 6500, 0, 6500, 'ALMENDRA *125 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(684, 'P000684', '90', 'QUESO TJ X 250 NAZARETH SURTICOM', 5, 34, 3, '', 3200, 3200, 3, 0, 3200, 0, 3200, 'QUESO TJ X 250 NAZARETH SURTICOM', 3250, 3250, 1.56, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-27 23:58:49', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(685, 'P000685', '93', 'SALSA CHOCOLATE *1000 TOLIBOY', 19, 36, 7, NULL, 3109, 3700, 1, 0, 3445, 591, 4100, 'SALSA CHOCOLATE *1000 TOLIBOY', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(686, 'P000686', '95', 'SALCHICHA MANGUERA METRO X 15 SURTICOM', 5, 34, 3, NULL, 14622, 17400, 1, 0, 14622, 2778, 17400, 'SALCHICHA MANGUERA METRO X 15 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(687, 'P000687', '96', 'GUANTE NITRILO NEGRO *100 SURTICOM', 3, 34, 2, NULL, 16639, 19800, 1, 0, 16639, 3161, 19800, 'GUANTE NITRILO NEGRO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:38', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(688, 'P000688', '98', 'PAPEL PARAFINADO *100 SURTICOM', 3, 34, 2, NULL, 5546, 6600, 1, 0, 5546, 1054, 6600, 'PAPEL PARAFINADO *100 SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:39', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(689, 'P000689', 'DESC', 'DESC SURTICOM', 5, 34, 3, NULL, 0, 0, 3, 0, 0, 0, 0, 'DESC SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:39', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(690, 'P000690', 'DEVOL', 'DEVOL SURTICOM', 5, 34, 3, NULL, 0, 0, 3, 0, 0, 0, 0, 'DEVOL SURTICOM', 0, 0, 0.00, 0.00, 0.00, '', NULL, 'color01', '2020-01-16 20:40:39', '2020-01-16 20:40:32', 0, NULL, NULL, 0, NULL, 8, NULL, NULL, '1,', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(691, 'P000691', 'BOLSA', 'IMPUESTO A LAS BOLSAS', 3, 1, 2, '', 0, 0, 3, 0, 200, 0, 200, 'IMPUESTO A LAS BOLSAS', 200, 200, 0.00, 0.00, 0.00, '', '', '', '2020-01-31 22:19:48', '2020-02-08 12:17:23', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(692, 'P000692', '5410376722331', 'PAPA LUTOSA * 2000', 14, 41, 6, '0000000692', 0, 0, 3, 0, 11700, 0, 11700, 'PAPA LUTOSA * 2000', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-02-25 15:58:38', '2020-02-25 15:58:38', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 2, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(693, 'P000693', '7709937898515', 'JAMON PULMAN *500', 12, 42, 3, '0000000693', 0, 0, 3, 0, 4250, 0, 4250, 'JAMON PULMAN *500', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-02-25 19:57:30', '2020-02-25 19:57:30', 0, 0, 0, 0, NULL, 8, NULL, NULL, 'Elija,', 2, NULL, NULL, 0.00, 2, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(694, 'P000694', '7707191090409', 'HAMBURGUESA SABORE *500', 10, 32, 3, '0000000694', 0, 0, 3, 0, 4350, 0, 4350, 'HAMBURGUESA SABORE *500', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-02-25 20:00:53', '2020-02-25 20:00:53', 0, 0, 0, 0, NULL, 8, NULL, NULL, 'Elija,', 2, NULL, NULL, 0.00, 2, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(695, 'P000695', '7707191090409', 'HAMBURGUESA SABORE *500', 10, 32, 3, '0000000695', 0, 0, 3, 0, 4350, 0, 4350, 'HAMBURGUESA SABORE *500', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-02-25 20:02:27', '2020-02-25 20:02:27', 0, 0, 0, 0, NULL, 8, NULL, NULL, 'Elija,', 2, NULL, NULL, 0.00, 2, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(696, 'P000696', '001xxx', 'PRODUCTO DE PRUEBA', 1, 1, 1, '0000000696', 1200, 1200, 3, 0, 1200, 0, 1200, 'PRODUCTO DE PRUEBA', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-03-08 13:11:16', '2020-03-08 13:11:16', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(697, 'P000697', '001XX', 'OTRO PRODUCTO DE PRUEBA', 1, 1, 1, '0000000697', 1200, 1200, 3, 0, 1200, 0, 1200, 'OTRO PRODUCTO DE PRUEBA', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-03-08 13:18:08', '2020-03-08 13:18:08', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 0, 0, NULL, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1),
(698, 'P000698', '001XXXXX', 'OTRO MAS PRODUCTO DE PRUEBA', 1, 3, 1, '', 1200, 1200, 3, 0, 1400, 0, 1400, 'OTRO MAS PRODUCTO DE PRUEBA', 0, 0, 0.00, 0.00, 0.00, '', '', '', '2020-03-08 13:26:46', '2020-03-08 14:02:17', 0, 0, 0, 0, NULL, 8, NULL, NULL, '1,', 2, NULL, NULL, 0.00, 1, 1, 1, 0, 0.00, 0, 0, NULL, NULL, 2, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 0, 0, 0, 0.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
`id` int(11) NOT NULL,
  `purchase_order` varchar(50) CHARACTER SET latin1 NOT NULL,
  `typedoc` int(2) NOT NULL,
  `numdoc` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `tax_id` int(2) NOT NULL,
  `subtot` float NOT NULL,
  `total` float NOT NULL,
  `retention` float NOT NULL,
  `paid` float NOT NULL,
  `discount` float NOT NULL,
  `total_tax` float NOT NULL,
  `difference` float NOT NULL,
  `attachment` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `paidmethod` tinyint(4) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `note` text CHARACTER SET latin1,
  `totalitems` int(2) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_items`
--

CREATE TABLE IF NOT EXISTS `purchase_items` (
`id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qt` int(10) NOT NULL,
  `cost` float NOT NULL,
  `tax_id` int(2) NOT NULL,
  `subtot` float NOT NULL,
  `date_exp` date DEFAULT NULL,
  `date_ven` date DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `in_status` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registers`
--

CREATE TABLE IF NOT EXISTS `registers` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_total` float DEFAULT NULL,
  `cash_sub` float DEFAULT NULL,
  `cc_total` float DEFAULT NULL,
  `cc_sub` float DEFAULT NULL,
  `cheque_total` float DEFAULT NULL,
  `cheque_sub` float DEFAULT NULL,
  `cash_inhand` float DEFAULT NULL,
  `note` text,
  `closed_at` varchar(150) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registers`
--

INSERT INTO `registers` (`id`, `date`, `status`, `user_id`, `cash_total`, `cash_sub`, `cc_total`, `cc_sub`, `cheque_total`, `cheque_sub`, `cash_inhand`, `note`, `closed_at`, `closed_by`, `store_id`) VALUES
(1, '2020-02-25 13:30:30', 0, 2, 337203, 0, 0, 0, 0, 0, 260000, '', '2020-02-25 15:25:05', 2, 1),
(2, '2020-02-25 13:49:58', 0, 1, 0, 0, 0, 0, 0, 0, 2, '', '2020-02-25 10:16:30', 1, 1),
(3, '2020-02-25 14:18:11', 0, 1, 0, 0, 0, 0, 0, 0, 250, '', '2020-02-25 10:19:50', 1, 1),
(4, '2020-02-25 14:20:10', 0, 3, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-25 15:25:59', 3, 1),
(5, '2020-02-25 19:30:20', 0, 7, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 11:31:39', 7, 1),
(6, '2020-02-25 19:30:40', 0, 5, 1492840, 1159550, 0, 0, 0, 0, 260000, '', '2020-02-25 21:36:24', 5, 1),
(7, '2020-02-26 13:02:55', 0, 5, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 11:31:14', 5, 1),
(8, '2020-02-26 13:02:55', 0, 5, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 09:03:10', 5, 1),
(9, '2020-02-26 13:03:30', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 16:08:06', 2, 1),
(10, '2020-02-26 20:12:19', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 16:12:35', 2, 1),
(11, '2020-02-26 20:12:42', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 16:12:49', 2, 1),
(12, '2020-02-26 20:13:17', 0, 5, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-26 21:17:14', 5, 1),
(13, '2020-02-27 13:08:42', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-27 18:26:46', 2, 1),
(14, '2020-02-27 22:29:09', 0, 2, 0, 0, 0, 0, 0, 0, 1, '', '2020-02-27 18:29:47', 2, 1),
(15, '2020-02-27 22:35:49', 0, 5, 0, 761150, 0, 0, 0, 0, 260000, '', '2020-02-27 21:21:13', 5, 1),
(16, '2020-02-28 13:01:56', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-28 16:27:21', 2, 1),
(17, '2020-02-28 13:01:56', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-28 16:27:06', 2, 1),
(18, '2020-02-28 20:31:43', 0, 5, 0, 1328700, 0, 0, 0, 0, 260000, '', '2020-02-28 21:19:08', 5, 1),
(19, '2020-02-29 13:03:19', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-29 15:09:51', 2, 1),
(20, '2020-02-29 13:03:19', 0, 2, 0, 0, 0, 0, 0, 0, 260000, '', '2020-02-29 15:09:40', 2, 1),
(21, '2020-02-29 19:15:26', 0, 5, 0, 1699900, 0, 0, 0, 0, 260000, '', '2020-02-29 21:25:14', 5, 1),
(22, '2020-03-01 14:35:08', 0, 5, 0, 1409150, 0, 0, 0, 0, 260000, '', '2020-03-01 16:19:29', 5, 1),
(23, '2020-03-01 22:28:43', 0, 1, 0, 0, 0, 0, 0, 0, 100000, '', '2020-03-01 20:08:33', 1, 1),
(24, '2020-03-08 13:28:01', 0, 1, 284101, 0, 0, 0, 0, 0, 100000, '', '2020-03-11 10:35:55', 1, 1),
(25, '2020-03-11 14:47:36', 0, 3, 0, 0, 0, 0, 0, 0, 10000, '', '2020-03-12 11:20:11', 3, 1),
(26, '2020-03-11 16:03:51', 0, 1, 0, 0, 0, 0, 0, 0, 123000, '', '2020-03-12 05:41:10', 1, 1),
(27, '2020-03-12 11:28:56', 0, 1, 10000, 0, 0, 0, 0, 0, 100000, '', '2020-03-12 11:19:29', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remisions`
--

CREATE TABLE IF NOT EXISTS `remisions` (
`id` int(11) NOT NULL,
  `store_id_out` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `remisions`
--

INSERT INTO `remisions` (`id`, `store_id_out`, `customer_id`, `total`, `created_by`, `type`, `created_at`) VALUES
(1, 1, 0, 69850, 1, 1, '2020-03-11 23:38:34'),
(2, 1, 0, 116900, 1, 3, '2020-03-11 23:49:20'),
(3, 1, 0, 116900, 1, 2, '2020-03-11 23:59:07'),
(4, 1, 1, 116900, 1, 1, '2020-03-12 00:03:08'),
(5, 1, 1, 116900, 1, 1, '2020-03-12 00:10:14'),
(6, 1, 1, 3600, 3, 2, '2020-03-12 00:16:35'),
(7, 1, 1, 44750, 3, 3, '2020-03-12 00:26:52'),
(8, 1, 1, 44750, 3, 3, '2020-03-12 00:26:52'),
(9, 1, 1, 4000, 1, 1, '2020-03-12 11:29:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision_items`
--

CREATE TABLE IF NOT EXISTS `remision_items` (
`id` int(11) NOT NULL,
  `remision_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qt` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `remision_items`
--

INSERT INTO `remision_items` (`id`, `remision_id`, `product_id`, `price`, `qt`) VALUES
(1, 1, 246, 3450, 1),
(2, 1, 40, 4000, 1),
(3, 1, 249, 5200, 12),
(4, 2, 246, 3500, 7),
(5, 2, 40, 5000, 6),
(6, 2, 249, 5200, 12),
(7, 3, 246, 3500, 7),
(8, 3, 40, 5000, 6),
(9, 3, 249, 5200, 12),
(10, 4, 246, 3500, 7),
(11, 4, 40, 5000, 6),
(12, 4, 249, 5200, 12),
(13, 5, 246, 3500, 7),
(14, 5, 40, 5000, 6),
(15, 5, 249, 5200, 12),
(16, 6, 152, 3600, 1),
(17, 7, 246, 3450, 11),
(18, 7, 39, 3400, 2),
(19, 8, 246, 3450, 11),
(20, 8, 39, 3400, 2),
(21, 9, 40, 4000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `return_sales`
--

CREATE TABLE IF NOT EXISTS `return_sales` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qt` float NOT NULL,
  `price` float NOT NULL,
  `taxvalue` float NOT NULL,
  `register_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`id` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `clientname` varchar(50) NOT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `discount` varchar(5) DEFAULT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL,
  `created_at` timestamp NOT NULL,
  `modified_at` varchar(150) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `totalitems` int(20) NOT NULL,
  `paid` decimal(10,0) DEFAULT NULL,
  `paidmethod` varchar(700) DEFAULT NULL,
  `taxamount` float DEFAULT NULL,
  `discountamount` float DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `firstpayement` float DEFAULT NULL,
  `in_activo` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `invoice`, `client_id`, `clientname`, `tax`, `discount`, `subtotal`, `total`, `created_at`, `modified_at`, `status`, `created_by`, `totalitems`, `paid`, `paidmethod`, `taxamount`, `discountamount`, `register_id`, `firstpayement`, `in_activo`) VALUES
(1, 23896, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-25 13:50:33', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 1, 7200, 1),
(2, 23897, 0, 'Público General', '0%', '', 9401, 9401, '2020-02-25 14:06:48', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 1, 9401, 1),
(3, 23898, 0, 'Público General', '0%', '', 4000, 4000, '2020-02-25 14:42:49', NULL, 0, 'Wendy J Gonzalez', 2, 5000, '0', 0, 0, 1, 4000, 1),
(4, 23899, 0, 'Público General', '0%', '', 40400, 40400.3, '2020-02-25 15:01:27', NULL, 0, 'Wendy J Gonzalez', 5, 40400, '0', 0, 0, 1, 40400, 1),
(5, 23900, 0, 'Público General', '0%', '8', 192102, 208807, '2020-02-26 00:57:21', NULL, 2, 'Wendy J Gonzalez', 28, 192100, '3', 0, 14037.4, 1, 0, 1),
(6, 23901, 0, 'Público General', '0%', '', 4100, 4099.55, '2020-02-25 15:15:26', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 1, 4100, 1),
(7, 23902, 0, 'Público General', '0%', '', 45700, 45699.9, '2020-02-25 15:25:06', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 1, 45700, 2),
(8, 23903, 0, 'Público General', '0%', '', 45999, 45999.1, '2020-02-25 15:28:29', NULL, 0, 'Wendy J Gonzalez', 4, 46000, '0', 0, 0, 1, 45999, 1),
(9, 23904, 0, 'Público General', '0%', '', 4601, 4600.54, '2020-02-25 15:32:29', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 1, 4601, 1),
(10, 23905, 0, 'Público General', '0%', '', 5800, 5800.06, '2020-02-25 15:52:06', NULL, 0, 'Wendy J Gonzalez', 2, 7000, '0', 0, 0, 1, 5800, 1),
(11, 23906, 0, 'Público General', '0%', '', 200, 200, '2020-02-25 16:14:40', NULL, 0, 'Wendy J Gonzalez', 4, 200, '0', 0, 0, 1, 200, 1),
(12, 23907, 0, 'Público General', '0%', '', 51600, 51599.6, '2020-02-25 16:30:55', NULL, 0, 'Wendy J Gonzalez', 5, 51600, '0', 0, 0, 1, 51600, 1),
(13, 23908, 0, 'Público General', '0%', '', 3002, 3001.99, '2020-02-25 16:36:03', NULL, 0, 'Wendy J Gonzalez', 2, 3002, '0', 0, 0, 1, 3002, 1),
(14, 23909, 0, 'Público General', '0%', '', 2000, 2000.39, '2020-02-25 16:42:50', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 1, 2000, 1),
(15, 23910, 0, 'Público General', '0%', '', 22900, 22900.3, '2020-02-25 16:44:33', NULL, 0, 'Wendy J Gonzalez', 4, 23000, '0', 0, 0, 1, 22900, 1),
(16, 23911, 0, 'Público General', '0%', '', 10300, 10300, '2020-02-25 17:33:17', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 1, 10300, 1),
(17, 23912, 0, 'Público General', '0%', '', 9800, 9800, '2020-02-25 17:35:58', NULL, 0, 'Wendy J Gonzalez', 3, 9800, '0', 0, 0, 1, 9800, 1),
(18, 23913, 0, 'Público General', '0%', '', 47600, 47600, '2020-02-25 17:42:56', NULL, 0, 'Wendy J Gonzalez', 5, 47600, '0', 0, 0, 1, 47600, 1),
(19, 23914, 0, 'Público General', '0%', '', 4100, 4100, '2020-02-25 17:47:34', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 1, 4100, 1),
(20, 23915, 0, 'Público General', '0%', '', 5800, 5800, '2020-02-25 17:58:22', NULL, 0, 'Wendy J Gonzalez', 1, 6000, '0', 0, 0, 1, 5800, 1),
(21, 23916, 0, 'Público General', '0%', '', 12700, 12700, '2020-02-25 18:32:03', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 1, 12700, 1),
(22, 23917, 0, 'Público General', '0%', '', 22250, 22250, '2020-02-25 19:34:50', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 6, 22250, 1),
(23, 23918, 0, 'Público General', '0%', '', 5600, 5600, '2020-02-25 19:36:50', NULL, 0, 'Thalia  Gonzalez', 2, 5600, '0', 0, 0, 6, 5600, 1),
(24, 23919, 0, 'Público General', '0%', '', 4500, 4499.98, '2020-02-25 19:37:15', NULL, 0, 'Thalia  Gonzalez', 3, 5000, '0', 0, 0, 6, 4500, 1),
(25, 23920, 0, 'Público General', '0%', '', 17000, 17000, '2020-02-25 19:37:51', NULL, 0, 'Thalia  Gonzalez', 1, 17000, '0', 0, 0, 6, 17000, 1),
(26, 23921, 0, 'Público General', '0%', '', 200, 200, '2020-02-25 19:55:52', NULL, 0, 'Thalia  Gonzalez', 1, 200, '0', 0, 0, 6, 200, 1),
(27, 23922, 0, 'Público General', '0%', '', 4700, 4700, '2020-02-25 20:01:15', NULL, 0, 'Thalia  Gonzalez', 2, 4700, '0', 0, 0, 6, 4700, 1),
(28, 23923, 0, 'Público General', '0%', '', 293100, 293100, '2020-02-25 20:33:49', NULL, 0, 'Thalia  Gonzalez', 23, 293100, '0', 0, 0, 6, 293100, 2),
(29, 23924, 0, 'Público General', '0%', '', 129400, 129400, '2020-02-25 20:19:57', NULL, 0, 'Thalia  Gonzalez', 21, 130000, '0', 0, 0, 6, 129400, 1),
(30, 23925, 0, 'Público General', '0%', '', 5600, 5600, '2020-02-25 20:20:42', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 6, 5600, 1),
(31, 23926, 0, 'Público General', '0%', '', 8200, 8199.99, '2020-02-25 20:21:46', NULL, 0, 'Thalia  Gonzalez', 2, 50000, '0', 0, 0, 6, 8200, 1),
(32, 23927, 0, 'Público General', '0%', '', 3150, 3150, '2020-02-25 20:23:01', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 6, 3150, 1),
(33, 23928, 0, 'Público General', '0%', '', 2000, 2000, '2020-02-25 20:23:34', NULL, 0, 'Thalia  Gonzalez', 1, 2000, '0', 0, 0, 6, 2000, 1),
(34, 23929, 0, 'Público General', '0%', '', 4900, 4900, '2020-02-25 20:28:12', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 6, 4900, 1),
(35, 23930, 0, 'Público General', '0%', '', 329400, 329400, '2020-02-25 20:45:56', NULL, 1, 'Thalia  Gonzalez', 23, 0, '3', 0, 0, 6, 0, 2),
(36, 23931, 0, 'Público General', '0%', '', 328350, 328350, '2020-02-25 20:21:44', NULL, 0, 'Thalia  Gonzalez', 23, 328350, '3', 0, 0, 6, 0, 1),
(37, 23932, 0, 'Público General', '0%', '', 3500, 3500, '2020-02-25 21:03:10', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 6, 3500, 1),
(38, 23933, 0, 'Público General', '0%', '', 6150, 6150, '2020-02-25 21:09:44', NULL, 0, 'Thalia  Gonzalez', 3, 7000, '0', 0, 0, 6, 6150, 1),
(39, 23934, 0, 'Público General', '0%', '', 69750, 69749.9, '2020-02-25 22:48:52', NULL, 0, 'Thalia  Gonzalez', 5, 69750, '3', 0, 0, 6, 0, 1),
(40, 23935, 0, 'Público General', '0%', '', 2500, 2500, '2020-02-25 21:30:38', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 6, 2500, 1),
(41, 23936, 0, 'Público General', '0%', '', 36200, 36200, '2020-02-25 21:44:11', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 6, 36200, 1),
(42, 23937, 0, 'Público General', '0%', '6', 60489, 64349.9, '2020-02-25 21:49:16', NULL, 0, 'Thalia  Gonzalez', 13, 60500, '0', 0, 3244.53, 6, 60489, 1),
(43, 23938, 0, 'Público General', '0%', '', 11000, 11000, '2020-02-25 21:52:11', NULL, 0, 'Thalia  Gonzalez', 5, 11000, '0', 0, 0, 6, 11000, 1),
(44, 23939, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-25 22:00:39', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 6, 4800, 1),
(45, 23940, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-25 22:01:04', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 6, 4800, 1),
(46, 23941, 0, 'Público General', '0%', '', 11200, 11200, '2020-02-25 22:08:14', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 6, 11200, 1),
(47, 23942, 0, 'Público General', '0%', '', 1400, 1400, '2020-02-25 22:09:13', NULL, 0, 'Thalia  Gonzalez', 1, 1400, '0', 0, 0, 6, 1400, 1),
(48, 23943, 0, 'Público General', '0%', '', 13000, 13000, '2020-02-25 22:14:16', NULL, 0, 'Thalia  Gonzalez', 0, 50000, '0', 0, 0, 6, 13000, 1),
(49, 23944, 0, 'Público General', '0%', '', 2300, 2300, '2020-02-25 22:18:22', NULL, 0, 'Thalia  Gonzalez', 1, 2300, '0', 0, 0, 6, 2300, 1),
(50, 23945, 0, 'Público General', '0%', '', 8400, 8400.01, '2020-02-25 22:25:39', NULL, 0, 'Thalia  Gonzalez', 3, 10000, '0', 0, 0, 6, 8400, 1),
(51, 23946, 0, 'Público General', '0%', '', 293800, 293800, '2020-02-26 01:01:26', NULL, 2, 'Thalia  Gonzalez', 25, 277000, '3', 0, 0, 6, 0, 1),
(52, 23947, 0, 'Público General', '0%', '', 8000, 8000, '2020-02-25 22:49:42', NULL, 1, 'Thalia  Gonzalez', 8, 0, '3', 0, 0, 6, 0, 1),
(53, 23948, 0, 'Público General', '0%', '', 6300, 6300, '2020-02-25 22:53:51', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 6, 6300, 1),
(54, 23949, 0, 'Público General', '0%', '', 1600, 1600, '2020-02-25 23:05:31', NULL, 0, 'Thalia  Gonzalez', 1, 2000, '0', 0, 0, 6, 1600, 1),
(55, 23950, 0, 'Público General', '0%', '', 143020, 143020, '2020-02-26 00:50:14', NULL, 0, 'Thalia  Gonzalez', 24, 143050, '3', 0, 0, 6, 0, 1),
(56, 23951, 0, 'Público General', '0%', '', 4600, 4600, '2020-02-25 23:16:12', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 6, 4600, 1),
(57, 23952, 0, 'Público General', '0%', '', 4600, 4600, '2020-02-25 23:19:53', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 6, 4600, 1),
(58, 23953, 0, 'Público General', '0%', '', 850, 850, '2020-02-25 23:20:43', NULL, 0, 'Thalia  Gonzalez', 1, 900, '0', 0, 0, 6, 850, 1),
(59, 23954, 0, 'Público General', '0%', '', 13750, 13750, '2020-02-25 23:24:03', NULL, 0, 'Thalia  Gonzalez', 0, 14000, '0', 0, 0, 6, 13750, 1),
(60, 23955, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-25 23:47:02', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 6, 4800, 1),
(61, 23956, 0, 'Público General', '0%', '', 25050, 25050, '2020-02-26 00:49:18', NULL, 0, 'Thalia  Gonzalez', 4, 25050, '3', 0, 0, 6, 0, 1),
(62, 23957, 0, 'Público General', '0%', '', 21500, 21500, '2020-02-26 00:00:50', NULL, 0, 'Thalia  Gonzalez', 104, 40000, '0', 0, 0, 6, 21500, 1),
(63, 23958, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-26 00:05:00', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 6, 3600, 1),
(64, 23959, 0, 'Público General', '0%', '', 18350, 18350, '2020-02-26 00:06:22', NULL, 0, 'Thalia  Gonzalez', 4, 20000, '0', 0, 0, 6, 18350, 1),
(65, 23960, 0, 'Público General', '0%', '', 6400, 6400, '2020-02-26 00:19:05', NULL, 0, 'Thalia  Gonzalez', 2, 20000, '0', 0, 0, 6, 6400, 1),
(66, 23961, 0, 'Público General', '0%', '', 4500, 4500, '2020-02-26 00:21:25', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 6, 4500, 1),
(67, 23962, 0, 'Público General', '0%', '', 2800, 2800, '2020-02-26 00:21:59', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 6, 2800, 1),
(68, 23963, 0, 'Público General', '0%', '', 8400, 8400.01, '2020-02-26 00:24:09', NULL, 0, 'Thalia  Gonzalez', 3, 9000, '0', 0, 0, 6, 8400, 1),
(69, 23964, 0, 'Público General', '0%', '', 9600, 9600, '2020-02-26 00:47:14', NULL, 0, 'Thalia  Gonzalez', 2, 20000, '0', 0, 0, 6, 9600, 1),
(70, 23965, 0, 'Público General', '0%', '', 7900, 7900, '2020-02-26 00:48:38', NULL, 0, 'Thalia  Gonzalez', 2, 20000, '0', 0, 0, 6, 7900, 1),
(71, 23966, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-26 13:03:47', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 9, 7200, 1),
(72, 23967, 0, 'Público General', '0%', '', 17750, 17750, '2020-02-26 13:29:23', NULL, 0, 'Wendy J Gonzalez', 7, 20000, '0', 0, 0, 9, 17750, 1),
(73, 23968, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-26 14:15:41', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 9, 3600, 1),
(74, 23969, 0, 'Público General', '0%', '', 17000, 17000, '2020-02-26 14:21:40', NULL, 0, 'Wendy J Gonzalez', 1, 17000, '0', 0, 0, 9, 17000, 1),
(75, 23970, 0, 'Público General', '0%', '', 71000, 71000, '2020-02-26 14:27:44', NULL, 0, 'Wendy J Gonzalez', 4, 100000, '0', 0, 0, 9, 71000, 1),
(76, 23971, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-26 14:41:54', NULL, 0, 'Wendy J Gonzalez', 1, 3600, '0', 0, 0, 9, 3600, 1),
(77, 23972, 0, 'Público General', '0%', '', 5600, 5600, '2020-02-26 15:10:37', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 9, 5600, 1),
(78, 23973, 0, 'Público General', '0%', '', 8000, 8000, '2020-02-26 15:25:39', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 9, 8000, 1),
(79, 23974, 0, 'Público General', '0%', '', 2800, 2800, '2020-02-26 15:27:02', NULL, 0, 'Wendy J Gonzalez', 1, 2800, '0', 0, 0, 9, 2800, 1),
(80, 23975, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-26 15:40:36', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 9, 1500, 1),
(81, 23976, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-26 16:04:34', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 9, 7200, 1),
(82, 23977, 0, 'Público General', '0%', '', 14650, 14650, '2020-02-26 16:28:12', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 9, 14650, 1),
(83, 23978, 0, 'Público General', '0%', '', 14650, 0, '2020-02-26 16:28:12', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 9, 14650, 2),
(84, 23979, 0, 'Público General', '0%', '', 14650, 0, '2020-02-26 16:28:12', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 9, 14650, 2),
(85, 23980, 0, 'Público General', '0%', '', 500, 500, '2020-02-26 16:28:43', NULL, 0, 'Wendy J Gonzalez', 1, 500, '0', 0, 0, 9, 500, 1),
(86, 23981, 0, 'Público General', '0%', '', 6800, 6800, '2020-02-26 16:31:21', NULL, 0, 'Wendy J Gonzalez', 5, 7000, '0', 0, 0, 9, 6800, 1),
(87, 23982, 0, 'Público General', '0%', '', 11000, 11000, '2020-02-26 16:45:20', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 9, 11000, 1),
(88, 23983, 0, 'Público General', '0%', '', 3000, 2999.99, '2020-02-26 17:03:30', NULL, 0, 'Wendy J Gonzalez', 2, 3000, '0', 0, 0, 9, 3000, 1),
(89, 23984, 0, 'Público General', '0%', '', 46800, 46800, '2020-02-26 17:07:34', NULL, 0, 'Wendy J Gonzalez', 7, 46800, '0', 0, 0, 9, 46800, 1),
(90, 23985, 0, 'Público General', '0%', '', 3000, 3000, '2020-02-26 17:25:33', NULL, 0, 'Wendy J Gonzalez', 1, 3000, '0', 0, 0, 9, 3000, 1),
(91, 23986, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-26 17:26:08', NULL, 0, 'Wendy J Gonzalez', 1, 6000, '0', 0, 0, 9, 5000, 1),
(92, 23987, 0, 'Público General', '0%', '', 2150, 2150, '2020-02-26 17:45:14', NULL, 0, 'Wendy J Gonzalez', 1, 2200, '0', 0, 0, 9, 2150, 1),
(93, 23988, 0, 'Público General', '0%', '', 25850, 25850, '2020-02-26 18:17:31', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 9, 25850, 1),
(94, 23989, 0, 'Público General', '0%', '', 3000, 3000, '2020-02-26 18:23:53', NULL, 0, 'Wendy J Gonzalez', 1, 3000, '0', 0, 0, 9, 3000, 1),
(95, 23990, 0, 'Público General', '0%', '', 8200, 8200, '2020-02-26 18:34:46', NULL, 0, 'Wendy J Gonzalez', 3, 10000, '0', 0, 0, 9, 8200, 1),
(96, 23991, 0, 'Público General', '0%', '', 8300, 8300, '2020-02-26 18:44:47', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 9, 8300, 1),
(97, 23992, 0, 'Público General', '0%', '', 38100, 38100.1, '2020-02-26 19:19:20', NULL, 0, 'Wendy J Gonzalez', 3, 38100, '0', 0, 0, 9, 38100, 1),
(98, 23993, 0, 'Público General', '0%', '', 44250, 44250, '2020-02-26 19:32:15', NULL, 0, 'Wendy J Gonzalez', 13, 45000, '0', 0, 0, 9, 44250, 1),
(99, 23994, 0, 'Público General', '0%', '', 14000, 14000, '2020-02-26 19:42:38', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 9, 14000, 1),
(100, 23995, 0, 'Público General', '0%', '', 4500, 4500, '2020-02-26 19:43:45', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 9, 4500, 1),
(101, 23996, 0, 'Público General', '0%', '', 55000, 55000, '2020-02-26 20:15:32', NULL, 0, 'Thalia  Gonzalez', 25, 55000, '0', 0, 0, 12, 55000, 1),
(102, 23997, 0, 'Público General', '0%', '', 15500, 15500, '2020-02-26 20:17:38', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 12, 15500, 1),
(103, 23998, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-26 20:23:38', NULL, 0, 'Thalia  Gonzalez', 3, 5000, '0', 0, 0, 12, 4800, 1),
(104, 23999, 0, 'Público General', '0%', '', 24000, 24000, '2020-02-26 20:24:19', NULL, 1, 'Thalia  Gonzalez', 2, 0, '3', 0, 0, 12, 0, 1),
(105, 24000, 0, 'Público General', '0%', '', 19750, 19750, '2020-02-26 20:33:08', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 12, 19750, 1),
(106, 24001, 0, 'Público General', '0%', '', 146950, 146950, '2020-02-26 21:21:07', NULL, 0, 'Thalia  Gonzalez', 19, 146950, '0', 0, 0, 12, 146950, 1),
(107, 24002, 0, 'Público General', '0%', '', 5800, 5799.99, '2020-02-26 21:22:14', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 12, 5800, 1),
(108, 24003, 0, 'Público General', '0%', '', 70400, 70400, '2020-02-26 21:54:01', NULL, 0, 'Thalia  Gonzalez', 6, 70400, '0', 0, 0, 12, 70400, 2),
(109, 24004, 0, 'Público General', '0%', '', 2400, 2400, '2020-02-26 21:26:34', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 12, 2400, 1),
(110, 24005, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-26 21:27:16', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 12, 3600, 1),
(111, 24006, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-26 21:36:03', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 12, 3600, 1),
(112, 24007, 0, 'Público General', '0%', '', 4200, 4200, '2020-02-26 21:38:43', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 12, 4200, 1),
(113, 24008, 0, 'Público General', '0%', '', 52800, 52800, '2020-02-26 22:55:27', NULL, 0, 'Thalia  Gonzalez', 4, 52800, '0', 0, 0, 12, 52800, 2),
(114, 24009, 0, 'Público General', '0%', '', 26000, 26000, '2020-02-26 22:38:55', NULL, 0, 'Thalia  Gonzalez', 1, 30000, '0', 0, 0, 12, 26000, 1),
(115, 24010, 0, 'Público General', '0%', '', 13750, 13750, '2020-02-26 22:40:45', NULL, 0, 'Thalia  Gonzalez', 0, 50000, '0', 0, 0, 12, 13750, 1),
(116, 24011, 0, 'Público General', '0%', '', 60450, 60450, '2020-02-26 22:42:33', NULL, 0, 'Thalia  Gonzalez', 13, 62000, '0', 0, 0, 12, 60450, 1),
(117, 24012, 0, 'Público General', '0%', '', 24400, 24400, '2020-02-26 22:43:47', NULL, 0, 'Thalia  Gonzalez', 204, 24400, '0', 0, 0, 12, 24400, 1),
(118, 24013, 0, 'Público General', '0%', '', 3500, 3500, '2020-02-26 22:45:02', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 12, 3500, 1),
(119, 24014, 0, 'Público General', '0%', '', 20700, 20700, '2020-02-26 22:46:30', NULL, 1, 'Thalia  Gonzalez', 27, 0, '0', 0, 0, 12, 0, 1),
(120, 24015, 0, 'Público General', '0%', '', 9750, 9750, '2020-02-26 22:47:42', NULL, 0, 'Thalia  Gonzalez', 24, 10000, '0', 0, 0, 12, 9750, 1),
(121, 24016, 0, 'Público General', '0%', '', 5600, 5600.01, '2020-02-26 22:48:40', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 12, 5600, 1),
(122, 24017, 0, 'Público General', '0%', '', 5600, 5600.01, '2020-02-26 22:49:15', NULL, 0, 'Thalia  Gonzalez', 2, 6000, '0', 0, 0, 12, 5600, 1),
(123, 24018, 0, 'Público General', '0%', '', 8400, 8400.01, '2020-02-26 22:49:39', NULL, 0, 'Thalia  Gonzalez', 3, 20000, '0', 0, 0, 12, 8400, 1),
(124, 24019, 0, 'Público General', '0%', '', 17000, 17000, '2020-02-26 22:54:57', NULL, 0, 'Thalia  Gonzalez', 1, 17000, '0', 0, 0, 12, 17000, 1),
(125, 24020, 0, 'Público General', '0%', '', 51300, 51300, '2020-02-26 22:57:19', NULL, 0, 'Thalia  Gonzalez', 4, 51300, '0', 0, 0, 12, 51300, 1),
(126, 24021, 0, 'Público General', '0%', '', 3800, 3800, '2020-02-26 23:06:20', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 12, 3800, 1),
(127, 24022, 0, 'Público General', '0%', '', 8600, 8600, '2020-02-26 23:21:12', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 12, 8600, 1),
(128, 24023, 0, 'Público General', '0%', '', 25800, 25800, '2020-02-26 23:26:40', NULL, 0, 'Thalia  Gonzalez', 3, 26000, '0', 0, 0, 12, 25800, 1),
(129, 24024, 0, 'Público General', '0%', '', 26000, 26000, '2020-02-26 23:27:24', NULL, 0, 'Thalia  Gonzalez', 1, 26000, '0', 0, 0, 12, 26000, 1),
(130, 24025, 0, 'Público General', '0%', '', 111000, 111000, '2020-02-26 23:44:04', NULL, 0, 'Thalia  Gonzalez', 14, 111000, '0', 0, 0, 12, 111000, 1),
(131, 24026, 0, 'Público General', '0%', '', 6500, 6500, '2020-02-26 23:53:18', NULL, 0, 'Thalia  Gonzalez', 3, 10000, '0', 0, 0, 12, 6500, 1),
(132, 24027, 0, 'Público General', '0%', '', 29250, 29250, '2020-02-27 00:13:26', NULL, 0, 'Thalia  Gonzalez', 2, 30000, '0', 0, 0, 12, 29250, 1),
(133, 24028, 0, 'Público General', '0%', '', 14750, 14750, '2020-02-27 00:25:40', NULL, 0, 'Thalia  Gonzalez', 3, 16000, '0', 0, 0, 12, 14750, 1),
(134, 24029, 0, 'Público General', '0%', '', 12300, 12300, '2020-02-27 00:27:26', NULL, 0, 'Thalia  Gonzalez', 3, 12300, '0', 0, 0, 12, 12300, 1),
(135, 24030, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-27 00:28:53', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 12, 3600, 1),
(136, 24031, 0, 'Público General', '0%', '', 3750, 3750, '2020-02-27 00:40:19', NULL, 0, 'Thalia  Gonzalez', 2, 4000, '0', 0, 0, 12, 3750, 1),
(137, 24032, 0, 'Público General', '0%', '', 5300, 5300, '2020-02-27 00:53:35', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 12, 5300, 1),
(138, 24033, 0, 'Público General', '0%', '', 12700, 12700, '2020-02-27 13:14:52', NULL, 0, 'Wendy J Gonzalez', 3, 14000, '0', 0, 0, 13, 12700, 1),
(139, 24034, 0, 'Público General', '0%', '', 33550, 33550, '2020-02-27 13:48:02', NULL, 0, 'Wendy J Gonzalez', 5, 34000, '0', 0, 0, 13, 33550, 1),
(140, 24035, 0, 'Público General', '0%', '', 297000, 297000, '2020-02-27 14:02:22', NULL, 0, 'Wendy J Gonzalez', 39, 297000, '0', 0, 0, 13, 297000, 1),
(141, 24036, 0, 'Público General', '0%', '', 8300, 8300, '2020-02-27 14:04:06', NULL, 0, 'Wendy J Gonzalez', 2, 8300, '0', 0, 0, 13, 8300, 1),
(142, 24037, 0, 'Público General', '0%', '', 20000, 20000, '2020-02-27 14:05:02', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 13, 20000, 1),
(143, 24038, 0, 'Público General', '0%', '', 52100, 52100, '2020-02-27 14:27:37', NULL, 0, 'Wendy J Gonzalez', 16, 53000, '0', 0, 0, 13, 52100, 1),
(144, 24039, 0, 'Público General', '0%', '', 37500, 37500, '2020-02-27 14:44:26', NULL, 0, 'Wendy J Gonzalez', 4, 37500, '0', 0, 0, 13, 37500, 1),
(145, 24040, 0, 'Público General', '0%', '', 9100, 9100, '2020-02-27 14:53:27', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 13, 9100, 1),
(146, 24041, 0, 'Público General', '0%', '', 6700, 6700, '2020-02-27 14:59:59', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 13, 6700, 1),
(147, 24042, 0, 'Público General', '0%', '', 12800, 12800, '2020-02-27 15:13:31', NULL, 0, 'Wendy J Gonzalez', 3, 20000, '0', 0, 0, 13, 12800, 1),
(148, 24043, 0, 'Público General', '0%', '', 5850, 5850, '2020-02-27 15:17:24', NULL, 0, 'Wendy J Gonzalez', 51, 5850, '0', 0, 0, 13, 5850, 1),
(149, 24044, 0, 'Público General', '0%', '', 3200, 3200, '2020-02-27 15:19:25', NULL, 0, 'Wendy J Gonzalez', 21, 4000, '0', 0, 0, 13, 3200, 1),
(150, 24045, 0, 'Público General', '0%', '', 500, 500, '2020-02-27 15:42:02', NULL, 0, 'Wendy J Gonzalez', 1, 500, '0', 0, 0, 13, 500, 1),
(151, 24046, 0, 'Público General', '0%', '', 16700, 16700, '2020-02-27 15:50:25', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 13, 16700, 1),
(152, 24047, 0, 'Público General', '0%', '', 9200, 9200, '2020-02-27 15:51:18', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 13, 9200, 1),
(153, 24048, 0, 'Público General', '0%', '', 65500, 65500, '2020-02-27 15:54:28', NULL, 0, 'Wendy J Gonzalez', 8, 65500, '0', 0, 0, 13, 65500, 1),
(154, 24049, 0, 'Público General', '0%', '', 24100, 24100, '2020-02-27 16:03:42', NULL, 0, 'Wendy J Gonzalez', 12, 24100, '0', 0, 0, 13, 24100, 1),
(155, 24050, 0, 'Público General', '0%', '', 254400, 254400, '2020-02-27 16:28:36', NULL, 0, 'Wendy J Gonzalez', 40, 254400, '0', 0, 0, 13, 254400, 1),
(156, 24051, 0, 'Público General', '0%', '', 68000, 68000.1, '2020-02-27 17:18:29', NULL, 0, 'Wendy J Gonzalez', 1, 68000, '0', 0, 0, 13, 68000, 1),
(157, 24052, 0, 'Público General', '0%', '', 2000, 2000, '2020-02-27 17:26:07', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 13, 2000, 1),
(158, 24053, 0, 'Público General', '0%', '', 5800, 5800, '2020-02-27 17:33:37', NULL, 0, 'Wendy J Gonzalez', 1, 5800, '0', 0, 0, 13, 5800, 1),
(159, 24054, 0, 'Público General', '0%', '', 12600, 12600, '2020-02-27 17:48:22', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 13, 12600, 1),
(160, 24055, 0, 'Público General', '0%', '', 11400, 11400, '2020-02-27 18:27:07', NULL, 0, 'Wendy J Gonzalez', 4, 50000, '0', 0, 0, 13, 11400, 1),
(161, 24056, 0, 'Público General', '0%', '', -17000, -17000, '2020-02-27 18:55:34', NULL, 0, 'Wendy J Gonzalez', -1, -17000, '0', 0, 0, 13, -17000, 1),
(162, 24057, 0, 'Público General', '0%', '', -81600, -81599.9, '2020-02-27 18:57:07', NULL, 0, 'Wendy J Gonzalez', 0, -81600, '0', 0, 0, 13, -81600, 1),
(163, 24058, 0, 'Público General', '0%', '', 26600, 26600, '2020-02-27 19:04:12', NULL, 0, 'Wendy J Gonzalez', 4, 26600, '0', 0, 0, 13, 26600, 1),
(164, 24059, 0, 'Público General', '0%', '', 67200, 67199.8, '2020-02-27 19:25:26', NULL, 0, 'Wendy J Gonzalez', 4, 67200, '0', 0, 0, 13, 67200, 1),
(165, 24060, 0, 'Público General', '0%', '', 4700, 4700, '2020-02-27 19:29:49', NULL, 0, 'Wendy J Gonzalez', 2, 4700, '0', 0, 0, 13, 4700, 1),
(166, 24061, 0, 'Público General', '0%', '', 5700, 5700, '2020-02-27 19:32:08', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 13, 5700, 1),
(167, 24062, 0, 'Público General', '0%', '', 12600, 12600, '2020-02-27 19:41:35', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 13, 12600, 1),
(168, 24063, 0, 'Público General', '0%', '', 1700, 1700, '2020-02-27 20:06:24', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 13, 1700, 1),
(169, 24064, 0, 'Público General', '0%', '', 4900, 4900.01, '2020-02-27 20:09:47', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 13, 4900, 1),
(170, 24065, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-27 20:17:31', NULL, 0, 'Wendy J Gonzalez', 1, 100000, '0', 0, 0, 13, 5000, 1),
(171, 24066, 0, 'Público General', '0%', '', 121770, 121770, '2020-02-27 20:27:17', NULL, 0, 'Wendy J Gonzalez', 39, 121770, '0', 0, 0, 13, 121770, 1),
(172, 24067, 0, 'Público General', '0%', '', 27500, 27500, '2020-02-27 20:47:38', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 13, 27500, 1),
(173, 24068, 0, 'Público General', '0%', '', 11300, 11300, '2020-02-27 21:03:26', NULL, 0, 'Wendy J Gonzalez', 4, 20000, '0', 0, 0, 13, 11300, 1),
(174, 24069, 0, 'Público General', '0%', '', 7500, 7500, '2020-02-27 21:12:04', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 13, 7500, 1),
(175, 24070, 0, 'Público General', '0%', '', 12900, 12900, '2020-02-27 21:14:21', NULL, 0, 'Wendy J Gonzalez', 2, 12900, '0', 0, 0, 13, 12900, 1),
(176, 24071, 0, 'Público General', '0%', '', 41300, 41300, '2020-02-27 21:21:37', NULL, 0, 'Wendy J Gonzalez', 6, 50000, '0', 0, 0, 13, 41300, 1),
(177, 24072, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-27 21:37:57', NULL, 0, 'Wendy J Gonzalez', 1, 4000, '0', 0, 0, 13, 3600, 1),
(178, 24073, 0, 'Público General', '0%', '', 14000, 14000, '2020-02-27 21:55:24', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 13, 14000, 1),
(179, 24074, 0, 'Público General', '0%', '', 12700, 12700, '2020-02-27 21:56:30', NULL, 0, 'Wendy J Gonzalez', 1, 15000, '0', 0, 0, 13, 12700, 1),
(180, 24075, 0, 'Público General', '0%', '', 10150, 10150, '2020-02-27 22:01:00', NULL, 0, 'Wendy J Gonzalez', 101, 50000, '0', 0, 0, 13, 10150, 1),
(181, 24076, 0, 'Público General', '0%', '', 4500, 4500, '2020-02-27 22:14:46', NULL, 0, 'Wendy J Gonzalez', 15, 5000, '0', 0, 0, 13, 4500, 1),
(182, 24077, 0, 'Público General', '0%', '', 222150, 222150, '2020-02-27 22:42:06', NULL, 0, 'Thalia  Gonzalez', 232, 222150, '0', 0, 0, 15, 222150, 1),
(183, 24078, 0, 'Público General', '0%', '', 31750, 31750, '2020-02-27 22:50:22', NULL, 0, 'Thalia  Gonzalez', 28, 32000, '0', 0, 0, 15, 31750, 1),
(184, 24079, 0, 'Público General', '0%', '', 3500, 3500, '2020-02-27 22:53:33', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 15, 3500, 1),
(185, 24080, 0, 'Público General', '0%', '', 12400, 12400, '2020-02-27 22:55:42', NULL, 0, 'Thalia  Gonzalez', 3, 20000, '0', 0, 0, 15, 12400, 1),
(186, 24081, 0, 'Público General', '0%', '', 2700, 2700, '2020-02-27 23:02:39', NULL, 0, 'Thalia  Gonzalez', 1, 2700, '0', 0, 0, 15, 2700, 1),
(187, 24082, 0, 'Público General', '0%', '', 4600, 4600, '2020-02-27 23:04:38', NULL, 0, 'Thalia  Gonzalez', 1, 4600, '0', 0, 0, 15, 4600, 1),
(188, 24083, 0, 'Público General', '0%', '', 27100, 27100, '2020-02-27 23:07:41', NULL, 0, 'Thalia  Gonzalez', 4, 27100, '0', 0, 0, 15, 27100, 1),
(189, 24084, 0, 'Público General', '0%', '', 36524, 36524, '2020-02-27 23:24:33', NULL, 0, 'Thalia  Gonzalez', 12, 36524, '0', 0, 0, 15, 36524, 1),
(190, 24085, 0, 'Público General', '0%', '', 27500, 27500, '2020-02-27 23:32:13', NULL, 0, 'Thalia  Gonzalez', 5, 30000, '0', 0, 0, 15, 27500, 1),
(191, 24086, 0, 'Público General', '0%', '', 128900, 128900, '2020-02-27 23:39:35', NULL, 0, 'Thalia  Gonzalez', 34, 128900, '0', 0, 0, 15, 128900, 1),
(192, 24087, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-27 23:47:12', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 15, 3600, 1),
(193, 24088, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-28 00:03:24', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 15, 3600, 1),
(194, 24089, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-28 00:07:06', NULL, 0, 'Thalia  Gonzalez', 1, 3600, '0', 0, 0, 15, 3600, 1),
(195, 24090, 0, 'Público General', '0%', '', 2800, 2800, '2020-02-28 00:10:02', NULL, 0, 'Thalia  Gonzalez', 1, 3000, '0', 0, 0, 15, 2800, 1),
(196, 24091, 0, 'Público General', '0%', '', 8600, 8600, '2020-02-28 00:31:37', NULL, 0, 'Thalia  Gonzalez', 2, 9000, '0', 0, 0, 15, 8600, 1),
(197, 24092, 0, 'Público General', '0%', '', 12300, 12300, '2020-02-28 00:36:28', NULL, 0, 'Thalia  Gonzalez', 3, 12500, '0', 0, 0, 15, 12300, 1),
(198, 24093, 0, 'Público General', '0%', '', 17800, 17800, '2020-02-28 00:46:55', NULL, 0, 'Thalia  Gonzalez', 5, 20000, '0', 0, 0, 15, 17800, 1),
(199, 24094, 0, 'Público General', '0%', '', 2800, 2800, '2020-02-28 01:00:53', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 15, 2800, 1),
(200, 24095, 0, 'Público General', '0%', '', 9100, 9100, '2020-02-28 13:03:56', NULL, 1, 'Wendy J Gonzalez', 3, 0, '3', 0, 0, 17, 0, 1),
(201, 24096, 0, 'Público General', '0%', '', 16600, 16600, '2020-02-28 13:14:39', NULL, 0, 'Wendy J Gonzalez', 4, 20000, '0', 0, 0, 17, 16600, 1),
(202, 24097, 0, 'Público General', '0%', '', 5800, 5799.99, '2020-02-28 13:24:44', NULL, 0, 'Wendy J Gonzalez', 2, 5800, '0', 0, 0, 17, 5800, 1),
(203, 24098, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-28 14:10:52', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 17, 5000, 1),
(204, 24099, 0, 'Público General', '0%', '', 70850, 70849.9, '2020-02-28 14:13:03', NULL, 0, 'Wendy J Gonzalez', 11, 70850, '0', 0, 0, 17, 70850, 1),
(205, 24100, 0, 'Público General', '0%', '', 7900, 7900, '2020-02-28 14:14:56', NULL, 0, 'Wendy J Gonzalez', 3, 10000, '0', 0, 0, 17, 7900, 1),
(206, 24101, 0, 'Público General', '0%', '', 2700, 2700, '2020-02-28 14:19:27', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 17, 2700, 1),
(207, 24102, 0, 'Público General', '0%', '', 34200, 34200, '2020-02-28 14:50:04', NULL, 0, 'Wendy J Gonzalez', 3, 34200, '0', 0, 0, 17, 34200, 1),
(208, 24103, 0, 'Público General', '0%', '', 67100, 67100, '2020-02-28 15:17:49', NULL, 0, 'Wendy J Gonzalez', 105, 67100, '0', 0, 0, 17, 67100, 1),
(209, 24104, 0, 'Público General', '0%', '', 14000, 14000, '2020-02-28 15:19:46', NULL, 0, 'Wendy J Gonzalez', 1, 15000, '0', 0, 0, 17, 14000, 1),
(210, 24105, 0, 'Público General', '0%', '', 8000, 8000, '2020-02-28 15:22:36', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 17, 8000, 1),
(211, 24106, 0, 'Público General', '0%', '', 14000, 14000, '2020-02-28 15:34:41', NULL, 0, 'Wendy J Gonzalez', 1, 15000, '0', 0, 0, 17, 14000, 1),
(212, 24107, 0, 'Público General', '0%', '', 5100, 5100.01, '2020-02-28 16:00:28', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 17, 5100, 1),
(213, 24108, 0, 'Público General', '0%', '', 313200, 313200, '2020-02-28 16:05:04', NULL, 0, 'Wendy J Gonzalez', 40, 313200, '0', 0, 0, 17, 313200, 1),
(214, 24109, 0, 'Público General', '0%', '', 4100, 4100, '2020-02-28 16:40:50', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 17, 4100, 1),
(215, 24110, 0, 'Público General', '0%', '', 280100, 280100, '2020-02-28 16:46:25', NULL, 0, 'Wendy J Gonzalez', 17, 280100, '0', 0, 0, 17, 280100, 1),
(216, 24111, 0, 'Público General', '0%', '', 24000, 24000, '2020-02-28 16:47:37', NULL, 0, 'Wendy J Gonzalez', 3, 50000, '0', 0, 0, 17, 24000, 1),
(217, 24112, 0, 'Público General', '0%', '', 3000, 2999.99, '2020-02-28 16:51:28', NULL, 0, 'Wendy J Gonzalez', 2, 3000, '0', 0, 0, 17, 3000, 1),
(218, 24113, 0, 'Público General', '0%', '', 2100, 2100, '2020-02-28 16:55:18', NULL, 0, 'Wendy J Gonzalez', 1, 2100, '0', 0, 0, 17, 2100, 1),
(219, 24114, 0, 'Público General', '0%', '', 18650, 18650, '2020-02-28 16:58:53', NULL, 0, 'Wendy J Gonzalez', 5, 50000, '0', 0, 0, 17, 18650, 1),
(220, 24115, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-28 17:00:31', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 17, 1500, 1),
(221, 24116, 0, 'Público General', '0%', '', 86100, 86099.9, '2020-02-28 17:01:55', NULL, 0, 'Wendy J Gonzalez', 3, 86100, '0', 0, 0, 17, 86100, 1),
(222, 24117, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-28 17:13:34', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 17, 5000, 1),
(223, 24118, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-28 17:22:00', NULL, 0, 'Wendy J Gonzalez', 1, 3600, '0', 0, 0, 17, 3600, 1),
(224, 24119, 0, 'Público General', '0%', '', 5850, 5850, '2020-02-28 17:31:16', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 17, 5850, 1),
(225, 24120, 0, 'Público General', '0%', '', 10800, 10800, '2020-02-28 17:40:45', NULL, 0, 'Wendy J Gonzalez', 4, 10800, '0', 0, 0, 17, 10800, 1),
(226, 24121, 0, 'Público General', '0%', '', 4100, 4100, '2020-02-28 17:41:40', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 17, 4100, 1),
(227, 24122, 0, 'Público General', '0%', '', 7900, 7900.01, '2020-02-28 17:45:39', NULL, 0, 'Wendy J Gonzalez', 2, 50000, '0', 0, 0, 17, 7900, 1),
(228, 24123, 0, 'Público General', '0%', '', 19850, 19850, '2020-02-28 17:59:22', NULL, 0, 'Wendy J Gonzalez', 5, 50000, '0', 0, 0, 17, 19850, 1),
(229, 24124, 0, 'Público General', '0%', '', 4300, 4300.01, '2020-02-28 18:13:23', NULL, 0, 'Wendy J Gonzalez', 1, 4300, '0', 0, 0, 17, 4300, 1),
(230, 24125, 0, 'Público General', '0%', '', 3150, 3150, '2020-02-28 18:32:22', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 17, 3150, 1),
(231, 24126, 0, 'Público General', '0%', '', 26000, 26000, '2020-02-28 18:54:02', NULL, 0, 'Wendy J Gonzalez', 1, 26000, '0', 0, 0, 17, 26000, 1),
(232, 24127, 0, 'Público General', '0%', '', -86100, -86099.9, '2020-02-28 18:56:59', NULL, 0, 'Wendy J Gonzalez', -3, -86100, '0', 0, 0, 17, -86100, 1),
(233, 24128, 0, 'Público General', '0%', '', 52350, 52350, '2020-02-28 18:57:43', NULL, 0, 'Wendy J Gonzalez', 3, 52350, '0', 0, 0, 17, 52350, 1),
(234, 24129, 0, 'Público General', '0%', '', 4100, 4100, '2020-02-28 19:13:53', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 17, 4100, 1),
(235, 24130, 0, 'Público General', '0%', '', 50200, 50199.9, '2020-02-28 19:20:29', NULL, 0, 'Wendy J Gonzalez', 4, 50200, '0', 0, 0, 17, 50200, 1),
(236, 24131, 0, 'Público General', '0%', '', 8800, 8800, '2020-02-28 19:35:58', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 17, 8800, 1),
(237, 24132, 0, 'Público General', '0%', '', 13500, 13500, '2020-02-28 19:48:25', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 17, 13500, 1),
(238, 24133, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-28 19:49:58', NULL, 0, 'Wendy J Gonzalez', 1, 4000, '0', 0, 0, 17, 3600, 1),
(239, 24134, 0, 'Público General', '0%', '', 500, 500, '2020-02-28 20:04:10', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 17, 500, 1),
(240, 24135, 0, 'Público General', '0%', '', 112300, 112300, '2020-02-28 20:09:33', NULL, 0, 'Wendy J Gonzalez', 22, 112300, '0', 0, 0, 17, 112300, 1),
(241, 24136, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-28 20:21:53', NULL, 0, 'Wendy J Gonzalez', 2, 6000, '0', 0, 0, 17, 4800, 1),
(242, 24137, 0, 'Público General', '0%', '', 57100, 57100, '2020-02-28 20:23:48', NULL, 0, 'Wendy J Gonzalez', 6, 57100, '0', 0, 0, 17, 57100, 1),
(243, 24138, 0, 'Público General', '0%', '', 5800, 5800, '2020-02-28 20:24:10', NULL, 0, 'Wendy J Gonzalez', 1, 7000, '0', 0, 0, 17, 5800, 1),
(244, 24139, 0, 'Público General', '0%', '', 8400, 8400, '2020-02-28 20:50:36', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 18, 8400, 1),
(245, 24140, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-28 21:00:04', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 18, 4800, 1),
(246, 24141, 0, 'Público General', '0%', '', 8400, 8400, '2020-02-28 21:03:05', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 18, 8400, 1),
(247, 24142, 0, 'Público General', '0%', '', 5700, 5699.99, '2020-02-28 21:04:29', NULL, 0, 'Thalia  Gonzalez', 3, 10700, '0', 0, 0, 18, 5700, 1),
(248, 24143, 0, 'Público General', '0%', '', 6750, 6750, '2020-02-28 21:20:21', NULL, 0, 'Thalia  Gonzalez', 2, 7000, '0', 0, 0, 18, 6750, 1),
(249, 24144, 0, 'Público General', '0%', '', 3000, 3000, '2020-02-28 21:26:16', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 18, 3000, 1),
(250, 24145, 0, 'Público General', '0%', '', 144350, 144350, '2020-02-28 21:32:11', NULL, 0, 'Thalia  Gonzalez', 21, 144350, '0', 0, 0, 18, 144350, 1),
(251, 24146, 0, 'Público General', '0%', '', 52000, 52000, '2020-02-28 21:41:02', NULL, 0, 'Thalia  Gonzalez', 2, 55000, '0', 0, 0, 18, 52000, 1),
(252, 24147, 0, 'Público General', '0%', '', 2100, 2100, '2020-02-28 21:42:51', NULL, 0, 'Thalia  Gonzalez', 1, 5100, '0', 0, 0, 18, 2100, 1),
(253, 24148, 0, 'Público General', '0%', '', 4650, 4650, '2020-02-28 21:43:47', NULL, 0, 'Thalia  Gonzalez', 2, 20000, '0', 0, 0, 18, 4650, 1),
(254, 24149, 0, 'Público General', '0%', '', 138000, 138000, '2020-02-28 21:58:07', NULL, 1, 'Thalia  Gonzalez', 30, 0, '3', 0, 0, 18, 0, 1),
(255, 24150, 0, 'Público General', '0%', '', 5800, 5799.99, '2020-02-28 22:18:52', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 18, 5800, 1),
(256, 24151, 0, 'Público General', '0%', '', 4500, 4499.98, '2020-02-28 22:25:01', NULL, 0, 'Thalia  Gonzalez', 3, 5000, '0', 0, 0, 18, 4500, 1),
(257, 24152, 0, 'Público General', '0%', '', 26000, 26000, '2020-02-28 22:26:53', NULL, 0, 'Thalia  Gonzalez', 1, 30000, '0', 0, 0, 18, 26000, 1),
(258, 24153, 0, 'Público General', '0%', '', 16900, 16900, '2020-02-28 22:29:02', NULL, 0, 'Thalia  Gonzalez', 4, 20000, '0', 0, 0, 18, 16900, 1),
(259, 24154, 0, 'Público General', '0%', '', 2750, 2749.99, '2020-02-28 22:44:36', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 18, 2750, 1),
(260, 24155, 0, 'Público General', '0%', '', 44300, 44300, '2020-02-28 22:57:38', NULL, 0, 'Thalia  Gonzalez', 12, 60000, '0', 0, 0, 18, 44300, 1),
(261, 24156, 0, 'Público General', '0%', '', 44000, 44000, '2020-02-28 22:58:52', NULL, 0, 'Thalia  Gonzalez', 10, 50000, '0', 0, 0, 18, 44000, 1),
(262, 24157, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-28 22:59:38', NULL, 0, 'Thalia  Gonzalez', 1, 8000, '0', 0, 0, 18, 7200, 1),
(263, 24158, 0, 'Público General', '0%', '', 9900, 9900, '2020-02-28 23:04:37', NULL, 0, 'Thalia  Gonzalez', 1, 9900, '0', 0, 0, 18, 9900, 1),
(264, 24159, 0, 'Público General', '0%', '', 34200, 34200, '2020-02-28 23:09:47', NULL, 0, 'Thalia  Gonzalez', 2, 34200, '0', 0, 0, 18, 34200, 1),
(265, 24160, 0, 'Público General', '0%', '', 11200, 11200, '2020-02-28 23:10:56', NULL, 0, 'Thalia  Gonzalez', 1, 20200, '0', 0, 0, 18, 11200, 1),
(266, 24161, 0, 'Público General', '0%', '', 9600, 9600, '2020-02-28 23:13:37', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 18, 9600, 1),
(267, 24162, 0, 'Público General', '0%', '', 154600, 154600, '2020-02-28 23:21:53', NULL, 0, 'Thalia  Gonzalez', 18, 154600, '0', 0, 0, 18, 154600, 1),
(268, 24163, 0, 'Público General', '0%', '', 6000, 6000, '2020-02-28 23:30:29', NULL, 0, 'Thalia  Gonzalez', 1, 6000, '0', 0, 0, 18, 6000, 1),
(269, 24164, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-28 23:33:05', NULL, 0, 'Thalia  Gonzalez', 1, 1500, '0', 0, 0, 18, 1500, 1),
(270, 24165, 0, 'Público General', '0%', '', 8800, 8800, '2020-02-28 23:38:34', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 18, 8800, 1),
(271, 24166, 0, 'Público General', '0%', '', 4200, 4200, '2020-02-28 23:39:04', NULL, 0, 'Thalia  Gonzalez', 1, 10200, '0', 0, 0, 18, 4200, 1),
(272, 24167, 0, 'Público General', '0%', '5', 284620, 299600, '2020-02-28 23:42:13', NULL, 0, 'Thalia  Gonzalez', 24, 284620, '0', 0, 12588.2, 18, 284620, 1),
(273, 24168, 0, 'Público General', '0%', '', 11600, 11600, '2020-02-28 23:43:37', NULL, 0, 'Thalia  Gonzalez', 6, 20000, '0', 0, 0, 18, 11600, 1),
(274, 24169, 0, 'Público General', '0%', '', 67400, 67400, '2020-02-28 23:51:53', NULL, 0, 'Thalia  Gonzalez', 16, 67400, '0', 0, 0, 18, 67400, 2),
(275, 24170, 0, 'Público General', '0%', '', 18100, 18100, '2020-02-28 23:49:41', NULL, 0, 'Thalia  Gonzalez', 4, 20000, '0', 0, 0, 18, 18100, 1),
(276, 24171, 0, 'Público General', '0%', '', 39000, 39000, '2020-02-28 23:57:20', NULL, 0, 'Thalia  Gonzalez', 14, 39000, '0', 0, 0, 18, 39000, 1),
(277, 24172, 0, 'Público General', '0%', '', 4500, 4499.98, '2020-02-29 00:08:37', NULL, 0, 'Thalia  Gonzalez', 3, 20000, '0', 0, 0, 18, 4500, 1),
(278, 24173, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-29 00:19:17', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 18, 3600, 1),
(279, 24174, 0, 'Público General', '0%', '', 2700, 2700, '2020-02-29 00:24:10', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 18, 2700, 1),
(280, 24175, 0, 'Público General', '0%', '', 21250, 21250, '2020-02-29 00:26:44', NULL, 0, 'Thalia  Gonzalez', 5, 21300, '0', 0, 0, 18, 21250, 1),
(281, 24176, 0, 'Público General', '0%', '', 12400, 12400, '2020-02-29 00:27:25', NULL, 0, 'Thalia  Gonzalez', 2, 13000, '0', 0, 0, 18, 12400, 1),
(282, 24177, 0, 'Público General', '0%', '', 20150, 20150, '2020-02-29 00:32:23', NULL, 0, 'Thalia  Gonzalez', 45, 20150, '0', 0, 0, 18, 20150, 1),
(283, 24178, 0, 'Público General', '0%', '', 19800, 19800.1, '2020-02-29 00:48:48', NULL, 0, 'Thalia  Gonzalez', 1, 19800, '0', 0, 0, 18, 19800, 1),
(284, 24179, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-29 00:50:40', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 18, 7200, 1),
(285, 24180, 0, 'Público General', '0%', '', 2050, 2050, '2020-02-29 13:12:05', NULL, 0, 'Wendy J Gonzalez', 1, 2050, '0', 0, 0, 20, 2050, 1),
(286, 24181, 0, 'Público General', '0%', '', 18700, 18700, '2020-02-29 13:29:11', NULL, 0, 'Wendy J Gonzalez', 2, 19000, '0', 0, 0, 20, 18700, 1),
(287, 24182, 0, 'Público General', '0%', '', 4300, 4299.99, '2020-02-29 13:33:33', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 20, 4300, 1),
(288, 24183, 0, 'Público General', '0%', '', 1000, 1000, '2020-02-29 13:43:52', NULL, 0, 'Wendy J Gonzalez', 5, 1000, '0', 0, 0, 20, 1000, 1),
(289, 24184, 0, 'Público General', '0%', '', 4100, 4100, '2020-02-29 14:04:55', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 20, 4100, 1),
(290, 24185, 0, 'Público General', '0%', '', 52100, 52099.8, '2020-02-29 14:15:03', NULL, 0, 'Wendy J Gonzalez', 5, 52100, '0', 0, 0, 20, 52100, 1),
(291, 24186, 0, 'Público General', '0%', '', 10000, 10000, '2020-02-29 14:27:35', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 20, 10000, 1),
(292, 24187, 0, 'Público General', '0%', '', 500, 500, '2020-02-29 14:29:30', NULL, 0, 'Wendy J Gonzalez', 1, 0, '0', 0, 0, 20, 0, 1),
(293, 24188, 0, 'Público General', '0%', '', 4400, 4400, '2020-02-29 14:29:49', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 4400, 1),
(294, 24189, 0, 'Público General', '0%', '', 500, 500, '2020-02-29 14:30:08', NULL, 0, 'Wendy J Gonzalez', 1, 500, '0', 0, 0, 20, 500, 1),
(295, 24190, 0, 'Público General', '0%', '', 61150, 61150, '2020-02-29 14:44:45', NULL, 0, 'Wendy J Gonzalez', 14, 61150, '0', 0, 0, 20, 61150, 1),
(296, 24191, 0, 'Público General', '0%', '', 1800, 1800.01, '2020-02-29 14:44:58', NULL, 0, 'Wendy J Gonzalez', 1, 2000, '0', 0, 0, 20, 1800, 1),
(297, 24192, 0, 'Público General', '0%', '', 4600, 4599.99, '2020-02-29 14:46:43', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 20, 4600, 1),
(298, 24193, 0, 'Público General', '0%', '', 5800, 5800, '2020-02-29 14:48:31', NULL, 0, 'Wendy J Gonzalez', 1, 5800, '0', 0, 0, 20, 5800, 1),
(299, 24194, 0, 'Público General', '0%', '', 7200, 7200, '2020-02-29 14:50:53', NULL, 0, 'Wendy J Gonzalez', 2, 7200, '0', 0, 0, 20, 7200, 1),
(300, 24195, 0, 'Público General', '0%', '', 87450, 87450, '2020-02-29 14:59:45', NULL, 0, 'Wendy J Gonzalez', 8, 87450, '0', 0, 0, 20, 87450, 1),
(301, 24196, 0, 'Público General', '0%', '', 44000, 44000, '2020-02-29 15:03:35', NULL, 0, 'Wendy J Gonzalez', 5, 50000, '0', 0, 0, 20, 44000, 1),
(302, 24197, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-29 15:33:04', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 20, 1500, 1),
(303, 24198, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-29 15:34:55', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 4800, 1),
(304, 24199, 0, 'Público General', '0%', '', 2350, 2350, '2020-02-29 15:41:48', NULL, 0, 'Wendy J Gonzalez', 1, 2350, '0', 0, 0, 20, 2350, 1),
(305, 24200, 0, 'Público General', '0%', '', 81900, 81899.9, '2020-02-29 15:49:24', NULL, 0, 'Wendy J Gonzalez', 16, 81900, '0', 0, 0, 20, 81900, 1),
(306, 24201, 0, 'Público General', '0%', '', 5950, 5950, '2020-02-29 15:54:07', NULL, 0, 'Wendy J Gonzalez', 1, 50000, '0', 0, 0, 20, 5950, 1),
(307, 24202, 0, 'Público General', '0%', '', 229200, 229200, '2020-02-29 15:56:41', NULL, 0, 'Wendy J Gonzalez', 72, 229200, '0', 0, 0, 20, 229200, 1),
(308, 24203, 0, 'Público General', '0%', '', 23700, 23700, '2020-02-29 15:57:44', NULL, 0, 'Wendy J Gonzalez', 6, 50000, '0', 0, 0, 20, 23700, 1),
(309, 24204, 0, 'Público General', '0%', '', 35400, 35400, '2020-02-29 16:12:31', NULL, 0, 'Wendy J Gonzalez', 10, 50000, '0', 0, 0, 20, 35400, 1),
(310, 24205, 0, 'Público General', '0%', '', 3300, 3300, '2020-02-29 16:14:25', NULL, 0, 'Wendy J Gonzalez', 1, 4000, '0', 0, 0, 20, 3300, 1),
(311, 24206, 0, 'Público General', '0%', '', 6200, 6200, '2020-02-29 16:15:03', NULL, 0, 'Wendy J Gonzalez', 2, 7000, '0', 0, 0, 20, 6200, 1),
(312, 24207, 0, 'Público General', '0%', '', 175450, 175450, '2020-02-29 16:27:49', NULL, 0, 'Wendy J Gonzalez', 35, 175450, '0', 0, 0, 20, 175450, 1),
(313, 24208, 0, 'Público General', '0%', '', 5500, 5500, '2020-02-29 16:29:54', NULL, 0, 'Wendy J Gonzalez', 2, 5500, '0', 0, 0, 20, 5500, 1),
(314, 24209, 0, 'Público General', '0%', '', 19750, 19750, '2020-02-29 16:33:26', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 20, 19750, 1),
(315, 24210, 0, 'Público General', '0%', '', 16800, 16800, '2020-02-29 16:43:37', NULL, 0, 'Wendy J Gonzalez', 2, 20000, '0', 0, 0, 20, 16800, 1),
(316, 24211, 0, 'Público General', '0%', '', 28250, 28250, '2020-02-29 16:46:30', NULL, 0, 'Wendy J Gonzalez', 6, 29000, '0', 0, 0, 20, 28250, 1),
(317, 24212, 0, 'Público General', '0%', '', 5200, 5200, '2020-02-29 16:51:23', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 5200, 1),
(318, 24213, 0, 'Público General', '0%', '', 4900, 4900, '2020-02-29 16:51:49', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 4900, 1),
(319, 24214, 0, 'Público General', '0%', '', -23100, -23100, '2020-02-29 17:05:30', NULL, 0, 'Wendy J Gonzalez', -9, -23100, '0', 0, 0, 20, -23100, 1),
(320, 24215, 0, 'Público General', '0%', '', 3000, 2999.99, '2020-02-29 17:13:56', NULL, 0, 'Wendy J Gonzalez', 2, 10000, '0', 0, 0, 20, 3000, 1),
(321, 24216, 0, 'Público General', '0%', '', 118800, 118800, '2020-02-29 17:18:12', NULL, 0, 'Wendy J Gonzalez', 33, 118800, '0', 0, 0, 20, 118800, 1),
(322, 24217, 0, 'Público General', '0%', '', 2300, 2300, '2020-02-29 17:21:28', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 2300, 1),
(323, 24218, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-29 17:24:55', NULL, 0, 'Wendy J Gonzalez', 1, 20000, '0', 0, 0, 20, 4800, 1),
(324, 24219, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-29 17:27:51', NULL, 0, 'Wendy J Gonzalez', 1, 5000, '0', 0, 0, 20, 5000, 1),
(325, 24220, 0, 'Público General', '0%', '', 319750, 319750, '2020-02-29 17:30:50', NULL, 0, 'Wendy J Gonzalez', 20, 319750, '0', 0, 0, 20, 319750, 1),
(326, 24221, 0, 'Público General', '0%', '', 6000, 5999.98, '2020-02-29 17:47:16', NULL, 0, 'Wendy J Gonzalez', 4, 6000, '0', 0, 0, 20, 6000, 1),
(327, 24222, 0, 'Público General', '0%', '', 6200, 6200, '2020-02-29 17:51:08', NULL, 0, 'Wendy J Gonzalez', 1, 10000, '0', 0, 0, 20, 6200, 1),
(328, 24223, 0, 'Público General', '0%', '', 35700, 35700, '2020-02-29 18:30:29', NULL, 0, 'Wendy J Gonzalez', 9, 40000, '0', 0, 0, 20, 35700, 1),
(329, 24224, 0, 'Público General', '0%', '', 5000, 5000, '2020-02-29 19:17:12', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 21, 5000, 1),
(330, 24225, 0, 'Público General', '0%', '', 160700, 160700, '2020-02-29 19:48:33', NULL, 0, 'Thalia  Gonzalez', 217, 160700, '0', 0, 0, 21, 160700, 1),
(331, 24226, 0, 'Público General', '0%', '', 19700, 19700, '2020-02-29 19:53:03', NULL, 0, 'Thalia  Gonzalez', 3, 20000, '0', 0, 0, 21, 19700, 1),
(332, 24227, 0, 'Público General', '0%', '', 3500, 3500.01, '2020-02-29 20:06:19', NULL, 0, 'Thalia  Gonzalez', 41, 5500, '0', 0, 0, 21, 3500, 1),
(333, 24228, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-29 20:19:02', NULL, 0, 'Thalia  Gonzalez', 1, 3600, '0', 0, 0, 21, 3600, 1),
(334, 24229, 0, 'Público General', '0%', '', 71000, 70999.9, '2020-02-29 20:25:18', NULL, 0, 'Thalia  Gonzalez', 14, 71000, '0', 0, 0, 21, 71000, 1),
(335, 24230, 0, 'Público General', '0%', '', 12700, 12700, '2020-02-29 20:25:51', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 21, 12700, 1),
(336, 24231, 0, 'Público General', '0%', '', 8200, 8200, '2020-02-29 21:02:19', NULL, 0, 'Thalia  Gonzalez', 2, 20200, '0', 0, 0, 21, 8200, 1),
(337, 24232, 0, 'Público General', '0%', '', 3500, 3500, '2020-02-29 21:02:53', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 21, 3500, 1),
(338, 24233, 0, 'Público General', '0%', '', 8200, 8200, '2020-02-29 21:03:58', NULL, 0, 'Thalia  Gonzalez', 2, 10200, '0', 0, 0, 21, 8200, 1),
(339, 24234, 0, 'Público General', '0%', '', 39400, 39399.9, '2020-02-29 21:12:35', NULL, 0, 'Thalia  Gonzalez', 2, 50000, '0', 0, 0, 21, 39400, 1),
(340, 24235, 0, 'Público General', '0%', '', 12600, 12600, '2020-02-29 21:13:12', NULL, 0, 'Thalia  Gonzalez', 1, 12600, '0', 0, 0, 21, 12600, 1),
(341, 24236, 0, 'Público General', '0%', '', 37150, 37150, '2020-02-29 21:15:43', NULL, 0, 'Thalia  Gonzalez', 9, 50000, '0', 0, 0, 21, 37150, 1),
(342, 24237, 0, 'Público General', '0%', '', 32500, 32500, '2020-02-29 21:18:59', NULL, 0, 'Thalia  Gonzalez', 9, 33000, '0', 0, 0, 21, 32500, 1),
(343, 24238, 0, 'Público General', '0%', '', 150900, 150900, '2020-02-29 21:26:37', NULL, 0, 'Thalia  Gonzalez', 13, 150900, '0', 0, 0, 21, 150900, 1),
(344, 24239, 0, 'Público General', '0%', '', 4700, 4700, '2020-02-29 21:32:01', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 21, 4700, 1);
INSERT INTO `sales` (`id`, `invoice`, `client_id`, `clientname`, `tax`, `discount`, `subtotal`, `total`, `created_at`, `modified_at`, `status`, `created_by`, `totalitems`, `paid`, `paidmethod`, `taxamount`, `discountamount`, `register_id`, `firstpayement`, `in_activo`) VALUES
(345, 24240, 0, 'Público General', '0%', '', 5600, 5600.01, '2020-02-29 21:35:10', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 21, 5600, 1),
(346, 24241, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-29 21:38:19', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 21, 1500, 1),
(347, 24242, 0, 'Público General', '0%', '', 125400, 125400, '2020-02-29 17:35:33', NULL, 0, 'Thalia  Gonzalez', 11, 125400, '3', 0, 0, 21, 0, 1),
(348, 24243, 0, 'Público General', '0%', '', 2100, 2100, '2020-02-29 21:47:27', NULL, 0, 'Thalia  Gonzalez', 60, 2100, '0', 0, 0, 21, 2100, 1),
(349, 24244, 0, 'Público General', '0%', '', 14400, 14400, '2020-02-29 21:48:00', NULL, 0, 'Thalia  Gonzalez', 1, 15000, '0', 0, 0, 21, 14400, 1),
(350, 24245, 0, 'Público General', '0%', '', 52650, 52650, '2020-02-29 21:59:47', NULL, 0, 'Thalia  Gonzalez', 7, 60000, '0', 0, 0, 21, 52650, 1),
(351, 24246, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-29 22:03:40', NULL, 0, 'Thalia  Gonzalez', 1, 1500, '0', 0, 0, 21, 1500, 1),
(352, 24247, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-02-29 22:20:37', NULL, 0, 'Thalia  Gonzalez', 1, 1500, '0', 0, 0, 21, 1500, 1),
(353, 24248, 0, 'Público General', '0%', '', 76750, 76750, '2020-02-29 22:21:39', NULL, 0, 'Thalia  Gonzalez', 13, 100000, '0', 0, 0, 21, 76750, 1),
(354, 24249, 0, 'Público General', '0%', '', 4200, 4200, '2020-02-29 22:22:36', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 21, 4200, 1),
(355, 24250, 0, 'Público General', '0%', '', 12700, 12700, '2020-02-29 22:23:07', NULL, 0, 'Thalia  Gonzalez', 1, 15000, '0', 0, 0, 21, 12700, 1),
(356, 24251, 0, 'Público General', '0%', '', 47950, 47950, '2020-02-29 22:23:43', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 21, 47950, 1),
(357, 24252, 0, 'Público General', '0%', '', 8400, 8400, '2020-02-29 22:24:15', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 21, 8400, 1),
(358, 24253, 0, 'Público General', '0%', '', 8550, 8550, '2020-02-29 22:26:10', NULL, 0, 'Thalia  Gonzalez', 3, 10000, '0', 0, 0, 21, 8550, 1),
(359, 24254, 0, 'Público General', '0%', '', 3600, 3600, '2020-02-29 22:31:29', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 21, 3600, 1),
(360, 24255, 0, 'Público General', '0%', '', 3400, 3400, '2020-02-29 22:42:48', NULL, 0, 'Thalia  Gonzalez', 2, 5000, '0', 0, 0, 21, 3400, 1),
(361, 24256, 0, 'Público General', '0%', '', 14000, 14000, '2020-02-29 22:47:45', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 21, 14000, 1),
(362, 24257, 0, 'Público General', '0%', '', 39050, 39050, '2020-02-29 22:50:35', NULL, 0, 'Thalia  Gonzalez', 31, 39050, '0', 0, 0, 21, 39050, 1),
(363, 24258, 0, 'Público General', '0%', '', 26700, 26700, '2020-02-29 22:59:09', NULL, 0, 'Thalia  Gonzalez', 7, 27000, '0', 0, 0, 21, 26700, 1),
(364, 24259, 0, 'Público General', '0%', '', 11700, 11700, '2020-02-29 23:03:34', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 21, 11700, 1),
(365, 24260, 0, 'Público General', '0%', '', 28500, 28500, '2020-02-29 23:07:25', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 21, 28500, 1),
(366, 24261, 0, 'Público General', '0%', '', 57000, 57000, '2020-02-29 23:08:28', NULL, 0, 'Thalia  Gonzalez', 2, 57000, '0', 0, 0, 21, 57000, 1),
(367, 24262, 0, 'Público General', '0%', '', -3600, -3600, '2020-02-29 23:13:11', NULL, 0, 'Thalia  Gonzalez', -1, -3600, '0', 0, 0, 21, -3600, 1),
(368, 24263, 0, 'Público General', '0%', '', 5600, 5600, '2020-02-29 23:14:32', NULL, 0, 'Thalia  Gonzalez', 2, 5600, '0', 0, 0, 21, 5600, 1),
(369, 24264, 0, 'Público General', '0%', '', 8300, 8300, '2020-02-29 23:16:30', NULL, 0, 'Thalia  Gonzalez', 2, 8300, '0', 0, 0, 21, 8300, 1),
(370, 24265, 0, 'Público General', '0%', '', 93300, 93300, '2020-02-29 23:21:00', NULL, 0, 'Thalia  Gonzalez', 6, 100000, '0', 0, 0, 21, 93300, 1),
(371, 24266, 0, 'Público General', '0%', '', 4800, 4800, '2020-02-29 23:21:41', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 21, 4800, 1),
(372, 24267, 0, 'Público General', '0%', '', 6500, 6500.01, '2020-02-29 23:25:28', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 21, 6500, 1),
(373, 24268, 0, 'Público General', '0%', '', 21200, 21200, '2020-02-29 23:33:29', NULL, 0, 'Thalia  Gonzalez', 6, 21200, '0', 0, 0, 21, 21200, 1),
(374, 24269, 0, 'Público General', '0%', '', 8800, 8800, '2020-02-29 23:37:16', NULL, 0, 'Thalia  Gonzalez', 1, 9000, '0', 0, 0, 21, 8800, 1),
(375, 24270, 0, 'Público General', '0%', '', 157200, 157200, '2020-02-29 23:49:45', NULL, 0, 'Thalia  Gonzalez', 27, 157200, '0', 0, 0, 21, 157200, 1),
(376, 24271, 0, 'Público General', '0%', '', 3900, 3900, '2020-02-29 23:52:15', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 21, 3900, 1),
(377, 24272, 0, 'Público General', '0%', '', 3150, 3150, '2020-03-01 00:19:51', NULL, 0, 'Thalia  Gonzalez', 1, 4000, '0', 0, 0, 21, 3150, 1),
(378, 24273, 0, 'Público General', '0%', '', 5400, 5400, '2020-03-01 00:21:20', NULL, 0, 'Thalia  Gonzalez', 2, 10400, '0', 0, 0, 21, 5400, 1),
(379, 24274, 0, 'Público General', '0%', '', 8000, 8000, '2020-03-01 00:23:17', NULL, 0, 'Thalia  Gonzalez', 2, 10000, '0', 0, 0, 21, 8000, 1),
(380, 24275, 0, 'Público General', '0%', '', 2200, 2200, '2020-03-01 00:23:59', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 21, 2200, 1),
(381, 24276, 0, 'Público General', '0%', '', 36600, 36600.1, '2020-03-01 00:28:14', NULL, 0, 'Thalia  Gonzalez', 3, 50000, '0', 0, 0, 21, 36600, 1),
(382, 24277, 0, 'Público General', '0%', '', 10200, 10200, '2020-03-01 00:40:26', NULL, 0, 'Thalia  Gonzalez', 2, 10200, '0', 0, 0, 21, 10200, 1),
(383, 24278, 0, 'Público General', '0%', '', 1700, 1700, '2020-03-01 00:56:50', NULL, 0, 'Thalia  Gonzalez', 1, 1700, '0', 0, 0, 21, 1700, 1),
(384, 24279, 0, 'Público General', '0%', '', 33000, 33000, '2020-03-01 01:05:15', NULL, 0, 'Thalia  Gonzalez', 7, 50000, '0', 0, 0, 21, 33000, 1),
(385, 24280, 0, 'Público General', '0%', '', 17000, 17000, '2020-03-01 01:06:14', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 21, 17000, 1),
(386, 24281, 0, 'Público General', '0%', '', 2700, 2700, '2020-03-01 14:36:50', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 22, 2700, 1),
(387, 24282, 0, 'Público General', '0%', '', 2900, 2900, '2020-03-01 14:37:38', NULL, 0, 'Thalia  Gonzalez', 0, 10000, '0', 0, 0, 22, 2900, 1),
(388, 24283, 0, 'Público General', '0%', '', 5900, 5900, '2020-03-01 14:39:42', NULL, 0, 'Thalia  Gonzalez', 3, 10900, '0', 0, 0, 22, 5900, 1),
(389, 24284, 0, 'Público General', '0%', '', 69450, 69450, '2020-03-01 14:44:36', NULL, 0, 'Thalia  Gonzalez', 9, 69450, '0', 0, 0, 22, 69450, 1),
(390, 24285, 0, 'Público General', '0%', '', 30400, 30400, '2020-03-01 15:01:33', NULL, 0, 'Thalia  Gonzalez', 4, 40000, '0', 0, 0, 22, 30400, 1),
(391, 24286, 0, 'Público General', '0%', '', 3000, 3000, '2020-03-01 15:02:04', NULL, 0, 'Thalia  Gonzalez', 1, 3000, '0', 0, 0, 22, 3000, 1),
(392, 24287, 0, 'Público General', '0%', '', 20450, 20450, '2020-03-01 15:38:33', NULL, 0, 'Thalia  Gonzalez', 7, 20450, '0', 0, 0, 22, 20450, 1),
(393, 24288, 0, 'Público General', '0%', '', 1200, 1200, '2020-03-01 15:51:41', NULL, 0, 'Thalia  Gonzalez', 1, 1200, '0', 0, 0, 22, 1200, 1),
(394, 24289, 0, 'Público General', '0%', '', 3900, 3900, '2020-03-01 15:52:12', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 22, 3900, 1),
(395, 24290, 0, 'Público General', '0%', '', 25200, 25199.9, '2020-03-01 15:56:11', NULL, 0, 'Thalia  Gonzalez', 2, 40200, '0', 0, 0, 22, 25200, 1),
(396, 24291, 0, 'Público General', '0%', '', 11700, 11700, '2020-03-01 16:11:11', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 22, 11700, 1),
(397, 24292, 0, 'Público General', '0%', '', 120550, 120550, '2020-03-01 16:16:04', NULL, 0, 'Thalia  Gonzalez', 18, 120550, '0', 0, 0, 22, 120550, 1),
(398, 24293, 0, 'Público General', '0%', '', 6200, 6200, '2020-03-01 16:20:50', NULL, 0, 'Thalia  Gonzalez', 1, 7000, '0', 0, 0, 22, 6200, 1),
(399, 24294, 0, 'Público General', '0%', '', 8500, 8500, '2020-03-01 16:22:25', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 22, 8500, 1),
(400, 24295, 0, 'Público General', '0%', '', 17900, 17900, '2020-03-01 16:32:56', NULL, 0, 'Thalia  Gonzalez', 2, 50000, '0', 0, 0, 22, 17900, 1),
(401, 24296, 0, 'Público General', '0%', '', 32400, 32400, '2020-03-01 16:39:26', NULL, 0, 'Thalia  Gonzalez', 11, 35000, '0', 0, 0, 22, 32400, 1),
(402, 24297, 0, 'Público General', '0%', '', 3600, 3600, '2020-03-01 16:55:20', NULL, 0, 'Thalia  Gonzalez', 1, 50600, '0', 0, 0, 22, 3600, 1),
(403, 24298, 0, 'Público General', '0%', '', 3900, 3900, '2020-03-01 16:58:08', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 22, 3900, 1),
(404, 24299, 0, 'Público General', '0%', '', 23900, 23900, '2020-03-01 17:08:37', NULL, 0, 'Thalia  Gonzalez', 7, 23900, '0', 0, 0, 22, 23900, 1),
(405, 24300, 0, 'Público General', '0%', '', 9100, 9100, '2020-03-01 17:12:46', NULL, 0, 'Thalia  Gonzalez', 2, 20000, '0', 0, 0, 22, 9100, 1),
(406, 24301, 0, 'Público General', '0%', '', 6100, 6100, '2020-03-01 17:22:29', NULL, 0, 'Thalia  Gonzalez', 2, 7100, '0', 0, 0, 22, 6100, 1),
(407, 24302, 0, 'Público General', '0%', '', 6600, 6600, '2020-03-01 17:24:28', NULL, 0, 'Thalia  Gonzalez', 1, 8000, '0', 0, 0, 22, 6600, 1),
(408, 24303, 0, 'Público General', '0%', '', 15800, 15800, '2020-03-01 17:26:02', NULL, 0, 'Thalia  Gonzalez', 4, 20000, '0', 0, 0, 22, 15800, 1),
(409, 24304, 0, 'Público General', '0%', '', 33295, 33295, '2020-03-01 17:34:32', NULL, 0, 'Thalia  Gonzalez', 40, 50000, '0', 0, 0, 22, 33295, 1),
(410, 24305, 0, 'Público General', '0%', '', 19400, 19400, '2020-03-01 17:40:47', NULL, 0, 'Thalia  Gonzalez', 5, 50000, '0', 0, 0, 22, 19400, 1),
(411, 24306, 0, 'Público General', '0%', '', 3600, 3600, '2020-03-01 17:43:27', NULL, 0, 'Thalia  Gonzalez', 1, 3600, '0', 0, 0, 22, 3600, 1),
(412, 24307, 0, 'Público General', '0%', '', 6200, 6200, '2020-03-01 17:46:29', NULL, 0, 'Thalia  Gonzalez', 1, 6200, '0', 0, 0, 22, 6200, 1),
(413, 24308, 0, 'Público General', '0%', '', 38000, 38000, '2020-03-01 17:54:20', NULL, 0, 'Thalia  Gonzalez', 4, 50000, '0', 0, 0, 22, 38000, 1),
(414, 24309, 0, 'Público General', '0%', '', 254400, 254400, '2020-03-01 18:01:07', NULL, 0, 'Thalia  Gonzalez', 36, 254400, '0', 0, 0, 22, 254400, 1),
(415, 24310, 0, 'Público General', '0%', '', 19750, 19750, '2020-03-01 18:04:55', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 22, 19750, 1),
(416, 24311, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-03-01 18:07:53', NULL, 0, 'Thalia  Gonzalez', 1, 2000, '0', 0, 0, 22, 1500, 1),
(417, 24312, 0, 'Público General', '0%', '', 12700, 12700, '2020-03-01 18:15:31', NULL, 0, 'Thalia  Gonzalez', 4, 20000, '0', 0, 0, 22, 12700, 1),
(418, 24313, 0, 'Público General', '0%', '', 283500, 283500, '2020-03-01 18:25:54', NULL, 0, 'Thalia  Gonzalez', 24, 283500, '0', 0, 0, 22, 283500, 1),
(419, 24314, 0, 'Público General', '0%', '', 26750, 26750, '2020-03-01 18:29:21', NULL, 0, 'Thalia  Gonzalez', 106, 30000, '0', 0, 0, 22, 26750, 1),
(420, 24315, 0, 'Público General', '0%', '', 7200, 7200, '2020-03-01 18:32:52', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 22, 7200, 1),
(421, 24316, 0, 'Público General', '0%', '', 5800, 5800, '2020-03-01 18:37:12', NULL, 0, 'Thalia  Gonzalez', 1, 20000, '0', 0, 0, 22, 5800, 1),
(422, 24317, 0, 'Público General', '0%', '', 1500, 1499.99, '2020-03-01 18:44:11', NULL, 0, 'Thalia  Gonzalez', 1, 2000, '0', 0, 0, 22, 1500, 1),
(423, 24318, 0, 'Público General', '0%', '', 6000, 6000, '2020-03-01 18:49:56', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 22, 6000, 1),
(424, 24319, 0, 'Público General', '0%', '', 2800, 2800, '2020-03-01 18:50:11', NULL, 0, 'Thalia  Gonzalez', 1, 5000, '0', 0, 0, 22, 2800, 1),
(425, 24320, 0, 'Público General', '0%', '', 12700, 12700, '2020-03-01 18:51:46', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 22, 12700, 1),
(426, 24321, 0, 'Público General', '0%', '', 23900, 23900, '2020-03-01 19:16:56', NULL, 0, 'Thalia  Gonzalez', 2, 30000, '0', 0, 0, 22, 23900, 1),
(427, 24322, 0, 'Público General', '0%', '', 1300, 1300, '2020-03-01 19:21:46', NULL, 0, 'Thalia  Gonzalez', 1, 10000, '0', 0, 0, 22, 1300, 1),
(428, 24323, 0, 'Público General', '0%', '', 2800, 2800, '2020-03-01 19:33:30', NULL, 0, 'Thalia  Gonzalez', 1, 50000, '0', 0, 0, 22, 2800, 1),
(429, 24324, 0, 'Público General', '0%', '', 208300, 208300, '2020-03-01 19:42:44', NULL, 0, 'Thalia  Gonzalez', 77, 210000, '0', 0, 0, 22, 208300, 1),
(430, 24325, 0, 'Público General', '0%', '', 25400, 25400.1, '2020-03-01 19:50:50', NULL, 0, 'Thalia  Gonzalez', 2, 50000, '0', 0, 0, 22, 25400, 1),
(431, 24326, 0, 'Público General', '0%', '', 25350, 25350, '2020-03-01 20:03:38', NULL, 0, 'Thalia  Gonzalez', 3, 30000, '0', 0, 0, 22, 25350, 1),
(432, 24327, 0, 'Público General', '0%', '', 1200, 1200, '2020-03-08 14:29:40', NULL, 1, ' Malaver', 1, 0, '3', 0, 0, 24, 0, 1),
(433, 24328, 0, 'Público General', '0%', '', 1200, 1200, '2020-03-08 14:30:17', NULL, 0, ' Malaver', 1, 1200, '0', 0, 0, 24, 1200, 1),
(434, 24329, 0, 'Público General', '0%', '', 9700, 9700, '2020-03-10 20:45:26', NULL, 0, ' Malaver', 2, 10000, '0', 0, 0, 24, 9700, 1),
(435, 24330, 0, 'Público General', '0%', '', 3800, 3800, '2020-03-10 20:50:39', NULL, 0, ' Malaver', 1, 4000, '0', 0, 0, 24, 3800, 1),
(436, 24331, 0, 'Público General', '0%', '', 4850, 4850, '2020-03-10 20:58:20', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 4850, 1),
(437, 24332, 0, 'Público General', '0%', '', 7200, 7200, '2020-03-10 21:23:33', NULL, 0, ' Malaver', 2, 8000, '0', 0, 0, 24, 7200, 1),
(438, 24333, 0, 'Público General', '0%', '', 4000, 4000, '2020-03-10 21:30:18', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 4000, 1),
(439, 24334, 0, 'Público General', '0%', '', 3600, 3600, '2020-03-10 21:35:18', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 3600, 1),
(440, 24335, 0, 'Público General', '0%', '', 4000, 4000, '2020-03-10 21:41:12', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 4000, 1),
(441, 24336, 0, 'Público General', '0%', '', 150301, 150301, '2020-03-10 21:42:22', NULL, 0, ' Malaver', 1, 150301, '0', 0, 0, 24, 150301, 1),
(442, 24337, 0, 'Público General', '0%', '', 4000, 4000, '2020-03-10 21:45:50', NULL, 0, ' Malaver', 1, 5500, '0', 0, 0, 24, 4000, 1),
(443, 24338, 0, 'Público General', '0%', '', 4400, 4400, '2020-03-10 21:47:02', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 4400, 1),
(444, 24339, 0, 'Público General', '0%', '', 70000, 70000, '2020-03-10 21:51:43', NULL, 0, ' Malaver', 1, 100000, '0', 0, 0, 24, 70000, 1),
(445, 24340, 0, 'Público General', '0%', '', 3450, 3450, '2020-03-10 23:14:13', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 3450, 1),
(446, 24341, 0, 'Público General', '0%', '', 10200, 10200, '2020-03-10 23:30:54', NULL, 0, ' Malaver', 3, 11000, '0', 0, 0, 24, 10200, 1),
(447, 24342, 0, 'Público General', '0%', '', 3400, 3400, '2020-03-10 23:37:28', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 24, 3400, 1),
(448, 24343, 0, 'Público General', '0%', '', 4000, 4000, '2020-03-12 11:51:14', NULL, 0, ' Malaver', 1, 5000, '0', 0, 0, 27, 4000, 1),
(449, 24344, 0, 'Público General', '0%', '', 6000, 6000, '2020-03-12 12:05:31', NULL, 0, ' Malaver', 1, 6000, '0', 0, 0, 27, 6000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_items`
--

CREATE TABLE IF NOT EXISTS `sale_items` (
`id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `qt` float NOT NULL,
  `subtotal` float NOT NULL,
  `taxvalue` float NOT NULL,
  `taxamount` decimal(10,0) NOT NULL,
  `discount` float NOT NULL,
  `total` float NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=979 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `name`, `price`, `qt`, `subtotal`, `taxvalue`, `taxamount`, `discount`, `total`, `date`) VALUES
(1, 1, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-25'),
(2, 2, 228, 'AZUCAR SOBRES *100 SURTICOM', 3950, 2, 9401, 19, 1501, 0, 9401, '2020-02-25'),
(3, 3, 668, 'GUANTES MANIPULACION SURTICOM', 2000, 2, 4000, 0, 0, 0, 4000, '2020-02-25'),
(4, 4, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7395, 1, 8800.05, 19, 1405, 0, 8800.05, '2020-02-25'),
(5, 4, 692, 'PAPA LUTOSA * 2000', 11700, 2, 23400, 0, 0, 0, 23400, '2020-02-25'),
(6, 4, 518, 'SALSA NEGRA TOMATICO *500 TOMATICO', 1681, 1, 2000.39, 19, 319, 0, 2000.39, '2020-02-25'),
(7, 4, 601, 'CHORIZO PARRILLERO MINI *500 HAMBURGUER', 5210, 1, 6199.9, 19, 990, 0, 6199.9, '2020-02-25'),
(8, 5, 495, 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 4202, 4, 18401.4, 19, 2938, 1344.64, 20001.5, '2020-02-25'),
(9, 5, 522, 'ROSADA SOBRES TOMATICO *100 TOMATICO', 3866, 12, 50790, 19, 8109, 3711.36, 55206.5, '2020-02-25'),
(10, 5, 527, 'BBQ TOMATICO *4000 TOMATICO', 12101, 4, 52992.7, 19, 8461, 3872.32, 57600.8, '2020-02-25'),
(11, 5, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983, 8, 69918.3, 19, 11163, 5109.12, 75998.2, '2020-02-25'),
(12, 6, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445, 1, 4099.55, 19, 655, 0, 4099.55, '2020-02-25'),
(13, 7, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9244, 1, 11000.4, 19, 1756, 0, 11000.4, '2020-02-25'),
(14, 7, 69, 'JAMON PIZZA *500 FRIGOSAN', 3025, 2, 7199.5, 19, 1150, 0, 7199.5, '2020-02-25'),
(15, 7, 446, 'QUESO DC *2500 ENTERO ANGELES', 27500, 1, 27500, 0, 0, 0, 27500, '2020-02-25'),
(16, 8, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-25'),
(17, 8, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9412, 1, 11200.3, 19, 1788, 0, 11200.3, '2020-02-25'),
(18, 8, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697, 2, 8798.86, 19, 1405, 0, 8798.86, '2020-02-25'),
(19, 9, 541, 'MAYO MOSTAZA *1000 TOMATICO', 3866, 1, 4600.54, 19, 735, 0, 4600.54, '2020-02-25'),
(20, 10, 296, 'ZUCARITAS *250 SURTICOM', 2437, 2, 5800.06, 19, 926, 0, 5800.06, '2020-02-25'),
(21, 11, 37, 'IMPUESTO A LA BOLSA SURTICOM', 50, 4, 200, 0, 0, 0, 200, '2020-02-25'),
(22, 12, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11765, 1, 14000.3, 19, 2235, 0, 14000.3, '2020-02-25'),
(23, 12, 400, 'HAMBURGUESA VALENCIA *500 SURTICOM', 3655, 2, 8698.9, 19, 1389, 0, 8698.9, '2020-02-25'),
(24, 12, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12185, 1, 14500.2, 19, 2315, 0, 14500.2, '2020-02-25'),
(25, 12, 527, 'BBQ TOMATICO *4000 TOMATICO', 12101, 1, 14400.2, 19, 2299, 0, 14400.2, '2020-02-25'),
(26, 13, 606, 'VASO VBC 5.5 Oz VBC', 1261.34, 2, 3001.99, 19, 479, 0, 3001.99, '2020-02-25'),
(27, 14, 311, 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 1681, 1, 2000.39, 19, 319, 0, 2000.39, '2020-02-25'),
(28, 15, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9412, 1, 11200.3, 19, 1788, 0, 11200.3, '2020-02-25'),
(29, 15, 439, 'YUCA FROZZEN *100 SURTICOM', 3277.31, 3, 11700, 19, 1868, 0, 11700, '2020-02-25'),
(30, 16, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-25'),
(31, 16, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-25'),
(32, 17, 134, 'BOLSA ALUMINIO L-23 SURTICOM', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-25'),
(33, 17, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-25'),
(34, 17, 330, 'CHAMPIÑON BLANCO *250 SETAS DE CUIVÁ', 3800, 1, 3800, 0, 0, 0, 3800, '2020-02-25'),
(35, 18, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 8991.6, 3, 32100, 19, 5125, 0, 32100, '2020-02-25'),
(36, 18, 490, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 10084, 1, 12000, 19, 1916, 0, 12000, '2020-02-25'),
(37, 18, 149, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 3500, 1, 3500, 0, 0, 0, 3500, '2020-02-25'),
(38, 19, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-25'),
(39, 20, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-25'),
(40, 21, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-02-25'),
(41, 22, 448, 'JAMON PULMAN *500', 4250, 1, 4250, 0, 0, 0, 4250, '2020-02-25'),
(42, 22, 612, 'ACEITE SUPER A *3000 SURTICOM', 12773.1, 1, 15200, 19, 2427, 0, 15200, '2020-02-25'),
(43, 22, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-25'),
(44, 23, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 2, 5600, 19, 894, 0, 5600, '2020-02-25'),
(45, 24, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 3, 4499.98, 19, 718, 0, 4499.98, '2020-02-25'),
(46, 25, 199, 'SALCHICHON CERVERONI *1200 NUTRESA', 16190.5, 1, 17000, 5, 810, 0, 17000, '2020-02-25'),
(47, 26, 691, 'IMPUESTO A LAS BOLSAS', 200, 1, 200, 0, 0, 0, 200, '2020-02-25'),
(48, 27, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-25'),
(49, 27, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-25'),
(50, 28, 644, 'CABANO HAMBURGUER *500 HAMBURGUER', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-25'),
(51, 28, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 4, 21200, 19, 3385, 0, 21200, '2020-02-25'),
(52, 28, 353, 'JAMON CERDO AHUMADO *450 MARTSANG', 5756.3, 2, 13700, 19, 2187, 0, 13700, '2020-02-25'),
(53, 28, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 4, 110000, 0, 0, 0, 110000, '2020-02-25'),
(54, 28, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 3, 85500, 0, 0, 0, 85500, '2020-02-25'),
(55, 28, 223, 'SALCHICHA AMERICANA DUO SURTICOM', 2521.01, 4, 12000, 19, 1916, 0, 12000, '2020-02-25'),
(56, 28, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 2, 28000, 19, 4471, 0, 28000, '2020-02-25'),
(57, 28, 659, 'PAPA CABELLO ANGEL KRU *1000 KRUMER SHIPS', 5042.02, 3, 18000, 19, 2874, 0, 18000, '2020-02-25'),
(58, 29, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 2, 25199.9, 19, 4024, 0, 25199.9, '2020-02-25'),
(59, 29, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-25'),
(60, 29, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 2, 18600, 19, 2970, 0, 18600, '2020-02-25'),
(61, 29, 485, 'MOSTAZA TOMATICO *4000 TOMATICO', 8319.33, 1, 9900, 19, 1581, 0, 9900, '2020-02-25'),
(62, 29, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 1, 14400, 19, 2299, 0, 14400, '2020-02-25'),
(63, 29, 590, 'PAPA CABELLO ANGEL MEGA *1000 KRUMER SHIPS', 4453.78, 2, 10600, 19, 1692, 0, 10600, '2020-02-25'),
(64, 29, 688, 'PAPEL PARAFINADO *100 SURTICOM', 5546.22, 2, 13200, 19, 2108, 0, 13200, '2020-02-25'),
(65, 29, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 10, 28000, 5, 1333, 0, 28000, '2020-02-25'),
(66, 30, 149, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 3500, 1, 3500, 0, 0, 0, 3500, '2020-02-25'),
(67, 30, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-25'),
(68, 31, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2761.9, 1, 2900, 5, 138, 0, 2900, '2020-02-25'),
(69, 31, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-02-25'),
(70, 32, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-25'),
(71, 33, 668, 'GUANTES MANIPULACION SURTICOM', 2000, 1, 2000, 0, 0, 0, 2000, '2020-02-25'),
(72, 34, 681, 'PORTACOMIDA P-1 *20 DARNEL', 4117.65, 1, 4900, 19, 782, 0, 4900, '2020-02-25'),
(73, 35, 644, 'CABANO HAMBURGUER *500 HAMBURGUER', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-25'),
(74, 35, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 4, 110000, 0, 0, 0, 110000, '2020-02-25'),
(75, 35, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 4, 50399.8, 19, 8047, 0, 50399.8, '2020-02-25'),
(76, 35, 353, 'JAMON CERDO AHUMADO *450 MARTSANG', 5756.3, 2, 13700, 19, 2187, 0, 13700, '2020-02-25'),
(77, 35, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 3, 85500, 0, 0, 0, 85500, '2020-02-25'),
(78, 35, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 4, 21200, 19, 3385, 0, 21200, '2020-02-25'),
(79, 35, 590, 'PAPA CABELLO ANGEL MEGA *1000 KRUMER SHIPS', 4453.78, 3, 15900, 19, 2539, 0, 15900, '2020-02-25'),
(80, 35, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 2, 28000, 19, 4471, 0, 28000, '2020-02-25'),
(81, 36, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 3, 85500, 0, 0, 0, 85500, '2020-02-25'),
(82, 36, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 4, 110000, 0, 0, 0, 110000, '2020-02-25'),
(83, 36, 353, 'JAMON CERDO AHUMADO *450 MARTSANG', 5756.3, 2, 13700, 19, 2187, 0, 13700, '2020-02-25'),
(84, 36, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 4, 50399.8, 19, 8047, 0, 50399.8, '2020-02-25'),
(85, 36, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 2, 28000, 19, 4471, 0, 28000, '2020-02-25'),
(86, 36, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 4, 21200, 19, 3385, 0, 21200, '2020-02-25'),
(87, 36, 590, 'PAPA CABELLO ANGEL MEGA *1000 KRUMER SHIPS', 4159.66, 3, 14850, 19, 2371, 0, 14850, '2020-02-25'),
(88, 36, 644, 'CABANO HAMBURGUER *500 HAMBURGUER', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-25'),
(89, 37, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-25'),
(90, 38, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-25'),
(91, 38, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-25'),
(92, 38, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-25'),
(93, 39, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-25'),
(94, 39, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 1, 12550, 19, 2004, 0, 12550, '2020-02-25'),
(95, 39, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 3, 50999.9, 19, 8143, 0, 50999.9, '2020-02-25'),
(96, 40, 110, 'VINIPEL  PLASVIMAS * 50 mts SURTICOM', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-25'),
(97, 41, 120, 'BOLSA ALUMINIO P-20 PIZZA SURTICOM', 2521.01, 1, 3000, 19, 479, 0, 3000, '2020-02-25'),
(98, 41, 329, 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 7200, 1, 7200, 0, 0, 0, 7200, '2020-02-25'),
(99, 41, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-25'),
(100, 42, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 13, 60488.9, 19, 9658, 3244.53, 64349.9, '2020-02-25'),
(101, 43, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 1848.74, 5, 11000, 19, 1756, 0, 11000, '2020-02-25'),
(102, 44, 114, 'SALCHICHON MARTSANG *950 MARTSANG', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-25'),
(103, 45, 114, 'SALCHICHON MARTSANG *950 MARTSANG', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-25'),
(104, 46, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-25'),
(105, 47, 516, 'VINAGRE TOMATICO *500 TOMATICO', 1176.47, 1, 1400, 19, 224, 0, 1400, '2020-02-25'),
(106, 48, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 0.5, 13000, 0, 0, 0, 13000, '2020-02-25'),
(107, 49, 305, 'PALO PINCHO FESTIVAL 25cm *100 SURTICOM', 1932.77, 1, 2300, 19, 367, 0, 2300, '2020-02-25'),
(108, 50, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 3, 8400.01, 5, 400, 0, 8400.01, '2020-02-25'),
(109, 51, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 4, 24800, 19, 3960, 0, 24800, '2020-02-25'),
(110, 51, 261, 'UVA PASA *250 SURTICOM', 3000, 4, 12000, 0, 0, 0, 12000, '2020-02-25'),
(111, 51, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 15, 255000, 19, 40714, 0, 255000, '2020-02-25'),
(112, 51, 327, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 840.336, 2, 2000, 19, 319, 0, 2000, '2020-02-25'),
(113, 52, 327, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 840.336, 8, 8000, 19, 1277, 0, 8000, '2020-02-25'),
(114, 53, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-25'),
(115, 53, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-25'),
(116, 54, 139, 'BOLSA MANIJA 2 K SURTICOM', 1344.54, 1, 1600, 19, 255, 0, 1600, '2020-02-25'),
(117, 55, 232, 'VASO TUC 7 ONZ *50 UNIDADES TUC', 1428.57, 6, 10200, 19, 1629, 0, 10200, '2020-02-25'),
(118, 55, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, 10, 23000, 19, 3672, 0, 23000, '2020-02-25'),
(119, 55, 527, 'BBQ TOMATICO *4000 TOMATICO', 11495.8, 4, 54720, 19, 8737, 0, 54720, '2020-02-25'),
(120, 55, 487, 'ROSADA TOMATICO *4000 TOMATICO', 11575.6, 4, 55099.9, 19, 8797, 0, 55099.9, '2020-02-25'),
(121, 56, 29, 'COPA VENECIANA 5 oz *20 DARNEL', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-25'),
(122, 57, 541, 'MAYO MOSTAZA *1000 TOMATICO', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-25'),
(123, 58, 231, 'VASO TUC 7 Oz *25 TUC', 714.286, 1, 850, 19, 136, 0, 850, '2020-02-25'),
(124, 59, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 0.5, 13750, 0, 0, 0, 13750, '2020-02-25'),
(125, 60, 114, 'SALCHICHON MARTSANG *950 MARTSANG', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-25'),
(126, 61, 591, 'PAPA MEGA *500 SURTICOM', 2226.89, 1, 2650, 19, 423, 0, 2650, '2020-02-25'),
(127, 61, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-25'),
(128, 61, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 1, 9300, 19, 1485, 0, 9300, '2020-02-25'),
(129, 61, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-25'),
(130, 62, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-25'),
(131, 62, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-25'),
(132, 62, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 2, 9899.99, 19, 1581, 0, 9899.99, '2020-02-25'),
(133, 62, 676, 'PORTA PERRO *UNIDAD SURTICOM', 33.6134, 100, 3999.99, 19, 639, 0, 3999.99, '2020-02-25'),
(134, 63, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-25'),
(135, 64, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-25'),
(136, 64, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-25'),
(137, 64, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-25'),
(138, 65, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-25'),
(139, 65, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-25'),
(140, 66, 554, 'GRANOLA * 500grs NUTRIGRANOLA', 3781.51, 1, 4500, 19, 718, 0, 4500, '2020-02-25'),
(141, 67, 426, 'PRACTIPASTA FLAUTA *500 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-25'),
(142, 68, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 3, 8400.01, 5, 400, 0, 8400.01, '2020-02-25'),
(143, 69, 114, 'SALCHICHON MARTSANG *950 MARTSANG', 4571.43, 2, 9600, 5, 457, 0, 9600, '2020-02-25'),
(144, 70, 208, 'SALCHICHA SUPER DOG *14 SURTICOM', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-25'),
(145, 70, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-25'),
(146, 71, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-26'),
(147, 72, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-26'),
(148, 72, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-26'),
(149, 72, 123, 'BOLSA ALUMINIO L-17 SURTICOM', 1302.52, 1, 1550, 19, 247, 0, 1550, '2020-02-26'),
(150, 72, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-26'),
(151, 72, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(152, 72, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-26'),
(153, 73, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(154, 74, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 1, 17000, 19, 2714, 0, 17000, '2020-02-26'),
(155, 75, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-26'),
(156, 75, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 1, 28500, 0, 0, 0, 28500, '2020-02-26'),
(157, 75, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-26'),
(158, 75, 331, 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 13500, 1, 13500, 0, 0, 0, 13500, '2020-02-26'),
(159, 76, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(160, 77, 291, 'SERVILLETA POPULAR *320 POPULAR', 2352.94, 2, 5600, 19, 894, 0, 5600, '2020-02-26'),
(161, 78, 224, 'TOCINETA AHUMADA *500 PROCARSAN SURTICOM', 6722.69, 1, 8000, 19, 1277, 0, 8000, '2020-02-26'),
(162, 79, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-26'),
(163, 80, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-26'),
(164, 81, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-26'),
(165, 82, 515, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 1722.69, 1, 2050, 19, 327, 0, 2050, '2020-02-26'),
(166, 82, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-26'),
(167, 82, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-26'),
(168, 82, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 1, 5600, 19, 894, 0, 5600, '2020-02-26'),
(169, 85, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 1, 500, 0, 0, 0, 500, '2020-02-26'),
(170, 86, 282, 'PLATO PANDO 12 cm *20 DARNEL', 672.269, 2, 1600, 19, 255, 0, 1600, '2020-02-26'),
(171, 86, 238, 'VASO BAR 3.3 *50 TUC', 1428.57, 2, 3400, 19, 543, 0, 3400, '2020-02-26'),
(172, 86, 481, 'CUCHARA DEKO DULCERA *100 SURTICOM', 1512.61, 1, 1800.01, 19, 287, 0, 1800.01, '2020-02-26'),
(173, 87, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-26'),
(174, 87, 278, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 5798.32, 1, 6900, 19, 1102, 0, 6900, '2020-02-26'),
(175, 88, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-26'),
(176, 89, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-26'),
(177, 89, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-02-26'),
(178, 89, 261, 'UVA PASA *250 SURTICOM', 3000, 2, 6000, 0, 0, 0, 6000, '2020-02-26'),
(179, 89, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 1, 17000, 19, 2714, 0, 17000, '2020-02-26'),
(180, 89, 681, 'PORTACOMIDA P-1 *20 DARNEL', 4117.65, 1, 4900, 19, 782, 0, 4900, '2020-02-26'),
(181, 89, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-26'),
(182, 90, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-26'),
(183, 91, 99, 'AREQUIPE BOLSA *1000gr BENNY', 5000, 1, 5000, 0, 0, 0, 5000, '2020-02-26'),
(184, 92, 610, 'VASO VBC 9 Oz *50 ATIKAS', 1806.72, 1, 2150, 19, 343, 0, 2150, '2020-02-26'),
(185, 93, 466, 'LONJA BOCADILLO COMBINADO SURTICOM', 2200, 1, 2200, 0, 0, 0, 2200, '2020-02-26'),
(186, 93, 617, 'QUESO PERA NAZARETH *500G SURTICOM', 7700, 1, 7700, 0, 0, 0, 7700, '2020-02-26'),
(187, 93, 570, 'AREQUIPE TARRO *1000 BENNY', 5000, 1, 5950, 19, 950, 0, 5950, '2020-02-26'),
(188, 93, 259, 'NUEZ PARTIDA *250 SURTICOM', 8403.36, 1, 10000, 19, 1597, 0, 10000, '2020-02-26'),
(189, 94, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-26'),
(190, 95, 618, 'QUESO TAJADO PRIMAVERA *250 PRIMAVERA', 3100, 1, 3100, 0, 0, 0, 3100, '2020-02-26'),
(191, 95, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-26'),
(192, 95, 421, 'LONJA DE BOCADILLO *500 GRS SURTICOM', 2100, 1, 2100, 0, 0, 0, 2100, '2020-02-26'),
(193, 96, 261, 'UVA PASA *250 SURTICOM', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-26'),
(194, 96, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-02-26'),
(195, 97, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 3, 38100.1, 19, 6083, 0, 38100.1, '2020-02-26'),
(196, 98, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-26'),
(197, 98, 405, 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-26'),
(198, 98, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-26'),
(199, 98, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-26'),
(200, 98, 573, 'ALUMINIO MIO *16 mts MIO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-26'),
(201, 98, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-26'),
(202, 98, 513, 'PASTA DE TOMATE TOMATICO *500 TOMATICO', 2436.97, 1, 2899.99, 19, 463, 0, 2899.99, '2020-02-26'),
(203, 98, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-26'),
(204, 98, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-26'),
(205, 98, 76, 'SALCHICHA MANGUERA *1 MARTSANG', 1008.4, 4, 4799.98, 19, 766, 0, 4799.98, '2020-02-26'),
(206, 99, 72, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 1, 14000, 0, 0, 0, 14000, '2020-02-26'),
(207, 100, 554, 'GRANOLA * 500grs NUTRIGRANOLA', 3781.51, 1, 4500, 19, 718, 0, 4500, '2020-02-26'),
(208, 101, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 1848.74, 25, 55000, 19, 8782, 0, 55000, '2020-02-26'),
(209, 102, 406, 'CHORIZO PAISA *12 SURTICOM', 10084, 1, 12000, 19, 1916, 0, 12000, '2020-02-26'),
(210, 102, 294, 'ARROZ ACHOCOLATADO *500grs SURTICOM', 5882.35, 0.5, 3500, 19, 559, 0, 3500, '2020-02-26'),
(211, 103, 481, 'CUCHARA DEKO DULCERA *100 SURTICOM', 1512.61, 1, 1800.01, 19, 287, 0, 1800.01, '2020-02-26'),
(212, 103, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-26'),
(213, 104, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-26'),
(214, 104, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-26'),
(215, 105, 492, 'PASTA DE TOMATE TOMATICO *4000 TOMATICO', 16596.6, 1, 19750, 19, 3153, 0, 19750, '2020-02-26'),
(216, 106, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3361.34, 10, 39999.9, 19, 6387, 0, 39999.9, '2020-02-26'),
(217, 106, 406, 'CHORIZO PAISA *12 SURTICOM', 10084, 2, 23999.9, 19, 3832, 0, 23999.9, '2020-02-26'),
(218, 106, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 1, 12550, 19, 2004, 0, 12550, '2020-02-26'),
(219, 106, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 1, 14400, 19, 2299, 0, 14400, '2020-02-26'),
(220, 106, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 5, 56000, 19, 8941, 0, 56000, '2020-02-26'),
(221, 107, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2761.9, 2, 5799.99, 5, 276, 0, 5799.99, '2020-02-26'),
(222, 108, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-26'),
(223, 108, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-26'),
(224, 108, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 1, 28500, 0, 0, 0, 28500, '2020-02-26'),
(225, 108, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 3, 26400, 19, 4215, 0, 26400, '2020-02-26'),
(226, 109, 142, 'BOLSA PAPEL 3 LIBRAS SURTICOM', 2400, 1, 2400, 0, 0, 0, 2400, '2020-02-26'),
(227, 110, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(228, 111, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(229, 112, 569, 'VASO PAPEL 6 Oz *50 HOUSE', 3529.41, 1, 4200, 19, 671, 0, 4200, '2020-02-26'),
(230, 113, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-26'),
(231, 113, 450, 'QUESO DC *2500 TAJ ANGELES', 28500, 1, 28500, 0, 0, 0, 28500, '2020-02-26'),
(232, 113, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-26'),
(233, 113, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-26'),
(234, 114, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-26'),
(235, 115, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 0.5, 13750, 0, 0, 0, 13750, '2020-02-26'),
(236, 116, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 3907.56, 13, 60450, 19, 9652, 0, 60450, '2020-02-26'),
(237, 117, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 200, 7000.01, 19, 1118, 0, 7000.01, '2020-02-26'),
(238, 117, 400, 'HAMBURGUESA VALENCIA *500 ', 3655.46, 4, 17400, 19, 2778, 0, 17400, '2020-02-26'),
(239, 118, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-26'),
(240, 119, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 20, 700.001, 19, 112, 0, 700.001, '2020-02-26'),
(241, 119, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-26'),
(242, 119, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 2, 5000, 19, 798, 0, 5000, '2020-02-26'),
(243, 119, 147, 'ACEITE HIDROGENADO *500 g SURTICOM', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-26'),
(244, 119, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-26'),
(245, 119, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 2, 7200, 19, 1150, 0, 7200, '2020-02-26'),
(246, 120, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 2, 5000, 19, 798, 0, 5000, '2020-02-26'),
(247, 120, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 20, 700.001, 19, 112, 0, 700.001, '2020-02-26'),
(248, 120, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-26'),
(249, 120, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-26'),
(250, 121, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 2, 5600.01, 5, 267, 0, 5600.01, '2020-02-26'),
(251, 122, 426, 'PRACTIPASTA FLAUTA *500 PRACTI PASTA', 2666.67, 2, 5600.01, 5, 267, 0, 5600.01, '2020-02-26'),
(252, 123, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 3, 8400.01, 5, 400, 0, 8400.01, '2020-02-26'),
(253, 124, 199, 'SALCHICHON CERVERONI *1200 NUTRESA', 16190.5, 1, 17000, 5, 810, 0, 17000, '2020-02-26'),
(254, 125, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-26'),
(255, 125, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-26'),
(256, 125, 450, 'QUESO DC *2500 TAJ ANGELES', 27000, 1, 27000, 0, 0, 0, 27000, '2020-02-26'),
(257, 125, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-26'),
(258, 126, 330, 'CHAMPIÑON BLANCO *250 SETAS DE CUIVÁ', 3800, 1, 3800, 0, 0, 0, 3800, '2020-02-26'),
(259, 127, 465, 'TAPA BOCAS CAJA *50 SURTICOM', 7226.89, 1, 8600, 19, 1373, 0, 8600, '2020-02-26'),
(260, 128, 465, 'TAPA BOCAS CAJA *50 SURTICOM', 7226.89, 3, 25800, 19, 4119, 0, 25800, '2020-02-26'),
(261, 129, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-26'),
(262, 130, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3697.48, 6, 26400, 19, 4215, 0, 26400, '2020-02-26'),
(263, 130, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 7, 65100, 19, 10394, 0, 65100, '2020-02-26'),
(264, 130, 397, 'ALUMINIO GOLDEN *100', 16386.6, 1, 19500.1, 19, 3113, 0, 19500.1, '2020-02-26'),
(265, 131, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-26'),
(266, 131, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-26'),
(267, 131, 464, 'PAN HAMBURGUESA x 6 COUNTRY', 2300, 1, 2300, 0, 0, 0, 2300, '2020-02-26'),
(268, 132, 73, 'QUESO MEDIO BLOQUE TAJADO SURTICOM', 13750, 1, 13750, 0, 0, 0, 13750, '2020-02-26'),
(269, 132, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-26'),
(270, 132, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 0.5, 13000, 0, 0, 0, 13000, '2020-02-26'),
(271, 133, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(272, 133, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-26'),
(273, 133, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-26'),
(274, 134, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-26'),
(275, 134, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2761.9, 1, 2900, 5, 138, 0, 2900, '2020-02-26'),
(276, 134, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(277, 135, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(278, 136, 515, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 1722.69, 1, 2050, 19, 327, 0, 2050, '2020-02-26'),
(279, 136, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-26'),
(280, 137, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-26'),
(281, 137, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-26'),
(282, 138, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-27'),
(283, 138, 404, 'CHORIZO MINI PAISA *500 CIAL SAS', 4621.85, 1, 5500, 19, 878, 0, 5500, '2020-02-27'),
(284, 139, 405, 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-27'),
(285, 139, 401, 'SALCHICHA SUPER DOG * 24 SURTICOM', 5462.19, 1, 6500.01, 19, 1038, 0, 6500.01, '2020-02-27'),
(286, 139, 400, 'HAMBURGUESA VALENCIA *500 ', 3655.46, 3, 13050, 19, 2084, 0, 13050, '2020-02-27'),
(287, 140, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 15, 255000, 19, 40714, 0, 255000, '2020-02-27'),
(288, 140, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 20, 29999.9, 19, 4790, 0, 29999.9, '2020-02-27'),
(289, 140, 261, 'UVA PASA *250 SURTICOM', 3000, 4, 12000, 0, 0, 0, 12000, '2020-02-27'),
(290, 141, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-02-27'),
(291, 141, 261, 'UVA PASA *250 SURTICOM', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-27'),
(292, 142, 191, 'PAPA PRECOCIDA PORCIONADA*20 UNI SURTICOM', 16806.7, 1, 20000, 19, 3193, 0, 20000, '2020-02-27'),
(293, 143, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 2, 7200, 19, 1150, 0, 7200, '2020-02-27'),
(294, 143, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(295, 143, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 2, 6600, 19, 1054, 0, 6600, '2020-02-27'),
(296, 143, 608, 'VASO VBC 14 Oz *50 ATIKAS', 3067.23, 2, 7300.01, 19, 1166, 0, 7300.01, '2020-02-27'),
(297, 143, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 9, 25200, 5, 1200, 0, 25200, '2020-02-27'),
(298, 144, 692, 'PAPA LUTOSA * 2000', 11700, 2, 23400, 0, 0, 0, 23400, '2020-02-27'),
(299, 144, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-27'),
(300, 144, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-02-27'),
(301, 145, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(302, 145, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(303, 146, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(304, 146, 618, 'QUESO TAJADO PRIMAVERA *250 PRIMAVERA', 3100, 1, 3100, 0, 0, 0, 3100, '2020-02-27'),
(305, 147, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 1, 5600, 19, 894, 0, 5600, '2020-02-27'),
(306, 147, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-27'),
(307, 148, 676, 'PORTA PERRO *UNIDAD SURTICOM', 29.4118, 50, 1750, 19, 279, 0, 1750, '2020-02-27'),
(308, 148, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-27'),
(309, 149, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-27'),
(310, 149, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 20, 700.001, 19, 112, 0, 700.001, '2020-02-27'),
(311, 150, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 1, 500, 0, 0, 0, 500, '2020-02-27'),
(312, 151, 543, 'MAYO MOSTAZA BOLSA *4000 TOMATICO', 14033.6, 1, 16700, 19, 2666, 0, 16700, '2020-02-27'),
(313, 152, 235, 'CREMA DE LECHE ALQUERIA *900 ALQUERIA', 9200, 1, 9200, 0, 0, 0, 9200, '2020-02-27'),
(314, 153, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 3, 13200, 19, 2108, 0, 13200, '2020-02-27'),
(315, 153, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-27'),
(316, 153, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 1, 5600, 19, 894, 0, 5600, '2020-02-27'),
(317, 153, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(318, 153, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-27'),
(319, 153, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-27'),
(320, 154, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 4, 5999.98, 19, 958, 0, 5999.98, '2020-02-27'),
(321, 154, 238, 'VASO BAR 3.3 *50 TUC', 1428.57, 4, 6799.99, 19, 1086, 0, 6799.99, '2020-02-27'),
(322, 154, 228, 'AZUCAR SOBRES *100 SURTICOM', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-27'),
(323, 154, 597, 'MEZCLADORES *500 SURTICOM', 840.336, 1, 1000, 19, 160, 0, 1000, '2020-02-27'),
(324, 154, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 2, 5600, 19, 894, 0, 5600, '2020-02-27'),
(325, 155, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 12, 49200, 19, 7855, 0, 49200, '2020-02-27'),
(326, 155, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 12, 51600.1, 19, 8239, 0, 51600.1, '2020-02-27'),
(327, 155, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 12, 114000, 19, 18202, 0, 114000, '2020-02-27'),
(328, 155, 485, 'MOSTAZA TOMATICO *4000 TOMATICO', 8319.33, 4, 39600, 19, 6323, 0, 39600, '2020-02-27'),
(329, 156, 98, 'ACEITE HIDRIGENADO *15 K SURTICOM', 57142.9, 1, 68000.1, 19, 10857, 0, 68000.1, '2020-02-27'),
(330, 157, 311, 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 1680.67, 1, 2000, 19, 319, 0, 2000, '2020-02-27'),
(331, 158, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(332, 159, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 1, 12600, 19, 2012, 0, 12600, '2020-02-27'),
(333, 160, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-27'),
(334, 160, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-27'),
(335, 160, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-02-27'),
(336, 161, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, -1, -17000, 19, -2714, 0, -17000, '2020-02-27'),
(337, 162, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 12, 32400, 19, 5173, 0, 32400, '2020-02-27'),
(338, 162, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, -12, -114000, 19, -18202, 0, -114000, '2020-02-27'),
(339, 163, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 2, 8800, 19, 1405, 0, 8800, '2020-02-27'),
(340, 163, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-27'),
(341, 163, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(342, 164, 488, 'TARTARA TOMATICO *4000 TOMATICO', 14117.6, 4, 67199.8, 19, 10729, 0, 67199.8, '2020-02-27'),
(343, 165, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-27'),
(344, 165, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-27'),
(345, 166, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(346, 166, 124, 'BOLSA ALUMINIO L-21 SURTICOM', 2016.81, 1, 2400, 19, 383, 0, 2400, '2020-02-27'),
(347, 167, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 1, 12600, 19, 2012, 0, 12600, '2020-02-27'),
(348, 168, 238, 'VASO BAR 3.3 *50 TUC', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-27'),
(349, 169, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-27'),
(350, 169, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-27'),
(351, 170, 352, 'HAMBURGUESA MARTSANG * 6 UNI MARTSANG', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-27'),
(352, 171, 250, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 5310.92, 1, 6319.99, 19, 1009, 0, 6319.99, '2020-02-27'),
(353, 171, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 3907.56, 13, 60450, 19, 9652, 0, 60450, '2020-02-27'),
(354, 171, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 1848.74, 25, 55000, 19, 8782, 0, 55000, '2020-02-27'),
(355, 172, 620, 'QUESO DC *2500 NAZARET NAZARETH', 27500, 1, 27500, 0, 0, 0, 27500, '2020-02-27'),
(356, 173, 20, 'BOLSA MANIJA 20 K SURTICOM', 5714.29, 1, 6800, 19, 1086, 0, 6800, '2020-02-27'),
(357, 173, 139, 'BOLSA MANIJA 2 K SURTICOM', 1344.54, 1, 1600, 19, 255, 0, 1600, '2020-02-27'),
(358, 173, 136, 'BOLSA MANIJA 1.5 K SURTICOM', 1218.49, 2, 2900.01, 19, 463, 0, 2900.01, '2020-02-27'),
(359, 174, 404, 'CHORIZO MINI PAISA *500 CIAL SAS', 4621.85, 1, 5500, 19, 878, 0, 5500, '2020-02-27'),
(360, 174, 311, 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 1680.67, 1, 2000, 19, 319, 0, 2000, '2020-02-27'),
(361, 175, 259, 'NUEZ PARTIDA *250 SURTICOM', 8403.36, 1, 10000, 19, 1597, 0, 10000, '2020-02-27'),
(362, 175, 158, 'MANI  NUTRI *250 grs SURTICOM', 2900, 1, 2900, 0, 0, 0, 2900, '2020-02-27'),
(363, 176, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-27'),
(364, 176, 519, 'TOMATE SOBRES TOMATICO *100 TOMATICO', 3781.51, 1, 4500, 19, 718, 0, 4500, '2020-02-27'),
(365, 176, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-27'),
(366, 176, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-27'),
(367, 176, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-27'),
(368, 176, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-27'),
(369, 177, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(370, 178, 72, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 1, 14000, 0, 0, 0, 14000, '2020-02-27'),
(371, 179, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-02-27'),
(372, 180, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-27'),
(373, 180, 250, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 5588.24, 1, 6650.01, 19, 1062, 0, 6650.01, '2020-02-27'),
(374, 181, 188, 'MOLDE LASAÑA 16 Oz UNID SURTICOM', 252.101, 15, 4500, 19, 718, 0, 4500, '2020-02-27'),
(375, 182, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 4, 67999.9, 19, 10857, 0, 67999.9, '2020-02-27'),
(376, 182, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 4, 11200, 19, 1788, 0, 11200, '2020-02-27'),
(377, 182, 543, 'MAYO MOSTAZA BOLSA *4000 TOMATICO', 14033.6, 1, 16700, 19, 2666, 0, 16700, '2020-02-27'),
(378, 182, 676, 'PORTA PERRO *UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-27'),
(379, 182, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-27'),
(380, 182, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-27'),
(381, 182, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(382, 182, 614, 'JAMON CASERO *250 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(383, 182, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-27'),
(384, 182, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 10, 15000, 19, 2395, 0, 15000, '2020-02-27'),
(385, 182, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 3, 26400, 19, 4215, 0, 26400, '2020-02-27'),
(386, 182, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 3, 14850, 19, 2371, 0, 14850, '2020-02-27'),
(387, 182, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-27'),
(388, 182, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-27'),
(389, 182, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-27'),
(390, 183, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 2, 5000, 19, 798, 0, 5000, '2020-02-27'),
(391, 183, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(392, 183, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-27'),
(393, 183, 403, 'JAMON FROSTER *500 SURTICOM', 3361.34, 1, 3999.99, 19, 639, 0, 3999.99, '2020-02-27'),
(394, 183, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 20, 700.001, 19, 112, 0, 700.001, '2020-02-27'),
(395, 183, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-27'),
(396, 183, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 2, 7200, 19, 1150, 0, 7200, '2020-02-27'),
(397, 184, 70, 'PORTACOMIDA K-1 *50 DARNEL', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-27'),
(398, 185, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(399, 185, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(400, 185, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-27'),
(401, 186, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-27'),
(402, 187, 468, 'GELATINA FRESA PICCOLO *500 SURTICOM', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-27'),
(403, 188, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-27'),
(404, 188, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-27'),
(405, 188, 323, 'PALO PINCHO 25 CM *100 UNIDADES SURTICOM', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-27'),
(406, 188, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-27'),
(407, 189, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 2, 5000, 19, 798, 0, 5000, '2020-02-27'),
(408, 189, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 3, 12900, 19, 2060, 0, 12900, '2020-02-27'),
(409, 189, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 2, 4700, 19, 750, 0, 4700, '2020-02-27'),
(410, 189, 501, 'TARTARA TOMATICO *1000 TOMATICO', 3949.58, 2, 9400, 19, 1501, 0, 9400, '2020-02-27'),
(411, 189, 298, 'VINAGRE BLANCO *500 CALIFORNIA SURTICOM', 1267.23, 3, 4524.01, 19, 722, 0, 4524.01, '2020-02-27'),
(412, 190, 404, 'CHORIZO MINI PAISA *500 CIAL SAS', 4621.85, 5, 27500, 19, 4391, 0, 27500, '2020-02-27'),
(413, 191, 607, 'VASO VBC 7 oz*50 VBC', 1176.47, 25, 35000, 19, 5588, 0, 35000, '2020-02-27'),
(414, 191, 397, 'ALUMINIO GOLDEN *100', 16386.6, 1, 19500.1, 19, 3113, 0, 19500.1, '2020-02-27'),
(415, 191, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 8, 74400, 19, 11879, 0, 74400, '2020-02-27'),
(416, 192, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(417, 193, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(418, 194, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(419, 195, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-27'),
(420, 196, 449, 'QUESO DC *500 ENT ANGELES', 6400, 1, 6400, 0, 0, 0, 6400, '2020-02-27'),
(421, 196, 466, 'LONJA BOCADILLO COMBINADO SURTICOM', 2200, 1, 2200, 0, 0, 0, 2200, '2020-02-27'),
(422, 197, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-27'),
(423, 197, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2761.9, 1, 2900, 5, 138, 0, 2900, '2020-02-27'),
(424, 197, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-27'),
(425, 198, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-27'),
(426, 198, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 3, 10800, 5, 514, 0, 10800, '2020-02-27'),
(427, 198, 513, 'PASTA DE TOMATE TOMATICO *500 TOMATICO', 2436.97, 1, 2899.99, 19, 463, 0, 2899.99, '2020-02-27'),
(428, 199, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-27'),
(429, 200, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(430, 200, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-28'),
(431, 200, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-28'),
(432, 201, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-28'),
(433, 201, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 3, 10800, 5, 514, 0, 10800, '2020-02-28'),
(434, 202, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2761.9, 2, 5799.99, 5, 276, 0, 5799.99, '2020-02-28'),
(435, 203, 495, 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-28'),
(436, 204, 400, 'HAMBURGUESA VALENCIA *500 ', 3655.46, 8, 34800, 19, 5556, 0, 34800, '2020-02-28'),
(437, 204, 405, 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-28'),
(438, 204, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 1, 12550, 19, 2004, 0, 12550, '2020-02-28'),
(439, 204, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-28'),
(440, 205, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 2, 1000, 0, 0, 0, 1000, '2020-02-28'),
(441, 205, 278, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 5798.32, 1, 6900, 19, 1102, 0, 6900, '2020-02-28'),
(442, 206, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-28'),
(443, 207, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 2, 8200, 19, 1309, 0, 8200, '2020-02-28'),
(444, 207, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-28'),
(445, 208, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-28'),
(446, 208, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-28'),
(447, 208, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-28'),
(448, 208, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-28'),
(449, 208, 498, 'SALSA NEGRA TOMATICO *3000cc TOMATICO', 6386.55, 1, 7599.99, 19, 1213, 0, 7599.99, '2020-02-28'),
(450, 208, 329, 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 7200, 1, 7200, 0, 0, 0, 7200, '2020-02-28'),
(451, 209, 72, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 1, 14000, 0, 0, 0, 14000, '2020-02-28'),
(452, 210, 224, 'TOCINETA AHUMADA *500 PROCARSAN SURTICOM', 6722.69, 1, 8000, 19, 1277, 0, 8000, '2020-02-28'),
(453, 211, 405, 'CHORIZO PARRILLERO SABORE *1500 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-28'),
(454, 212, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-28'),
(455, 212, 139, 'BOLSA MANIJA 2 K SURTICOM', 1344.54, 1, 1600, 19, 255, 0, 1600, '2020-02-28'),
(456, 213, 490, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 10084, 4, 47999.8, 19, 7664, 0, 47999.8, '2020-02-28'),
(457, 213, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 12, 67200, 19, 10729, 0, 67200, '2020-02-28'),
(458, 213, 507, 'MAYONESA ESPAÑOLA *1000 TOMATICO', 3109.24, 12, 44399.9, 19, 7089, 0, 44399.9, '2020-02-28'),
(459, 213, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 4, 58000.1, 19, 9261, 0, 58000.1, '2020-02-28'),
(460, 213, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 4, 38000, 19, 6067, 0, 38000, '2020-02-28'),
(461, 213, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 4, 57599.8, 19, 9197, 0, 57599.8, '2020-02-28'),
(462, 214, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-28'),
(463, 215, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 2, 25100, 19, 4008, 0, 25100, '2020-02-28'),
(464, 215, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 15, 255000, 19, 40714, 0, 255000, '2020-02-28'),
(465, 216, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 1, 17000, 19, 2714, 0, 17000, '2020-02-28'),
(466, 216, 149, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 3500, 2, 7000, 0, 0, 0, 7000, '2020-02-28'),
(467, 217, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-28'),
(468, 218, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-28'),
(469, 219, 414, 'PAPA LOS LANCEROS *250G SURTICOM', 5700, 1, 5700, 0, 0, 0, 5700, '2020-02-28'),
(470, 219, 218, 'SERVILLETA FAMILIA 1a1 *150 FAMILIA', 1386.55, 1, 1649.99, 19, 263, 0, 1649.99, '2020-02-28'),
(471, 219, 304, 'ATUN LOMITOS SOBERANA *170 SURTICOM', 3529.41, 1, 4200, 19, 671, 0, 4200, '2020-02-28'),
(472, 219, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(473, 219, 149, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 3500, 1, 3500, 0, 0, 0, 3500, '2020-02-28'),
(474, 220, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(475, 221, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-28'),
(476, 221, 59, 'PORTACOMIDA J1 PACA *200 DARNEL', 33571.4, 2, 79899.9, 19, 12757, 0, 79899.9, '2020-02-28'),
(477, 222, 634, 'PAPA FROZZEN *1000G SURTICOM', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-28'),
(478, 223, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(479, 224, 13, 'AREQUIPE TARRO *250 BENNY', 2950, 1, 2950, 0, 0, 0, 2950, '2020-02-28'),
(480, 224, 158, 'MANI  NUTRI *250 grs SURTICOM', 2900, 1, 2900, 0, 0, 0, 2900, '2020-02-28'),
(481, 225, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2571.43, 4, 10800, 5, 514, 0, 10800, '2020-02-28'),
(482, 226, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-28'),
(483, 227, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-28'),
(484, 227, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-28'),
(485, 228, 110, 'VINIPEL  PLASVIMAS * 50 mts SURTICOM', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-28'),
(486, 228, 564, 'ALUMINIO REPUESTO HOUSE *40 HOUSE', 6176.47, 1, 7350, 19, 1174, 0, 7350, '2020-02-28'),
(487, 228, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-28'),
(488, 228, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(489, 228, 83, 'TAPAS VAS 7 ONZAS SURTICOM', 1932.77, 1, 2300, 19, 367, 0, 2300, '2020-02-28'),
(490, 229, 571, 'AREQUIPE TARRO *500 BENNY', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-28'),
(491, 230, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-28'),
(492, 231, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-28'),
(493, 232, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, -1, -6200, 19, -990, 0, -6200, '2020-02-28'),
(494, 232, 59, 'PORTACOMIDA J1 PACA *200 DARNEL', 33571.4, -2, -79899.9, 19, -12757, 0, -79899.9, '2020-02-28'),
(495, 233, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, 2, 12400, 19, 1980, 0, 12400, '2020-02-28');
INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `name`, `price`, `qt`, `subtotal`, `taxvalue`, `taxamount`, `discount`, `total`, `date`) VALUES
(496, 233, 59, 'PORTACOMIDA J1 PACA *200 DARNEL', 33571.4, 1, 39950, 19, 6379, 0, 39950, '2020-02-28'),
(497, 234, 103, 'PORTACOMIDA J-2 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-28'),
(498, 235, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 4, 50199.9, 19, 8015, 0, 50199.9, '2020-02-28'),
(499, 236, 534, 'BBQ SOBRES TOMATICO *100 TOMATICO', 3697.48, 2, 8800, 19, 1405, 0, 8800, '2020-02-28'),
(500, 237, 331, 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 13500, 1, 13500, 0, 0, 0, 13500, '2020-02-28'),
(501, 238, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(502, 239, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 1, 500, 0, 0, 0, 500, '2020-02-28'),
(503, 240, 250, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 5588.24, 2, 13300, 19, 2124, 0, 13300, '2020-02-28'),
(504, 240, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 20, 98999.9, 19, 15807, 0, 98999.9, '2020-02-28'),
(505, 241, 464, 'PAN HAMBURGUESA x 6 COUNTRY', 2300, 1, 2300, 0, 0, 0, 2300, '2020-02-28'),
(506, 241, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-28'),
(507, 242, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 1, 4400, 19, 703, 0, 4400, '2020-02-28'),
(508, 242, 692, 'PAPA LUTOSA * 2000', 11700, 3, 35100, 0, 0, 0, 35100, '2020-02-28'),
(509, 242, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 2, 17600, 19, 2810, 0, 17600, '2020-02-28'),
(510, 243, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-28'),
(511, 244, 449, 'QUESO DC *500 ENT ANGELES', 6400, 1, 6400, 0, 0, 0, 6400, '2020-02-28'),
(512, 244, 311, 'SALCHICHA POLLO XL CAMPOLLO UND SURTICOM', 1680.67, 1, 2000, 19, 319, 0, 2000, '2020-02-28'),
(513, 245, 646, 'SALCHICHON MADRIGAL * 1100 SURTICOM', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-28'),
(514, 246, 569, 'VASO PAPEL 6 Oz *50 HOUSE', 3529.41, 2, 8400, 19, 1341, 0, 8400, '2020-02-28'),
(515, 247, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2571.43, 1, 2700, 5, 129, 0, 2700, '2020-02-28'),
(516, 247, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-28'),
(517, 248, 538, 'MIEL TOMATICO *500 GRS TOMATICO', 2689.08, 1, 3200.01, 19, 511, 0, 3200.01, '2020-02-28'),
(518, 248, 504, 'MORA TOMATICO *1000 TOMATICO', 2983.19, 1, 3550, 19, 567, 0, 3550, '2020-02-28'),
(519, 249, 220, 'SERVILLETA FAMILIA *300 SURTICOM', 2521.01, 1, 3000, 19, 479, 0, 3000, '2020-02-28'),
(520, 250, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3361.34, 10, 39999.9, 19, 6387, 0, 39999.9, '2020-02-28'),
(521, 250, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 8991.6, 4, 42800, 19, 6834, 0, 42800, '2020-02-28'),
(522, 250, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 3, 13200, 19, 2108, 0, 13200, '2020-02-28'),
(523, 250, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 1, 12550, 19, 2004, 0, 12550, '2020-02-28'),
(524, 250, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-28'),
(525, 250, 331, 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 13500, 2, 27000, 0, 0, 0, 27000, '2020-02-28'),
(526, 251, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 2, 52000, 0, 0, 0, 52000, '2020-02-28'),
(527, 252, 421, 'LONJA DE BOCADILLO *500 GRS SURTICOM', 2100, 1, 2100, 0, 0, 0, 2100, '2020-02-28'),
(528, 253, 21, 'BOLSA ALUMINIO P-25 PIZZA SURTICOM', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-28'),
(529, 253, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(530, 254, 439, 'YUCA FROZZEN *100 SURTICOM', 3277.31, 10, 39000, 19, 6227, 0, 39000, '2020-02-28'),
(531, 254, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-28'),
(532, 254, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-28'),
(533, 254, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 6, 27600, 19, 4407, 0, 27600, '2020-02-28'),
(534, 254, 522, 'ROSADA SOBRES TOMATICO *100 TOMATICO', 3865.55, 6, 27600, 19, 4407, 0, 27600, '2020-02-28'),
(535, 254, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 6, 19800, 19, 3161, 0, 19800, '2020-02-28'),
(536, 255, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-28'),
(537, 255, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-28'),
(538, 256, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-28'),
(539, 256, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(540, 257, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-02-28'),
(541, 258, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-28'),
(542, 258, 554, 'GRANOLA * 500grs NUTRIGRANOLA', 3781.51, 1, 4500, 19, 718, 0, 4500, '2020-02-28'),
(543, 258, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-28'),
(544, 258, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(545, 259, 176, 'COPA 1/2 ON DARNEL *100 UNID DARNEL', 2310.92, 1, 2749.99, 19, 439, 0, 2749.99, '2020-02-28'),
(546, 260, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-28'),
(547, 260, 72, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 1, 14000, 0, 0, 0, 14000, '2020-02-28'),
(548, 260, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2571.43, 6, 16200, 5, 771, 0, 16200, '2020-02-28'),
(549, 260, 426, 'PRACTIPASTA FLAUTA *500 PRACTI PASTA', 2571.43, 4, 10800, 5, 514, 0, 10800, '2020-02-28'),
(550, 261, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3697.48, 10, 44000, 19, 7025, 0, 44000, '2020-02-28'),
(551, 262, 329, 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 7200, 1, 7200, 0, 0, 0, 7200, '2020-02-28'),
(552, 263, 485, 'MOSTAZA TOMATICO *4000 TOMATICO', 8319.33, 1, 9900, 19, 1581, 0, 9900, '2020-02-28'),
(553, 264, 329, 'CHAMPIÑON BLANCO *500 SETAS DE CUIVÁ', 7200, 1, 7200, 0, 0, 0, 7200, '2020-02-28'),
(554, 264, 450, 'QUESO DC *2500 TAJ ANGELES', 27000, 1, 27000, 0, 0, 0, 27000, '2020-02-28'),
(555, 265, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-28'),
(556, 266, 682, 'PORTACOMIDA T-1 *20 DARNEL', 8067.23, 1, 9600, 19, 1533, 0, 9600, '2020-02-28'),
(557, 267, 490, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 10084, 4, 47999.8, 19, 7664, 0, 47999.8, '2020-02-28'),
(558, 267, 397, 'ALUMINIO GOLDEN *100', 16386.6, 1, 19500.1, 19, 3113, 0, 19500.1, '2020-02-28'),
(559, 267, 478, 'TENEDOR GRANDE DECO *100 SURTICOM', 2773.11, 2, 6600, 19, 1054, 0, 6600, '2020-02-28'),
(560, 267, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 5, 46500, 19, 7424, 0, 46500, '2020-02-28'),
(561, 267, 495, 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-28'),
(562, 267, 465, 'TAPA BOCAS CAJA *50 SURTICOM', 7226.89, 1, 8600, 19, 1373, 0, 8600, '2020-02-28'),
(563, 267, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-28'),
(564, 267, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-28'),
(565, 267, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-28'),
(566, 267, 309, 'GUANTE VINILO TRANSP *100 SURTICOM', 8571.43, 1, 10200, 19, 1629, 0, 10200, '2020-02-28'),
(567, 268, 74, 'QUESO NAZARET *450 NAZARETH', 6000, 1, 6000, 0, 0, 0, 6000, '2020-02-28'),
(568, 269, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(569, 270, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-28'),
(570, 271, 526, 'MIEL MOSTAZA *1000 TOMATICO', 3529.41, 1, 4200, 19, 671, 0, 4200, '2020-02-28'),
(571, 272, 485, 'MOSTAZA TOMATICO *4000 TOMATICO', 8319.33, 4, 37620, 19, 6007, 1663.87, 39600, '2020-02-28'),
(572, 272, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 4, 36100, 19, 5764, 1596.64, 38000, '2020-02-28'),
(573, 272, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 4, 55100.1, 19, 8797, 2436.98, 58000.1, '2020-02-28'),
(574, 272, 490, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 10084, 4, 45599.8, 19, 7281, 2016.8, 47999.8, '2020-02-28'),
(575, 272, 489, 'MAYO AJO BOLSA *4000 TOMATICO', 12268.9, 4, 55480, 19, 8858, 2453.78, 58400, '2020-02-28'),
(576, 272, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 4, 54719.8, 19, 8737, 2420.16, 57599.8, '2020-02-28'),
(577, 273, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-28'),
(578, 273, 231, 'VASO TUC 7 Oz *25 TUC', 714.286, 2, 1700, 19, 271, 0, 1700, '2020-02-28'),
(579, 273, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 3, 8400.01, 5, 400, 0, 8400.01, '2020-02-28'),
(580, 274, 687, 'GUANTE NITRILO NEGRO *100 SURTICOM', 16638.7, 1, 19800.1, 19, 3161, 0, 19800.1, '2020-02-28'),
(581, 274, 465, 'TAPA BOCAS CAJA *50 SURTICOM', 7226.89, 1, 8600, 19, 1373, 0, 8600, '2020-02-28'),
(582, 274, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 10, 33000, 19, 5269, 0, 33000, '2020-02-28'),
(583, 274, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 4, 5999.98, 19, 958, 0, 5999.98, '2020-02-28'),
(584, 275, 498, 'SALSA NEGRA TOMATICO *3000cc TOMATICO', 6386.55, 1, 7599.99, 19, 1213, 0, 7599.99, '2020-02-28'),
(585, 275, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-28'),
(586, 275, 507, 'MAYONESA ESPAÑOLA *1000 TOMATICO', 3109.24, 1, 3700, 19, 591, 0, 3700, '2020-02-28'),
(587, 275, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-28'),
(588, 276, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 4, 5999.98, 19, 958, 0, 5999.98, '2020-02-28'),
(589, 276, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 10, 33000, 19, 5269, 0, 33000, '2020-02-28'),
(590, 277, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 3, 4499.98, 19, 718, 0, 4499.98, '2020-02-28'),
(591, 278, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-28'),
(592, 279, 147, 'ACEITE HIDROGENADO *500 g SURTICOM', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-28'),
(593, 280, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-28'),
(594, 280, 591, 'PAPA MEGA *500 SURTICOM', 2226.89, 1, 2650, 19, 423, 0, 2650, '2020-02-28'),
(595, 280, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-28'),
(596, 280, 250, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 5588.24, 1, 6650.01, 19, 1062, 0, 6650.01, '2020-02-28'),
(597, 280, 74, 'QUESO NAZARET *450 NAZARETH', 6000, 1, 6000, 0, 0, 0, 6000, '2020-02-28'),
(598, 281, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 2, 12400, 19, 1980, 0, 12400, '2020-02-28'),
(599, 282, 507, 'MAYONESA ESPAÑOLA *1000 TOMATICO', 3109.24, 1, 3700, 19, 591, 0, 3700, '2020-02-28'),
(600, 282, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 40, 1400, 19, 224, 0, 1400, '2020-02-28'),
(601, 282, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-28'),
(602, 282, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-28'),
(603, 282, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-28'),
(604, 282, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-28'),
(605, 283, 595, 'GUANTE VINILO NEGRO *100 SURTICOM', 16638.7, 1, 19800.1, 19, 3161, 0, 19800.1, '2020-02-28'),
(606, 284, 457, 'QUESO COSTEÑO *500 ANGELES', 7200, 1, 7200, 0, 0, 0, 7200, '2020-02-28'),
(607, 285, 515, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 1722.69, 1, 2050, 19, 327, 0, 2050, '2020-02-29'),
(608, 286, 485, 'MOSTAZA TOMATICO *4000 TOMATICO', 8319.33, 1, 9900, 19, 1581, 0, 9900, '2020-02-29'),
(609, 286, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-29'),
(610, 287, 610, 'VASO VBC 9 Oz *50 ATIKAS', 1806.72, 2, 4299.99, 19, 687, 0, 4299.99, '2020-02-29'),
(611, 288, 691, 'IMPUESTO A LAS BOLSAS', 200, 5, 1000, 0, 0, 0, 1000, '2020-02-29'),
(612, 289, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(613, 290, 406, 'CHORIZO PAISA *12 SURTICOM', 10084, 4, 47999.8, 19, 7664, 0, 47999.8, '2020-02-29'),
(614, 290, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(615, 291, 634, 'PAPA FROZZEN *1000G SURTICOM', 4201.68, 2, 10000, 19, 1597, 0, 10000, '2020-02-29'),
(616, 292, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 1, 500, 0, 0, 0, 500, '2020-02-29'),
(617, 293, 637, 'MAIZ FROZZEN *500 SURTICOM', 3697.48, 1, 4400, 19, 703, 0, 4400, '2020-02-29'),
(618, 294, 92, 'GUANTES VINITRILO NEGROS *UND EL SOL', 500, 1, 500, 0, 0, 0, 500, '2020-02-29'),
(619, 295, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(620, 295, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-29'),
(621, 295, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 3, 7500, 19, 1197, 0, 7500, '2020-02-29'),
(622, 295, 596, 'CHORIZO MADRIGAL *10 SURTICOM', 7815.13, 2, 18600, 19, 2970, 0, 18600, '2020-02-29'),
(623, 295, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(624, 295, 663, 'PAN PERRO *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-29'),
(625, 295, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-29'),
(626, 295, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-29'),
(627, 295, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-29'),
(628, 295, 147, 'ACEITE HIDROGENADO *500 g SURTICOM', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-29'),
(629, 295, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-29'),
(630, 296, 390, 'VINAGRE DE MANZANA DEL CASINO  *500 DELCASINO', 1512.61, 1, 1800.01, 19, 287, 0, 1800.01, '2020-02-29'),
(631, 297, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, 2, 4599.99, 19, 734, 0, 4599.99, '2020-02-29'),
(632, 298, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-29'),
(633, 299, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 2, 7200, 19, 1150, 0, 7200, '2020-02-29'),
(634, 300, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-29'),
(635, 300, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 5, 56000, 19, 8941, 0, 56000, '2020-02-29'),
(636, 300, 406, 'CHORIZO PAISA *12 SURTICOM', 10084, 1, 12000, 19, 1916, 0, 12000, '2020-02-29'),
(637, 300, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-29'),
(638, 301, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 5, 44000, 19, 7025, 0, 44000, '2020-02-29'),
(639, 302, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-29'),
(640, 303, 646, 'SALCHICHON MADRIGAL * 1100 SURTICOM', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-29'),
(641, 304, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-29'),
(642, 305, 681, 'PORTACOMIDA P-1 *20 DARNEL', 4117.65, 1, 4900, 19, 782, 0, 4900, '2020-02-29'),
(643, 305, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-29'),
(644, 305, 261, 'UVA PASA *250 SURTICOM', 3000, 2, 6000, 0, 0, 0, 6000, '2020-02-29'),
(645, 305, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-29'),
(646, 305, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(647, 305, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 6, 8999.97, 19, 1437, 0, 8999.97, '2020-02-29'),
(648, 305, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 2, 10600, 19, 1692, 0, 10600, '2020-02-29'),
(649, 305, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 2, 34000, 19, 5429, 0, 34000, '2020-02-29'),
(650, 306, 570, 'AREQUIPE TARRO *1000 BENNY', 5000, 1, 5950, 19, 950, 0, 5950, '2020-02-29'),
(651, 307, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 12, 32400, 19, 5173, 0, 32400, '2020-02-29'),
(652, 307, 522, 'ROSADA SOBRES TOMATICO *100 TOMATICO', 3865.55, 12, 55200.1, 19, 8813, 0, 55200.1, '2020-02-29'),
(653, 307, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 24, 50400.1, 19, 8047, 0, 50400.1, '2020-02-29'),
(654, 307, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 12, 39600, 19, 6323, 0, 39600, '2020-02-29'),
(655, 307, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 12, 51600.1, 19, 8239, 0, 51600.1, '2020-02-29'),
(656, 308, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 3, 13800, 19, 2203, 0, 13800, '2020-02-29'),
(657, 308, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 3, 9900, 19, 1581, 0, 9900, '2020-02-29'),
(658, 309, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-29'),
(659, 309, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 2, 6600, 19, 1054, 0, 6600, '2020-02-29'),
(660, 309, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-29'),
(661, 309, 139, 'BOLSA MANIJA 2 K SURTICOM', 1344.54, 1, 1600, 19, 255, 0, 1600, '2020-02-29'),
(662, 309, 124, 'BOLSA ALUMINIO L-21 SURTICOM', 2016.81, 2, 4800.01, 19, 766, 0, 4800.01, '2020-02-29'),
(663, 309, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(664, 309, 278, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 5798.32, 1, 6900, 19, 1102, 0, 6900, '2020-02-29'),
(665, 309, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(666, 310, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(667, 311, 532, 'SALSA SOYA TOMATICO *500 CC TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-29'),
(668, 311, 149, 'HUEVOS DE CODORNIS *24 UNI SURTICOM', 3500, 1, 3500, 0, 0, 0, 3500, '2020-02-29'),
(669, 312, 60, 'PORTACOMIDA P1 PACA *200 DARNEL', 39075.6, 1, 46500, 19, 7424, 0, 46500, '2020-02-29'),
(670, 312, 138, 'BOLSA MANIJA 15 K SURTICOM', 4537.81, 2, 10800, 19, 1724, 0, 10800, '2020-02-29'),
(671, 312, 59, 'PORTACOMIDA J1 PACA *200 DARNEL', 33571.4, 1, 39950, 19, 6379, 0, 39950, '2020-02-29'),
(672, 312, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 2, 7000.01, 19, 1118, 0, 7000.01, '2020-02-29'),
(673, 312, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, 10, 23000, 19, 3672, 0, 23000, '2020-02-29'),
(674, 312, 132, 'BOLSA ALUMINIO L-19 SURTICOM', 1764.71, 4, 8400.02, 19, 1341, 0, 8400.02, '2020-02-29'),
(675, 312, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 8, 12000, 19, 1916, 0, 12000, '2020-02-29'),
(676, 312, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 5, 14000, 19, 2235, 0, 14000, '2020-02-29'),
(677, 312, 278, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 5798.32, 2, 13800, 19, 2203, 0, 13800, '2020-02-29'),
(678, 313, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2571.43, 1, 2700, 5, 129, 0, 2700, '2020-02-29'),
(679, 313, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-29'),
(680, 314, 492, 'PASTA DE TOMATE TOMATICO *4000 TOMATICO', 16596.6, 1, 19750, 19, 3153, 0, 19750, '2020-02-29'),
(681, 315, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-02-29'),
(682, 315, 224, 'TOCINETA AHUMADA *500 PROCARSAN SURTICOM', 6722.69, 1, 8000, 19, 1277, 0, 8000, '2020-02-29'),
(683, 316, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-29'),
(684, 316, 499, 'MOSTAZA TOMATICO *1000 TOMATICO', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-29'),
(685, 316, 501, 'TARTARA TOMATICO *1000 TOMATICO', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-29'),
(686, 316, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(687, 316, 146, 'BOLSA PARAFINADA *100 SURTICOM', 5042.02, 1, 6000, 19, 958, 0, 6000, '2020-02-29'),
(688, 316, 133, 'BOLSA PAPEL 1/2 LIBRA SURTICOM', 966.387, 1, 1150, 19, 184, 0, 1150, '2020-02-29'),
(689, 317, 453, 'QUESO CAMPESINO ANGELES *500 ANGELES', 5200, 1, 5200, 0, 0, 0, 5200, '2020-02-29'),
(690, 318, 681, 'PORTACOMIDA P-1 *20 DARNEL', 4117.65, 1, 4900, 19, 782, 0, 4900, '2020-02-29'),
(691, 319, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, -7, -16100, 19, -2571, 0, -16100, '2020-02-29'),
(692, 319, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, -2, -7000.01, 19, -1118, 0, -7000.01, '2020-02-29'),
(693, 320, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-02-29'),
(694, 321, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 6, 25800, 19, 4119, 0, 25800, '2020-02-29'),
(695, 321, 506, 'TOMATE ESPAÑOLA *1000 TOMATICO', 2268.91, 2, 5400.01, 19, 862, 0, 5400.01, '2020-02-29'),
(696, 321, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 4, 9400, 19, 1501, 0, 9400, '2020-02-29'),
(697, 321, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 6, 24600, 19, 3928, 0, 24600, '2020-02-29'),
(698, 321, 501, 'TARTARA TOMATICO *1000 TOMATICO', 3949.58, 4, 18800, 19, 3002, 0, 18800, '2020-02-29'),
(699, 321, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 3, 7500, 19, 1197, 0, 7500, '2020-02-29'),
(700, 321, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 5, 16500, 19, 2634, 0, 16500, '2020-02-29'),
(701, 321, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 3, 10800, 5, 514, 0, 10800, '2020-02-29'),
(702, 322, 234, 'CREMA DE LECHE  ALQUERIA *200 ALQUERIA', 1932.77, 1, 2300, 19, 367, 0, 2300, '2020-02-29'),
(703, 323, 272, 'CONTENEDOR 12 Oz *20 DARNEL', 4033.61, 1, 4800, 19, 766, 0, 4800, '2020-02-29'),
(704, 324, 495, 'VINAGRE TOMATICO  GARRAFA *3000cc TOMATICO', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-29'),
(705, 325, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 4, 24800, 19, 3960, 0, 24800, '2020-02-29'),
(706, 325, 59, 'PORTACOMIDA J1 PACA *200 DARNEL', 33571.4, 1, 39950, 19, 6379, 0, 39950, '2020-02-29'),
(707, 325, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 15, 255000, 19, 40714, 0, 255000, '2020-02-29'),
(708, 326, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 4, 5999.98, 19, 958, 0, 5999.98, '2020-02-29'),
(709, 327, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-29'),
(710, 328, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-29'),
(711, 328, 637, 'MAIZ FROZZEN *500 SURTICOM', 3697.48, 2, 8800, 19, 1405, 0, 8800, '2020-02-29'),
(712, 328, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 1, 5600, 19, 894, 0, 5600, '2020-02-29'),
(713, 328, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(714, 328, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 4, 14400, 5, 686, 0, 14400, '2020-02-29'),
(715, 329, 634, 'PAPA FROZZEN *1000G SURTICOM', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-29'),
(716, 330, 637, 'MAIZ FROZZEN *500 SURTICOM', 3697.48, 4, 17600, 19, 2810, 0, 17600, '2020-02-29'),
(717, 330, 682, 'PORTACOMIDA T-1 *20 DARNEL', 8067.23, 1, 9600, 19, 1533, 0, 9600, '2020-02-29'),
(718, 330, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-02-29'),
(719, 330, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-29'),
(720, 330, 676, 'PORTA PERRO *UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-02-29'),
(721, 330, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 3, 50999.9, 19, 8143, 0, 50999.9, '2020-02-29'),
(722, 330, 450, 'QUESO DC *2500 TAJ ANGELES', 27000, 1, 27000, 0, 0, 0, 27000, '2020-02-29'),
(723, 330, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 3, 8400, 19, 1341, 0, 8400, '2020-02-29'),
(724, 330, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-02-29'),
(725, 330, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-29'),
(726, 330, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 2, 9899.99, 19, 1581, 0, 9899.99, '2020-02-29'),
(727, 331, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 1, 12600, 19, 2012, 0, 12600, '2020-02-29'),
(728, 331, 647, 'PAPA GLORIA TRITURADA *1000 KRUMER SHIPS', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-29'),
(729, 331, 512, 'MORA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-29'),
(730, 332, 676, 'PORTA PERRO *UNIDAD SURTICOM', 29.4118, 40, 1400, 19, 224, 0, 1400, '2020-02-29'),
(731, 332, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-29'),
(732, 333, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(733, 334, 250, 'SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA', 5588.24, 1, 6650.01, 19, 1062, 0, 6650.01, '2020-02-29'),
(734, 334, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 13, 64349.9, 19, 10274, 0, 64349.9, '2020-02-29'),
(735, 335, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-02-29'),
(736, 336, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(737, 336, 468, 'GELATINA FRESA PICCOLO *500 SURTICOM', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-29'),
(738, 337, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 1, 3500, 19, 559, 0, 3500, '2020-02-29'),
(739, 338, 468, 'GELATINA FRESA PICCOLO *500 SURTICOM', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-02-29'),
(740, 338, 471, 'GRAJEAS *500 GRS PICOLLO', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-29'),
(741, 339, 358, 'SALCHICHA ROMANA *1350 MARTSANG', 16554.6, 2, 39399.9, 19, 6291, 0, 39399.9, '2020-02-29'),
(742, 340, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 1, 12600, 19, 2012, 0, 12600, '2020-02-29'),
(743, 341, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-29'),
(744, 341, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(745, 341, 542, 'MAYO MOSTAZA *500 TOMATICO', 2142.86, 1, 2550, 19, 407, 0, 2550, '2020-02-29'),
(746, 341, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-29'),
(747, 341, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-29'),
(748, 341, 509, 'ROSADA TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-29'),
(749, 341, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-29'),
(750, 341, 236, 'CREMA DE LECHE ALQUERIA *450 ALQUERIA', 4369.75, 1, 5200, 19, 830, 0, 5200, '2020-02-29'),
(751, 341, 73, 'QUESO MEDIO BLOQUE TAJADO SURTICOM', 13750, 1, 13750, 0, 0, 0, 13750, '2020-02-29'),
(752, 342, 634, 'PAPA FROZZEN *1000G SURTICOM', 4201.68, 4, 20000, 19, 3193, 0, 20000, '2020-02-29'),
(753, 342, 639, 'PAPA FROZZEN *500 SURTICOM', 2100.84, 5, 12500, 19, 1996, 0, 12500, '2020-02-29'),
(754, 343, 327, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 840.336, 1, 1000, 19, 160, 0, 1000, '2020-02-29'),
(755, 343, 679, 'PORTACOMIDA J-1 *20 DARNEL', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(756, 343, 682, 'PORTACOMIDA T-1 *20 DARNEL', 8067.23, 1, 9600, 19, 1533, 0, 9600, '2020-02-29'),
(757, 343, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 1, 14400, 19, 2299, 0, 14400, '2020-02-29'),
(758, 343, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-29'),
(759, 343, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-29'),
(760, 343, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 4, 17600, 19, 2810, 0, 17600, '2020-02-29'),
(761, 343, 450, 'QUESO DC *2500 TAJ ANGELES', 27000, 1, 27000, 0, 0, 0, 27000, '2020-02-29'),
(762, 343, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 2, 52000, 0, 0, 0, 52000, '2020-02-29'),
(763, 344, 228, 'AZUCAR SOBRES *100 SURTICOM', 3949.58, 1, 4700, 19, 750, 0, 4700, '2020-02-29'),
(764, 345, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 2, 5600.01, 5, 267, 0, 5600.01, '2020-02-29'),
(765, 346, 111, 'VINIPEL PLASVIMAS *20 mts SURTICOM', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-29'),
(766, 347, 529, 'BBQ TOMATICO *500 TOMATICO', 1974.79, 1, 2350, 19, 375, 0, 2350, '2020-02-29'),
(767, 347, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-29'),
(768, 347, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-29'),
(769, 347, 515, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 1722.69, 1, 2050, 19, 327, 0, 2050, '2020-02-29'),
(770, 347, 505, 'PASTA DE TOMATE TOMATICO *1000 TOMATICO', 4705.88, 1, 5600, 19, 894, 0, 5600, '2020-02-29'),
(771, 347, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-29'),
(772, 347, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(773, 347, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 4, 104000, 0, 0, 0, 104000, '2020-02-29'),
(774, 348, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 60, 2100, 19, 335, 0, 2100, '2020-02-29'),
(775, 349, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 1, 14400, 19, 2299, 0, 14400, '2020-02-29'),
(776, 350, 330, 'CHAMPIÑON BLANCO *250 SETAS DE CUIVÁ', 3800, 1, 3800, 0, 0, 0, 3800, '2020-02-29'),
(777, 350, 637, 'MAIZ FROZZEN *500 SURTICOM', 3697.48, 2, 8800, 19, 1405, 0, 8800, '2020-02-29'),
(778, 350, 692, 'PAPA LUTOSA * 2000', 11700, 3, 35100, 0, 0, 0, 35100, '2020-02-29'),
(779, 350, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-29'),
(780, 351, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-29'),
(781, 352, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-02-29'),
(782, 353, 363, 'TOCINETA BACON *500 MARTSANG', 7142.86, 4, 34000, 19, 5429, 0, 34000, '2020-02-29'),
(783, 353, 441, 'TOCINETA AHUMADA *250 PROCARSAN SURTICOM', 3991.6, 9, 42750, 19, 6826, 0, 42750, '2020-02-29'),
(784, 354, 526, 'MIEL MOSTAZA *1000 TOMATICO', 3529.41, 1, 4200, 19, 671, 0, 4200, '2020-02-29'),
(785, 355, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-02-29'),
(786, 356, 450, 'QUESO DC *2500 TAJ ANGELES', 27000, 1, 27000, 0, 0, 0, 27000, '2020-02-29'),
(787, 356, 499, 'MOSTAZA TOMATICO *1000 TOMATICO', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-02-29'),
(788, 356, 379, 'ROSADA DELCASINO *4000 DELCASINO', 15252.1, 1, 18150, 19, 2898, 0, 18150, '2020-02-29'),
(789, 357, 68, 'SALCHICHA MAXIDOG  *24 *1300 FRIGOSAN', 7058.82, 1, 8400, 19, 1341, 0, 8400, '2020-02-29'),
(790, 358, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(791, 358, 591, 'PAPA MEGA *500 SURTICOM', 2226.89, 1, 2650, 19, 423, 0, 2650, '2020-02-29'),
(792, 358, 464, 'PAN HAMBURGUESA x 6 COUNTRY', 2300, 1, 2300, 0, 0, 0, 2300, '2020-02-29'),
(793, 359, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(794, 360, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 2, 3400, 19, 543, 0, 3400, '2020-02-29'),
(795, 361, 72, 'QUESO MEDIO BLOQUE SIN TAJAR SURTICOM', 14000, 1, 14000, 0, 0, 0, 14000, '2020-02-29'),
(796, 362, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-29'),
(797, 362, 403, 'JAMON FROSTER *500 SURTICOM', 3361.34, 1, 3999.99, 19, 639, 0, 3999.99, '2020-02-29'),
(798, 362, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-02-29'),
(799, 362, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 2, 5000, 19, 798, 0, 5000, '2020-02-29'),
(800, 362, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 3, 10800, 19, 1724, 0, 10800, '2020-02-29'),
(801, 362, 147, 'ACEITE HIDROGENADO *500 g SURTICOM', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-02-29'),
(802, 362, 327, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 840.336, 1, 1000, 19, 160, 0, 1000, '2020-02-29'),
(803, 362, 573, 'ALUMINIO MIO *16 mts MIO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(804, 362, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 20, 700.001, 19, 112, 0, 700.001, '2020-02-29'),
(805, 363, 552, 'CHORIZO MIXTO DANGUS *1080 SURTICOM', 11764.7, 1, 14000, 19, 2235, 0, 14000, '2020-02-29'),
(806, 363, 76, 'SALCHICHA MANGUERA *1 MARTSANG', 1008.4, 4, 4799.98, 19, 766, 0, 4799.98, '2020-02-29'),
(807, 363, 511, 'PIÑA TOMATICO *500 TOMATICO', 1764.71, 1, 2100, 19, 335, 0, 2100, '2020-02-29'),
(808, 363, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-29'),
(809, 364, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(810, 364, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-02-29'),
(811, 364, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(812, 365, 619, 'QUESO DC NAZARET TAJ *2500 NAZARETH', 28500, 1, 28500, 0, 0, 0, 28500, '2020-02-29'),
(813, 366, 619, 'QUESO DC NAZARET TAJ *2500 NAZARETH', 28500, 2, 57000, 0, 0, 0, 57000, '2020-02-29'),
(814, 367, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, -1, -3600, 19, -575, 0, -3600, '2020-02-29'),
(815, 368, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 2, 5600, 19, 894, 0, 5600, '2020-02-29'),
(816, 369, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-02-29'),
(817, 369, 634, 'PAPA FROZZEN *1000G SURTICOM', 4201.68, 1, 5000, 19, 798, 0, 5000, '2020-02-29'),
(818, 370, 58, 'PORTACOMIDA C1 PACA *500 DARNEL', 50588.2, 1, 60200, 19, 9612, 0, 60200, '2020-02-29'),
(819, 370, 278, 'CONTENEDOR 24 ONZAS X 20 UNIDADES DARNEL', 5798.32, 3, 20700, 19, 3305, 0, 20700, '2020-02-29'),
(820, 370, 273, 'CONTENEDOR DE 16 ONZ*20 UNI DARNEL', 5210.08, 2, 12400, 19, 1980, 0, 12400, '2020-02-29'),
(821, 371, 114, 'SALCHICHON MARTSANG *950 MARTSANG', 4571.43, 1, 4800, 5, 229, 0, 4800, '2020-02-29'),
(822, 372, 401, 'SALCHICHA SUPER DOG * 24 SURTICOM', 5462.19, 1, 6500.01, 19, 1038, 0, 6500.01, '2020-02-29'),
(823, 373, 136, 'BOLSA MANIJA 1.5 K SURTICOM', 1218.49, 2, 2900.01, 19, 463, 0, 2900.01, '2020-02-29'),
(824, 373, 117, 'BOLSA MANIJA 25 K SURTICOM', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-02-29'),
(825, 373, 137, 'BOLSA MANIJA 10 K SURTICOM', 3529.41, 1, 4200, 19, 671, 0, 4200, '2020-02-29'),
(826, 373, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, 2, 4599.99, 19, 734, 0, 4599.99, '2020-02-29'),
(827, 374, 307, 'OBLEAS BENY *50 BENNY', 8800, 1, 8800, 0, 0, 0, 8800, '2020-02-29'),
(828, 375, 562, 'PALILLO TIPO SANDWICH *35 gr SURTICOM', 756.303, 10, 9000.01, 19, 1437, 0, 9000.01, '2020-02-29'),
(829, 375, 551, 'HAMBURGUESA COLCARNES *500', 3865.55, 3, 13800, 19, 2203, 0, 13800, '2020-02-29'),
(830, 375, 478, 'TENEDOR GRANDE DECO *100 SURTICOM', 2773.11, 2, 6600, 19, 1054, 0, 6600, '2020-02-29'),
(831, 375, 406, 'CHORIZO PAISA *12 SURTICOM', 10084, 3, 35999.9, 19, 5748, 0, 35999.9, '2020-02-29'),
(832, 375, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 4, 50199.9, 19, 8015, 0, 50199.9, '2020-02-29'),
(833, 375, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-02-29'),
(834, 375, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 4, 38000, 19, 6067, 0, 38000, '2020-02-29'),
(835, 376, 168, 'TENEDOR GRANDE *100 TAMI', 3277.31, 1, 3900, 19, 623, 0, 3900, '2020-02-29'),
(836, 377, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-02-29'),
(837, 378, 425, 'PRACTIPASTA EMPANADA *500 PRACTI PASTA', 2571.43, 2, 5400, 5, 257, 0, 5400, '2020-02-29'),
(838, 379, 453, 'QUESO CAMPESINO ANGELES *500 ANGELES', 5200, 1, 5200, 0, 0, 0, 5200, '2020-02-29'),
(839, 379, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-02-29'),
(840, 380, 466, 'LONJA BOCADILLO COMBINADO SURTICOM', 2200, 1, 2200, 0, 0, 0, 2200, '2020-02-29'),
(841, 381, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-29'),
(842, 381, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 2, 25400.1, 19, 4055, 0, 25400.1, '2020-02-29'),
(843, 382, 617, 'QUESO PERA NAZARETH *500G SURTICOM', 7700, 1, 7700, 0, 0, 0, 7700, '2020-02-29'),
(844, 382, 287, 'PLATO PANDO 23cm *20 DARNEL', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-02-29'),
(845, 383, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-29'),
(846, 384, 153, 'SALCHICHON SANTA RITA 900 GR SURTICOM', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(847, 384, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-02-29'),
(848, 384, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-02-29'),
(849, 384, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-02-29'),
(850, 384, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-02-29'),
(851, 384, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-02-29'),
(852, 384, 460, 'PAN  TAJADO MANTEQUILA *500 COUNTRY', 3000, 1, 3000, 0, 0, 0, 3000, '2020-02-29'),
(853, 385, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 1, 17000, 19, 2714, 0, 17000, '2020-02-29'),
(854, 386, 532, 'SALSA SOYA TOMATICO *500 CC TOMATICO', 2268.91, 1, 2700, 19, 431, 0, 2700, '2020-03-01'),
(855, 387, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 0.5, 2900, 0, 0, 0, 2900, '2020-03-01'),
(856, 388, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-03-01'),
(857, 388, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-03-01'),
(858, 388, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-03-01'),
(859, 389, 21, 'BOLSA ALUMINIO P-25 PIZZA SURTICOM', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-03-01'),
(860, 389, 220, 'SERVILLETA FAMILIA *300 SURTICOM', 2521.01, 1, 3000, 19, 479, 0, 3000, '2020-03-01'),
(861, 389, 363, 'TOCINETA BACON *500 MARTSANG', 7142.86, 1, 8500, 19, 1357, 0, 8500, '2020-03-01'),
(862, 389, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 1, 11200, 19, 1788, 0, 11200, '2020-03-01'),
(863, 389, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 4, 17600, 19, 2810, 0, 17600, '2020-03-01'),
(864, 389, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-03-01'),
(865, 390, 498, 'SALSA NEGRA TOMATICO *3000cc TOMATICO', 6386.55, 4, 30400, 19, 4854, 0, 30400, '2020-03-01'),
(866, 391, 261, 'UVA PASA *250 SURTICOM', 3000, 1, 3000, 0, 0, 0, 3000, '2020-03-01'),
(867, 392, 590, 'PAPA CABELLO ANGEL MEGA *1000 ', 4159.66, 1, 4950, 19, 790, 0, 4950, '2020-03-01'),
(868, 392, 472, 'GRAJEAS * 250 GR PICOLLO', 1848.74, 1, 2200, 19, 351, 0, 2200, '2020-03-01'),
(869, 392, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-03-01'),
(870, 392, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-03-01'),
(871, 392, 514, 'TOMATE ESPAÑOLA *500 TOMATICO', 1428.57, 2, 3400, 19, 543, 0, 3400, '2020-03-01'),
(872, 392, 44, 'PIÑA TROZOS CAMPIFRUT*1000 SURTICOM', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-03-01'),
(873, 393, 76, 'SALCHICHA MANGUERA *1 MARTSANG', 1008.4, 1, 1200, 19, 192, 0, 1200, '2020-03-01'),
(874, 394, 439, 'YUCA FROZZEN *100 SURTICOM', 3277.31, 1, 3900, 19, 623, 0, 3900, '2020-03-01'),
(875, 395, 155, 'SALCHICHA CALIFORNIA *18 FRIGOSAN', 10588.2, 2, 25199.9, 19, 4024, 0, 25199.9, '2020-03-01'),
(876, 396, 692, 'PAPA LUTOSA * 2000', 11700, 1, 11700, 0, 0, 0, 11700, '2020-03-01'),
(877, 397, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3697.48, 10, 44000, 19, 7025, 0, 44000, '2020-03-01'),
(878, 397, 154, 'SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN', 9411.76, 2, 22400, 19, 3576, 0, 22400, '2020-03-01'),
(879, 397, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 2, 8800, 19, 1405, 0, 8800, '2020-03-01'),
(880, 397, 638, 'MAIZ FROZZEN *1000 SURTICOM', 7394.96, 1, 8800, 19, 1405, 0, 8800, '2020-03-01'),
(881, 397, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 1, 9500, 19, 1517, 0, 9500, '2020-03-01'),
(882, 397, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 1, 12550, 19, 2004, 0, 12550, '2020-03-01'),
(883, 397, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 1, 14500, 19, 2315, 0, 14500, '2020-03-01'),
(884, 398, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-03-01'),
(885, 399, 363, 'TOCINETA BACON *500 MARTSANG', 7142.86, 1, 8500, 19, 1357, 0, 8500, '2020-03-01'),
(886, 400, 637, 'MAIZ FROZZEN *500 SURTICOM', 3697.48, 1, 4400, 19, 703, 0, 4400, '2020-03-01'),
(887, 400, 331, 'CHAMPIÑON BLANCO *1000 SETAS DE CUIVÁ', 13500, 1, 13500, 0, 0, 0, 13500, '2020-03-01'),
(888, 401, 593, 'JAMON LORD FINO *500 HAMBURGUER', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-03-01'),
(889, 401, 335, 'SERVILLETA NUBE *320 DARNEL', 2352.94, 1, 2800, 19, 447, 0, 2800, '2020-03-01'),
(890, 401, 515, 'MAYONESA ESPAÑOLA  *500 TOMATICO', 1722.69, 1, 2050, 19, 327, 0, 2050, '2020-03-01'),
(891, 401, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 2, 2999.99, 19, 479, 0, 2999.99, '2020-03-01'),
(892, 401, 655, 'PAPA CABELLO ANGEL KRU *500 KRUMER SHIPS', 2647.06, 1, 3150, 19, 503, 0, 3150, '2020-03-01'),
(893, 401, 573, 'ALUMINIO MIO *16 mts MIO', 3445.38, 1, 4100, 19, 655, 0, 4100, '2020-03-01'),
(894, 401, 401, 'SALCHICHA SUPER DOG * 24 SURTICOM', 5462.19, 1, 6500.01, 19, 1038, 0, 6500.01, '2020-03-01'),
(895, 401, 648, 'HAMBURGUESA PREMIUM *10 CIAL SAS', 2100.84, 3, 7500, 19, 1197, 0, 7500, '2020-03-01'),
(896, 402, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-03-01'),
(897, 403, 439, 'YUCA FROZZEN *100 SURTICOM', 3277.31, 1, 3900, 19, 623, 0, 3900, '2020-03-01'),
(898, 404, 128, 'BOLSA ALUMINIO L-25 SURTICOM', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-03-01'),
(899, 404, 261, 'UVA PASA *250 SURTICOM', 3000, 2, 6000, 0, 0, 0, 6000, '2020-03-01'),
(900, 404, 668, 'GUANTES MANIPULACION SURTICOM', 2000, 2, 4000, 0, 0, 0, 4000, '2020-03-01'),
(901, 404, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 2, 10600, 19, 1692, 0, 10600, '2020-03-01'),
(902, 405, 503, 'PIÑA TOMATICO *1000 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-03-01'),
(903, 405, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-03-01'),
(904, 406, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-03-01'),
(905, 406, 510, 'TARTARA TOMATICO *500GR TOMATICO', 2100.84, 1, 2500, 19, 399, 0, 2500, '2020-03-01'),
(906, 407, 688, 'PAPEL PARAFINADO *100 SURTICOM', 5546.22, 1, 6600, 19, 1054, 0, 6600, '2020-03-01'),
(907, 408, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 2, 9200.01, 19, 1469, 0, 9200.01, '2020-03-01'),
(908, 408, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 2, 6600, 19, 1054, 0, 6600, '2020-03-01'),
(909, 409, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 37, 1295, 19, 207, 0, 1295, '2020-03-01'),
(910, 409, 508, 'MOSTAZA TOMATICO *500 TOMATICO', 1428.57, 1, 1700, 19, 271, 0, 1700, '2020-03-01'),
(911, 409, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 1, 4300.01, 19, 687, 0, 4300.01, '2020-03-01'),
(912, 409, 446, 'QUESO DC *2500 ENTERO ANGELES', 26000, 1, 26000, 0, 0, 0, 26000, '2020-03-01'),
(913, 410, 464, 'PAN HAMBURGUESA x 6 COUNTRY', 2300, 1, 2300, 0, 0, 0, 2300, '2020-03-01'),
(914, 410, 551, 'HAMBURGUESA COLCARNES *500', 3865.55, 2, 9200.01, 19, 1469, 0, 9200.01, '2020-03-01'),
(915, 410, 540, 'TOMATE SOBRES ESPAÑOLA *100 TOMATICO', 2773.11, 1, 3300, 19, 527, 0, 3300, '2020-03-01'),
(916, 410, 523, 'MIEL SOBRES TOMATICO *100 TOMATICO', 3865.55, 1, 4600, 19, 734, 0, 4600, '2020-03-01'),
(917, 411, 156, 'SALCHICHON POLLO ESPAÑOL *900 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-03-01'),
(918, 412, 678, 'PORTACOMIDA C-1 *50 UNIDA DARNEL', 5210.08, 1, 6200, 19, 990, 0, 6200, '2020-03-01'),
(919, 413, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 4, 38000, 19, 6067, 0, 38000, '2020-03-01'),
(920, 414, 528, 'BBQ TOMATICO *1000 TOMATICO', 3445.38, 12, 49200, 19, 7855, 0, 49200, '2020-03-01'),
(921, 414, 500, 'ROSADA TOMATICO *1000 TOMATICO', 3613.45, 12, 51600.1, 19, 8239, 0, 51600.1, '2020-03-01'),
(922, 414, 487, 'ROSADA TOMATICO *4000 TOMATICO', 12184.9, 4, 58000.1, 19, 9261, 0, 58000.1, '2020-03-01'),
(923, 414, 527, 'BBQ TOMATICO *4000 TOMATICO', 12100.8, 4, 57599.8, 19, 9197, 0, 57599.8, '2020-03-01'),
(924, 414, 493, 'TOMATE ESPAÑOLA *4000 TOMATICO', 7983.19, 4, 38000, 19, 6067, 0, 38000, '2020-03-01'),
(925, 415, 492, 'PASTA DE TOMATE TOMATICO *4000 TOMATICO', 16596.6, 1, 19750, 19, 3153, 0, 19750, '2020-03-01'),
(926, 416, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-03-01'),
(927, 417, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-03-01'),
(928, 417, 688, 'PAPEL PARAFINADO *100 SURTICOM', 5546.22, 1, 6600, 19, 1054, 0, 6600, '2020-03-01'),
(929, 417, 606, 'VASO VBC 5.5 Oz VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-03-01'),
(930, 417, 327, 'PALILLOS HAMBURGUESA FESTIVAL EL SOL', 840.336, 1, 1000, 19, 160, 0, 1000, '2020-03-01'),
(931, 418, 75, 'DELIPIÑA 2500 SURTICOM', 4453.78, 1, 5300, 19, 846, 0, 5300, '2020-03-01'),
(932, 418, 140, 'BOLSA MANIJA 3 K SURTICOM', 1932.77, 2, 4599.99, 19, 734, 0, 4599.99, '2020-03-01'),
(933, 418, 139, 'BOLSA MANIJA 2 K SURTICOM', 1344.54, 2, 3200.01, 19, 511, 0, 3200.01, '2020-03-01'),
(934, 418, 137, 'BOLSA MANIJA 10 K SURTICOM', 3529.41, 2, 8400, 19, 1341, 0, 8400, '2020-03-01'),
(935, 418, 141, 'BOLSA MANIJA 5 K SURTICOM', 2941.18, 2, 7000.01, 19, 1118, 0, 7000.01, '2020-03-01'),
(936, 418, 402, 'SALCHICHA MANGUERA SABORÉ *15 SURTICOM', 14285.7, 15, 255000, 19, 40714, 0, 255000, '2020-03-01'),
(937, 419, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-03-01'),
(938, 419, 675, 'PORTA HAMBURGUES * UNIDAD SURTICOM', 29.4118, 100, 3500, 19, 559, 0, 3500, '2020-03-01'),
(939, 419, 400, 'HAMBURGUESA VALENCIA *500 ', 3655.46, 5, 21750, 19, 3473, 0, 21750, '2020-03-01'),
(940, 420, 457, 'QUESO COSTEÑO *500 ANGELES', 7200, 1, 7200, 0, 0, 0, 7200, '2020-03-01'),
(941, 421, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-03-01'),
(942, 422, 607, 'VASO VBC 7 oz*50 VBC', 1260.5, 1, 1499.99, 19, 239, 0, 1499.99, '2020-03-01'),
(943, 423, 74, 'QUESO NAZARET *450 NAZARETH', 6000, 1, 6000, 0, 0, 0, 6000, '2020-03-01'),
(944, 424, 423, 'PRACTI PASTA EMPANADA *560 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-03-01'),
(945, 425, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-03-01'),
(946, 426, 439, 'YUCA FROZZEN *100 SURTICOM', 3277.31, 1, 3900, 19, 623, 0, 3900, '2020-03-01'),
(947, 426, 191, 'PAPA PRECOCIDA PORCIONADA*20 UNI SURTICOM', 16806.7, 1, 20000, 19, 3193, 0, 20000, '2020-03-01'),
(948, 427, 640, 'SERVILLETA SARITA CAFETERIA *100 SURTICOM', 1092.44, 1, 1300, 19, 208, 0, 1300, '2020-03-01'),
(949, 428, 424, 'PRACTIPASTA FLAUTA *560 PRACTI PASTA', 2666.67, 1, 2800, 5, 133, 0, 2800, '2020-03-01'),
(950, 429, 562, 'PALILLO TIPO SANDWICH *35 gr SURTICOM', 756.303, 60, 54000, 19, 8622, 0, 54000, '2020-03-01'),
(951, 429, 688, 'PAPEL PARAFINADO *100 SURTICOM', 5546.22, 1, 6600, 19, 1054, 0, 6600, '2020-03-01'),
(952, 429, 622, 'COSTILLA PROCARSAN *250 SURTICOM', 3697.48, 6, 26400, 19, 4215, 0, 26400, '2020-03-01'),
(953, 429, 397, 'ALUMINIO GOLDEN *100', 16386.6, 1, 19500.1, 19, 3113, 0, 19500.1, '2020-03-01'),
(954, 429, 494, 'MAYONESA ESPAÑOLA *4000 TOMATICO', 10546.2, 4, 50199.9, 19, 8015, 0, 50199.9, '2020-03-01'),
(955, 429, 490, 'PIÑA TOMATICO BOLSA *4000 TOMATICO', 10084, 4, 47999.8, 19, 7664, 0, 47999.8, '2020-03-01'),
(956, 429, 664, 'PAN HAMBURGUESA *750 REPAN SURTICOM', 3025.21, 1, 3600, 19, 575, 0, 3600, '2020-03-01'),
(957, 430, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 2, 25400.1, 19, 4055, 0, 25400.1, '2020-03-01'),
(958, 431, 427, 'QUESO DC PRIMAVERA TAJADO *500 SURTICOM', 5800, 1, 5800, 0, 0, 0, 5800, '2020-03-01'),
(959, 431, 353, 'JAMON CERDO AHUMADO *450 MARTSANG', 5756.3, 1, 6850, 19, 1094, 0, 6850, '2020-03-01'),
(960, 431, 1, 'PAPA FROZZEN *2.5 SURTICOM', 10672.3, 1, 12700, 19, 2028, 0, 12700, '2020-03-01'),
(961, 432, 696, 'PRODUCTO DE PRUEBA', 1200, 1, 1200, 0, 0, 0, 1200, '2020-03-08'),
(962, 433, 697, 'OTRO PRODUCTO DE PRUEBA', 1200, 1, 1200, 0, 0, 0, 1200, '2020-03-08'),
(963, 434, 247, 'MORTADELA RICA *450 g NUTRESA', 4619.05, 2, 9700, 5, 462, 0, 9700, '2020-03-10'),
(964, 435, 38, 'PAN HAMBURGUESA KAREN *900 SURTICOM', 3800, 1, 3800, 0, 0, 0, 3800, '2020-03-10'),
(965, 436, 247, 'MORTADELA RICA *450 g NUTRESA', 4619.05, 1, 4850, 5, 231, 0, 4850, '2020-03-10'),
(966, 437, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 2, 7200, 5, 343, 0, 7200, '2020-03-10'),
(967, 438, 40, 'ITALPAN PERRO 800 GRS SURTICOM', 4000, 1, 4000, 0, 0, 0, 4000, '2020-03-10'),
(968, 439, 152, 'MORTADELA RES FRIGOSAN *500 FRIGOSAN', 3428.57, 1, 3600, 5, 171, 0, 3600, '2020-03-10'),
(969, 440, 40, 'ITALPAN PERRO 800 GRS SURTICOM', 4000, 1, 4000, 0, 0, 0, 4000, '2020-03-10'),
(970, 441, 22, 'CAJA CONTENEDOR 16 ONZAS *25 SURTICOM', 126303, 1, 150301, 19, 23998, 0, 150301, '2020-03-10'),
(971, 442, 40, 'ITALPAN PERRO 800 GRS SURTICOM', 4000, 1, 4000, 0, 0, 0, 4000, '2020-03-10'),
(972, 443, 69, 'JAMON PIZZA *500 FRIGOSAN', 3697.48, 1, 4400, 19, 703, 0, 4400, '2020-03-10'),
(973, 444, 42, 'HAMBURGUESA APANADA *48 UND SURTICOM', 58823.5, 1, 70000, 19, 11176, 0, 70000, '2020-03-10'),
(974, 445, 246, 'MORTADELA RICA *250g NUTRESA', 3285.71, 1, 3450, 5, 164, 0, 3450, '2020-03-10'),
(975, 446, 39, 'ITALPAN HAMBURGUESA ECO 600 GRS SURTICOM', 3400, 3, 10200, 0, 0, 0, 10200, '2020-03-10'),
(976, 447, 39, 'ITALPAN HAMBURGUESA ECO 600 GRS SURTICOM', 3400, 1, 3400, 0, 0, 0, 3400, '2020-03-10'),
(977, 448, 40, 'ITALPAN PERRO 800 GRS SURTICOM', 4000, 1, 4000, 0, 0, 0, 4000, '2020-03-12'),
(978, 449, 66, 'PITILLO *500 EMPACADO DARNEL', 5042.02, 1, 6000, 19, 958, 0, 6000, '2020-03-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`id` int(11) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `image_publicity` varchar(200) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `receiptheader` text,
  `receiptfooter` text NOT NULL,
  `theme` varchar(20) NOT NULL,
  `discount` varchar(5) DEFAULT NULL,
  `tax` varchar(5) DEFAULT NULL,
  `timezone` varchar(400) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `stripe` tinyint(4) DEFAULT NULL,
  `stripe_secret_key` varchar(150) DEFAULT NULL,
  `stripe_publishable_key` varchar(150) DEFAULT NULL,
  `decimals` int(2) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `companyname`, `logo`, `image_publicity`, `phone`, `currency`, `keyboard`, `receiptheader`, `receiptfooter`, `theme`, `discount`, `tax`, `timezone`, `language`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `decimals`) VALUES
(1, 'SURTICOM', NULL, '176f99821ee9c70f9c2a523462da1d53.jpg', '3203432386', 'COP', 0, '<p style="text-align: center;"><span style="font-size: 18px; background-color: rgb(0, 0, 0);"><font color="#efefef">SURTIC</font></span><span style="font-size: 18px;">﻿</span><span style="font-size: 18px;">﻿</span><span style="font-size: 18px;">﻿</span><span style="font-size: 18px; background-color: rgb(0, 0, 0);"><font color="#efefef">OM</font></span><span style="font-size: 24px;"> </span></p><p></p><div style="text-align: center; line-height: 1;">Nombre Sucursal<br></div><div style="text-align: center; line-height: 1;"><span style="font-size: 11px;">Nit: 23924281-2</span></div><div style="text-align: center; line-height: 1;"><span style="font-size: 11px;">REGIMEN COMUN</span></div><div style="text-align: center; line-height: 1;"><span style="font-size: 11px;">Direccion: Carrera 12 # 9-63</span><br></div><p style="text-align: center; line-height: 1;"><span style="font-size: 11px;">Tel: 3203432386 Sogamoso<br></span></p>', '<p style="text-align: justify; line-height: 1;"><span style="font-size: 10px;">Resolución de facturación # 18762009641079, con fecha de expedición 2018-08-13 habilita de la 1 hasta 100000, impreso por sistema NITPOS  </span></p><p style="text-align: justify; line-height: 1;"><br></p>', 'Light', '', '0%', 'America/Caracas', 'spanish', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `type`, `store_id`, `warehouse_id`, `quantity`, `price`) VALUES
(1, 152, NULL, 1, NULL, -40, NULL),
(2, 228, NULL, 1, NULL, -4, NULL),
(3, 668, NULL, 1, NULL, -5, NULL),
(4, 692, NULL, 1, NULL, -1, 0),
(5, 638, NULL, 1, NULL, -21, NULL),
(6, 518, NULL, 1, NULL, -1, NULL),
(7, 601, NULL, 1, NULL, -1, NULL),
(8, 495, NULL, 1, NULL, -7, NULL),
(9, 522, NULL, 1, NULL, -30, NULL),
(10, 527, NULL, 1, NULL, -25, NULL),
(11, 493, NULL, 1, NULL, -40, NULL),
(12, 528, NULL, 1, NULL, -41, NULL),
(13, 154, NULL, 1, NULL, -28, NULL),
(14, 69, NULL, 1, NULL, -22, NULL),
(15, 446, NULL, 1, NULL, -23, NULL),
(16, 541, NULL, 1, NULL, -2, NULL),
(17, 296, NULL, 1, NULL, -2, NULL),
(18, 37, NULL, 1, NULL, -4, NULL),
(19, 552, NULL, 1, NULL, -8, NULL),
(20, 400, NULL, 1, NULL, -22, NULL),
(21, 487, NULL, 1, NULL, -24, NULL),
(22, 606, NULL, 1, NULL, -58, NULL),
(23, 311, NULL, 1, NULL, -4, NULL),
(24, 439, NULL, 1, NULL, -16, NULL),
(25, 273, NULL, 1, NULL, -6, NULL),
(26, 679, NULL, 1, NULL, -11, NULL),
(27, 134, NULL, 1, NULL, -1, NULL),
(28, 128, NULL, 1, NULL, -14, NULL),
(29, 330, NULL, 1, NULL, -3, NULL),
(30, 490, NULL, 1, NULL, -17, NULL),
(31, 149, NULL, 1, NULL, -6, NULL),
(32, 427, NULL, 1, NULL, -20.5, NULL),
(33, 1, NULL, 1, NULL, -13, NULL),
(34, 693, NULL, 1, NULL, 10, NULL),
(35, 694, NULL, 1, NULL, 10, NULL),
(36, 695, NULL, 1, NULL, 10, NULL),
(37, 448, NULL, 1, NULL, -1, NULL),
(38, 612, NULL, 1, NULL, -1, NULL),
(39, 44, NULL, 1, NULL, -7, NULL),
(40, 335, NULL, 1, NULL, -20, NULL),
(41, 607, NULL, 1, NULL, -66, NULL),
(42, 199, NULL, 1, NULL, -2, NULL),
(43, 691, NULL, 1, NULL, -6, NULL),
(44, 509, NULL, 1, NULL, -12, NULL),
(45, 529, NULL, 1, NULL, -7, NULL),
(46, 644, NULL, 1, NULL, -1, NULL),
(47, 75, NULL, 1, NULL, -14, NULL),
(48, 353, NULL, 1, NULL, -3, NULL),
(49, 620, NULL, 1, NULL, -6, NULL),
(50, 450, NULL, 1, NULL, -9, NULL),
(51, 223, NULL, 1, NULL, 0, NULL),
(52, 659, NULL, 1, NULL, 0, NULL),
(53, 155, NULL, 1, NULL, -12, NULL),
(54, 596, NULL, 1, NULL, -25, NULL),
(55, 485, NULL, 1, NULL, -11, NULL),
(56, 590, NULL, 1, NULL, -91, NULL),
(57, 688, NULL, 1, NULL, -5, NULL),
(58, 423, NULL, 1, NULL, -34, NULL),
(59, 511, NULL, 1, NULL, -33, NULL),
(60, 424, NULL, 1, NULL, -8, NULL),
(61, 655, NULL, 1, NULL, -6, NULL),
(62, 681, NULL, 1, NULL, -4, NULL),
(63, 141, NULL, 1, NULL, -7, NULL),
(64, 514, NULL, 1, NULL, -12, NULL),
(65, 678, NULL, 1, NULL, -16, NULL),
(66, 494, NULL, 1, NULL, -19, NULL),
(67, 402, NULL, 1, NULL, -90, NULL),
(68, 110, NULL, 1, NULL, -2, NULL),
(69, 120, NULL, 1, NULL, -1, NULL),
(70, 329, NULL, 1, NULL, -4, NULL),
(71, 648, NULL, 1, NULL, -76, NULL),
(72, 114, NULL, 1, NULL, -6, NULL),
(73, 516, NULL, 1, NULL, -1, NULL),
(74, 305, NULL, 1, NULL, -1, NULL),
(75, 425, NULL, 1, NULL, -23, NULL),
(76, 261, NULL, 1, NULL, -17, NULL),
(77, 327, NULL, 1, NULL, -13, NULL),
(78, 593, NULL, 1, NULL, -8, NULL),
(79, 460, NULL, 1, NULL, -10, NULL),
(80, 139, NULL, 1, NULL, -6, NULL),
(81, 232, NULL, 1, NULL, -6, NULL),
(82, 140, NULL, 1, NULL, -19, NULL),
(83, 29, NULL, 1, NULL, -1, NULL),
(84, 231, NULL, 1, NULL, -3, NULL),
(85, 591, NULL, 1, NULL, -3, NULL),
(86, 664, NULL, 1, NULL, -16, NULL),
(87, 503, NULL, 1, NULL, -23, NULL),
(88, 500, NULL, 1, NULL, -54, NULL),
(89, 676, NULL, 1, NULL, -390, NULL),
(90, 156, NULL, 1, NULL, -17, NULL),
(91, 554, NULL, 1, NULL, -3, NULL),
(92, 426, NULL, 1, NULL, -7, NULL),
(93, 208, NULL, 1, NULL, -1, NULL),
(94, 123, NULL, 1, NULL, -1, NULL),
(95, 331, NULL, 1, NULL, -5, NULL),
(96, 291, NULL, 1, NULL, -2, NULL),
(97, 224, NULL, 1, NULL, -3, NULL),
(98, 515, NULL, 1, NULL, -5, NULL),
(99, 515, NULL, 1, NULL, -1, NULL),
(100, 506, NULL, 1, NULL, -33, NULL),
(101, 505, NULL, 1, NULL, -18, NULL),
(102, 92, NULL, 1, NULL, -7, NULL),
(103, 282, NULL, 1, NULL, -2, NULL),
(104, 238, NULL, 1, NULL, -7, NULL),
(105, 481, NULL, 1, NULL, -2, NULL),
(106, 278, NULL, 1, NULL, -8, NULL),
(107, 99, NULL, 1, NULL, -1, NULL),
(108, 610, NULL, 1, NULL, -3, NULL),
(109, 466, NULL, 1, NULL, -3, NULL),
(110, 617, NULL, 1, NULL, -2, NULL),
(111, 570, NULL, 1, NULL, -2, NULL),
(112, 259, NULL, 1, NULL, -2, NULL),
(113, 618, NULL, 1, NULL, -2, NULL),
(114, 421, NULL, 1, NULL, -2, NULL),
(115, 405, NULL, 1, NULL, -4, NULL),
(116, 508, NULL, 1, NULL, -7, NULL),
(117, 573, NULL, 1, NULL, -3, NULL),
(118, 663, NULL, 1, NULL, -7, NULL),
(119, 513, NULL, 1, NULL, -2, NULL),
(120, 76, NULL, 1, NULL, -9, NULL),
(121, 72, NULL, 1, NULL, -5, NULL),
(122, 406, NULL, 1, NULL, -11, NULL),
(123, 294, NULL, 1, NULL, -0.5, NULL),
(124, 492, NULL, 1, NULL, -3, NULL),
(125, 622, NULL, 1, NULL, -52, NULL),
(126, 142, NULL, 1, NULL, -1, NULL),
(127, 153, NULL, 1, NULL, -9, NULL),
(128, 569, NULL, 1, NULL, -3, NULL),
(129, 675, NULL, 1, NULL, -937, NULL),
(130, 147, NULL, 1, NULL, -4, NULL),
(131, 465, NULL, 1, NULL, -5, NULL),
(132, 397, NULL, 1, NULL, -4, NULL),
(133, 464, NULL, 1, NULL, -4, NULL),
(134, 73, NULL, 1, NULL, -2, NULL),
(135, 404, NULL, 1, NULL, -7, NULL),
(136, 401, NULL, 1, NULL, -3, NULL),
(137, 191, NULL, 1, NULL, -2, NULL),
(138, 608, NULL, 1, NULL, -2, NULL),
(139, 543, NULL, 1, NULL, -2, NULL),
(140, 235, NULL, 1, NULL, -1, NULL),
(141, 597, NULL, 1, NULL, -1, NULL),
(142, 98, NULL, 1, NULL, -1, NULL),
(143, 510, NULL, 1, NULL, -9, NULL),
(144, 540, NULL, 1, NULL, -19, NULL),
(145, 488, NULL, 1, NULL, -4, NULL),
(146, 124, NULL, 1, NULL, -3, NULL),
(147, 352, NULL, 1, NULL, -1, NULL),
(148, 250, NULL, 1, NULL, -6, NULL),
(149, 20, NULL, 1, NULL, -1, NULL),
(150, 136, NULL, 1, NULL, -4, NULL),
(151, 158, NULL, 1, NULL, -2, NULL),
(152, 519, NULL, 1, NULL, -1, NULL),
(153, 188, NULL, 1, NULL, -15, NULL),
(154, 614, NULL, 1, NULL, -1, NULL),
(155, 403, NULL, 1, NULL, -2, NULL),
(156, 70, NULL, 1, NULL, -1, NULL),
(157, 468, NULL, 1, NULL, -3, NULL),
(158, 323, NULL, 1, NULL, -1, NULL),
(159, 501, NULL, 1, NULL, -7, NULL),
(160, 298, NULL, 1, NULL, -3, NULL),
(161, 449, NULL, 1, NULL, -2, NULL),
(162, 498, NULL, 1, NULL, -6, NULL),
(163, 507, NULL, 1, NULL, -14, NULL),
(164, 414, NULL, 1, NULL, -1, NULL),
(165, 218, NULL, 1, NULL, -1, NULL),
(166, 304, NULL, 1, NULL, -1, NULL),
(167, 59, NULL, 1, NULL, -3, NULL),
(168, 634, NULL, 1, NULL, -9, NULL),
(169, 13, NULL, 1, NULL, -1, NULL),
(170, 523, NULL, 1, NULL, -15, NULL),
(171, 564, NULL, 1, NULL, -1, NULL),
(172, 83, NULL, 1, NULL, -1, NULL),
(173, 571, NULL, 1, NULL, -1, NULL),
(174, 103, NULL, 1, NULL, -1, NULL),
(175, 534, NULL, 1, NULL, -2, NULL),
(176, 646, NULL, 1, NULL, -2, NULL),
(177, 538, NULL, 1, NULL, -1, NULL),
(178, 504, NULL, 1, NULL, -1, NULL),
(179, 220, NULL, 1, NULL, -2, NULL),
(180, 21, NULL, 1, NULL, -2, NULL),
(181, 176, NULL, 1, NULL, -1, NULL),
(182, 682, NULL, 1, NULL, -3, NULL),
(183, 478, NULL, 1, NULL, -4, NULL),
(184, 309, NULL, 1, NULL, -1, NULL),
(185, 74, NULL, 1, NULL, -3, NULL),
(186, 526, NULL, 1, NULL, -2, NULL),
(187, 489, NULL, 1, NULL, -4, NULL),
(188, 687, NULL, 1, NULL, 0, NULL),
(189, 595, NULL, 1, NULL, -1, NULL),
(190, 457, NULL, 1, NULL, -2, NULL),
(191, 637, NULL, 1, NULL, -10, NULL),
(192, 390, NULL, 1, NULL, -1, NULL),
(193, 532, NULL, 1, NULL, -2, NULL),
(194, 60, NULL, 1, NULL, -1, NULL),
(195, 138, NULL, 1, NULL, -2, NULL),
(196, 132, NULL, 1, NULL, -4, NULL),
(197, 499, NULL, 1, NULL, -2, NULL),
(198, 146, NULL, 1, NULL, -1, NULL),
(199, 133, NULL, 1, NULL, -1, NULL),
(200, 453, NULL, 1, NULL, -2, NULL),
(201, 234, NULL, 1, NULL, -1, NULL),
(202, 272, NULL, 1, NULL, -1, NULL),
(203, 647, NULL, 1, NULL, -1, NULL),
(204, 512, NULL, 1, NULL, -1, NULL),
(205, 471, NULL, 1, NULL, -1, NULL),
(206, 358, NULL, 1, NULL, -2, NULL),
(207, 542, NULL, 1, NULL, -1, NULL),
(208, 236, NULL, 1, NULL, -1, NULL),
(209, 639, NULL, 1, NULL, -5, NULL),
(210, 111, NULL, 1, NULL, -1, NULL),
(211, 363, NULL, 1, NULL, -6, NULL),
(212, 441, NULL, 1, NULL, -9, NULL),
(213, 379, NULL, 1, NULL, -1, NULL),
(214, 68, NULL, 1, NULL, -1, NULL),
(215, 619, NULL, 1, NULL, -3, NULL),
(216, 58, NULL, 1, NULL, -1, NULL),
(217, 117, NULL, 1, NULL, -1, NULL),
(218, 137, NULL, 1, NULL, -3, NULL),
(219, 307, NULL, 1, NULL, -1, NULL),
(220, 562, NULL, 1, NULL, -70, NULL),
(221, 551, NULL, 1, NULL, -5, NULL),
(222, 168, NULL, 1, NULL, -1, NULL),
(223, 287, NULL, 1, NULL, -1, NULL),
(224, 472, NULL, 1, NULL, -1, NULL),
(225, 640, NULL, 1, NULL, -1, NULL),
(226, 696, NULL, 1, NULL, 9, NULL),
(227, 696, NULL, 1, NULL, 10, NULL),
(228, 698, NULL, 1, NULL, 2, NULL),
(229, 697, NULL, 1, NULL, -1, NULL),
(230, 247, NULL, 1, NULL, -3, NULL),
(231, 38, NULL, 1, NULL, -1, NULL),
(232, 40, NULL, 1, NULL, -30, NULL),
(233, 22, NULL, 1, NULL, -1, NULL),
(234, 42, NULL, 1, NULL, -1, NULL),
(235, 246, NULL, 1, NULL, -52, NULL),
(236, 39, NULL, 1, NULL, -8, NULL),
(237, 249, NULL, 1, NULL, -36, NULL),
(238, 66, NULL, 1, NULL, -1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
`id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `adresse` varchar(400) DEFAULT NULL,
  `footer_text` varchar(400) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL,
  `licencia_id` int(11) NOT NULL,
  `invoice_begin` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`id`, `name`, `email`, `phone`, `adresse`, `footer_text`, `city`, `country`, `created_at`, `licencia_id`, `invoice_begin`, `status`) VALUES
(1, 'SURTICOM Sogamoso', 'surticom@yahoo.com', '3203432386', 'Carrera 12 # 9-63', 'Gracias por su compra!', 'Sogamoso', 'Colombia', '2020-02-25 09:18:32', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
`id` int(11) NOT NULL,
  `typedoc` int(2) NOT NULL,
  `numdoc` varchar(50) NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `type` int(2) NOT NULL,
  `legal` varchar(100) NOT NULL,
  `regime` int(2) DEFAULT NULL,
  `movil1` varchar(50) NOT NULL,
  `movil2` varchar(50) NOT NULL,
  `phone` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `note` text CHARACTER SET latin1,
  `created_at` varchar(150) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `typedoc`, `numdoc`, `name`, `type`, `legal`, `regime`, `movil1`, `movil2`, `phone`, `email`, `city`, `adresse`, `note`, `created_at`) VALUES
(8, 3, '111111111', 'SURTICOM', 1, '', 1, '', '', '', '', '', '', '', '2019-12-27 12:24:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxes`
--

CREATE TABLE IF NOT EXISTS `taxes` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `created_date`) VALUES
(1, 'IVA 19%', 19.00, '2019-09-16 15:35:02'),
(3, 'EXE 0%', 0.00, '2019-09-16 15:51:45'),
(4, 'IVA 5%', 5.00, '2019-12-21 00:42:31'),
(5, 'IVA 8%', 8.00, '2020-02-11 17:01:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thirdparties`
--

CREATE TABLE IF NOT EXISTS `thirdparties` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfers`
--

CREATE TABLE IF NOT EXISTS `transfers` (
`id` int(11) NOT NULL,
  `store_id_out` int(11) NOT NULL,
  `store_id_in` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_items`
--

CREATE TABLE IF NOT EXISTS `transfer_items` (
`id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `qt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trazas`
--

CREATE TABLE IF NOT EXISTS `trazas` (
`id` int(11) NOT NULL,
  `action` varchar(200) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trazas`
--

INSERT INTO `trazas` (`id`, `action`, `created_by`, `created_at`) VALUES
(1, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 14:19:13'),
(2, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 14:38:00'),
(3, 'Se modificó el precio base del producto 614143818158 MORTADELA RES FRIGOSAN *500 FRIGOSAN de 3.429 a 3.429', 'Carlosm Carlos Malaver', '2020-02-25 14:38:19'),
(4, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-25 14:59:45'),
(5, 'Se modificó el precio base del producto 7702127212023 AZUCAR SOBRES *100 SURTICOM de 3.950 a 3.950', 'Carlosm Carlos Malaver', '2020-02-25 15:06:20'),
(6, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 15:54:56'),
(7, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-25 16:11:37'),
(8, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 16:24:46'),
(9, 'Autorización para anular factura, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-25 16:25:06'),
(10, 'Se anuló factura N° 00023902', '01 Wendy J Gonzalez', '2020-02-25 16:25:06'),
(11, 'Se modificó el precio base del producto 614143818790 SALCHICHA MANGUERA FRIGOSAN *2500 FRIGOSAN de 9.244 a 9.412', 'Carlosm Carlos Malaver', '2020-02-25 16:25:36'),
(12, 'Se modificó el precio base del producto 7707269790019 QUESO DC *2500 ENTERO ANGELES de 27.500 a 26.000', 'Carlosm Carlos Malaver', '2020-02-25 16:26:05'),
(13, 'Se modificó el precio base del producto 0614143818837 JAMON PIZZA *500 FRIGOSAN de 3.025 a 3.697', 'Carlosm Carlos Malaver', '2020-02-25 16:26:32'),
(14, 'Se modificó el precio base del producto 0614143818837 JAMON PIZZA *500 FRIGOSAN de 3.697 a 3.697', 'Carlosm Carlos Malaver', '2020-02-25 16:27:30'),
(15, 'Se modificó el precio base del producto 7709174732818 VASO VBC 5.5 Oz VBC de 1.345 a 1.261', 'Carlosm Carlos Malaver', '2020-02-25 17:35:13'),
(16, 'Se modificó el precio base del producto 7709990018615 SALCHICHON MADRIGAL * 1100 SURTICOM de 3.905 a 4.571', 'Carlosm Carlos Malaver', '2020-02-25 17:38:24'),
(17, 'Se modificó el precio base del producto 7701101250310 SALCHICHON CERVERONI *1200 NUTRESA de 16.476 a 16.190', 'Carlosm Carlos Malaver', '2020-02-25 17:39:34'),
(18, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 18:37:57'),
(19, 'Se modificó el precio base del producto 58 HUEVOS DE CODORNIS *24 UNI SURTICOM de 4.000 a 3.500', 'Carlosm Carlos Malaver', '2020-02-25 18:38:21'),
(20, 'Se modificó el precio base del producto 7707296930181 PIÑA TOMATICO BOLSA *4000 TOMATICO de 10.588 a 10.084', 'Carlosm Carlos Malaver', '2020-02-25 18:38:42'),
(21, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-25 18:42:28'),
(22, 'Se modificó el precio base del producto 000000000000 PAPA FROZZEN *2.5 SURTICOM de 10.084 a 10.672', 'Carlosm Carlos Malaver', '2020-02-25 19:31:41'),
(23, 'Se modificó el precio base del producto 7707191090522 SALCHICHA MANGUERA SABORÉ *15 SURTICOM de 13.866 a 14.286', 'Carlosm Carlos Malaver', '2020-02-25 19:48:13'),
(24, 'Se modificó el precio base del producto 069 DELIPIÑA 2500 SURTICOM de 4.706 a 4.454', 'Carlosm Carlos Malaver', '2020-02-25 19:48:54'),
(25, 'Se modificó el precio base del producto 7709383721818 COSTILLA PROCARSAN *250 SURTICOM de 3.361 a 3.697', 'Carlosm Carlos Malaver', '2020-02-25 19:49:15'),
(26, 'Se modificó el precio base del producto 7707191091109 CHORIZO PAISA *12 SURTICOM de 10.588 a 10.084', 'Carlosm Carlos Malaver', '2020-02-25 19:51:07'),
(27, 'Se modificó el precio base del producto 7709023005131 CHORIZO MADRIGAL *10 SURTICOM de 7.563 a 7.815', 'Carlosm Carlos Malaver', '2020-02-25 19:51:23'),
(28, 'Se modificó el precio base del producto 7707191091086 CHORIZO PARRILLERO SABORE *1500 SURTICOM de 12.353 a 11.765', 'Carlosm Carlos Malaver', '2020-02-25 19:51:49'),
(29, 'Se modificó el precio base del producto 7707176500305 CHORIZO MARTSANG *12 UND MARTSANG de 9.664 a 9.244', 'Carlosm Carlos Malaver', '2020-02-25 19:53:34'),
(30, 'Se modificó el precio base del producto 614143818981 SALCHICHA CALIFORNIA *18 FRIGOSAN de 12.101 a 10.588', 'Carlosm Carlos Malaver', '2020-02-25 19:54:02'),
(31, 'Se modificó el precio base del producto 7707191090454 SALCHICHA SUPER DOG * 24 SURTICOM de 5.798 a 5.462', 'Carlosm Carlos Malaver', '2020-02-25 19:55:08'),
(32, 'Se modificó el precio base del producto 7702398017914 SALCHICHA IDEAL RICA *10 UNI *611 g NUTRESA de 5.966 a 5.588', 'Carlosm Carlos Malaver', '2020-02-25 19:55:35'),
(33, 'Se modificó el  producto 7709146949848 JAMON CASERO HAMBURGUER *500 HAMBURGUER ', 'Carlosm Carlos Malaver', '2020-02-25 19:58:21'),
(34, 'Se modificó el precio base del producto 7707176500183 JAMON CERDO AHUMADO *450 MARTSANG de 6.050 a 5.756', 'Carlosm Carlos Malaver', '2020-02-25 19:58:44'),
(35, 'Se modificó el  producto 7707191090447 HAMBURGUESA VALENCIA *500 SURTICOM ', 'Carlosm Carlos Malaver', '2020-02-25 19:59:41'),
(36, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-25 20:31:52'),
(37, 'Se modificó el precio base del producto 7707269790040 QUESO 7 CUEROS *280 ANGELES de 7.500 a 4.250', 'Carlosm Carlos Malaver', '2020-02-25 20:32:59'),
(38, 'Autorización para anular factura, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-25 21:33:48'),
(39, 'Se anuló factura N° 00023923', '04 Thalia  Gonzalez', '2020-02-25 21:33:49'),
(40, 'Autorización para anular factura, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-25 21:45:56'),
(41, 'Se anuló factura N° 00023930', '04 Thalia  Gonzalez', '2020-02-25 21:45:56'),
(42, 'Se modificó el precio base del producto 7708900957006 PAPA CABELLO ANGEL MEGA *1000 KRUMER SHIPS de 4.454 a 4.160', 'Carlosm Carlos Malaver', '2020-02-25 21:49:38'),
(43, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-25 22:46:38'),
(44, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-25 22:51:52'),
(45, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 00:11:46'),
(46, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 02:06:36'),
(47, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 16:21:19'),
(48, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 16:32:04'),
(49, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 16:51:50'),
(50, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 20:51:49'),
(51, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:53:19'),
(52, 'Ingreso de Usuario Administador Carlosm', 'Carlosm Carlos Malaver', '2020-02-26 20:53:40'),
(53, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:54:51'),
(54, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:54:56'),
(55, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:55:14'),
(56, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:55:17'),
(57, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-26 20:55:59'),
(58, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-26 20:56:10'),
(59, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 21:14:21'),
(60, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:20:49'),
(61, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:31:31'),
(62, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:31:36'),
(63, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:31:39'),
(64, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:31:43'),
(65, 'Autorización para anular factura, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 22:54:01'),
(66, 'Se anuló factura N° 00024003', '04 Thalia  Gonzalez', '2020-02-26 22:54:01'),
(67, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-26 23:36:01'),
(68, 'Se modificó el precio base del producto 7707269790064 QUESO DC *2500 TAJ ANGELES de 28.500 a 27.000', 'Carlosm  Malaver', '2020-02-26 23:36:43'),
(69, 'Se modificó el precio base del producto 83 PORTA PERRO *UNIDAD SURTICOM de 34 a 29', 'Carlosm  Malaver', '2020-02-26 23:37:14'),
(70, 'Se modificó el precio base del producto 82 PORTA HAMBURGUES * UNIDAD SURTICOM de 34 a 29', 'Carlosm  Malaver', '2020-02-26 23:37:38'),
(71, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 23:41:58'),
(72, 'Autorización para anular factura, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-26 23:55:27'),
(73, 'Se anuló factura N° 00024008', '04 Thalia  Gonzalez', '2020-02-26 23:55:27'),
(74, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 00:24:10'),
(75, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 00:31:36'),
(76, 'Se modificó el precio base del producto 7707187320039 AREPA RELLENA QUESO *3 SURTICOM de 1.300 a 16.387', 'Carlosm  Malaver', '2020-02-27 00:33:48'),
(77, 'Se modificó el precio base del producto 091 QUESO PAIPA *500 SURTICOM de 10.000 a 41.933', 'Carlosm  Malaver', '2020-02-27 00:35:42'),
(78, 'Se modificó el  producto 091 ALUMINIO HOUSE *300 ', 'Carlosm  Malaver', '2020-02-27 00:35:57'),
(79, 'Se modificó el  producto 7707320620057 ALUMINIO HOUSE *300 ', 'Carlosm  Malaver', '2020-02-27 00:36:57'),
(80, 'Se modificó el  producto 75858  ', 'Carlosm  Malaver', '2020-02-27 00:39:37'),
(81, 'Se modificó el precio base del producto 7707296931126 SALSA TERIYAKI *500 de 41.933 a 3.445', 'Carlosm  Malaver', '2020-02-27 00:44:58'),
(82, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 02:05:09'),
(83, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '01 Wendy J Gonzalez', '2020-02-27 21:26:19'),
(84, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 21:39:10'),
(85, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 21:52:07'),
(86, 'Se modificó el precio base del producto 7707300260068 AREPA QUESO KAÑAVERAL *5 SURTICOM de 2.600 a 3.866', 'Carlosm  Malaver', '2020-02-27 22:01:41'),
(87, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-27 22:32:55'),
(88, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-28 00:38:36'),
(89, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-28 18:35:10'),
(90, 'Se modificó el precio base del producto 7707210500209 PRACTIPASTA EMPANADA *500 PRACTI PASTA de 2.667 a 2.571', 'Carlosm  Malaver', '2020-02-28 18:37:16'),
(91, 'Se modificó el precio base del producto 7707210500216 PRACTIPASTA FLAUTA *500 PRACTI PASTA de 2.667 a 2.571', 'Carlosm  Malaver', '2020-02-28 18:37:57'),
(92, 'Se modificó el precio base del producto 7707210500124 PRACTIPASTA FLAUTA *560 PRACTI PASTA de 2.762 a 2.667', 'Carlosm  Malaver', '2020-02-28 18:38:39'),
(93, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-28 22:29:41'),
(94, 'Autorización para descuento y/o precio especial, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-29 00:40:54'),
(95, 'Autorización para anular factura, con la clave de Carlosm', '04 Thalia  Gonzalez', '2020-02-29 00:51:53'),
(96, 'Se anuló factura N° 00024169', '04 Thalia  Gonzalez', '2020-02-29 00:51:53'),
(97, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-02-29 00:52:52'),
(98, 'Se modificó el precio base del producto 7707282990168 TAPA BOCAS CAJA *50 SURTICOM de 7.227 a 19.832', 'Carlosm  Malaver', '2020-02-29 00:54:38'),
(99, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-01 20:56:49'),
(100, 'Se anuló factura N° 00023978', 'Carlosm  Malaver', '2020-03-01 22:29:39'),
(101, 'Se anuló factura N° 00023979', 'Carlosm  Malaver', '2020-03-01 22:29:57'),
(102, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-08 12:16:42'),
(103, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-08 12:16:43'),
(104, 'Se modificó el precio base del producto   de 0 a 1.200', 'Carlosm  Malaver', '2020-03-08 13:38:08'),
(105, 'Se modificó el precio base del producto   de 0 a 1.200', 'Carlosm  Malaver', '2020-03-08 13:50:45'),
(106, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 13:51:56'),
(107, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 13:59:39'),
(108, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 14:00:16'),
(109, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 14:00:16'),
(110, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 14:00:53'),
(111, 'Se modificó el  producto 001XXXX OTRO MAS PRODUCTO DE PRUEBA ', 'Carlosm  Malaver', '2020-03-08 14:00:53'),
(112, 'Se modificó el precio base del producto 001XXXXX OTRO MAS PRODUCTO DE PRUEBA de 1.200 a 1.400', 'Carlosm  Malaver', '2020-03-08 14:02:17'),
(113, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-11 14:46:55'),
(114, 'Autorización para anular factura, con la clave de Carlosm', '02 Wendy J Gonzalez', '2020-03-11 15:09:27'),
(115, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-11 15:43:47'),
(116, 'Se realizó una remisióm desde el POS de 25 producto(s), para un total de 116.900', 'Carlosm  Malaver', '2020-03-12 00:10:14'),
(117, 'Autorización para realizar remisión, con la clave de Carlosm', '02 Wendy J Gonzalez', '2020-03-12 00:16:09'),
(118, 'Autorización para realizar remisión, con la clave de Carlosm', '02 Wendy J Gonzalez', '2020-03-12 00:16:32'),
(119, 'Se realizó una remisión Nota de débito desde el POS de 1 producto(s), para un total de 3.600', '02 Wendy J Gonzalez', '2020-03-12 00:16:36'),
(120, 'Autorización para realizar remisión, con la clave de Carlosm', '02 Wendy J Gonzalez', '2020-03-12 00:26:43'),
(121, 'Se realizó una remisión Nota de entrega desde el POS de 13 producto(s), para un total de 44.750', '02 Wendy J Gonzalez', '2020-03-12 00:26:52'),
(122, 'Se realizó una remisión Nota de entrega desde el POS de 13 producto(s), para un total de 44.750', '02 Wendy J Gonzalez', '2020-03-12 00:26:53'),
(123, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-12 09:40:19'),
(124, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-12 11:26:39'),
(125, 'Se realizó una remisión Nota de crédito desde el POS de 1 producto(s), para un total de 4.000', 'Carlosm  Malaver', '2020-03-12 11:29:28'),
(126, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-12 11:56:26'),
(127, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-12 13:54:31'),
(128, 'Ingreso de Usuario Administador Carlosm', 'Carlosm  Malaver', '2020-03-12 13:59:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `hashed_password` varchar(128) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `last_active` varchar(50) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `created_at` varchar(300) DEFAULT NULL,
  `store_id` int(9) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `hashed_password`, `email`, `role`, `last_active`, `avatar`, `created_at`, `store_id`) VALUES
(1, 'Carlosm', '', 'Malaver', '814fec0426942d5697f7cffbd4bb3b199c8056b58d230b4836c44ee74429be629e1cf4f377933cb94bd37ceef590ed7423048caeba1aebea8ec836c9f551c111', 'surticom@yahoo.com', 'admin', '2020-03-12 11:19:32', NULL, '2020-02-26 15:54:31', 1),
(2, '01', 'Wendy J', 'Gonzalez', '3d18d678712a9bd09a0a52ae39b1d19574a9952f1093e875776b5fb36611aee6658e88bca231057479ca0f4d36703392c53127971bd5738afbcb1aad3e593c48', 'surticom@yahoo.com', 'sales', '2020-02-29 15:09:54', NULL, '2020-02-25 09:27:08', 1),
(3, '02', 'Wendy J', 'Gonzalez', 'bc605afa9f456becd328f65704aa5a5cfdd4c83f37adc5b88e5c13eb86d201ffedb4a8edf6af96f6e585dbeb5828ef78b5ea8ef44fb5b0752383f2dedf195bf8', 'surticom@yahoo.com', 'sales', '2020-03-12 11:20:13', NULL, '2020-03-11 10:47:21', 1),
(4, '03', 'Wendy J', 'Gonzalez', 'fe0989ed0791dc61f4586c47baafb8bd4006c66a1516fee54b27dddb8642b9f6b16c26d2b8ae11f67ada4f68bfdc9a4b8a630d4b4d6705a2f2fa10f47b826050', 'surticom@yahoo.com', 'sales', NULL, NULL, '2020-02-25 09:28:31', 1),
(5, '04', 'Thalia ', 'Gonzalez', 'e8222ca39fe67d0befe7e761efd6002b42d6e37411e553ba26dc16803fe60502dae50a8ae40f3c72a438744f5d0f948e9aee29ec3a7709cd8c19e8b69cc84e0f', '', 'sales', '2020-03-01 16:19:31', NULL, '2020-02-25 15:28:12', 1),
(6, '05', 'Thalia', 'Gonzalez', 'f3420f0c44af154f1ad66fda865f244a34ef57592fb456889529122ba5fe651ac2fbfff6db20269f961c0eb5125c2fe710c38e22769955c2386a8bd9dd41b3ef', '', 'sales', '2020-02-26 21:04:31', NULL, '2020-02-25 15:29:13', 1),
(7, '06', 'Thalia', 'Gonzalez', '918cf833001efc7789d0c349f8b63c130923a79d6b98cd0780eba82487d36c63148621f5df0d3f0ca698621bdcabeeabc76f64e26c84630e6e9400244e9dea79', '', 'sales', '2020-02-26 11:31:41', NULL, '2020-02-25 15:29:55', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variations`
--

CREATE TABLE IF NOT EXISTS `variations` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouses`
--

CREATE TABLE IF NOT EXISTS `warehouses` (
`id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `adresse` varchar(400) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `adresse`, `created_at`) VALUES
(3, 'Almacen Principal ', '+582034331122', 'almacen@gmail.com', 'Avenidad Bermudez', '2019-07-26 20:15:12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalog_expences`
--
ALTER TABLE `catalog_expences`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `combo_items`
--
ALTER TABLE `combo_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `devolucions`
--
ALTER TABLE `devolucions`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expences`
--
ALTER TABLE `expences`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `holds`
--
ALTER TABLE `holds`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payements`
--
ALTER TABLE `payements`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posales`
--
ALTER TABLE `posales`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presentations`
--
ALTER TABLE `presentations`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `purchase_items`
--
ALTER TABLE `purchase_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registers`
--
ALTER TABLE `registers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remisions`
--
ALTER TABLE `remisions`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remision_items`
--
ALTER TABLE `remision_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `return_sales`
--
ALTER TABLE `return_sales`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sale_items`
--
ALTER TABLE `sale_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stocks`
--
ALTER TABLE `stocks`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taxes`
--
ALTER TABLE `taxes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transfers`
--
ALTER TABLE `transfers`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transfer_items`
--
ALTER TABLE `transfer_items`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trazas`
--
ALTER TABLE `trazas`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `warehouses`
--
ALTER TABLE `warehouses`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `catalog_expences`
--
ALTER TABLE `catalog_expences`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `combo_items`
--
ALTER TABLE `combo_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `devolucions`
--
ALTER TABLE `devolucions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `expences`
--
ALTER TABLE `expences`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `holds`
--
ALTER TABLE `holds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `payements`
--
ALTER TABLE `payements`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posales`
--
ALTER TABLE `posales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1127;
--
-- AUTO_INCREMENT de la tabla `presentations`
--
ALTER TABLE `presentations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=699;
--
-- AUTO_INCREMENT de la tabla `purchases`
--
ALTER TABLE `purchases`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `purchase_items`
--
ALTER TABLE `purchase_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `registers`
--
ALTER TABLE `registers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `remisions`
--
ALTER TABLE `remisions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `remision_items`
--
ALTER TABLE `remision_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `return_sales`
--
ALTER TABLE `return_sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=450;
--
-- AUTO_INCREMENT de la tabla `sale_items`
--
ALTER TABLE `sale_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=979;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `stocks`
--
ALTER TABLE `stocks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `taxes`
--
ALTER TABLE `taxes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `transfers`
--
ALTER TABLE `transfers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `transfer_items`
--
ALTER TABLE `transfer_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `trazas`
--
ALTER TABLE `trazas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `warehouses`
--
ALTER TABLE `warehouses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
