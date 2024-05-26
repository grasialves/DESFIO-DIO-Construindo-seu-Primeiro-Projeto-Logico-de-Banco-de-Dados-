-- Criação do banco de dados de uma E-commerce - desafio 
-- Autor: Grasiele ALves 
-- Data criação: 25/05/2024

CREATE database ecommerce;
USE ecommerce;
-- drop database Ecommerce;
-- TABELAS
	-- Tabela cliente

CREATE table Cliente (
		IdCliente INT auto_increment PRIMARY KEY,
        Pnome VARCHAR(45) NOT NULL,
        Mnome VARCHAR(3),
        Unome VARCHAR(15) NOT NULL,
        CPF CHAR(11) NOT NULL,
        Rua VARCHAR(45) NOT NULL,
        Cidade VARCHAR(15) NOT NULL,
        UF CHAR(2) NOT NULL,
        Data_nascimento DATE,
        CONSTRAINT Cliente_CPF_UN UNIQUE(CPF)
        );
    
alter table cliente auto_increment = 1;
  
	-- Tabela produto
CREATE table Produto (
		IdProduto INT auto_increment PRIMARY KEY,
        Produto_nome VARCHAR(45) NOT NULL,
        Valor FLOAT NOT NULL,
        Descrição VARCHAR(100),
        Categoria ENUM('Alimento','Vestuário','Escritório','Eletrônico','Casa', 'Outros'),
        Indicado_criança BOOL DEFAULT false
        );
 

 
	-- Tabela Pagamento
 CREATE table Pagamento (
		IdCliente INT,
        IdPagamento INT,  													
        Pagamento_Tipo ENUM('Cartão','Boleto') NOT NULL,
        PRIMARY KEY (IdCliente, IdPagamento), 
        CONSTRAINT Pagamento_Cliente_FK FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
        );
        

   
	-- Tabela Pedido
CREATE table Pedido (
		IdPedido INT auto_increment PRIMARY KEY,
        Pedido_IdCliente INT,
        Valor_unidade FLOAT NOT NULL,
        Quantidade INT NOT NULL,
		IdPagamento INT,
        Descrição VARCHAR(100),
        Data_criação DATE NOT NULL,
        Pedido_Status ENUM("Em processamento", "Processado", "Cancelado", "Enviado", "Entregue") NOT NULL,
        Frete FLOAT DEFAULT 0,
        CONSTRAINT Pedido_IdCliente_FK FOREIGN KEY (Pedido_IdCliente) REFERENCES Cliente(IdCliente)           -- ADC A FK DE PAGAMENTO
        );
   

   
	-- Tabela Fornecedor
 CREATE table Fornecedor (
		IdFornecedor INT AUTO_INCREMENT PRIMARY KEY,
        Razão_Social VARCHAR(45) NOT NULL,
        CNPJ CHAR(14) NOT NULL,
        Contato CHAR(11) NOT NULL,
        CONSTRAINT Fornecedor_CNPJ_UN UNIQUE(CNPJ)
        );
        
	-- Tabela Estoque
 CREATE table Estoque (
		IdEstoque INT AUTO_INCREMENT PRIMARY KEY,
        Estoque_Local VARCHAR(45),
		Estoque_Quantidade INT DEFAULT 0
        );
        
	-- Tabela Terceiro
 CREATE table Terceiro (
		IdTerceiro INT AUTO_INCREMENT PRIMARY KEY,
        Razão_Social VARCHAR(45) NOT NULL,
        CNPJ CHAR(14),
        CPF CHAR(11),
        Rua VARCHAR(45) NOT NULL,
        Cidade VARCHAR(15) NOT NULL,
        UF CHAR(2) NOT NULL,
        Contato CHAR(11) NOT NULL,
        CONSTRAINT Terceiro_CNPJ_UN UNIQUE(CNPJ),
        CONSTRAINT Terceiro_CPF_UN UNIQUE(CPF)
        );
        
-- Tabelas de Relacionamento

	-- Relação produto/terceiro
 CREATE table Relação_Produto_Terceiro (
		IdTerceiro INT,
        IdProduto INT,
        Quantidade INT DEFAULT 1,
        PRIMARY KEY (IdTerceiro, IdProduto), 
        CONSTRAINT Relação_Terceiro_FK FOREIGN KEY(IdTerceiro) REFERENCES Terceiro(IdTerceiro),
        CONSTRAINT Relação_Produto_FK FOREIGN KEY(IdProduto) REFERENCES Produto(IdProduto)
        );
desc Relação_Produto_Terceiro;
 
	-- Relação Fornecedor/Produto      
 CREATE table Relação_Produto_Fornecedor (
		IdFornecedor INT,
        IdProduto INT,
        Quantidade INT DEFAULT 1,
        PRIMARY KEY (IdFornecedor, IdProduto), 
        CONSTRAINT Relação_Fornecedor_FK FOREIGN KEY(IdFornecedor) REFERENCES Fornecedor(IdFornecedor),
        CONSTRAINT Relação_Fornecedor_Produto_FK FOREIGN KEY(IdProduto) REFERENCES Produto(IdProduto)
        );
        
 -- Relação Estoque/Produto         
 CREATE table Relação_Estoque_Produto (
		IdEstoque INT,
        IdProduto INT,
        Estoque_Local VARCHAR(100),
        Quantidade INT DEFAULT 1,
        PRIMARY KEY (IdEstoque, IdProduto), 
        CONSTRAINT Relação_Estoque_FK FOREIGN KEY(IdEstoque) REFERENCES Estoque(IdEstoque),
        CONSTRAINT Relação_Estoque_Produto_FK FOREIGN KEY(IdProduto) REFERENCES Produto(IdProduto)
        );
        
    -- Relação Pedido/Produto         
 CREATE table Relação_Pedido_Produto (
		IdPedido INT,
        IdProduto INT,
        Quantidade INT DEFAULT 1,
        Pedido_Produto_Status ENUM("Disponível", "Indisponível") DEFAULT 'Disponível',
        PRIMARY KEY (IdPedido, IdProduto), 
        CONSTRAINT Relação_Pedido_FK FOREIGN KEY(IdPedido) REFERENCES Pedido(IdPedido),
        CONSTRAINT Relação_Pedido_Produto_FK FOREIGN KEY(IdProduto) REFERENCES Produto(IdProduto)
        );
        

