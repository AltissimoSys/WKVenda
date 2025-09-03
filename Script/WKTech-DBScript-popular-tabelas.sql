use AltsSys;

DELETE FROM Cliente; 
DELETE FROM Produto;
 

    
/* ****************************** Populando tabela de cliente ******************************* */
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Amanda Rocha', 'Ibirité', 'MG');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Bruno Lima', 'São Paulo', 'SP');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Carla Mendes', 'Fortaleza', 'CE');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Daniel Souza', 'Curitiba', 'PR');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Eduarda Martins', 'Salvador', 'BA');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Felipe Andrade', 'Porto Alegre', 'RS');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Gabriela Torres', 'Recife', 'PE');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Henrique Castro', 'Manaus', 'AM');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Isabela Nunes', 'Belém', 'PA');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('João Vitor', 'Campinas', 'SP');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Karen Oliveira', 'Niterói', 'RJ');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Leonardo Alves', 'Florianópolis', 'SC');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Mariana Costa', 'Vitória', 'ES');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Nicolas Ferreira', 'Goiânia', 'GO');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Otávio Ramos', 'Campo Grande', 'MS');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Patrícia Duarte', 'João Pessoa', 'PB');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Rafael Teixeira', 'São Luís', 'MA');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Sabrina Lopes', 'Aracaju', 'SE');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Thiago Barros', 'Teresina', 'PI');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Ursula Farias', 'Palmas', 'TO');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Vinícius Moreira', 'Maceió', 'AL');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Wesley Cardoso', 'Ribeirão Preto', 'SP');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Yasmin Ribeiro', 'Uberlândia', 'MG');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Zeca Brito', 'Caxias do Sul', 'RS');
INSERT INTO Cliente (Nome, Cidade, UF) VALUES ('Lívia Fernandes', 'São Bernardo do Campo', 'SP');
 
/* ****************************** Populando tabela de produtos ******************************* */
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Camiseta Algodão Básica', 39.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Calça Jeans Slim', 129.99);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Tênis Esportivo Masculino', 199.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Bolsa Feminina Couro Sintético', 89.50);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Relógio Digital Resistente à Água', 149.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Fone de Ouvido Bluetooth', 79.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Smartphone 128GB', 1399.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Notebook Intel i5 8GB RAM', 2999.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Mouse Gamer RGB', 119.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Teclado Mecânico ABNT2', 249.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Monitor LED 24 Polegadas', 899.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Cadeira Escritório Ergonômica', 499.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Mesa de Jantar 6 Lugares', 899.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Liquidificador 700W', 149.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Micro-ondas 20L', 399.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Geladeira Duplex Frost Free', 2399.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Fogão 4 Bocas Inox', 899.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Máquina de Lavar 11kg', 1799.00);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Ventilador de Mesa 40cm', 129.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Aspirador de Pó Vertical', 299.90);
INSERT INTO Produto (Descricao, PrecoVenda) VALUES ('Cafeteira Elétrica 15 Xícaras', 189.00);



select * FROM Cliente;
select * FROM Produto;




