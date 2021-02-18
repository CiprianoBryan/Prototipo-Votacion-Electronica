-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-02-2021 a las 01:14:28
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bryan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votos_alumnos` int(11) DEFAULT NULL,
  `votos_docentes` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_candidato_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`, `activo`) VALUES
(1, 'DNI', 1),
(2, 'CE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`, `activo`) VALUES
(1, 'Docente', 1),
(2, 'Alumno', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(9) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido_paterno` varchar(200) NOT NULL,
  `apellido_materno` varchar(200) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_tu_id` (`tipo_usuario_id`),
  KEY `fk_usuario_td_id` (`tipo_documento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `codigo`, `clave`, `nombre`, `apellido_paterno`, `apellido_materno`, `documento`, `tipo_documento_id`, `tipo_usuario_id`, `activo`) VALUES
(1, '20140161A', '123456', 'Mery', 'Morales', 'Cuellar', '75012563', 1, 1, 1),
(2, '20130128C', '123456', 'Francisco Rafael', 'Sagasti ', 'Hochhausler', '41251256', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE IF NOT EXISTS `voto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `voto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_voto_usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `fk_candidato_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_td_id` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`),
  ADD CONSTRAINT `fk_usuario_tu_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `fk_voto_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
