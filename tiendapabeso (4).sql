-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2024 a las 16:20:21
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPrendaConPrecio` (IN `p_descripcion` VARCHAR(255), IN `p_tipo_de_prenda` INT, IN `p_color` INT, IN `p_talle` INT, IN `p_stock` INT, IN `p_stock_minimo` INT, IN `p_precio` INT)   BEGIN
    DECLARE new_id_prenda INT;
    DECLARE new_id_precio INT;

    -- Insertar la prenda
    INSERT INTO prendas (descripcion, id_Tipo_de_prenda, id_Color, id_Talle, stock, stock_minimo)
    VALUES (p_descripcion, p_tipo_de_prenda, p_color, p_talle, p_stock, p_stock_minimo);

    -- Obtener el id de la prenda recién insertada
    SET new_id_prenda = LAST_INSERT_ID();

    -- Insertar el precio en la tabla Precio
    INSERT INTO Precio (id_Prenda, precio, fecha_Inicio, fecha_Fin)
    VALUES (new_id_prenda, p_precio, NOW(), NULL);

    -- Obtener el id del precio recién insertado
    SET new_id_precio = LAST_INSERT_ID();

    -- Actualizar la prenda con el id_Precio
    UPDATE prendas SET id_Precio = new_id_precio WHERE id_Prenda = new_id_prenda;
END$$

DELIMITER ;

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
(5, 11, 1000, 0, 0, 10000, '2024-07-24 00:00:00', NULL, 0);

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
(4, 'azul');

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
(31, 115, 4, 1, 15000, 15000);

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
(13, 13, 9000.00, '2024-07-24 13:01:45', NULL);

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
(1, 'pollera corta', 3, 1, 1, 9, 0, 1),
(2, 'pantalon deportivo', 4, 3, 2, NULL, 10, 2),
(3, 'pantalon deportivo', 4, 3, 2, NULL, 10, 3),
(4, 'pantalon  sastrero', 4, 2, 3, 9, 0, 4),
(5, 'pollera con tablas', 3, 4, 1, NULL, 0, 5),
(6, 'pollera con tablas', 3, 4, 1, NULL, 0, 6),
(7, 'pollera con tablas', 3, 4, 1, NULL, 0, 7),
(8, 'pollera con tablas', 3, 4, 1, NULL, 0, 8),
(9, 'pollera con tablas', 3, 4, 1, NULL, 0, 9),
(10, 'pollera con tablas', 3, 4, 1, NULL, 0, 10),
(11, 'pollera con tablas', 3, 4, 1, NULL, 0, 11),
(12, 'pollera con tablas', 3, 4, 1, NULL, 0, 12),
(13, 'pantalon a lunares', 2, 1, 3, NULL, 0, 13);

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
(6, 'XXL');

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
(4, 'pantalon largo');

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
(115, 11, '2024-07-24 13:27:40', 1, NULL);

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
  MODIFY `id_Caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_Color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id_Detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id_Precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `prendas`
--
ALTER TABLE `prendas`
  MODIFY `id_Prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `talle`
--
ALTER TABLE `talle`
  MODIFY `id_Talle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipodeprenda`
--
ALTER TABLE `tipodeprenda`
  MODIFY `id_Tipo_de_prenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  MODIFY `id_Tipo_de_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

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