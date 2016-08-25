-- ----------------------------------------------------
-- Schema serasa
-- -----------------------------------------------------
CREATE SCHEMA `serasa`;

USE `serasa` ;

-- -----------------------------------------------------
-- Table estados
-- -----------------------------------------------------
CREATE TABLE `estados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table cidades
-- -----------------------------------------------------
CREATE TABLE `cidades` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `estados_id` INT NOT NULL ,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cidades_estados1`
    FOREIGN KEY (`estados_id`)
    REFERENCES `estados` (`id`)
);


-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE `clientes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `cpf` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `cidades_id` INT NOT NULL ,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_clientes_cidades1`
    FOREIGN KEY (`cidades_id`)
    REFERENCES `cidades` (`id`)
 );


-- -----------------------------------------------------
-- Table `estabelecimentos`
-- -----------------------------------------------------
CREATE TABLE `estabelecimentos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `cidades_id` INT NOT NULL ,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_estabelecimentos_cidades1`
    FOREIGN KEY (`cidades_id`)
    REFERENCES `cidades` (`id`)
 );


-- -----------------------------------------------------
-- Table `dividas`
-- -----------------------------------------------------
CREATE TABLE `dividas` (
  `clientes_id` INT NOT NULL ,
  `estabelecimentos_id` INT NOT NULL ,
  `valor` DECIMAL(10,2) NOT NULL ,

  PRIMARY KEY (`clientes_id`, `estabelecimentos_id`)  ,
  CONSTRAINT `fk_clientes_has_estabelecimentos_clientes`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_clientes_has_estabelecimentos_estabelecimentos1`
    FOREIGN KEY (`estabelecimentos_id`)
    REFERENCES `estabelecimentos` (`id`)
);