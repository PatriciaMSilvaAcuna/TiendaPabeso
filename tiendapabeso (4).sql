-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2024 a las 16:45:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendapabeso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_Caja` int(11) NOT NULL,
  `id_Empleado` int(11) NOT NULL,
  `monto_Inicio` double NOT NULL,
  `ventas_debito` int(11) NOT NULL,
  `ventas_credito` int(11) NOT NULL,
  `monto_Final` double NOT NULL,
  `fecha_Apertura` datetime DEFAULT NULL,
  `fecha_Cierre` datetime DEFAULT NULL,
  `difCaja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_Caja`, `id_Empleado`, `monto_Inicio`, `ventas_debito`, `ventas_credito`, `monto_Final`, `fecha_Apertura`, `fecha_Cierre`, `difCaja`) VALUES
(1, 11, 1600, 0, 0, 1, '2024-06-28 00:00:00', '2024-06-28 00:00:00', 0),
(2, 11, 7000, 0, 0, 7888, '2024-06-28 00:00:00', '2024-06-28 00:00:00', 0),
(3, 11, 70, 0, 0, 1, '2024-06-28 00:00:00', '2024-07-20 00:00:00', 0),
(4, 11, 1000, 1000, 1000, 0, '2024-07-20 00:00:00', '2024-07-24 00:00:00', 0),
(5, 11, 1000, 0, 0, 6000, '2024-07-24 00:00:00', '2024-07-25 18:04:10', 0),
(6, 11, 9000, 0, 0, 68000, '2024-07-25 00:00:00', '2024-07-25 20:17:28', 0),
(7, 11, 1000, 0, 0, 22000, '2024-07-26 00:00:00', '2024-07-25 20:28:01', -1000),
(8, 11, 500, 0, 0, 49000, '2024-07-26 00:00:00', '2024-07-26 10:46:55', 0),
(9, 11, 300, 0, 0, 100000, '2024-07-26 00:00:00', '2024-07-26 22:30:51', -4000),
(10, 11, 600, 0, 0, 40000, '2024-07-27 00:00:00', '2024-07-27 15:54:24', 0),
(11, 12, 300, 6000, 0, 13000, '2024-07-27 00:00:00', '2024-07-27 15:54:24', 0),
(12, 11, 500, 0, 0, 29000, '2024-07-28 00:00:00', '2024-07-28 18:16:43', 0),
(13, 11, 300, 0, 0, 28000, '2024-07-28 00:00:00', '2024-07-28 18:52:20', -3300),
(14, 11, 50, 8000, 6000, 20000, '2024-07-29 00:00:00', '2024-07-28 21:21:30', -50),
(15, 11, 100, 0, 0, 10000, '2024-07-31 00:00:00', '2024-07-30 19:38:44', -1100),
(16, 11, 1, 5000, 5000, 62000, '2024-08-01 00:00:00', '2024-07-31 22:44:54', -2001),
(17, 11, 59, 9000, 7000, 10000, '2024-08-01 00:00:00', '2024-07-31 22:59:22', 0),
(18, 12, 9, 0, 0, 5000, '2024-08-01 00:00:00', '2024-07-31 23:08:42', -9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_Color` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_Color`, `nombre`) VALUES
(1, 'blanco'),
(2, 'negro'),
(3, 'verde'),
(4, 'azul'),
(5, 'amarillo'),
(6, 'rosa'),
(7, 'celeste'),
(8, 'beige'),
(9, 'natural'),
(10, 'rojo'),
(11, 'otro');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consultascaja`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consultascaja` (
`Num_Caja` int(11)
,`Empleado` varchar(100)
,`Fecha_Apertura` datetime
,`Monto_Apertura` double
,`Ventas_Debito` int(11)
,`Ventas_Credito` int(11)
,`Monto_Cierre` double
,`Fecha_Cierre` datetime
,`Diferencia_Caja` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id_Detalle_venta` int(11) NOT NULL,
  `id_Venta` int(11) NOT NULL,
  `id_Prenda` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`id_Detalle_venta`, `id_Venta`, `id_Prenda`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 85, 1, 1, 1000, 1000),
(2, 85, 2, 1, 1000, 1000),
(3, 86, 1, 1, 1000, 1000),
(4, 86, 2, 1, 1000, 1000),
(5, 87, 1, 1, 1000, 1000),
(6, 88, 1, 1, 1000, 1000),
(7, 89, 1, 1, 1000, 1000),
(8, 90, 1, 1, 1000, 1000),
(9, 91, 1, 1, 1000, 1000),
(10, 92, 1, 1, 1000, 1000),
(11, 93, 1, 1, 1000, 1000),
(12, 93, 2, 1, 1000, 1000),
(13, 94, 1, 1, 1000, 1000),
(14, 95, 1, 1, 1000, 1000),
(15, 96, 2, 1, 1000, 1000),
(16, 97, 2, 1, 1000, 1000),
(17, 98, 2, 1, 1000, 1000),
(18, 99, 2, 1, 1000, 1000),
(19, 100, 2, 1, 1000, 1000),
(20, 101, 2, 1, 1000, 1000),
(21, 103, 2, 1, 1000, 1000),
(22, 105, 2, 1, 1000, 1000),
(23, 106, 2, 1, 1000, 1000),
(24, 107, 2, 1, 1000, 1000),
(25, 108, 2, 1, 1000, 1000),
(26, 109, 2, 1, 1000, 1000),
(27, 110, 2, 1, 1000, 1000),
(28, 112, 2, 1, 1000, 1000),
(29, 113, 2, 1, 1000, 1000),
(30, 114, 1, 1, 12000, 12000),
(31, 115, 4, 1, 15000, 15000),
(32, 116, 4, 1, 15000, 15000),
(33, 117, 1, 1, 12000, 12000),
(34, 121, 14, 1, 11000, 11000),
(35, 121, 1, 1, 12000, 12000),
(36, 122, 4, 1, 15000, 15000),
(37, 123, 14, 1, 11000, 11000),
(38, 124, 1, 1, 12000, 12000),
(39, 126, 1, 1, 12000, 12000),
(40, 126, 14, 1, 11000, 11000),
(41, 127, 4, 1, 15000, 15000),
(42, 128, 1, 1, 12000, 12000),
(43, 133, 14, 1, 11000, 11000),
(44, 133, 1, 1, 12000, 12000),
(45, 134, 14, 1, 11000, 11000),
(46, 135, 14, 1, 11000, 11000),
(47, 136, 14, 1, 11000, 11000),
(48, 137, 14, 1, 11000, 11000),
(49, 138, 14, 1, 11000, 11000),
(50, 139, 14, 1, 11000, 11000),
(51, 140, 1, 1, 12000, 12000),
(52, 141, 14, 1, 11000, 11000),
(53, 142, 1, 1, 12000, 12000),
(54, 143, 14, 1, 11000, 11000),
(55, 144, 4, 1, 15000, 15000),
(56, 145, 2, 1, 10000, 10000),
(57, 146, 1, 1, 12000, 12000),
(58, 148, 14, 1, 11000, 11000),
(59, 149, 3, 1, 10000, 10000),
(60, 150, 5, 1, 12500, 12500),
(61, 152, 1, 1, 12000, 12000),
(62, 153, 12, 1, 12500, 12500),
(63, 154, 1, 1, 12000, 12000),
(64, 155, 2, 1, 10000, 10000),
(65, 156, 14, 1, 11000, 11000),
(66, 157, 2, 1, 10000, 10000),
(67, 158, 2, 1, 6000, 6000),
(68, 159, 1, 1, 5000, 5000),
(69, 160, 2, 1, 6000, 6000),
(70, 161, 2, 1, 6000, 6000),
(71, 162, 1, 1, 5000, 5000),
(72, 163, 1, 1, 5000, 5000),
(73, 164, 1, 1, 5000, 5000),
(74, 165, 1, 1, 5000, 5000),
(75, 166, 1, 1, 5000, 5000),
(76, 167, 1, 1, 5000, 5000),
(77, 168, 1, 1, 5000, 5000),
(78, 169, 1, 1, 5000, 5000),
(79, 170, 1, 1, 5000, 5000),
(80, 171, 1, 1, 5000, 5000),
(81, 172, 1, 1, 5000, 5000),
(82, 173, 1, 1, 5000, 5000),
(83, 174, 1, 1, 5000, 5000),
(84, 175, 2, 1, 6000, 6000),
(85, 176, 3, 1, 7000, 7000),
(86, 177, 2, 1, 6000, 6000),
(87, 182, 2, 1, 6000, 6000),
(88, 183, 1, 1, 5000, 5000),
(89, 184, 3, 1, 7000, 7000),
(90, 185, 1, 1, 5000, 5000),
(91, 186, 2, 1, 6000, 6000),
(92, 187, 2, 1, 6000, 6000),
(93, 188, 1, 1, 5000, 5000),
(94, 189, 6, 1, 9000, 9000),
(95, 190, 4, 1, 8000, 8000),
(96, 191, 2, 1, 6000, 6000),
(97, 192, 6, 1, 9000, 9000),
(98, 193, 2, 1, 6000, 6000),
(99, 194, 4, 1, 8000, 8000),
(100, 195, 1, 1, 5000, 5000),
(101, 196, 1, 1, 5000, 5000),
(102, 197, 1, 1, 5000, 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_Empleado` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `id_Tipo_de_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_Empleado`, `dni`, `nombre`, `usuario`, `contrasena`, `estado`, `id_Tipo_de_usuario`) VALUES
(11, 30953341, 'Patricia', 'Pato', '1234', 1, 1),
(12, 34555666, 'Belen', 'Belu', '1234', 1, 2),
(17, 12345678, 'ADMIN', 'ADMIN', 'abcd', 0, 1),
(18, 22345678, 'Pedro', 'Pusu', '12345', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediodepago`
--

CREATE TABLE `mediodepago` (
  `id_Medio_de_pago` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `mediodepago`
--

INSERT INTO `mediodepago` (`id_Medio_de_pago`, `nombre`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta Debito'),
(3, 'Tarjeta Credito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_Pedido` int(11) NOT NULL,
  `id_Prenda` int(11) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

CREATE TABLE `precio` (
  `id_Precio` int(11) NOT NULL,
  `id_Prenda` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_Inicio` datetime DEFAULT NULL,
  `fecha_Fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precio`
--

INSERT INTO `precio` (`id_Precio`, `id_Prenda`, `precio`, `fecha_Inicio`, `fecha_Fin`) VALUES
(1, 1, 12000.00, '2024-07-23 19:11:26', NULL),
(2, 2, 10000.00, '2024-07-23 19:12:39', NULL),
(3, 3, 10000.00, '2024-07-23 19:13:02', NULL),
(4, 4, 15000.00, '2024-07-24 12:09:20', NULL),
(5, 5, 12500.00, '2024-07-24 12:53:29', NULL),
(6, 6, 12500.00, '2024-07-24 12:55:11', NULL),
(7, 7, 12500.00, '2024-07-24 12:57:43', NULL),
(8, 8, 12500.00, '2024-07-24 13:00:11', NULL),
(9, 9, 12500.00, '2024-07-24 13:00:14', NULL),
(10, 10, 12500.00, '2024-07-24 13:00:49', NULL),
(11, 11, 12500.00, '2024-07-24 13:00:52', NULL),
(12, 12, 12500.00, '2024-07-24 13:01:09', NULL),
(13, 13, 9000.00, '2024-07-24 13:01:45', NULL),
(14, 14, 11000.00, '2024-07-25 11:42:47', NULL),
(15, 1, 5000.00, '2021-07-25 11:42:47', NULL),
(16, 2, 6000.00, '2024-07-25 11:00:40', NULL),
(17, 3, 7000.00, '2024-07-23 09:00:00', NULL),
(18, 4, 8000.00, '2024-07-23 09:00:00', NULL),
(19, 5, 10000.00, '2024-07-23 09:00:00', NULL),
(20, 6, 9000.00, '2024-07-23 09:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prendas`
--

CREATE TABLE `prendas` (
  `id_Prenda` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_Tipo_de_prenda` int(11) DEFAULT NULL,
  `id_Color` int(11) DEFAULT NULL,
  `id_Talle` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `id_Precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prendas`
--

INSERT INTO `prendas` (`id_Prenda`, `descripcion`, `id_Tipo_de_prenda`, `id_Color`, `id_Talle`, `stock`, `stock_minimo`, `id_Precio`) VALUES
(1, 'remera', 1, 1, 1, 69, 10, 15),
(2, 'pantalon corto', 2, 2, 1, 51, 0, 16),
(3, 'pollera jean', 3, 1, 1, 10, 0, 17),
(4, 'camisa', 4, 1, 1, 15, 0, 18),
(5, 'joguins', 5, 4, 2, 14, 0, 19),
(6, 'buzo capucha', 8, 3, 3, 10, 0, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talle`
--

CREATE TABLE `talle` (
  `id_Talle` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `talle`
--

INSERT INTO `talle` (`id_Talle`, `nombre`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL'),
(6, 'XXL'),
(7, 'unico'),
(8, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeprenda`
--

CREATE TABLE `tipodeprenda` (
  `id_Tipo_de_prenda` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipodeprenda`
--

INSERT INTO `tipodeprenda` (`id_Tipo_de_prenda`, `nombre`) VALUES
(1, 'remera'),
(2, 'pantalon corto'),
(3, 'pollera'),
(4, 'camisa'),
(5, 'joggins'),
(6, 'calza'),
(7, 'jeans'),
(8, 'buzo'),
(9, 'sweater'),
(10, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeusuario`
--

CREATE TABLE `tipodeusuario` (
  `id_Tipo_de_usuario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipodeusuario`
--

INSERT INTO `tipodeusuario` (`id_Tipo_de_usuario`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `id_Empleado` int(11) NOT NULL,
  `fecha_Venta` datetime DEFAULT NULL,
  `id_Medio_de_pago` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `id_Empleado`, `fecha_Venta`, `id_Medio_de_pago`, `total`) VALUES
(1, 1, '2023-11-09 00:00:00', 1, 3000),
(2, 11, '2024-06-28 02:57:43', 1, 1000),
(3, 11, '2024-06-28 03:03:49', 1, 1000),
(4, 11, '2024-06-28 03:04:11', 2, 1000),
(5, 11, '2024-07-20 14:34:22', 1, 1000),
(6, 11, '2024-07-20 14:48:05', 2, 1000),
(7, 11, '2024-07-20 14:50:19', 2, 1000),
(8, 11, '2024-07-20 15:04:58', 2, 1000),
(9, 11, '2024-07-20 15:09:10', 2, 1000),
(10, 11, '2024-07-20 15:17:54', 2, 1000),
(11, 11, '2024-07-20 16:48:21', 2, 1000),
(12, 11, '2024-07-20 16:55:23', 1, 1000),
(13, 11, '2024-07-20 16:57:58', 2, 1000),
(14, 11, '2024-07-20 16:58:37', 3, 1000),
(15, 11, '2024-07-20 16:58:54', 1, 1000),
(16, 11, '2024-07-20 16:59:49', 1, 1000),
(17, 11, '2024-07-20 17:06:30', 1, 1000),
(18, 11, '2024-07-20 17:06:47', 2, 1000),
(19, 11, '2024-07-20 17:07:07', 3, 1000),
(20, 11, '2024-07-20 17:07:31', 1, 1000),
(21, 11, '2024-07-20 17:09:20', 1, 1000),
(22, 11, '2024-07-20 17:21:44', 1, 1000),
(23, 11, '2024-07-20 17:24:06', 1, 1000),
(24, 11, '2024-07-20 17:31:58', 1, 1000),
(25, 11, '2024-07-20 17:34:48', 1, 1000),
(26, 11, '2024-07-21 11:28:18', 1, 1000),
(27, 11, '2024-07-21 13:41:00', 1, 1000),
(28, 11, '2024-07-21 13:46:09', 1, 3000),
(29, 11, '2024-07-21 14:05:23', 1, 1000),
(30, 11, '2024-07-21 14:06:02', 1, 2000),
(31, 11, '2024-07-21 14:09:44', 1, 1000),
(32, 11, '2024-07-21 14:14:53', 1, 1000),
(33, 11, '2024-07-21 17:51:45', 1, 1000),
(34, 11, '2024-07-21 18:00:34', 1, 1000),
(35, 11, '2024-07-21 19:23:25', 1, 1000),
(36, 11, '2024-07-21 19:25:59', 1, 1000),
(37, 11, '2024-07-21 19:26:15', 1, 1000),
(38, 11, '2024-07-21 19:35:08', 1, 1000),
(39, 11, '2024-07-21 19:43:36', 1, 1000),
(40, 11, '2024-07-21 19:43:52', 1, 1000),
(41, 11, '2024-07-21 19:48:59', 2, 1000),
(42, 11, '2024-07-21 19:52:06', 1, 1000),
(43, 11, '2024-07-21 19:54:28', 1, 1000),
(44, 11, '2024-07-21 19:58:09', 1, 1000),
(45, 11, '2024-07-21 20:03:01', 1, 1000),
(46, 11, '2024-07-21 20:15:41', 1, 1000),
(47, 11, '2024-07-21 20:15:55', 1, 1000),
(48, 11, '2024-07-21 20:21:57', 1, 1000),
(49, 11, '2024-07-21 20:24:50', 1, 1000),
(50, 11, '2024-07-21 20:26:07', 1, 1000),
(51, 11, '2024-07-21 20:31:50', 1, 1000),
(52, 11, '2024-07-21 20:32:56', 1, 1000),
(53, 11, '2024-07-21 20:46:28', 1, 1000),
(54, 11, '2024-07-21 20:48:27', 1, 1000),
(55, 11, '2024-07-21 20:50:58', 1, 1000),
(56, 11, '2024-07-21 20:51:01', 1, 1000),
(57, 11, '2024-07-21 20:51:18', 1, 1000),
(58, 11, '2024-07-21 20:51:32', 1, 1000),
(59, 11, '2024-07-21 20:58:27', 1, 1000),
(60, 11, '2024-07-21 20:58:58', 1, 1000),
(61, 11, '2024-07-21 21:07:46', 1, 1000),
(62, 11, '2024-07-21 21:17:55', 1, 1000),
(63, 11, '2024-07-21 21:35:35', 1, 1000),
(64, 11, '2024-07-21 21:49:10', 1, NULL),
(65, 11, '2024-07-21 22:00:01', 1, 1000),
(66, 11, '2024-07-21 22:08:02', 1, 1000),
(67, 11, '2024-07-21 22:08:27', 1, 1000),
(68, 11, '2024-07-21 22:09:09', 1, 1000),
(69, 11, '2024-07-21 22:10:20', 1, 1000),
(70, 11, '2024-07-21 22:36:56', 1, 1000),
(71, 11, '2024-07-21 22:41:44', 1, 1000),
(72, 11, '2024-07-21 22:42:34', 3, 1000),
(73, 11, '2024-07-21 22:59:31', 1, NULL),
(74, 11, '2024-07-21 23:05:02', 1, NULL),
(75, 11, '2024-07-21 23:06:27', 1, NULL),
(76, 11, '2024-07-21 23:07:02', 1, NULL),
(77, 11, '2024-07-21 23:18:26', 3, 1000),
(79, 11, '2024-07-22 12:09:31', NULL, NULL),
(80, 11, '2024-07-22 12:10:05', NULL, NULL),
(81, 11, '2024-07-22 12:10:22', NULL, NULL),
(82, 11, '2024-07-22 12:25:30', NULL, NULL),
(83, 11, '2024-07-22 12:25:44', NULL, NULL),
(84, 11, '2024-07-22 12:28:07', 1, NULL),
(85, 11, '2024-07-22 12:39:39', 1, NULL),
(86, 11, '2024-07-22 12:41:28', 2, NULL),
(87, 11, '2024-07-22 12:43:02', 3, NULL),
(88, 11, '2024-07-22 12:45:47', 1, NULL),
(89, 11, '2024-07-22 13:05:18', 2, NULL),
(90, 11, '2024-07-22 13:11:55', 1, 1000),
(91, 11, '2024-07-22 13:13:16', 2, 1000),
(92, 11, '2024-07-22 13:13:56', 3, 1000),
(93, 11, '2024-07-22 13:14:58', 1, 2000),
(94, 11, '2024-07-22 13:21:45', 1, 1000),
(95, 11, '2024-07-22 13:24:12', 1, 1000),
(96, 11, '2024-07-22 13:31:16', 1, 1000),
(97, 11, '2024-07-22 13:34:32', 1, 1000),
(98, 11, '2024-07-22 13:34:51', 1, 1000),
(99, 11, '2024-07-22 13:35:31', 1, 1000),
(100, 11, '2024-07-22 13:36:45', 1, 1000),
(101, 11, '2024-07-22 13:37:13', 1, NULL),
(102, 11, '2024-07-22 13:41:25', 1, NULL),
(103, 11, '2024-07-22 13:41:44', 1, NULL),
(104, 11, '2024-07-22 13:41:55', 1, NULL),
(105, 11, '2024-07-22 13:42:17', 1, NULL),
(106, 11, '2024-07-22 13:58:17', 1, 1000),
(107, 11, '2024-07-22 14:04:34', 1, 1000),
(108, 11, '2024-07-22 14:06:32', 1, 1000),
(109, 11, '2024-07-22 14:07:07', 1, 1000),
(110, 11, '2024-07-22 14:08:23', 1, NULL),
(111, 11, '2024-07-22 14:08:44', NULL, NULL),
(112, 11, '2024-07-22 14:44:01', 1, NULL),
(113, 11, '2024-07-22 15:33:01', 1, NULL),
(114, 11, '2024-07-24 13:15:46', 1, NULL),
(115, 11, '2024-07-24 13:27:40', 1, NULL),
(116, 11, '2024-07-25 11:21:20', 1, NULL),
(117, 11, '2024-07-25 11:55:08', 1, NULL),
(118, 11, '2024-07-25 18:05:27', 1, NULL),
(119, 11, '2024-07-25 18:11:53', 1, NULL),
(120, 11, '2024-07-25 18:38:19', 2, NULL),
(121, 11, '2024-07-25 18:47:57', 1, NULL),
(122, 11, '2024-07-25 19:08:06', 1, NULL),
(123, 11, '2024-07-25 19:12:57', 1, NULL),
(124, 11, '2024-07-25 19:45:07', 1, 12000),
(125, 11, '2024-07-25 20:00:36', 1, 12000),
(126, 11, '2024-07-25 20:03:44', 1, 11000),
(127, 11, '2024-07-25 20:04:23', 1, 15000),
(128, 11, '2024-07-25 20:04:53', 1, 12000),
(129, 11, '2024-07-25 20:18:19', 1, 11000),
(130, 11, '2024-07-25 20:19:51', 1, 11000),
(131, 11, '2024-07-25 20:19:52', 1, 11000),
(132, 11, '2024-07-25 20:20:15', 1, 11000),
(133, 11, '2024-07-25 20:22:36', 1, 12000),
(134, 11, '2024-07-25 20:23:54', 1, 11000),
(135, 11, '2024-07-25 20:30:33', 1, 11000),
(136, 11, '2024-07-25 20:31:44', 1, 11000),
(137, 11, '2024-07-25 20:45:49', 1, 11000),
(138, 11, '2024-07-25 20:48:54', 1, 11000),
(139, 11, '2024-07-25 20:51:37', 1, 11000),
(140, 11, '2024-07-25 20:54:15', 1, 12000),
(141, 11, '2024-07-25 20:58:38', 1, 11000),
(142, 11, '2024-07-25 21:00:48', 1, 12000),
(143, 11, '2024-07-25 21:04:09', 1, 11000),
(144, 11, '2024-07-26 10:41:16', 1, 15000),
(145, 11, '2024-07-26 10:47:53', 1, 10000),
(146, 11, '2024-07-26 11:03:54', 1, 12000),
(147, 11, '2024-07-26 11:07:15', 1, 12000),
(148, 11, '2024-07-26 11:09:26', 1, 11000),
(149, 11, '2024-07-26 11:12:28', 1, 10000),
(150, 11, '2024-07-26 11:13:09', 1, 12500),
(151, 11, '2024-07-26 11:14:08', 1, 0),
(152, 11, '2024-07-26 12:41:57', 1, 12000),
(153, 11, '2024-07-26 12:48:04', 1, 12500),
(154, 11, '2024-07-26 13:16:03', 1, 12000),
(155, 11, '2024-07-26 22:49:06', 1, NULL),
(156, 11, '2024-07-26 22:50:54', 1, NULL),
(157, 11, '2024-07-26 22:56:22', 1, NULL),
(158, 11, '2024-07-26 23:44:15', 1, NULL),
(159, 11, '2024-07-26 23:46:07', 1, NULL),
(160, 11, '2024-07-26 23:57:53', 1, NULL),
(161, 11, '2024-07-27 00:04:25', 1, NULL),
(162, 11, '2024-07-27 00:08:15', 1, 0),
(163, 11, '2024-07-27 00:10:20', 1, 0),
(164, 11, '2024-07-27 00:11:42', 1, 0),
(165, 11, '2024-07-27 00:26:12', 1, 0),
(166, 11, '2024-07-27 00:32:14', 1, 0),
(167, 11, '2024-07-27 00:44:20', 1, 5000),
(168, 11, '2024-07-27 00:47:09', 1, 5000),
(169, 11, '2024-07-27 00:53:15', 1, 5000),
(170, 11, '2024-07-27 00:55:05', 1, 5000),
(171, 11, '2024-07-27 01:00:13', 1, 5000),
(172, 11, '2024-07-27 01:06:33', 1, 5000),
(173, 11, '2024-07-27 01:09:27', 1, 5000),
(174, 11, '2024-07-27 14:55:29', 1, 5000),
(175, 12, '2024-07-27 17:17:29', 2, 6000),
(176, 12, '2024-07-27 17:26:43', 1, 7000),
(177, 12, '2024-07-27 17:31:20', 1, 6000),
(178, 11, '2024-07-27 18:23:15', 1, 6000),
(179, 11, '2024-07-27 18:23:58', 1, 6000),
(180, 11, '2024-07-27 18:24:44', 1, 5000),
(181, 11, '2024-07-27 19:02:07', 1, 6000),
(182, 11, '2024-07-28 11:04:45', 1, 6000),
(183, 11, '2024-07-28 11:05:26', 1, 5000),
(184, 11, '2024-07-28 17:59:24', 1, 7000),
(185, 11, '2024-07-28 18:00:33', 1, 5000),
(186, 11, '2024-07-28 18:15:10', 1, 6000),
(187, 11, '2024-07-28 18:18:23', 1, 6000),
(188, 11, '2024-07-28 18:18:34', 1, 5000),
(189, 11, '2024-07-28 18:18:49', 1, 9000),
(190, 11, '2024-07-28 18:19:02', 1, 8000),
(191, 11, '2024-07-28 20:25:39', 1, 6000),
(192, 11, '2024-07-28 20:25:58', 1, 9000),
(193, 11, '2024-07-28 20:26:15', 3, 6000),
(194, 11, '2024-07-28 20:26:37', 2, 8000),
(195, 11, '2024-07-28 20:26:50', 1, 5000),
(196, 11, '2024-07-30 19:37:08', 1, 5000),
(197, 11, '2024-07-30 19:37:43', 1, 5000),
(198, 11, '2024-07-30 19:42:16', 3, 5000),
(199, 11, '2024-07-30 19:42:51', 2, 5000),
(200, 11, '2024-07-31 20:01:22', 1, 5000),
(201, 11, '2024-07-31 22:02:48', 2, 5000),
(202, 11, '2024-07-31 22:03:11', 1, 18000),
(203, 11, '2024-07-31 22:03:46', 3, 9000),
(204, 11, '2024-07-31 22:04:35', 1, 5000),
(205, 11, '2024-07-31 22:04:57', 2, 5000),
(206, 11, '2024-07-31 22:05:22', 2, 5000),
(207, 11, '2024-07-31 22:24:00', 3, 5000),
(208, 11, '2024-07-31 22:39:19', 2, 5000),
(209, 11, '2024-07-31 22:40:06', 3, 5000),
(210, 11, '2024-07-31 22:43:45', 2, 5000),
(211, 11, '2024-07-31 22:44:09', 3, 5000),
(212, 11, '2024-07-31 22:50:17', 1, 10000),
(213, 11, '2024-07-31 22:50:30', 2, 9000),
(214, 11, '2024-07-31 22:50:58', 3, 7000),
(215, 12, '2024-07-31 23:07:44', 1, 5000),
(216, 12, '2024-07-31 23:08:20', 1, 5000);

-- --------------------------------------------------------

--
-- Estructura para la vista `consultascaja`
--
DROP TABLE IF EXISTS `consultascaja`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consultascaja`  AS SELECT `c`.`id_Caja` AS `Num_Caja`, `e`.`usuario` AS `Empleado`, `c`.`fecha_Apertura` AS `Fecha_Apertura`, `c`.`monto_Inicio` AS `Monto_Apertura`, `c`.`ventas_debito` AS `Ventas_Debito`, `c`.`ventas_credito` AS `Ventas_Credito`, `c`.`monto_Final` AS `Monto_Cierre`, `c`.`fecha_Cierre` AS `Fecha_Cierre`, `c`.`difCaja` AS `Diferencia_Caja` FROM (`caja` `c` join `empleado` `e` on(`c`.`id_Empleado` = `e`.`id_Empleado`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_Caja`),
  ADD KEY `fk_idEmpleado` (`id_Empleado`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_Color`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id_Detalle_venta`),
  ADD KEY `id_Venta` (`id_Venta`),
  ADD KEY `id_Prenda` (`id_Prenda`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_Empleado`),
  ADD KEY `id_Tipo_de_usuario` (`id_Tipo_de_usuario`);

--
-- Indices de la tabla `mediodepago`
--
ALTER TABLE `mediodepago`
  ADD PRIMARY KEY (`id_Medio_de_pago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `id_Prenda` (`id_Prenda`);

--
-- Indices de la tabla `precio`
--
ALTER TABLE `precio`
  ADD PRIMARY KEY (`id_Precio`);

--
-- Indices de la tabla `prendas`
--
ALTER TABLE `prendas`
  ADD PRIMARY KEY (`id_Prenda`),
  ADD KEY `id_Tipo_de_prenda` (`id_Tipo_de_prenda`),
  ADD KEY `id_Color` (`id_Color`),
  ADD KEY `id_Talle` (`id_Talle`),
  ADD KEY `id_Precio` (`id_Precio`);

--
-- Indices de la tabla `talle`
--
ALTER TABLE `talle`
  ADD PRIMARY KEY (`id_Talle`);

--
-- Indices de la tabla `tipodeprenda`
--
ALTER TABLE `tipodeprenda`
  ADD PRIMARY KEY (`id_Tipo_de_prenda`);

--
-- Indices de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  ADD PRIMARY KEY (`id_Tipo_de_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `fk_Mediodepago` (`id_Medio_de_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_Caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_Color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id_Detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `mediodepago`
--
ALTER TABLE `mediodepago`
  MODIFY `id_Medio_de_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_Pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio`
--
ALTER TABLE `precio`
  MODIFY `id_Precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `prendas`
--
ALTER TABLE `prendas`
  MODIFY `id_Prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `talle`
--
ALTER TABLE `talle`
  MODIFY `id_Talle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipodeprenda`
--
ALTER TABLE `tipodeprenda`
  MODIFY `id_Tipo_de_prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  MODIFY `id_Tipo_de_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `fk_idEmpleado` FOREIGN KEY (`id_Empleado`) REFERENCES `empleado` (`id_Empleado`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`id_Venta`) REFERENCES `ventas` (`id_ventas`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_Tipo_de_usuario`) REFERENCES `tipodeusuario` (`id_Tipo_de_usuario`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_Prenda`) REFERENCES `detalleventa` (`id_Prenda`);

--
-- Filtros para la tabla `prendas`
--
ALTER TABLE `prendas`
  ADD CONSTRAINT `prendas_ibfk_1` FOREIGN KEY (`id_Tipo_de_prenda`) REFERENCES `tipodeprenda` (`id_Tipo_de_prenda`),
  ADD CONSTRAINT `prendas_ibfk_2` FOREIGN KEY (`id_Color`) REFERENCES `color` (`id_Color`),
  ADD CONSTRAINT `prendas_ibfk_3` FOREIGN KEY (`id_Talle`) REFERENCES `talle` (`id_Talle`),
  ADD CONSTRAINT `prendas_ibfk_4` FOREIGN KEY (`id_Precio`) REFERENCES `precio` (`id_Precio`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Mediodepago` FOREIGN KEY (`id_Medio_de_pago`) REFERENCES `mediodepago` (`id_Medio_de_pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
