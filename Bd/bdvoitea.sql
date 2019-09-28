-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2019 a las 20:02:35
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdvoitea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abogado`
--

CREATE TABLE `abogado` (
  `idAbogado` int(11) NOT NULL,
  `numeroCasos` int(11) NOT NULL,
  `puntajeCasos` double NOT NULL,
  `nivelEducativo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Persona_CC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bufed`
--

CREATE TABLE `bufed` (
  `idBufed` int(11) NOT NULL,
  `nombreBufed` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nitBufed` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `idCasos` int(11) NOT NULL,
  `evidencia` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `problema` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `asesoria` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Abogado_idAbogado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idEstudiante` int(11) NOT NULL,
  `semestreCursa` int(11) NOT NULL,
  `Abogado_idAbogado` int(11) NOT NULL,
  `Universidad_idUniversidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `CC` int(11) NOT NULL,
  `nombrePersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `contrasenaPersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `telefonoPersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `direccionPersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correoPersona` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE `profesional` (
  `idProfesional` int(11) NOT NULL,
  `especializacion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idEstudiante` int(11) NOT NULL,
  `Abogado_idAbogado` int(11) NOT NULL,
  `Bufed_idBufed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `idUniversidad` int(11) NOT NULL,
  `nombreUniversidad` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `NIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Persona_CC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abogado`
--
ALTER TABLE `abogado`
  ADD PRIMARY KEY (`idAbogado`),
  ADD KEY `fk_Abogado_Persona_idx` (`Persona_CC`);

--
-- Indices de la tabla `bufed`
--
ALTER TABLE `bufed`
  ADD PRIMARY KEY (`idBufed`),
  ADD UNIQUE KEY `nombreBufed_UNIQUE` (`nombreBufed`),
  ADD UNIQUE KEY `nitBufed_UNIQUE` (`nitBufed`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`idCasos`,`Usuario_idUsuario`,`Abogado_idAbogado`),
  ADD KEY `fk_Casos_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Casos_Abogado1_idx` (`Abogado_idAbogado`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idEstudiante`,`Abogado_idAbogado`,`Universidad_idUniversidad`),
  ADD KEY `fk_Estudiante_Abogado1_idx` (`Abogado_idAbogado`),
  ADD KEY `fk_Estudiante_Universidad1_idx` (`Universidad_idUniversidad`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`CC`),
  ADD UNIQUE KEY `direccionPersona_UNIQUE` (`direccionPersona`),
  ADD UNIQUE KEY `correoPersona_UNIQUE` (`correoPersona`);

--
-- Indices de la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD PRIMARY KEY (`idProfesional`,`Abogado_idAbogado`,`Bufed_idBufed`),
  ADD UNIQUE KEY `idEstudiante_UNIQUE` (`idEstudiante`),
  ADD KEY `fk_Profesional_Abogado1_idx` (`Abogado_idAbogado`),
  ADD KEY `fk_Profesional_Bufed1_idx` (`Bufed_idBufed`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`idUniversidad`),
  ADD UNIQUE KEY `NIT_UNIQUE` (`NIT`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`Persona_CC`),
  ADD KEY `fk_Usuario_Persona1_idx` (`Persona_CC`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abogado`
--
ALTER TABLE `abogado`
  MODIFY `idAbogado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `idCasos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesional`
--
ALTER TABLE `profesional`
  MODIFY `idProfesional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `idUniversidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abogado`
--
ALTER TABLE `abogado`
  ADD CONSTRAINT `fk_Abogado_Persona` FOREIGN KEY (`Persona_CC`) REFERENCES `mydb`.`persona` (`CC`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `fk_Casos_Abogado1` FOREIGN KEY (`Abogado_idAbogado`) REFERENCES `abogado` (`idAbogado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Casos_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_Estudiante_Abogado1` FOREIGN KEY (`Abogado_idAbogado`) REFERENCES `mydb`.`abogado` (`idAbogado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Estudiante_Universidad1` FOREIGN KEY (`Universidad_idUniversidad`) REFERENCES `mydb`.`universidad` (`idUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD CONSTRAINT `fk_Profesional_Abogado1` FOREIGN KEY (`Abogado_idAbogado`) REFERENCES `mydb`.`abogado` (`idAbogado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Profesional_Bufed1` FOREIGN KEY (`Bufed_idBufed`) REFERENCES `mydb`.`bufed` (`idBufed`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Persona1` FOREIGN KEY (`Persona_CC`) REFERENCES `mydb`.`persona` (`CC`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
