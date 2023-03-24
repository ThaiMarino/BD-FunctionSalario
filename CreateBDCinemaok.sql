-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8 ;
USE `cinema` ;

-- -----------------------------------------------------
-- Table `cinema`.`ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`ator` (
  `idAtor` INT(11) NOT NULL,
  `nome` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idAtor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`elenco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`elenco` (
  `ator_idAtor` INT(11) NOT NULL,
  `filme_idFilme` INT(11) NOT NULL,
  `personagemNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ator_idAtor`, `filme_idFilme`),
  INDEX `fk_ator_has_filme_filme1_idx` (`filme_idFilme` ASC),
  INDEX `fk_ator_has_filme_ator1_idx` (`ator_idAtor` ASC),
  CONSTRAINT `fk_ator_has_filme_ator1`
    FOREIGN KEY (`ator_idAtor`)
    REFERENCES `cinema`.`ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ator_has_filme_filme1`
    FOREIGN KEY (`filme_idFilme`)
    REFERENCES `cinema`.`filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`genero` (
  `idgenero` INT(11) NOT NULL,
  `descricao` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`filme` (
  `idFilme` INT(11) NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `duracao` TIME NOT NULL,
  `genero_idgenero` INT(11) NOT NULL,
  PRIMARY KEY (`idFilme`),
  INDEX `fk_filme_genero_idx` (`genero_idgenero` ASC),
  CONSTRAINT `fk_filme_genero`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `cinema`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`sala` (
  `idsala` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `qtdeAssento` INT(11) NOT NULL,
  PRIMARY KEY (`idsala`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`elenco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`elenco` (
  `ator_idAtor` INT(11) NOT NULL,
  `filme_idFilme` INT(11) NOT NULL,
  `personagemNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ator_idAtor`, `filme_idFilme`),
  INDEX `fk_ator_has_filme_filme1_idx` (`filme_idFilme` ASC),
  INDEX `fk_ator_has_filme_ator1_idx` (`ator_idAtor` ASC),
  CONSTRAINT `fk_ator_has_filme_ator1`
    FOREIGN KEY (`ator_idAtor`)
    REFERENCES `cinema`.`ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ator_has_filme_filme1`
    FOREIGN KEY (`filme_idFilme`)
    REFERENCES `cinema`.`filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cinema`.`sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`sessao` (
  `sala_idsala` INT(11) NOT NULL,
  `filme_idFilme` INT(11) NOT NULL,
  `dataHora` DATETIME NOT NULL,
  `qtdeVenda` INT NOT NULL,
  PRIMARY KEY (`sala_idsala`, `filme_idFilme`),
  INDEX `fk_sala_has_filme_filme1_idx` (`filme_idFilme` ASC),
  INDEX `fk_sala_has_filme_sala1_idx` (`sala_idsala` ASC),
  CONSTRAINT `fk_sala_has_filme_sala1`
    FOREIGN KEY (`sala_idsala`)
    REFERENCES `cinema`.`sala` (`idsala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sala_has_filme_filme1`
    FOREIGN KEY (`filme_idFilme`)
    REFERENCES `cinema`.`filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
