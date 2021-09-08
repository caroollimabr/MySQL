-- juntar tb_funcionario e tb_departamento
SELECT * FROM tb_funcionario 
INNER JOIN tb_departamento 
ON tb_funcionario.NUMERO_DEPARTAMENTO = tb_departamento.NUMERO_DEPARTAMENTO;

-- Selecionar funcionarios que trabalham no depto pesquisa
SELECT tb_departamento.NOME_DEPARTAMENTO, tb_funcionario.PRIMEIRO_NOME,  tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME 
FROM tb_funcionario
INNER JOIN tb_departamento 
ON tb_funcionario.NUMERO_DEPARTAMENTO = tb_departamento.NUMERO_DEPARTAMENTO WHERE tb_departamento.NOME_DEPARTAMENTO = 'Pesquisa';

-- Selecionar os funcionários tendo em vista os projetos
SELECT tb_projeto.NOME_PROJETO, tb_funcionario.PRIMEIRO_NOME FROM tb_funcionario 
INNER JOIN tb_departamento ON tb_funcionario.cpf = tb_departamento.CPF_GERENTE
INNER JOIN tb_projeto 
ON tb_departamento.NUMERO_DEPARTAMENTO = tb_projeto.NUMERO_DEPARTAMENTO;

-- Selecionar todos os projetos de Mauá junto com informações dos funcionários que estão no projeto
SELECT tb_projeto.NOME_PROJETO, tb_projeto.NUMERO_DEPARTAMENTO, tb_projeto.LOCAL_PROJETO,
tb_funcionario.PRIMEIRO_NOME, tb_funcionario.ENDERECO, tb_funcionario.DATA_NASCIMENTO 
FROM tb_projeto
INNER JOIN tb_departamento ON tb_projeto.NUMERO_DEPARTAMENTO = tb_departamento.NUMERO_DEPARTAMENTO
INNER JOIN tb_funcionario ON tb_funcionario.cpf = tb_departamento.CPF_GERENTE
WHERE tb_projeto.LOCAL_PROJETO = 'Mauá';


-- Selecionar nomes dos funcionários que trabalham no departamento 5 e em TODOS os projetos do depto
-- GROUP BY: o que vai aparecer na tela
SELECT tb_funcionario.PRIMEIRO_NOME, tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME FROM tb_projeto 
INNER JOIN tb_trabalha_em ON tb_projeto.NUMERO_PROJETO = tb_trabalha_em.NUMERO_PROJETO
INNER JOIN tb_funcionario ON tb_trabalha_em.CPF_FUNCIONARIO = tb_funcionario.CPF
WHERE tb_projeto.NUMERO_DEPARTAMENTO = 5
GROUP BY tb_funcionario.PRIMEIRO_NOME, tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME
-- HAVING: quando está fora do where, não dá para usar o "and". Usamos "having"
HAVING COUNT(*) = (SELECT COUNT(*) FROM tb_projeto WHERE tb_projeto.NUMERO_DEPARTAMENTO = 5); -- aqui pega apenas quem trabalhou em todos os projetos do depto 5

-- COUNT: conta o número de ocorrências em determinada consulta
SELECT COUNT(*) FROM tb_projeto WHERE tb_projeto.NUMERO_DEPARTAMENTO = 5;
SELECT * FROM tb_projeto WHERE tb_projeto.NUMERO_DEPARTAMENTO = 5;
SELECT * FROM tb_projeto WHERE tb_projeto.NUMERO_DEPARTAMENTO = 5; -- 2 ocorrências de projetos

SELECT * FROM tb_trabalha_em WHERE (tb_trabalha_em.NUMERO_PROJETO = 2 OR tb_trabalha_em.NUMERO_PROJETO = 3);

-- devolve números dos projetos que têm funcionários cujo sobrenome é "Souza"
SELECT tb_trabalha_em.NUMERO_PROJETO FROM tb_funcionario
INNER JOIN tb_trabalha_em ON tb_funcionario.CPF = tb_trabalha_em.CPF_FUNCIONARIO
WHERE tb_funcionario.ULTIMO_NOME = 'Souza'
UNION
SELECT tb_projeto.NUMERO_PROJETO FROM tb_funcionario
INNER JOIN tb_departamento ON tb_funcionario.CPF = tb_departamento.CPF_GERENTE
INNER JOIN tb_projeto ON tb_projeto.NUMERO_DEPARTAMENTO = tb_departamento.NUMERO_DEPARTAMENTO
WHERE tb_funcionario.ULTIMO_NOME = 'Souza';

-- pega funcionários que não têm dependentes
SELECT tb_funcionario.PRIMEIRO_NOME, tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME FROM tb_funcionario
LEFT JOIN tb_dependente
ON tb_funcionario.CPF = tb_dependente.CPF_FUNCIONARIO
WHERE tb_dependente.CPF_FUNCIONARIO IS NULL;

-- DISTINCT: retorna sem repetir valores
-- retorna funcionários que têm dependente(s) e são gerentes
SELECT DISTINCT tb_funcionario.PRIMEIRO_NOME, tb_funcionario.NOME_MEIO, tb_funcionario.ULTIMO_NOME FROM tb_funcionario
INNER JOIN tb_dependente ON tb_funcionario.CPF = tb_dependente.CPF_FUNCIONARIO
INNER JOIN tb_departamento ON tb_funcionario.CPF = tb_departamento.CPF_GERENTE;

