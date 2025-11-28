-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         9.3.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.13.0.7147
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para nibarra_local
CREATE DATABASE IF NOT EXISTS `nibarra_local` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nibarra_local`;

-- Volcando estructura para tabla nibarra_local.auditoria_cambios
CREATE TABLE IF NOT EXISTS `auditoria_cambios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tabla_nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pk_impactada` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `campo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valor_anterior` text COLLATE utf8mb4_general_ci,
  `valor_nuevo` text COLLATE utf8mb4_general_ci,
  `usuario` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.auditoria_cambios: ~7 rows (aproximadamente)
INSERT INTO `auditoria_cambios` (`id`, `tabla_nombre`, `pk_impactada`, `campo`, `valor_anterior`, `valor_nuevo`, `usuario`, `fecha_hora`) VALUES
	(1, 'equipo', '1', 'estado', 'Activo', 'Reparación', 'root', '2025-11-10 18:30:33'),
	(2, 'equipo', '1', 'estado', 'Reparación', 'En reparación', 'root', '2025-11-10 18:51:17'),
	(3, 'orden_servicio', 'FOLIO-83', 'estado', 'En espera de material', 'En revisión', 'root', '2025-11-10 18:51:54'),
	(4, 'orden_servicio', 'FOLIO-83', 'avance', '42', '47', 'root', '2025-11-10 18:51:54'),
	(5, 'orden_servicio', 'FOLIO-300', 'CREACION', NULL, 'id_equipo=1, tipo_mant=Correctivo', 'root', '2025-11-11 00:02:34'),
	(6, 'orden_servicio', 'FOLIO-301', 'CREACION', NULL, 'id_equipo=1, tipo_mant=Correctivo', 'root', '2025-11-11 00:09:24'),
	(25, 'orden_servicio', 'FOLIO-866', 'ELIMINACION', 'id_equipo=4, tipo_mant=Correctivo', NULL, 'root', '2025-11-11 22:17:00');

-- Volcando estructura para tabla nibarra_local.bitacora
CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modulo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `operacion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.bitacora: ~2 rows (aproximadamente)
INSERT INTO `bitacora` (`id`, `fecha`, `usuario`, `modulo`, `operacion`, `descripcion`) VALUES
	(1, '2025-11-11 02:24:06', '1', 'LOGIN', 'LOGOUT', 'Usuario cerró sesión'),
	(2, '2025-11-11 02:30:41', '1', 'LOGIN', 'LOGOUT', 'Usuario cerró sesión');

-- Volcando estructura para tabla nibarra_local.disponibilidad_equipo
CREATE TABLE IF NOT EXISTS `disponibilidad_equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `fecha` date NOT NULL,
  `estado_operativo` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `fk_disponibilidad_equipo` (`id_equipo`),
  CONSTRAINT `fk_disponibilidad_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.disponibilidad_equipo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla nibarra_local.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `familia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_detallado` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `horario_base` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ocupado` tinyint(1) DEFAULT '0',
  `estado` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_registro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.equipo: ~5 rows (aproximadamente)
INSERT INTO `equipo` (`id`, `codigo`, `tipo`, `familia`, `tipo_detallado`, `ubicacion`, `provincia`, `direccion`, `horario_base`, `ocupado`, `estado`, `usuario_registro`, `disponible`) VALUES
	(1, 'EQ-001', 'Mini Split', 'Aire Acondicionado', 'Mini Split', 'Hotel / Piso 1 / Hab 101', 'Herrera', 'Hotel', '4 a 6', 0, 'En reparación', 'admin', 0),
	(2, 'EQ-002', 'Mini Split', 'Refrigeración', 'MINI SPLIT 234', 'Hotel / Piso 1 / Hab 103', 'Chiriqui', 'Afuerza del Barrio', '8:00 a 6:00', 0, 'En reparación', 'admin', 1),
	(3, 'EQ-006', 'Caldera', 'Energía y Bombeo', '', 'Sala de máquinas', '', '', '', 0, 'En reparación', 'admin', 1),
	(4, 'EQ-023', 'Caldera', 'Refrigeración', '', 'Los Rios', '', '', '', 0, 'Activo', 'admin', 1),
	(5, 'EQ-898', 'Caldera', 'Refrigeración', '', 'Santa Susana', '', '', '', 0, 'Activo', 'admin', 1);

-- Volcando estructura para tabla nibarra_local.equipo_integrante
CREATE TABLE IF NOT EXISTS `equipo_integrante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Técnico',
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `equipo_integrante_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.equipo_integrante: ~1 rows (aproximadamente)
INSERT INTO `equipo_integrante` (`id`, `id_equipo`, `nombre`, `rol`, `telefono`, `correo`) VALUES
	(1, 5, 'Mario', 'Técnico', NULL, NULL);

-- Volcando estructura para tabla nibarra_local.equipo_reparacion
CREATE TABLE IF NOT EXISTS `equipo_reparacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_equipo` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha_inicio` date DEFAULT NULL,
  `costo_estimado` decimal(10,2) DEFAULT NULL,
  `costo_final` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'En reparación',
  PRIMARY KEY (`id`),
  KEY `id_equipo` (`id_equipo`),
  KEY `folio` (`folio`),
  CONSTRAINT `equipo_reparacion_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`),
  CONSTRAINT `equipo_reparacion_ibfk_2` FOREIGN KEY (`folio`) REFERENCES `orden_servicio` (`folio`),
  CONSTRAINT `equipo_reparacion_chk_1` CHECK ((`costo_estimado` <= 1500)),
  CONSTRAINT `equipo_reparacion_chk_2` CHECK ((`costo_final` <= 2000))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.equipo_reparacion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla nibarra_local.orden_servicio
CREATE TABLE IF NOT EXISTS `orden_servicio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_equipo` int NOT NULL,
  `tipo_mant` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avance` int DEFAULT '0',
  `fecha_programada` date DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.orden_servicio: ~6 rows (aproximadamente)
INSERT INTO `orden_servicio` (`id`, `folio`, `id_equipo`, `tipo_mant`, `estado`, `avance`, `fecha_programada`, `descripcion`) VALUES
	(1, 'FOLIO-82', 1, 'Preventivo', 'En revisión', 18, '2025-11-10', 'Cambio de filtro.'),
	(2, 'FOLIO-83', 4, 'Correctivo', 'En revisión', 47, '2025-11-15', 'Revisión de compresor.'),
	(3, 'FOLIO-84', 3, 'Predictivo', 'En espera de material', 44, '2025-11-05', 'Chequeo rutinario.'),
	(5, 'FOLIO-99', 3, 'Preventivo', 'En revisión', 45, '2025-11-10', 'No hay carro\n'),
	(16, 'FOLIO-300', 1, 'Preventivo', 'En revisión', 24, '2025-11-12', 'Prueba disponibilidad'),
	(17, 'FOLIO-301', 1, 'Correctivo', 'En espera de material', 100, '2025-11-15', 'Prueba terminada');

-- Volcando estructura para tabla nibarra_local.sesion_usuario
CREATE TABLE IF NOT EXISTS `sesion_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `evento` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `logout_at` datetime DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.sesion_usuario: ~192 rows (aproximadamente)
INSERT INTO `sesion_usuario` (`id`, `usuario`, `evento`, `logout_at`, `ip`, `fecha_hora`, `id_usuario`, `fecha`) VALUES
	(1, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:46:29', NULL, '2025-11-10 19:46:29'),
	(2, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:46:42', NULL, '2025-11-10 19:46:42'),
	(3, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:54', NULL, '2025-11-10 19:55:54'),
	(4, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:57', NULL, '2025-11-10 19:55:57'),
	(5, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:58', NULL, '2025-11-10 19:55:58'),
	(6, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:58', NULL, '2025-11-10 19:55:58'),
	(7, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:59', NULL, '2025-11-10 19:55:59'),
	(8, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:59', NULL, '2025-11-10 19:55:59'),
	(9, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:59', NULL, '2025-11-10 19:55:59'),
	(10, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:55:59', NULL, '2025-11-10 19:55:59'),
	(11, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:56:07', NULL, '2025-11-10 19:56:07'),
	(12, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:56:07', NULL, '2025-11-10 19:56:07'),
	(13, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:56:08', NULL, '2025-11-10 19:56:08'),
	(14, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:56:08', NULL, '2025-11-10 19:56:08'),
	(15, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 19:56:08', NULL, '2025-11-10 19:56:08'),
	(16, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:04:07', NULL, '2025-11-10 20:04:07'),
	(17, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:04:09', NULL, '2025-11-10 20:04:09'),
	(18, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:04:09', NULL, '2025-11-10 20:04:09'),
	(19, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:18:11', NULL, '2025-11-10 20:18:11'),
	(20, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-10 20:26:33', NULL, '2025-11-10 20:26:33'),
	(21, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:30:46', NULL, '2025-11-10 20:30:46'),
	(22, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 20:56:26', NULL, '2025-11-10 20:56:26'),
	(23, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:29:35', NULL, '2025-11-10 21:29:35'),
	(24, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:29:57', NULL, '2025-11-10 21:29:57'),
	(25, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:31:09', NULL, '2025-11-10 21:31:09'),
	(26, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:40:11', NULL, '2025-11-10 21:40:11'),
	(27, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:44:45', NULL, '2025-11-10 21:44:45'),
	(28, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 21:52:00', NULL, '2025-11-10 21:52:00'),
	(29, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 22:01:31', NULL, '2025-11-10 22:01:31'),
	(30, 'admin', 'LOGIN', NULL, NULL, '2025-11-10 22:13:31', NULL, '2025-11-10 22:13:31'),
	(31, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 00:11:44', NULL, '2025-11-11 00:11:44'),
	(32, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 00:49:32', NULL, '2025-11-11 00:49:32'),
	(33, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 00:51:22', NULL, '2025-11-11 00:51:22'),
	(34, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 00:57:00', NULL, '2025-11-11 00:57:00'),
	(35, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 01:06:27', NULL, '2025-11-11 01:06:27'),
	(36, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 01:17:02', NULL, '2025-11-11 01:17:02'),
	(37, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 01:19:30', NULL, '2025-11-11 01:19:30'),
	(38, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:21:36', NULL, '2025-11-11 02:21:36'),
	(39, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:24:03', NULL, '2025-11-11 02:24:03'),
	(40, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:30:36', NULL, '2025-11-11 02:30:36'),
	(41, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:32:22', NULL, '2025-11-11 02:32:22'),
	(42, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:32:42', NULL, '2025-11-11 02:32:42'),
	(43, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:33:29', NULL, '2025-11-11 02:33:29'),
	(44, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:42:16', NULL, '2025-11-11 02:42:16'),
	(45, 'admin', 'LOGOUT', NULL, NULL, '2025-11-11 02:42:18', 1, '2025-11-11 02:42:18'),
	(46, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 02:56:39', NULL, '2025-11-11 02:56:39'),
	(47, 'admin', 'LOGOUT', NULL, NULL, '2025-11-11 02:57:08', 1, '2025-11-11 02:57:08'),
	(48, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:02:05', NULL, '2025-11-11 10:02:05'),
	(49, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:04:50', NULL, '2025-11-11 10:04:50'),
	(50, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:04:52', NULL, '2025-11-11 10:04:52'),
	(51, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:10:31', NULL, '2025-11-11 10:10:31'),
	(52, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:12:56', NULL, '2025-11-11 10:12:56'),
	(53, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:14:25', NULL, '2025-11-11 10:14:25'),
	(54, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:16:49', NULL, '2025-11-11 10:16:49'),
	(55, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:41:00', NULL, '2025-11-11 10:41:00'),
	(56, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 10:53:27', NULL, '2025-11-11 10:53:27'),
	(57, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:02:34', NULL, '2025-11-11 11:02:34'),
	(58, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:10:26', NULL, '2025-11-11 11:10:26'),
	(59, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:12:39', NULL, '2025-11-11 11:12:39'),
	(60, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:14:36', NULL, '2025-11-11 11:14:36'),
	(61, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:16:30', NULL, '2025-11-11 11:16:30'),
	(62, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 11:33:15', NULL, '2025-11-11 11:33:15'),
	(63, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 12:46:24', NULL, '2025-11-11 12:46:24'),
	(64, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 13:25:15', NULL, '2025-11-11 13:25:15'),
	(65, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 13:44:28', NULL, '2025-11-11 13:44:28'),
	(66, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 13:53:56', NULL, '2025-11-11 13:53:56'),
	(67, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 14:05:03', NULL, '2025-11-11 14:05:03'),
	(68, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 14:21:57', NULL, '2025-11-11 14:21:57'),
	(69, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 14:23:02', NULL, '2025-11-11 14:23:02'),
	(70, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 14:25:58', NULL, '2025-11-11 14:25:58'),
	(71, 'admin', 'LOGOUT', NULL, NULL, '2025-11-11 14:31:47', 1, '2025-11-11 14:31:47'),
	(72, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 14:31:57', NULL, '2025-11-11 14:31:57'),
	(73, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 18:55:21', NULL, '2025-11-11 18:55:21'),
	(74, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 19:06:59', NULL, '2025-11-11 19:06:59'),
	(75, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 19:08:20', NULL, '2025-11-11 19:08:20'),
	(76, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 19:19:43', NULL, '2025-11-11 19:19:43'),
	(77, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 19:22:57', NULL, '2025-11-11 19:22:57'),
	(78, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:00:20', NULL, '2025-11-11 20:00:20'),
	(79, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:10:44', NULL, '2025-11-11 20:10:44'),
	(80, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:17:53', NULL, '2025-11-11 20:17:53'),
	(81, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:22:09', NULL, '2025-11-11 20:22:09'),
	(82, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:22:59', NULL, '2025-11-11 20:22:59'),
	(83, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:24:53', NULL, '2025-11-11 20:24:53'),
	(84, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:27:34', NULL, '2025-11-11 20:27:34'),
	(85, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:29:23', NULL, '2025-11-11 20:29:23'),
	(86, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:31:32', NULL, '2025-11-11 20:31:32'),
	(87, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:35:46', NULL, '2025-11-11 20:35:46'),
	(88, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:36:12', NULL, '2025-11-11 20:36:12'),
	(89, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:38:06', NULL, '2025-11-11 20:38:06'),
	(90, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:39:26', NULL, '2025-11-11 20:39:26'),
	(91, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:41:22', NULL, '2025-11-11 20:41:22'),
	(92, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:44:01', NULL, '2025-11-11 20:44:01'),
	(93, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:47:24', NULL, '2025-11-11 20:47:24'),
	(94, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 20:51:04', NULL, '2025-11-11 20:51:04'),
	(95, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:01:12', NULL, '2025-11-11 21:01:12'),
	(96, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:13:41', NULL, '2025-11-11 21:13:41'),
	(97, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:15:27', NULL, '2025-11-11 21:15:27'),
	(98, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:20:37', NULL, '2025-11-11 21:20:37'),
	(99, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:21:48', NULL, '2025-11-11 21:21:48'),
	(100, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:29:31', NULL, '2025-11-11 21:29:31'),
	(101, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:31:03', NULL, '2025-11-11 21:31:03'),
	(102, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:37:22', NULL, '2025-11-11 21:37:22'),
	(103, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:45:43', NULL, '2025-11-11 21:45:43'),
	(104, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 21:51:33', NULL, '2025-11-11 21:51:33'),
	(105, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 21:55:10', NULL, '2025-11-11 21:55:10'),
	(106, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 21:57:52', NULL, '2025-11-11 21:57:52'),
	(107, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:02:06', NULL, '2025-11-11 22:02:06'),
	(108, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:03:01', NULL, '2025-11-11 22:03:01'),
	(109, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:04:10', NULL, '2025-11-11 22:04:10'),
	(110, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:06:15', NULL, '2025-11-11 22:06:15'),
	(111, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:08:30', NULL, '2025-11-11 22:08:30'),
	(112, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:10:26', NULL, '2025-11-11 22:10:26'),
	(113, 'admin ', 'LOGIN', NULL, NULL, '2025-11-11 22:16:03', NULL, '2025-11-11 22:16:03'),
	(114, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:27:25', NULL, '2025-11-11 22:27:25'),
	(115, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:28:13', NULL, '2025-11-11 22:28:13'),
	(116, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:33:15', NULL, '2025-11-11 22:33:15'),
	(117, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:35:44', NULL, '2025-11-11 22:35:44'),
	(118, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:37:02', NULL, '2025-11-11 22:37:02'),
	(119, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:38:35', NULL, '2025-11-11 22:38:35'),
	(120, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:41:35', NULL, '2025-11-11 22:41:35'),
	(121, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:42:29', NULL, '2025-11-11 22:42:29'),
	(122, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:43:00', NULL, '2025-11-11 22:43:00'),
	(123, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:45:25', NULL, '2025-11-11 22:45:25'),
	(124, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 22:45:47', NULL, '2025-11-11 22:45:47'),
	(125, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:47:37', NULL, '2025-11-11 22:47:37'),
	(126, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:48:37', NULL, '2025-11-11 22:48:37'),
	(127, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:49:06', NULL, '2025-11-11 22:49:06'),
	(128, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 22:49:41', NULL, '2025-11-11 22:49:41'),
	(129, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 23:07:48', NULL, '2025-11-11 23:07:48'),
	(130, 'admin', 'LOGOUT', NULL, NULL, '2025-11-11 23:08:27', 1, '2025-11-11 23:08:27'),
	(131, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 23:14:17', NULL, '2025-11-11 23:14:17'),
	(132, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-11 23:17:24', NULL, '2025-11-11 23:17:24'),
	(133, 'ADMIN', 'LOGOUT', NULL, NULL, '2025-11-11 23:17:46', 1, '2025-11-11 23:17:46'),
	(134, 'admin', 'LOGIN', NULL, NULL, '2025-11-11 23:32:30', NULL, '2025-11-11 23:32:30'),
	(135, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:01:23', NULL, '2025-11-12 01:01:23'),
	(136, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:11:42', NULL, '2025-11-12 01:11:42'),
	(137, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:14:25', NULL, '2025-11-12 01:14:25'),
	(138, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:18:34', NULL, '2025-11-12 01:18:34'),
	(139, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:19:38', NULL, '2025-11-12 01:19:38'),
	(140, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:39:44', NULL, '2025-11-12 01:39:44'),
	(141, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:43:51', NULL, '2025-11-12 01:43:51'),
	(142, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:49:13', NULL, '2025-11-12 01:49:13'),
	(143, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:56:18', NULL, '2025-11-12 01:56:18'),
	(144, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 01:58:02', NULL, '2025-11-12 01:58:02'),
	(145, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-12 02:00:02', NULL, '2025-11-12 02:00:02'),
	(146, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 02:08:20', NULL, '2025-11-12 02:08:20'),
	(147, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 02:12:05', NULL, '2025-11-12 02:12:05'),
	(148, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 02:23:43', NULL, '2025-11-12 02:23:43'),
	(149, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 02:29:03', NULL, '2025-11-12 02:29:03'),
	(150, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 02:35:55', NULL, '2025-11-12 02:35:55'),
	(151, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 03:43:20', NULL, '2025-11-12 03:43:20'),
	(152, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 03:50:17', NULL, '2025-11-12 03:50:17'),
	(153, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 03:51:46', NULL, '2025-11-12 03:51:46'),
	(154, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:07:57', NULL, '2025-11-12 04:07:57'),
	(155, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:12:03', NULL, '2025-11-12 04:12:03'),
	(156, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:12:40', NULL, '2025-11-12 04:12:40'),
	(157, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:13:28', NULL, '2025-11-12 04:13:28'),
	(158, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:19:46', NULL, '2025-11-12 04:19:46'),
	(159, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:24:13', NULL, '2025-11-12 04:24:13'),
	(160, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:32:06', NULL, '2025-11-12 04:32:06'),
	(161, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:34:20', NULL, '2025-11-12 04:34:20'),
	(162, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:36:05', NULL, '2025-11-12 04:36:05'),
	(163, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:36:49', NULL, '2025-11-12 04:36:49'),
	(164, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:51:02', NULL, '2025-11-12 04:51:02'),
	(165, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:51:37', NULL, '2025-11-12 04:51:37'),
	(166, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:52:47', NULL, '2025-11-12 04:52:47'),
	(167, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 04:53:52', NULL, '2025-11-12 04:53:52'),
	(168, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:13:12', NULL, '2025-11-12 05:13:12'),
	(169, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:15:38', NULL, '2025-11-12 05:15:38'),
	(170, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:17:58', NULL, '2025-11-12 05:17:58'),
	(171, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:28:46', NULL, '2025-11-12 05:28:46'),
	(172, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:39:02', NULL, '2025-11-12 05:39:02'),
	(173, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:39:31', NULL, '2025-11-12 05:39:31'),
	(174, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:39:49', NULL, '2025-11-12 05:39:49'),
	(175, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:42:00', NULL, '2025-11-12 05:42:00'),
	(176, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:46:53', NULL, '2025-11-12 05:46:53'),
	(177, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:50:16', NULL, '2025-11-12 05:50:16'),
	(178, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:52:36', NULL, '2025-11-12 05:52:36'),
	(179, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 05:53:18', NULL, '2025-11-12 05:53:18'),
	(180, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-12 06:00:43', NULL, '2025-11-12 06:00:43'),
	(181, 'ADMIN', 'LOGOUT', NULL, NULL, '2025-11-12 06:02:09', 1, '2025-11-12 06:02:09'),
	(182, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-12 06:02:17', NULL, '2025-11-12 06:02:17'),
	(183, 'ADMIN', 'LOGOUT', NULL, NULL, '2025-11-12 06:02:32', 1, '2025-11-12 06:02:32'),
	(184, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 06:02:59', NULL, '2025-11-12 06:02:59'),
	(185, 'admin', 'LOGOUT', NULL, NULL, '2025-11-12 06:03:19', 1, '2025-11-12 06:03:19'),
	(186, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 06:03:34', NULL, '2025-11-12 06:03:34'),
	(187, 'admin', 'LOGOUT', NULL, NULL, '2025-11-12 06:03:42', 1, '2025-11-12 06:03:42'),
	(188, 'as', 'LOGIN', NULL, NULL, '2025-11-12 06:03:46', NULL, '2025-11-12 06:03:46'),
	(189, 'as', 'LOGOUT', NULL, NULL, '2025-11-12 06:03:51', 12, '2025-11-12 06:03:51'),
	(190, 'ADMIN', 'LOGIN', NULL, NULL, '2025-11-12 06:23:36', NULL, '2025-11-12 06:23:36'),
	(191, 'admin', 'LOGIN', NULL, NULL, '2025-11-12 06:33:08', NULL, '2025-11-12 06:33:08'),
	(192, 'as', 'LOGIN', NULL, NULL, '2025-11-12 06:34:43', NULL, '2025-11-12 06:34:43');

-- Volcando estructura para tabla nibarra_local.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla nibarra_local.usuario: ~5 rows (aproximadamente)
INSERT INTO `usuario` (`id`, `username`, `password_hash`, `rol`, `activo`) VALUES
	(1, 'admin', '1234', 'admin', 1),
	(6, 'Maria', '231312', 'usuario', 1),
	(8, 'MARIO', '23456', 'admin', 1),
	(10, 'SUSA', '23456', 'admin', 1),
	(12, 'as', '1234', 'admin', 1);

-- Volcando estructura para disparador nibarra_local.trg_equipo_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_equipo_update` AFTER UPDATE ON `equipo` FOR EACH ROW BEGIN
  -- estado
  IF NOT (NEW.estado <=> OLD.estado) THEN
    INSERT INTO auditoria_cambios(tabla_nombre, pk_impactada, campo, valor_anterior, valor_nuevo, usuario)
    VALUES ('equipo', CAST(OLD.id AS CHAR), 'estado', OLD.estado, NEW.estado, SUBSTRING_INDEX(USER(),'@',1));
  END IF;

  -- tipo
  IF NOT (NEW.tipo <=> OLD.tipo) THEN
    INSERT INTO auditoria_cambios(tabla_nombre, pk_impactada, campo, valor_anterior, valor_nuevo, usuario)
    VALUES ('equipo', CAST(OLD.id AS CHAR), 'tipo', OLD.tipo, NEW.tipo, SUBSTRING_INDEX(USER(),'@',1));
  END IF;

  -- ubicacion
  IF NOT (NEW.ubicacion <=> OLD.ubicacion) THEN
    INSERT INTO auditoria_cambios(tabla_nombre, pk_impactada, campo, valor_anterior, valor_nuevo, usuario)
    VALUES ('equipo', CAST(OLD.id AS CHAR), 'ubicacion', OLD.ubicacion, NEW.ubicacion, SUBSTRING_INDEX(USER(),'@',1));
  END IF;

  -- codigo
  IF NOT (NEW.codigo <=> OLD.codigo) THEN
    INSERT INTO auditoria_cambios(tabla_nombre, pk_impactada, campo, valor_anterior, valor_nuevo, usuario)
    VALUES ('equipo', CAST(OLD.id AS CHAR), 'codigo', OLD.codigo, NEW.codigo, SUBSTRING_INDEX(USER(),'@',1));
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador nibarra_local.trg_orden_servicio_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_orden_servicio_insert` AFTER INSERT ON `orden_servicio` FOR EACH ROW BEGIN
    -- Cuando se crea una orden, el equipo queda no disponible
    UPDATE equipo
    SET disponible = 0
    WHERE id = NEW.id_equipo;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador nibarra_local.trg_orden_servicio_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_orden_servicio_update` AFTER UPDATE ON `orden_servicio` FOR EACH ROW BEGIN
    -- Actualiza el estado de disponibilidad del equipo
    UPDATE equipo
    SET disponible = CASE
        WHEN NEW.estado = 'Terminada' THEN 1
        ELSE 0
    END
    WHERE id = NEW.id_equipo;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador nibarra_local.trg_os_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_os_delete` AFTER DELETE ON `orden_servicio` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios(tabla_nombre, pk_impactada, campo, valor_anterior, valor_nuevo, usuario)
  VALUES ('orden_servicio', OLD.folio, 'ELIMINACION',
          CONCAT('id_equipo=',OLD.id_equipo, ', tipo_mant=',OLD.tipo_mant),
          NULL,
          SUBSTRING_INDEX(USER(),'@',1));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
