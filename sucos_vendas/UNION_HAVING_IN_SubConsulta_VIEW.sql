SELECT DISTINCT BAIRRO FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- UNION: une duas ou mais tabelas
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- UNION ALL: lista TODOS os registros incluindo REPETIDOS
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE, CPF  FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR, MATRICULA FROM tabela_de_vendedores;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- IN: traz apenas o que está dentro das opções 
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN ('Tijuca','Jardins','Copacabana','Santo Amaro');

SELECT * FROM tabela_de_clientes WHERE BAIRRO 
IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

-- SELECT dentro de SELECT: subconsulta
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

-- VIEW: visão para simplificar a subconsulta

select * from vw_maiores_embalagens;
 
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
vw_maiores_embalagens X WHERE X.PRECO_MAXIMO >= 10;

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.PRECO_MAXIMO,
((A.PRECO_DE_LISTA / X.PRECO_MAXIMO) -1) * 100 AS PERCENTUAL
FROM tabela_de_produtos A INNER JOIN vw_maiores_embalagens X
ON A.EMBALAGEM = X.EMBALAGEM;



