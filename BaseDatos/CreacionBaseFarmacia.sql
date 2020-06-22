CREATE SCHEMA IF NOT EXISTS farmacia DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table mydb.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`direccion` (
  iddireccion INT NOT NULL,
  calle_P VARCHAR(45) NOT NULL,
  calle_S VARCHAR(45) NOT NULL,
  num_casa VARCHAR(45) NOT NULL,
  referencia VARCHAR(45) NULL,
  ciudad VARCHAR(45) NOT NULL,
  barrio VARCHAR(45) NOT NULL,
  PRIMARY KEY (iddireccion))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`contactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`contactos` (
  idcontactos INT NOT NULL,
  telefono1 VARCHAR(45) NULL,
  correo1 VARCHAR(45) NULL,
  PRIMARY KEY (idcontactos))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`farmacia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`farmacia` (
  idfarmacia INT NOT NULL,
  nombreFarmacia VARCHAR(45) NOT NULL,
  direccion_iddireccion INT NOT NULL,
  contactos_idcontactos INT NOT NULL,
  PRIMARY KEY (idfarmacia, direccion_iddireccion, contactos_idcontactos),
  INDEX fk_farmacia_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_farmacia_contactos1_idx (contactos_idcontactos ASC),
  CONSTRAINT fk_farmacia_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_farmacia_contactos1
    FOREIGN KEY (contactos_idcontactos)
    REFERENCES farmacia.`contactos` (idcontactos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`medicamento` (
  idmedicamento INT NOT NULL AUTO_INCREMENT,
  nombre_Medica VARCHAR(45) NOT NULL,
  precio VARCHAR(45) NOT NULL,
  existencia_Tot INT NOT NULL,
  fecha_Elab DATE NOT NULL,
  fecha_Cadu DATE NOT NULL,
  lote VARCHAR(45) NOT NULL,
  PRIMARY KEY (idmedicamento))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`tiene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`tiene` (
  medicamento_idmedicamento INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  PRIMARY KEY (medicamento_idmedicamento, farmacia_idfarmacia),
  INDEX fk_medicamento_has_farmacia_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_medicamento_has_farmacia_medicamento1_idx (medicamento_idmedicamento ASC),
  CONSTRAINT fk_medicamento_has_farmacia_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_medicamento_has_farmacia_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`tipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`tipoUsuario` (
  idtipoUsuario INT NOT NULL,
  tipo_Usuario VARCHAR(45) NOT NULL,
  PRIMARY KEY (idtipoUsuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`usuario` (
  idusuario INT NOT NULL,
  contrasenia VARCHAR(45) NOT NULL,
  tipoUsuario_idtipoUsuario INT NOT NULL,
  PRIMARY KEY (idusuario, tipoUsuario_idtipoUsuario),
  INDEX fk_usuario_tipoUsuario1_idx (tipoUsuario_idtipoUsuario ASC),
  CONSTRAINT fk_usuario_tipoUsuario1
    FOREIGN KEY (tipoUsuario_idtipoUsuario)
    REFERENCES farmacia.`tipoUsuario` (idtipoUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`empleado` (
  idempleado INT NOT NULL AUTO_INCREMENT,
  nombre_E VARCHAR(45) NOT NULL,
  apellido_E VARCHAR(45) NOT NULL,
  identificacion_E VARCHAR(45) NOT NULL,
  direccion_iddireccion INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  usuario_idusuario INT NOT NULL,
  PRIMARY KEY (idempleado, direccion_iddireccion, farmacia_idfarmacia, usuario_idusuario),
  INDEX fk_empleado_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_empleado_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_empleado_usuario1_idx (usuario_idusuario ASC),
  CONSTRAINT fk_empleado_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empleado_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empleado_usuario1
    FOREIGN KEY (usuario_idusuario)
    REFERENCES farmacia.`usuario` (idusuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`cliente` (
  idcliente INT NOT NULL AUTO_INCREMENT,
  nombre_C VARCHAR(45) NOT NULL,
  apellido_C VARCHAR(45) NOT NULL,
  identificacion_C VARCHAR(45) NOT NULL,
  direccion_iddireccion INT NOT NULL,
  contactos_idcontactos INT NOT NULL,
  PRIMARY KEY (idcliente, direccion_iddireccion, contactos_idcontactos),
  INDEX fk_cliente_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_cliente_contactos1_idx (contactos_idcontactos ASC),
  CONSTRAINT fk_cliente_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cliente_contactos1
    FOREIGN KEY (contactos_idcontactos)
    REFERENCES farmacia.`contactos` (idcontactos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`detalle_Factura` (
  iddetalle_Factura INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  sub_Total FLOAT NOT NULL,
  total FLOAT NOT NULL,
  cantidad INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  medicamento_idmedicamento INT NOT NULL,
  cliente_idcliente INT NOT NULL,
  PRIMARY KEY (iddetalle_Factura, farmacia_idfarmacia, medicamento_idmedicamento, cliente_idcliente),
  INDEX fk_detalle_Factura_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_detalle_Factura_medicamento1_idx (medicamento_idmedicamento ASC),
  INDEX fk_detalle_Factura_cliente1_idx (cliente_idcliente ASC),
  CONSTRAINT fk_detalle_Factura_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_detalle_Factura_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_detalle_Factura_cliente1
    FOREIGN KEY (cliente_idcliente)
    REFERENCES farmacia.`cliente` (idcliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`monoDrogra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`monoDrogra` (
  idmono_Drogra INT NOT NULL,
  monoDrogra_Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idmono_Drogra))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.`compone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`compone` (
  medicamento_idmedicamento INT NOT NULL,
  monoDrogra_idmono_Drogra INT NOT NULL,
  porcentaje INT NOT NULL,
  PRIMARY KEY (medicamento_idmedicamento, monoDrogra_idmono_Drogra),
  INDEX fk_medicamento_has_monoDrogra_monoDrogra1_idx (monoDrogra_idmono_Drogra ASC),
  INDEX fk_medicamento_has_monoDrogra_medicamento1_idx (medicamento_idmedicamento ASC),
  CONSTRAINT fk_medicamento_has_monoDrogra_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_medicamento_has_monoDrogra_monoDrogra1
    FOREIGN KEY (monoDrogra_idmono_Drogra)
    REFERENCES farmacia.`monoDrogra` (idmono_Drogra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE farmacia ;

-- -----------------------------------------------------
-- Table newFarmacia.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`cliente` (
  idcliente INT NOT NULL,
  nombre_C VARCHAR(45) NOT NULL,
  apellido_C VARCHAR(45) NOT NULL,
  identificacion_C VARCHAR(45) NOT NULL,
  direccion_iddireccion INT NOT NULL,
  contactos_idcontactos INT NOT NULL,
  PRIMARY KEY (idcliente, direccion_iddireccion, contactos_idcontactos),
  INDEX fk_cliente_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_cliente_contactos1_idx (contactos_idcontactos ASC),
  CONSTRAINT fk_cliente_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cliente_contactos1
    FOREIGN KEY (contactos_idcontactos)
    REFERENCES farmacia.`contactos` (idcontactos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`compone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`compone` (
  medicamento_idmedicamento INT NOT NULL,
  monoDrogra_idmono_Drogra INT NOT NULL,
  porcentaje INT NOT NULL,
  PRIMARY KEY (medicamento_idmedicamento, monoDrogra_idmono_Drogra),
  INDEX fk_medicamento_has_monoDrogra_monoDrogra1_idx (monoDrogra_idmono_Drogra ASC),
  INDEX fk_medicamento_has_monoDrogra_medicamento1_idx (medicamento_idmedicamento ASC),
  CONSTRAINT fk_medicamento_has_monoDrogra_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_medicamento_has_monoDrogra_monoDrogra1
    FOREIGN KEY (monoDrogra_idmono_Drogra)
    REFERENCES farmacia.`monoDrogra` (idmono_Drogra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`contactos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`contactos` (
  idcontactos INT NOT NULL,
  telefono1 VARCHAR(45) NULL,
  correo1 VARCHAR(45) NULL,
  PRIMARY KEY (idcontactos))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`detalle_Factura` (
  iddetalle_Factura INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  sub_Total FLOAT NOT NULL,
  total FLOAT NOT NULL,
  cantidad INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  medicamento_idmedicamento INT NOT NULL,
  cliente_idcliente INT NOT NULL,
  PRIMARY KEY (iddetalle_Factura, farmacia_idfarmacia, medicamento_idmedicamento, cliente_idcliente),
  INDEX fk_detalle_Factura_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_detalle_Factura_medicamento1_idx (medicamento_idmedicamento ASC),
  INDEX fk_detalle_Factura_cliente1_idx (cliente_idcliente ASC),
  CONSTRAINT fk_detalle_Factura_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_detalle_Factura_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_detalle_Factura_cliente1
    FOREIGN KEY (cliente_idcliente)
    REFERENCES farmacia.`cliente` (idcliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`direccion` (
  iddireccion INT NOT NULL,
  calle_P VARCHAR(45) NOT NULL,
  calle_S VARCHAR(45) NOT NULL,
  num_casa VARCHAR(45) NOT NULL,
  referencia VARCHAR(45) NULL,
  ciudad VARCHAR(45) NOT NULL,
  barrio VARCHAR(45) NOT NULL,
  PRIMARY KEY (iddireccion))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`empleado` (
  idempleado INT NOT NULL,
  nombre_E VARCHAR(45) NOT NULL,
  apellido_E VARCHAR(45) NOT NULL,
  identificacion_E VARCHAR(45) NOT NULL,
  direccion_iddireccion INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  usuario_idusuario INT NOT NULL,
  PRIMARY KEY (idempleado, direccion_iddireccion, farmacia_idfarmacia, usuario_idusuario),
  INDEX fk_empleado_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_empleado_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_empleado_usuario1_idx (usuario_idusuario ASC),
  CONSTRAINT fk_empleado_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empleado_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empleado_usuario1
    FOREIGN KEY (usuario_idusuario)
    REFERENCES farmacia.`usuario` (idusuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`farmacia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`farmacia` (
  idfarmacia INT NOT NULL,
  nombreFarmacia VARCHAR(45) NOT NULL,
  farmaciacol VARCHAR(45) NULL,
  direccion_iddireccion INT NOT NULL,
  contactos_idcontactos INT NOT NULL,
  PRIMARY KEY (idfarmacia, direccion_iddireccion, contactos_idcontactos),
  INDEX fk_farmacia_direccion1_idx (direccion_iddireccion ASC),
  INDEX fk_farmacia_contactos1_idx (contactos_idcontactos ASC),
  CONSTRAINT fk_farmacia_direccion1
    FOREIGN KEY (direccion_iddireccion)
    REFERENCES farmacia.`direccion` (iddireccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_farmacia_contactos1
    FOREIGN KEY (contactos_idcontactos)
    REFERENCES farmacia.`contactos` (idcontactos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`medicamento` (
  idmedicamento INT NOT NULL AUTO_INCREMENT,
  nombre_Medica VARCHAR(45) NOT NULL,
  precio VARCHAR(45) NOT NULL,
  existencia_Tot INT NOT NULL,
  fecha_Elab DATE NOT NULL,
  fecha_Cadu DATE NOT NULL,
  lote VARCHAR(45) NOT NULL,
  PRIMARY KEY (idmedicamento))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`monoDrogra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`monoDrogra` (
  idmono_Drogra INT NOT NULL,
  monoDrogra_Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idmono_Drogra))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`tiene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`tiene` (
  medicamento_idmedicamento INT NOT NULL,
  farmacia_idfarmacia INT NOT NULL,
  PRIMARY KEY (medicamento_idmedicamento, farmacia_idfarmacia),
  INDEX fk_medicamento_has_farmacia_farmacia1_idx (farmacia_idfarmacia ASC),
  INDEX fk_medicamento_has_farmacia_medicamento1_idx (medicamento_idmedicamento ASC),
  CONSTRAINT fk_medicamento_has_farmacia_medicamento1
    FOREIGN KEY (medicamento_idmedicamento)
    REFERENCES farmacia.`medicamento` (idmedicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_medicamento_has_farmacia_farmacia1
    FOREIGN KEY (farmacia_idfarmacia)
    REFERENCES farmacia.`farmacia` (idfarmacia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`tipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`tipoUsuario` (
  idtipoUsuario INT NOT NULL,
  tipo_Usuario VARCHAR(45) NOT NULL,
  PRIMARY KEY (idtipoUsuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table newFarmacia.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS farmacia.`usuario` (
  idusuario INT NOT NULL,
  contrasenia VARCHAR(45) NOT NULL,
  tipoUsuario_idtipoUsuario INT NOT NULL,
  PRIMARY KEY (idusuario, tipoUsuario_idtipoUsuario),
  INDEX fk_usuario_tipoUsuario1_idx (tipoUsuario_idtipoUsuario ASC),
  CONSTRAINT fk_usuario_tipoUsuario1
    FOREIGN KEY (tipoUsuario_idtipoUsuario)
    REFERENCES farmacia.`tipoUsuario` (idtipoUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


