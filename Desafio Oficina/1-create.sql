CREATE DATABASE oficina;
USE oficina;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf VARCHAR(45),
endereco VARCHAR(45)
);

CREATE TABLE Veiculo (
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
placa VARCHAR(45),
modelo VARCHAR(45),
Cliente_idCliente INT,
FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Mecanico (
idMecanico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
endereco VARCHAR(45),
especialidade VARCHAR(45)
);

CREATE TABLE Equipe (
idEquipe INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Equipe_has_Mecanico (
Equipe_idEquipe INT,
Mecanico_idMecanico INT,
PRIMARY KEY (Equipe_idEquipe, Mecanico_idMecanico),
FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe),
FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE Ordem_de_Servico (
id_os INT PRIMARY KEY AUTO_INCREMENT,
data_emissao VARCHAR(45),
data_conclusao VARCHAR(45),
valor_total VARCHAR(45),
status VARCHAR(45),
Veiculo_idVeiculo INT,
Veiculo_Cliente_idCliente INT,
FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
FOREIGN KEY (Veiculo_Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Servico (
idServico INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45),
valor_mao_obra VARCHAR(45)
);

CREATE TABLE OS_Servico (
Ordem_de_Servico_id_os INT,
Servico_idServico INT,
valor_servico VARCHAR(45),
PRIMARY KEY (Ordem_de_Servico_id_os, Servico_idServico),
FOREIGN KEY (Ordem_de_Servico_id_os) REFERENCES Ordem_de_Servico(id_os),
FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico)
);

CREATE TABLE Peca (
idPeca INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
valor VARCHAR(45)
);

CREATE TABLE OS_Peca (
Peca_idPeca INT,
OS_id_os INT,
quantidade VARCHAR(45),
autorizado TINYINT,
PRIMARY KEY (Peca_idPeca, OS_id_os),
FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
FOREIGN KEY (OS_id_os) REFERENCES Ordem_de_Servico(id_os)
);