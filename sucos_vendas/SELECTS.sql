USE sucos_vendas;

SELECT CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, 
CEP, DATA_DE_NASCIMENTO,
IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA 
FROM tabela_de_clientes;
SELECT * FROM tabela_de_clientes;
SELECT CPF, NOME FROM tabela_de_clientes;

-- usando alias
SELECT CPF as ID, NOME AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Uva';

-- valor maior que
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.50;

-- entre valores
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

-- or/and
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja' OR SABOR = 'Manga';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

-- in(x, y): opções (or)
SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja', 'Manga');
SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND IDADE >= 20;
SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro','São Paulo') AND (IDADE >= 20 AND IDADE <= 22);

-- not 
SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');
SELECT * FROM tabela_de_produtos WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND NOT ( TAMANHO = '470 ml');

-- like
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM = 'PET';

-- distinct: não retorna duplicados (tendo em vista as combinações)
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos; -- retorna embalagens e tamanhos da tabela de produtos
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos WHERE SABOR = 'Laranja'; -- retorna embalagens e tamanhos cujo sabor é laranja
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'; -- retorna bairros do RJ que têm clientes

-- limit: retorna a qte de linhas que vc quer que traga
-- IGUAL MICROSOFT SQL: select top 100 * from tabela_xpto (nolock) where produto = 'bla';
SELECT * FROM tabela_de_produtos LIMIT 5; -- retorna os 5 primeiros
SELECT * FROM tabela_de_produtos LIMIT 2,3; -- retornar os três próximos a partir da posição 2 (2, 3, 4)
SELECT * FROM tabela_de_produtos LIMIT 0,2; -- retorna os dois próximos a partir da posição 0 (0, 1)

-- order by
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA; -- crescente
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC; -- decrescente
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC; -- primeira opção virá agrupada e a segunda será em ordem crescente tendo em vista a primeira opção

-- agrupar resultados: GROUP BY
-- SUM: somar valores, MAX, MIN, AVG: average, COUNT: conta ocorrências
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabela_de_clientes;
SELECT ESTADO, AVG(LIMITE_DE_CREDITO) AS MEDIA_LIMITE FROM tabela_de_clientes GROUP BY ESTADO;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY ESTADO; -- soma os limites por estado
SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos;
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_Produtos GROUP BY EMBALAGEM; -- dá maior preço de cada embalagem
SELECT EMBALAGEM, COUNT(*) AS CONTADOR FROM tabela_de_produtos GROUP BY EMBALAGEM; -- conta embalagens da tabela
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes GROUP BY BAIRRO;
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes GROUP BY ESTADO, BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO ORDER BY BAIRRO;
SELECT MAX(QUANTIDADE) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ;
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;

-- having: adiciona nova condição
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
WHERE SOMA_LIMITE > 900000
GROUP BY ESTADO;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO) > 900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, 
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

-- clientes que fizeram mais de 2000 compras em 2016
select cpf, count(cpf) as contagem from notas_fiscais where year(DATA_VENDA) = 2016 group by cpf having contagem > 2000;


