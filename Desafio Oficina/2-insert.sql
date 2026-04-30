-- INSERT INTO

INSERT INTO Cliente (nome, cpf, endereco) VALUES
('João', '111', 'Rua A'),
('Maria', '222', 'Rua B');

INSERT INTO Veiculo (placa, modelo, Cliente_idCliente) VALUES
('ABC1234', 'Gol', 1),
('XYZ9999', 'Civic', 2);

INSERT INTO Mecanico (nome, endereco, especialidade) VALUES
('Carlos', 'Rua C', 'Motor'),
('Ana', 'Rua D', 'Freio');

INSERT INTO Equipe () VALUES (), ();

INSERT INTO Equipe_has_Mecanico VALUES
(1,1),(1,2),(2,2);

INSERT INTO Ordem_de_Servico (data_emissao, data_conclusao, valor_total, status, Veiculo_idVeiculo, Veiculo_Cliente_idCliente) VALUES
('2026-04-01','2026-04-02','500','Concluído',1,1),
('2026-04-03',NULL,'300','Aberto',2,2);

INSERT INTO Servico (descricao, valor_mao_obra) VALUES
('Troca de óleo','100'),
('Alinhamento','150');

INSERT INTO OS_Servico VALUES
(1,1,'100'),
(1,2,'150');

INSERT INTO Peca (nome, valor) VALUES
('Filtro','50'),
('Óleo','80');

INSERT INTO OS_Peca VALUES
(1,1,'1',1),
(2,1,'2',1);