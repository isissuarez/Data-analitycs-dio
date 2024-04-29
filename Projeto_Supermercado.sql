-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-169819-db.mysql-169819:10081
-- Tempo de geração: 19-Abr-2024 às 20:38
-- Versão do servidor: 8.0.26
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Projeto_Supermercado`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `Id` int NOT NULL,
  `Nome` varchar(200) NOT NULL COMMENT 'Nome COMPLETO do cliente',
  `CPF` varchar(17) NOT NULL COMMENT 'cpf DO CLIENTE (SOMENTE NÚMEROS)',
  `Email` varchar(100) NOT NULL COMMENT 'Email do cliente',
  `Rua` varchar(100) NOT NULL COMMENT 'Rua do cliente',
  `Bairro` varchar(50) NOT NULL COMMENT 'Bairro do cliente',
  `Cidade` varchar(50) NOT NULL COMMENT 'cidade do cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Compra`
--

CREATE TABLE `Compra` (
  `Id_compra` int NOT NULL,
  `ClienteId` int DEFAULT NULL,
  `LojaId` int DEFAULT NULL,
  `ProdutoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Loja`
--

CREATE TABLE `Loja` (
  `Id` int NOT NULL,
  `Rua` varchar(100) NOT NULL COMMENT 'Rua da loja',
  `Bairro` varchar(50) NOT NULL COMMENT 'Bairro da loja',
  `Cidade` varchar(50) NOT NULL COMMENT 'cidade da loja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Produtos`
--

CREATE TABLE `Produtos` (
  `Id` int NOT NULL,
  `Nome` varchar(50) DEFAULT NULL COMMENT 'Nome do produto',
  `Embalagem` varchar(50) DEFAULT NULL COMMENT 'emabalgem do produto , pode ser em gramas ou unidades',
  `preço` decimal(10,0) DEFAULT NULL COMMENT 'Valor do produto em reais'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Produtos_compra`
--

CREATE TABLE `Produtos_compra` (
  `Id` int NOT NULL,
  `CompraId` int DEFAULT NULL,
  `ProdutoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Índices para tabela `Compra`
--
ALTER TABLE `Compra`
  ADD PRIMARY KEY (`Id_compra`),
  ADD KEY `ClienteId` (`ClienteId`),
  ADD KEY `LojaId` (`LojaId`),
  ADD KEY `ProdutoId` (`ProdutoId`);

--
-- Índices para tabela `Loja`
--
ALTER TABLE `Loja`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `Produtos`
--
ALTER TABLE `Produtos`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `Produtos_compra`
--
ALTER TABLE `Produtos_compra`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CompraId` (`CompraId`),
  ADD KEY `ProdutoId` (`ProdutoId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Compra`
--
ALTER TABLE `Compra`
  MODIFY `Id_compra` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Loja`
--
ALTER TABLE `Loja`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Produtos`
--
ALTER TABLE `Produtos`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Produtos_compra`
--
ALTER TABLE `Produtos_compra`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Compra`
--
ALTER TABLE `Compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`ClienteId`) REFERENCES `Clientes` (`Id`),
  ADD CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`LojaId`) REFERENCES `Loja` (`Id`),
  ADD CONSTRAINT `Compra_ibfk_3` FOREIGN KEY (`ProdutoId`) REFERENCES `Produtos` (`Id`);

--
-- Limitadores para a tabela `Produtos_compra`
--
ALTER TABLE `Produtos_compra`
  ADD CONSTRAINT `Produtos_compra_ibfk_1` FOREIGN KEY (`CompraId`) REFERENCES `Compra` (`Id_compra`),
  ADD CONSTRAINT `Produtos_compra_ibfk_2` FOREIGN KEY (`ProdutoId`) REFERENCES `Produtos` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
