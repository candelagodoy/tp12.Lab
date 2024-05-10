-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2024 a las 23:17:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `construirsa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(1, 37000000, 'Segura', 'Luis', 1, 0),
(2, 39658745, 'Godoy', 'Candela', 2, 1),
(3, 35689574, 'Zuñiga', 'Jose', 1, 0),
(4, 45879521, 'Carrillo', 'Tomas', 3, 1),
(5, 41785236, 'Perez', 'Pedro', 3, 0),
(6, 30587965, 'Martinez', 'Juan', 2, 1),
(7, 40154789, 'Marin', 'Marcela', 2, 0),
(8, 39990555, 'Perez', 'Maria', 1, 1),
(9, 45123687, 'Martinez', 'Juan', 2, 1),
(10, 30452158, 'Gomez', 'Martin', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `idHerramienta` int(11) NOT NULL,
  `nombreHerramienta` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`idHerramienta`, `nombreHerramienta`, `descripcion`, `stock`, `estado`) VALUES
(1, 'Martillo', 'herramienta manual para clavar, golpear, empujar, romper o deformar objetos', 50, 1),
(2, 'Taladro', 'objeto para realizar perforaciones en piezas o materiales', 39, 1),
(3, 'Destornillador', 'herramienta manual diseñada para encajar tornillos', 67, 1),
(4, 'Mezcladora', 'maquina para mezclar concreto', 5, 0),
(5, 'Pinza', 'herramienta para agarrar, sujetar o manipular objetos de manera precisa y firme', 29, 1),
(6, 'Pistola de calor', 'Generador de calor de dos velocidades', 15, 1),
(7, 'Caladora', 'obejto para calar', 9, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idHerramienta` int(11) NOT NULL,
  `descripcionMovimiento` varchar(30) NOT NULL,
  `fechaP` date NOT NULL,
  `fechaD` date DEFAULT NULL,
  `cantidadRet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`idMovimiento`, `idEmpleado`, `idHerramienta`, `descripcionMovimiento`, `fechaP`, `fechaD`, `cantidadRet`) VALUES
(1, 2, 2, 'retira', '2024-04-19', NULL, 1),
(2, 2, 3, 'retira', '2024-04-19', NULL, 3),
(3, 2, 2, 'devuelve', '2024-04-19', '2024-05-02', 1),
(4, 2, 3, 'devuelve', '2024-04-19', '2024-05-02', 3),
(5, 1, 1, 'retira', '2024-04-12', NULL, 2),
(7, 3, 4, 'retira', '2024-05-02', NULL, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`idHerramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMovimiento`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idHerramienta` (`idHerramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `idHerramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`idHerramienta`) REFERENCES `herramienta` (`idHerramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
