use AltsSys;

/*
	DROP TABLE PedidoItens; 
    DROP TABLE Pedido;     
	DROP TABLE Cliente;
	DROP TABLE Produto; 
*/

/*  Tabela de clientes */
CREATE TABLE IF NOT EXISTS Cliente(Id INT NOT NULL AUTO_INCREMENT, 
								   Nome VARCHAR(150) NOT NULL, 
								   Cidade VARCHAR(100), 
								   UF CHAR(2),
								   PRIMARY KEY(Id)
								  );


/* ***************** Tabela de produtos ******************************************** */
CREATE TABLE IF NOT EXISTS Produto(Id INT NOT NULL AUTO_INCREMENT, 
								   Descricao VARCHAR(100) NOT NULL,
								   PrecoVenda DECIMAL(10,2) NOT NULL DEFAULT 0.00,
								   PRIMARY KEY(Id)
								  );
                      


/* **************** Tabela cabeçalho dos pedidos ********************************** */
CREATE TABLE IF NOT EXISTS Pedido(Id INT NOT NULL AUTO_INCREMENT,
								  DataEmissao DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP, 	
								  IdCliente INT NOT NULL, 
                                  ValorTotal DECIMAL(10,2) NOT NULL,
                                  PRIMARY KEY(Id),
                                  CONSTRAINT FK_Pedido_Cliente_IdCliente FOREIGN KEY(IdCliente)  REFERENCES Cliente(Id),
                                  INDEX idx_Pedido_IdCliente(IdCliente),
                                  INDEX idx_Pedido_DataEmissao(DataEmissao)                                  
								 );
                               
                                 
                                 
/* **************** Tabela itens do pedido *************************************** */
CREATE TABLE IF NOT EXISTS PedidoItens(Id INT NOT NULL AUTO_INCREMENT,
									   IdPedido INT NOT NULL,
                                       IdProduto INT NOT NULL,
                                       Quantidade DECIMAL(10,2) NOT NULL,
                                       ValorUnitario DECIMAL(10,2) NOT NULL,
                                       ValorTotal DECIMAL(10,2) NOT NULL,                                                                               
                                       
                                       PRIMARY KEY(Id),
                                       CONSTRAINT FK_PedidoItens_Pedido_IdPedido FOREIGN KEY(IdPedido) REFERENCES Pedido(Id),                                       
                                       CONSTRAINT FK_PedidoItens_Produto_IdProduto FOREIGN KEY(IdProduto) REFERENCES Produto(Id),
                                       INDEX idx_PedidoItens_IdPedido(IdPedido),
                                       INDEX idx_PedidoItens_IdProduto(IdProduto)                                       
									 );



select cli.Nome, prod.Descricao, pdi.* from PedidoItens pdi
INNER JOIN Produto prod 
	ON pdi.Idproduto = prod.Id
INNER JOIN Pedido pd 
	ON pdi.IdPedido = pd.Id
INNER JOIN Cliente cli 
	ON cli.Id = pd.IdCliente
