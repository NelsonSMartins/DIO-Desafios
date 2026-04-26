USE ecommerce;

-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.idClient,
    CONCAT(c.Fname, ' ', c.Lname) AS Cliente,
    COUNT(o.idOrder) AS Quantidade_Pedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, Cliente
ORDER BY Quantidade_Pedidos DESC;

-- 2. Clientes que fizeram mais de 1 pedido
SELECT 
    CONCAT(c.Fname, ' ', c.Lname) AS Cliente,
    COUNT(o.idOrder) AS Total
FROM clients c
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY Cliente
HAVING COUNT(o.idOrder) > 1;

-- 3. Produtos cadastrados ordenados por nota
SELECT 
    idProduct,
    Pname,
    category,
    assessment
FROM product
ORDER BY assessment DESC, Pname;

-- 4. Produtos infantis
SELECT 
    idProduct,
    Pname,
    category
FROM product
WHERE classification_kids = TRUE;

-- 5. Valor do frete com acréscimo de 10% (atributo derivado)
SELECT 
    idOrder,
    sendValue AS Frete_Atual,
    ROUND(sendValue * 1.10,2) AS Frete_Reajustado
FROM orders;

-- 6. Produtos e seus fornecedores
SELECT 
    p.Pname AS Produto,
    s.socialName AS Fornecedor,
    ps.quantity AS Quantidade_Fornecida
FROM productSupplier ps
INNER JOIN product p ON ps.idPsProduct = p.idProduct
INNER JOIN supplier s ON ps.idPsSupplier = s.idSupplier
ORDER BY Produto;

-- 7. Relação de produtos e estoque disponível
SELECT 
    p.Pname AS Produto,
    st.storageLocation AS Cidade_Estoque,
    st.quantity AS Quantidade
FROM storageLocation sl
INNER JOIN product p ON sl.idLproduct = p.idProduct
INNER JOIN productStorage st ON sl.idLstorage = st.idProdStorage
ORDER BY Quantidade DESC;

-- 8. Vendedores que também são fornecedores (mesmo CNPJ)
SELECT 
    se.socialName AS Vendedor,
    su.socialName AS Fornecedor,
    se.CNPJ
FROM seller se
INNER JOIN supplier su ON se.CNPJ = su.CNPJ;

-- 9. Pedidos com nome do cliente e status
SELECT 
    o.idOrder,
    CONCAT(c.Fname, ' ', c.Lname) AS Cliente,
    o.orderStatus,
    o.orderDescription
FROM orders o
INNER JOIN clients c ON o.idOrderClient = c.idClient
ORDER BY o.idOrder;

-- 10. Produtos mais vendidos
SELECT 
    p.Pname AS Produto,
    SUM(po.poQuantity) AS Total_Vendido
FROM productOrder po
INNER JOIN product p ON po.idPOproduct = p.idProduct
GROUP BY p.Pname
HAVING SUM(po.poQuantity) >= 1
ORDER BY Total_Vendido DESC;