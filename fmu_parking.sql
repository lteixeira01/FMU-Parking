-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/05/2024 às 02:08
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fmu_parking`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--
create database fmu_parking;

CREATE TABLE `cliente` (
  `cli_id` varchar(14) NOT NULL,
  `cli_telefone` varchar(14) DEFAULT NULL,
  `cli_nome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cli_id`, `cli_telefone`, `cli_nome`) VALUES
('12345678901234', '1234567890', 'Fulano de Tal'),
('56789012345678', '9876543210', 'Ciclano da Silva'),
('57615345689', '11940108978', 'buzeira'),
('7654764564', '543534435', 'hugo'),
('999999999', '88888888', 'teste');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estacionamento`
--

CREATE TABLE `estacionamento` (
  `est_total_ocupadas` smallint(6) DEFAULT NULL,
  `est_total_vagas` smallint(6) DEFAULT NULL,
  `est_total_disponiveis` smallint(6) DEFAULT NULL,
  `login` varchar(40) NOT NULL CHECK (char_length(`login`) <= 40),
  `senha` varchar(16) NOT NULL CHECK (char_length(`senha`) <= 16),
  `vei_placa` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estacionamento`
--

INSERT INTO `estacionamento` (`est_total_ocupadas`, `est_total_vagas`, `est_total_disponiveis`, `login`, `senha`, `vei_placa`) VALUES
(0, 20, 20, 'admin', 'admin', 'ABC1234');

-- --------------------------------------------------------

--
-- Estrutura para tabela `registro`
--

CREATE TABLE `registro` (
  `reg_id` int(11) NOT NULL,
  `cli_id` varchar(14) NOT NULL,
  `reg_data_entrada` timestamp NOT NULL DEFAULT current_timestamp(),
  `reg_data_saida` timestamp NOT NULL DEFAULT '1970-01-01 06:00:00',
  `vei_placa` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `registro`
--

INSERT INTO `registro` (`reg_id`, `cli_id`, `reg_data_entrada`, `reg_data_saida`, `vei_placa`) VALUES
(1, '12345678901234', '2024-04-26 01:51:53', '1970-01-01 06:00:00', 'ABC1234'),
(2, '56789012345678', '2024-04-26 01:51:53', '1970-01-01 06:00:00', 'DEF5678'),
(3, '999999999', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'www4321');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacao`
--

CREATE TABLE `transacao` (
  `trans_data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cli_id` varchar(14) DEFAULT NULL,
  `trans_id` int(11) NOT NULL,
  `trans_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `transacao`
--

INSERT INTO `transacao` (`trans_data`, `cli_id`, `trans_id`, `trans_valor`) VALUES
('2024-04-25 16:00:00', '12345678901234', 1, 50),
('2024-04-25 17:30:00', '56789012345678', 2, 60);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `vei_placa` varchar(7) NOT NULL,
  `vei_modelo` varchar(40) DEFAULT NULL,
  `vei_cor` varchar(40) DEFAULT NULL,
  `cli_id` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`vei_placa`, `vei_modelo`, `vei_cor`, `cli_id`) VALUES
('ABC1234', 'Toyota Corolla', 'Prata', '12345678901234'),
('DEF5678', 'Honda Civic', 'Preto', '56789012345678'),
('www4321', 'rosa', 'corsa', '999999999');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_id`),
  ADD UNIQUE KEY `cli_id` (`cli_id`,`cli_telefone`);

--
-- Índices de tabela `estacionamento`
--
ALTER TABLE `estacionamento`
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `vei_placa` (`vei_placa`);

--
-- Índices de tabela `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `vei_placa` (`vei_placa`,`cli_id`),
  ADD KEY `cli_id` (`cli_id`);

--
-- Índices de tabela `transacao`
--
ALTER TABLE `transacao`
  ADD PRIMARY KEY (`trans_id`),
  ADD UNIQUE KEY `cli_id` (`cli_id`,`trans_id`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`vei_placa`),
  ADD KEY `cli_id` (`cli_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `registro`
--
ALTER TABLE `registro`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `transacao`
--
ALTER TABLE `transacao`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estacionamento`
--
ALTER TABLE `estacionamento`
  ADD CONSTRAINT `estacionamento_ibfk_1` FOREIGN KEY (`vei_placa`) REFERENCES `veiculo` (`vei_placa`);

--
-- Restrições para tabelas `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `cliente` (`cli_id`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`vei_placa`) REFERENCES `veiculo` (`vei_placa`);

--
-- Restrições para tabelas `transacao`
--
ALTER TABLE `transacao`
  ADD CONSTRAINT `transacao_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `cliente` (`cli_id`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `cliente` (`cli_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create view ClienteView
AS
SELECT cli_id, cli_nome from cliente;

SELECT * FROM `clienteview`

CREATE VIEW view_cliente_veiculo 
AS SELECT c.cli_id, c.cli_nome, c.cli_telefone, v.vei_placa, v.vei_modelo, v.vei_cor
FROM cliente c INNER JOIN veiculo v ON c.cli_id = v.cli_id;

CREATE VIEW view_registro_estacionamento AS
 SELECT r.reg_id, c.cli_id, c.cli_nome, v.vei_placa, v.vei_modelo, v.vei_cor, e.est_total_ocupadas,
 e.est_total_vagas, e.est_total_disponiveis, r.reg_data_entrada, r.reg_data_saida FROM registro r
 INNER JOIN cliente c ON r.cli_id = c.cli_id INNER JOIN veiculo v ON r.vei_placa = v.vei_placa 
INNER JOIN estacionamento e ON v.vei_placa = e.vei_placa;