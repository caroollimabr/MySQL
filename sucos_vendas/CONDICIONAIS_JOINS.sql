-- condicionais: select case when then else
SELECT * FROM tabela_de_produtos;

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO 
FROM tabela_de_produtos;

-- preço médio do caro e do barato quando o sabor é manga
SELECT EMBALAGEM,
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM, 
CASE 
   WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
   WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
   ELSE 'PRODUTO BARATO' 
END 
ORDER BY EMBALAGEM;

-- antes de 1990 são velhos, entre 1990 e 1995 são jovens e depois de 1995 são crianças
SELECT NOME,
CASE WHEN YEAR(data_de_nascimento) < 1990 THEN 'Idoso' WHEN YEAR(data_de_nascimento) >= 1990 AND
YEAR(data_de_nascimento) <= 1995 THEN 'Jovem' 
ELSE 'Criança' END
FROM tabela_de_clientes;


SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

-- INNER JOIN: lista os correspondentes de ambas as tabelas
SELECT * FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA; -- elemento em comum de ambas as tabelas

-- traz matricula, nome e contagem
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA -- elemento em comum de ambas as tabelas
GROUP BY A.MATRICULA, A.NOME;

-- traz matricula, nome e contagem
SELECT A.MATRICULA, A.NOME, COUNT(*) FROM
tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA -- elemento em comum de ambas as tabelas
GROUP BY A.MATRICULA, A.NOME;


SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;


SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
INNER JOIN notas_fiscais B ON A.CPF = B.CPF;

-- LEFT JOIN: mostra todos os dados de B e somente os que correspondem em A
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

-- RIGHT JOIN: mostra todos os dados de A e somente os que correspondem em B
SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM notas_fiscais B
RIGHT JOIN tabela_de_clientes A ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A
LEFT JOIN notas_fiscais B ON A.CPF = B.CPF
WHERE B.CPF IS NULL AND YEAR(B.DATA_VENDA) = 2014;

SELECT * FROM tabela_de_vendedores;

SELECT count(*) FROM tabela_de_clientes;

SELECT * FROM tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- FULL JOIN: mostra todos os registros das 2 tabelas, correspondentes ou não
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores , tabela_de_clientes;
