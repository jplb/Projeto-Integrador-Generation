-- MySQL Script generated by MySQL Workbench
-- Mon Apr 26 12:11:00 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_integrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_integrador` DEFAULT CHARACTER SET utf8 ;
USE `db_integrador` ;

-- -----------------------------------------------------
-- Table `db_integrador`.`tb_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_integrador`.`tb_usuario` ;

CREATE TABLE IF NOT EXISTS `db_integrador`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome completo` VARCHAR(80) NOT NULL,
  `e-mail` VARCHAR(80) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(150) NOT NULL,
  `telefone_fixo` VARCHAR(45) NULL,
  `telefone_celular` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `avaliacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_integrador`.`tb_categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_integrador`.`tb_categoria` ;

CREATE TABLE IF NOT EXISTS `db_integrador`.`tb_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `filtragem` TINYINT NOT NULL,
  `materia_prima` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_integrador`.`tb_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_integrador`.`tb_produto` ;

CREATE TABLE IF NOT EXISTS `db_integrador`.`tb_produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `volume` FLOAT NOT NULL,
  `origem` VARCHAR(80) NOT NULL,
  `preco` FLOAT NOT NULL,
  `armazenamento` VARCHAR(45) NOT NULL,
  `fk_usuario` INT NOT NULL,
  `fk_categoria` INT NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `foto` BLOB(25) NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_tb_produto_tb_usuario_idx` (`fk_usuario` ASC) VISIBLE,
  INDEX `fk_tb_produto_tb_categoria1_idx` (`fk_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produto_tb_usuario`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `db_integrador`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produto_tb_categoria1`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `db_integrador`.`tb_categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
