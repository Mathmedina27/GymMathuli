CREATE TABLE `Cliente` (
  `id_cliente` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
);

CREATE TABLE `Clase` (
  `id_clase` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `horario` varchar(10) NOT NULL,
  `sala` int(10) NOT NULL,
  `cedula` varchar(10) NOT NULL
);

CREATE TABLE `inscribe` (
  `id_clase` int(10) NOT NULL,
  `id_cliente` int(10)
);

CREATE TABLE `Instructor` (
  `cedula` varchar(10) PRIMARY KEY NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL
);

CREATE TABLE `Equipo` (
  `id_equipo` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha_adquisicion` date NOT NULL
);

CREATE TABLE `usa` (
  `id_equipo` int(10) NOT NULL,
  `id_clase` int(10) NOT NULL
);

CREATE TABLE `Membresia` (
  `id_membresia` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  `precio` float(10) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `duracion` varchar(255) NOT NULL,
  `id_cliente` int(10) NOT NULL
);

CREATE TABLE `Pago` (
  `id_pago` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `monto` float(10) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `metodo_pago` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `id_membresia` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL
);

ALTER TABLE `Clase` ADD FOREIGN KEY (`cedula`) REFERENCES `Instructor` (`cedula`);

ALTER TABLE `inscribe` ADD FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`);

ALTER TABLE `inscribe` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`);

ALTER TABLE `usa` ADD FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`);

ALTER TABLE `usa` ADD FOREIGN KEY (`id_clase`) REFERENCES `Clase` (`id_clase`);

ALTER TABLE `Membresia` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`);

ALTER TABLE `Pago` ADD FOREIGN KEY (`id_membresia`) REFERENCES `Membresia` (`id_membresia`);

ALTER TABLE `Pago` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`);
