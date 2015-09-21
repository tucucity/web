-- --------------------------------------------------------
-- Host:                         javiercani.net
-- Versión del servidor:         5.5.42-cll - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla javierca_tucucity.articulos
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `empresa` int(11) NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `codbar` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipoArt` (`tipo`),
  KEY `empresaArt_idx` (`empresa`),
  CONSTRAINT `tipoArt` FOREIGN KEY (`tipo`) REFERENCES `articulos_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empresaArt` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.articulos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.articulos_tipo
DROP TABLE IF EXISTS `articulos_tipo`;
CREATE TABLE IF NOT EXISTS `articulos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.articulos_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articulos_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos_tipo` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.concepto
DROP TABLE IF EXISTS `concepto`;
CREATE TABLE IF NOT EXISTS `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.concepto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `concepto` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.controller
DROP TABLE IF EXISTS `controller`;
CREATE TABLE IF NOT EXISTS `controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `masterPage` varchar(45) NOT NULL,
  `page` varchar(45) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `tipoC` (`tipo`),
  CONSTRAINT `tipoC` FOREIGN KEY (`tipo`) REFERENCES `controller_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.controller: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.controller_tipo
DROP TABLE IF EXISTS `controller_tipo`;
CREATE TABLE IF NOT EXISTS `controller_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.controller_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `controller_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller_tipo` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.empresa
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `cuit` int(12) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `slogan` varchar(45) DEFAULT NULL,
  `rubro` int(11) DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  `ubicacion_x` float DEFAULT NULL,
  `ubicacion_y` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rubro_idx` (`rubro`),
  CONSTRAINT `rubro` FOREIGN KEY (`rubro`) REFERENCES `rubro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.factura
DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `letra` char(1) DEFAULT NULL,
  `terminal` int(11) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `nograv` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.factura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.factura_detalle
DROP TABLE IF EXISTS `factura_detalle`;
CREATE TABLE IF NOT EXISTS `factura_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura` int(11) NOT NULL,
  `concepto` int(11) NOT NULL,
  `cant_facturada` int(11) DEFAULT NULL,
  `cant_fisica` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_idx` (`factura`),
  KEY `concepto_idx` (`concepto`),
  CONSTRAINT `factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `concepto` FOREIGN KEY (`concepto`) REFERENCES `concepto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.factura_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.gasto
DROP TABLE IF EXISTS `gasto`;
CREATE TABLE IF NOT EXISTS `gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioG_idx` (`usuario`),
  CONSTRAINT `usuarioG` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.gasto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.gasto_detalle
DROP TABLE IF EXISTS `gasto_detalle`;
CREATE TABLE IF NOT EXISTS `gasto_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gasto` int(11) NOT NULL,
  `linea` int(11) NOT NULL,
  `concepto` int(11) DEFAULT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gasto_idx` (`gasto`),
  KEY `conceptoG_idx` (`concepto`),
  CONSTRAINT `gasto` FOREIGN KEY (`gasto`) REFERENCES `gasto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `conceptoG` FOREIGN KEY (`concepto`) REFERENCES `concepto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.gasto_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gasto_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `gasto_detalle` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.mensaje
DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `mensaje` text,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.mensaje: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.oferta
DROP TABLE IF EXISTS `oferta`;
CREATE TABLE IF NOT EXISTS `oferta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  `fechaVigencia` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vigencia` (`fechaVigencia`),
  KEY `usuarioO_idx` (`usuario`),
  KEY `empresaO_idx` (`empresa`),
  CONSTRAINT `usuarioO` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empresaO` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.oferta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.oferta_detalle
DROP TABLE IF EXISTS `oferta_detalle`;
CREATE TABLE IF NOT EXISTS `oferta_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oferta` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  `descuento` float NOT NULL,
  `minimo` int(11) DEFAULT NULL,
  `regalo` int(11) DEFAULT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `articulo_nombre` varchar(45) DEFAULT NULL,
  `articulo_precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oferta_idx` (`oferta`),
  KEY `alta` (`alta`),
  CONSTRAINT `oferta` FOREIGN KEY (`oferta`) REFERENCES `oferta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.oferta_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `oferta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta_detalle` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.pago
DROP TABLE IF EXISTS `pago`;
CREATE TABLE IF NOT EXISTS `pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` int(11) NOT NULL,
  `factura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioP_idx` (`usuario`),
  KEY `facturaP_idx` (`factura`),
  CONSTRAINT `usuarioP` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facturaP` FOREIGN KEY (`factura`) REFERENCES `factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.pago_detalle
DROP TABLE IF EXISTS `pago_detalle`;
CREATE TABLE IF NOT EXISTS `pago_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pago` int(11) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `forma` int(11) NOT NULL,
  `monto` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pagoD_idx` (`pago`),
  KEY `formaP_idx` (`forma`),
  CONSTRAINT `pagoD` FOREIGN KEY (`pago`) REFERENCES `pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `formaP` FOREIGN KEY (`forma`) REFERENCES `pago_forma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.pago_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_detalle` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.pago_forma
DROP TABLE IF EXISTS `pago_forma`;
CREATE TABLE IF NOT EXISTS `pago_forma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.pago_forma: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago_forma` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_forma` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.rubro
DROP TABLE IF EXISTS `rubro`;
CREATE TABLE IF NOT EXISTS `rubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.rubro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` int(11) DEFAULT NULL,
  `genero` char(1) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `password_fecha` datetime NOT NULL,
  `tipo` int(11) NOT NULL,
  `nacimiento` date DEFAULT NULL,
  `notificaciones` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificacion` timestamp NULL DEFAULT NULL,
  `codpos` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa_idx` (`empresa`),
  KEY `tipoUsuario_idx` (`tipo`),
  CONSTRAINT `empresaU` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipoUsuario` FOREIGN KEY (`tipo`) REFERENCES `usuario_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Volcando estructura para tabla javierca_tucucity.usuario_tipo
DROP TABLE IF EXISTS `usuario_tipo`;
CREATE TABLE IF NOT EXISTS `usuario_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla javierca_tucucity.usuario_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tipo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
