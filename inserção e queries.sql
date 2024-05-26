-- INSERÇÃO DE DADOS E CONSULTAS 

USE Ecommerce;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'Ecommerce'; 


-- ------------------------------------------------- INSERÇÃO - TABELAS PRINCIPAIS -----------------------------------------------------------------
-- clientes
INSERT INTO Cliente (Pnome, Mnome, Unome, CPF, Rua, Cidade, UF, Data_nascimento)
VALUES
  ('João', 'S', 'Pereira', '12345678900', 'Rua dos Ipês, 123', 'Fortaleza', 'CE', '1980-01-01'),
  ('Maria', 'S', 'Santos', '98765432110', 'Avenida Paulista, 500', 'São Paulo', 'SP', '1990-07-15'),
  ('Carlos', 'R', 'Oliveira', '00011122230', 'Rua das Flores, 789', 'Rio de Janeiro', 'RJ', '2000-12-31'),
  ('Ana', 'M', 'Dias', '33322211140', 'Beco do Sossego, 10', 'Salvador', 'BA', '1975-05-20'),
  ('Pedro', 'P', 'da Costa', '55544433350', 'Estrada do Campo, 2000', 'Belo Horizonte', 'MG', '1985-03-14');


-- Produto
INSERT INTO Produto (Produto_nome, Valor, Descrição, Categoria, Indicado_criança) 
VALUES
    ('Maçã', 1.50, 'Maçã vermelha fresca', 'Alimento', TRUE),
    ('Camiseta', 20.00, 'Camiseta 100% algodão', 'Vestuário', FALSE),
    ('Laptop', 1500.00, 'Laptop com 8GB de RAM e 256GB SSD', 'Eletrônico', FALSE),
    ('Caneta', 2.00, 'Caneta esferográfica azul', 'Escritório', FALSE),
    ('Sofá', 800.00, 'Sofá de 3 lugares, cor cinza', 'Casa', FALSE),
    ('Quebra-cabeça', 25.00, 'Quebra-cabeça de 1000 peças', 'Outros', TRUE);
    

-- Pedido
INSERT INTO Pedido (Pedido_IdCliente, Valor_unidade, Quantidade, IdPagamento, Descrição, Data_criação, Pedido_Status, Frete) 
VALUES
    (1, 1.50, 10, 1001, 'Compra de maçãs', '2024-05-01', 'Em processamento', 5.00),
    (2, 20.00, 3, 1002, 'Compra de camisetas', '2024-05-02', 'Processado', 10.00),
    (3, 1500.00, 1, 1003, 'Compra de laptop', '2024-05-03', 'Enviado', 20.00),
    (4, 2.00, 50, 1004, 'Compra de canetas', '2024-05-04', 'Entregue', 7.00),
    (5, 800.00, 1, 1005, 'Compra de sofá', '2024-05-05', 'Cancelado', 15.00),
    (1, 25.00, 2, 1006, 'Compra de quebra-cabeça', '2024-05-06', 'Processado', 8.00);
    
  
  -- Fornecedor
INSERT INTO Fornecedor (Razão_Social, CNPJ, Contato) 
VALUES
    ('Alimentos S.A.', '12345678000195', '11234567890'),
    ('Vestuário Ltda.', '98765432000196', '21987654321'),
    ('Tecnologia e Cia.', '11122233000197', '31322344556'),
    ('Papéis e Canetas Ltda.', '55544433000198', '41988776655'),
    ('Móveis Confortáveis S.A.', '66655544000199', '51987654322'),
    ('Brinquedos e Jogos Ltda.', '77766655000200', '62999887766');
    
 
 -- Estoque
INSERT INTO Estoque (Estoque_Local, Estoque_Quantidade) 
VALUES
    ('Armazém Central', 150),
    ('Filial Norte', 100),
    ('Filial Sul', 200),
    ('Centro de Distribuição Leste', 300),
    ('Centro de Distribuição Oeste', 250),
    ('Armazém Secundário', 180);
    
    
 -- Terceiro
INSERT INTO Terceiro (Razão_Social, CNPJ, CPF, Rua, Cidade, UF, Contato) 
VALUES
    ('Construtora ABC', '12345678000195', NULL, 'Rua das Palmeiras, 100', 'São Paulo', 'SP', '11987654321'),
    ('Transportadora XYZ', '98765432000196', NULL, 'Avenida dos Bandeirantes, 200', 'Rio de Janeiro', 'RJ', '21987654322'),
    ('Fernanda', NULL, '12345678901', 'Rua da Paz, 300', 'Belo Horizonte', 'MG', '31987654323'),
    ('Escola de Idiomas', NULL, '98765432102', 'Rua das Flores, 400', 'Curitiba', 'PR', '41987654324'),
    ('João', '11122233000197', NULL, 'Avenida Brasil, 500', 'Porto Alegre', 'RS', '51987654325'),
    ('Serviços Gerais Ltda.', NULL, '33322211104', 'Rua das Árvores, 600', 'Salvador', 'BA', '71987654326');
    
    
 -- ----------------------------------------------- INSERÇÃO - TABELAS DE RELAÇÕES--------------------------------------------------------------------   
 
INSERT INTO Relação_Produto_Terceiro (IdTerceiro, IdProduto, Quantidade) 
VALUES
    (1, 1, 50),  -- Construtora ABC fornece 50 unidades de Maçã
    (2, 2, 30),  -- Transportadora XYZ fornece 30 unidades de Camiseta
    (3, 3, 10),  -- Fernanda fornece 10 unidades de Laptop
    (4, 4, 100), -- Escola de Idiomas fornece 100 unidades de Caneta
    (5, 5, 5),   -- Loja de Materiais fornece 5 unidades de Sofá
    (6, 6, 20);  -- João fornece 20 unidades de Quebra-cabeça


INSERT INTO Relação_Produto_Fornecedor (IdFornecedor, IdProduto, Quantidade) 
VALUES
    (1, 1, 100),  -- Alimentos S.A. fornece 100 unidades de Maçã
    (2, 2, 50),   -- Vestuário Ltda. fornece 50 unidades de Camiseta
    (3, 3, 20),   -- Tecnologia e Cia. fornece 20 unidades de Laptop
    (4, 4, 200),  -- Papéis e Canetas Ltda. fornece 200 unidades de Caneta
    (5, 5, 10),   -- Móveis Confortáveis S.A. fornece 10 unidades de Sofá
    (6, 6, 75);   -- Brinquedos e Jogos Ltda. fornece 75 unidades de Quebra-cabeça
    

INSERT INTO Relação_Estoque_Produto (IdEstoque, IdProduto, Estoque_Local, Quantidade) 
VALUES
    (1, 1, 'SP', 100),  -- São Paulo tem 100 unidades de Maçã
    (2, 2, 'RJ', 50),   -- Rio de Janeiro tem 50 unidades de Camiseta
    (3, 3, 'RS', 10),   -- Rio Grande do Sul tem 10 unidades de Laptop
    (4, 4, 'MG', 200),  -- Minas Gerais tem 200 unidades de Caneta
    (5, 5, 'BA', 5),    -- Bahia tem 5 unidades de Sofá
    (6, 6, 'PR', 75);   -- Paraná tem 75 unidades de Quebra-cabeça
  
  
INSERT INTO Relação_Pedido_Produto (IdPedido, IdProduto, Quantidade, Pedido_Produto_Status) VALUES
    (1, 1, 5, 'Disponível'),   -- Pedido 1 inclui 5 unidades de Maçã disponíveis
    (2, 2, 2, 'Indisponível'), -- Pedido 2 inclui 2 unidades de Camiseta indisponíveis
    (3, 3, 1, 'Disponível'),   -- Pedido 3 inclui 1 unidade de Laptop disponível
    (4, 4, 10, 'Disponível'),  -- Pedido 4 inclui 10 unidades de Caneta disponíveis
    (5, 5, 3, 'Indisponível'), -- Pedido 5 inclui 3 unidades de Sofá indisponíveis
    (6, 6, 4, 'Disponível');   -- Pedido 6 inclui 4 unidades de Quebra-cabeça disponíveis
    
    
-- ------------------------------------------------ CONSULTAS -----------------------------------------------------

-- Consultar pedidos por cliente e sua data de criação
select * from pedido;
SELECT IdPedido, IdCliente, Data_Criação, CONCAT(Pnome,' ',MNome,' ',Unome) as Nome_Cliente 
FROM Cliente C, Pedido P
WHERE C.IdCliente=Pedido_IdCliente;


-- Junta as tabelas Cliente e Pedido onde IdCliente é igual ao IdCliente do Pedido
SELECT * FROM Cliente
LEFT JOIN Pedido ON IdCliente=Pedido_IdCliente;


-- Consultar e verificar a contagem dos status dos pedidos
SELECT Pedido_Status, COUNT(*) as Status_Count
FROM Pedido
WHERE Pedido_Status
GROUP BY Pedido_Status;


-- Consultar o status de cada pedido e o nome do cliente
SELECT DISTINCT P.IdPedido, P.Pedido_IdCliente AS IdCliente, CONCAT(C.PNome, ' ', C.MNome, ' ', C.UNome) AS Nome_do_Emissor, P.Pedido_Status
FROM Pedido P
INNER JOIN Cliente C ON P.Pedido_IdCliente = C.IdCliente;


-- Retorna o status do pedido de acordo com a sua data de criação. Um pedido maior que 22 dias que não foi atendido é expirado.
SELECT IdPedido, CONCAT(C.PNome, ' ', C.MNome, ' ', C.UNome) AS Nome_do_Emissor, Data_Criação,
       DATEDIFF(CURDATE(), Data_Criação) AS Dias_Desde_Criação,
       CASE 
           WHEN DATEDIFF(CURDATE(), Data_Criação) > 22 THEN 'Expirado'
           ELSE 'Aguardando Processamento'
       END AS Status
FROM Pedido, Cliente C
WHERE IdCliente=Pedido_IdCliente
ORDER BY CONCAT(C.PNome, ' ', C.MNome, ' ', C.UNome);


-- Retorna quantos pedidos foram Expirados 
SELECT 
    C.IdCliente, 
    CONCAT(C.PNome, ' ', C.MNome, ' ', C.UNome) AS Nome_do_Cliente,
    P.IdPedido,
    P.Data_criação,
    DATEDIFF(CURDATE(), P.Data_criação) AS DiasDesde,
    CASE 
        WHEN DATEDIFF(CURDATE(), P.Data_criação) > 22 THEN 'Expirado'
        ELSE 'Aguardando Processamento'
    END AS Status
FROM 
    Pedido P
JOIN 
    Cliente C ON P.Pedido_IdCliente = C.IdCliente
GROUP BY 
    C.IdCliente, P.IdPedido
HAVING 
    DiasDesde > 22;