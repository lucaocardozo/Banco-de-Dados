/*Nome: Victor Silvano Verri RA: 1914871; Nome: Lucas Martins Cardozo RA:1996770; Nome: Artur Ornaghi Interliche RA: 1705288*/
/*O desenvolvimento de um Banco de Dados para um e-commerce, no qual precisa de cadastro e consulta de produtos*/

CREATE DATABASE e_commerce; #Criando um Banco de Dados
USE e_commerce; #utilizando-a

#criando tabela cliente
CREATE TABLE cliente(
rg DOUBLE NOT NULL,
nome VARCHAR(30) NOT NULL,
telefone DOUBLE NOT NULL,
PRIMARY KEY (rg)
);
 
 #criando tabela produto
CREATE TABLE produto(
id_prod INT NOT NULL,
nome_prod VARCHAR(30) NOT NULL,
quantidade INT NOT NULL,
preco INT NOT NULL,
PRIMARY KEY (id_prod)
);
 
 #criando tabela categoria
 CREATE TABLE categoria(
id_cat INT NOT NULL,
nome_cat VARCHAR(30) NOT NULL,
produto INT NOT NULL,
FOREIGN KEY (produto) REFERENCES produto(id_prod)
);

#Inserindo dados na tabela cliente
INSERT INTO cliente (rg,nome,telefone) 
	VALUES
		(524896597, 'Victor', 19981627475), 
        (548976568, 'Lucas', 19978546225),
        (528945671, 'Artur', 43981627476),
        (524498672, 'Victor', 19984516766);

#Inserindo dados na tabela produto
INSERT INTO produto (id_prod,nome_prod,quantidade,preco) 
	VALUES
		(1, 'TV', 5, 2000), 
        (2, 'Sofa', 10, 3500),
        (3, 'Escrivaninha', 15, 400),
        (4, 'Abajour', 20, 40);
        
#Inserindo dados na tabela categoria
INSERT INTO categoria (id_cat,nome_cat,produto) 
	VALUES
		(12, 'Eletronicos', 1), 
        (23, 'Moveis', 2),
        (23, 'Moveis', 3),
        (34, 'Utensilios', 4);
        
#consultando cliente
SELECT * FROM cliente;

#transacao responsavel pela mudanca de telefone de um cliente
START TRANSACTION;
	DELETE FROM cliente WHERE telefone= 43981627476 AND nome= 'Artur' AND rg= 528945671;
    INSERT INTO cliente (telefone, nome, rg) VALUES (43958698744, 'Artur', 528945671);
COMMIT;
 
#conferindo alteração de telefone do cliente
SELECT * FROM cliente WHERE nome = 'Artur';
 
#Realizando consulta envolvendo inner join com categoria e produto
SELECT * FROM categoria INNER JOIN produto ON categoria.produto = produto.id_prod and nome_cat = 'Moveis';
 
#criando uma visão a partir da tabela categoria
CREATE VIEW vw_viewCat AS SELECT id_cat, nome_cat FROM categoria;
 
#realizando uma visão criada previamente
SELECT * FROM vw_viewCat LIMIT 4;

#criando um papel 
CREATE ROLE 'admin'; 


#atribuindo privilegio total para papel criado
GRANT ALL ON e_commerce.* TO 'admin'; 

#criando um usuario
CREATE USER 'VictorAdm'@'localhost' IDENTIFIED BY 'teste123'; 

#atribuindo papel com todos privilegios para usuario
GRANT 'admin' TO 'VictorAdm'@'localhost'; 

#mostrando privilegios para papel criado
SHOW GRANTS FOR admin; 
 