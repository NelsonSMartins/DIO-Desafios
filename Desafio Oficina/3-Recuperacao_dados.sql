-- Queries (com perguntas)

-- Quais clientes e seus veículos?
SELECT c.nome, v.placa, v.modelo
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.Cliente_idCliente;

-- Quais ordens de serviço estão abertas?
SELECT * FROM Ordem_de_Servico
WHERE status = 'Aberto';

-- Qual o valor total de serviços por OS?
SELECT os.id_os, SUM(os_s.valor_servico) AS total_servicos
FROM OS_Servico os_s
JOIN Ordem_de_Servico os ON os.id_os = os_s.Ordem_de_Servico_id_os
GROUP BY os.id_os;

-- Quais peças foram usadas em cada OS?
SELECT os.id_os, p.nome, op.quantidade
FROM OS_Peca op
JOIN Peca p ON p.idPeca = op.Peca_idPeca
JOIN Ordem_de_Servico os ON os.id_os = op.OS_id_os;

-- Quantos mecânicos por equipe?
SELECT Equipe_idEquipe, COUNT(Mecanico_idMecanico) AS total_mecanicos
FROM Equipe_has_Mecanico
GROUP BY Equipe_idEquipe;

-- Qual cliente gastou mais?
SELECT c.nome, SUM(os.valor_total) AS total_gasto
FROM Cliente c
JOIN Ordem_de_Servico os ON c.idCliente = os.Veiculo_Cliente_idCliente
GROUP BY c.nome
ORDER BY total_gasto DESC;