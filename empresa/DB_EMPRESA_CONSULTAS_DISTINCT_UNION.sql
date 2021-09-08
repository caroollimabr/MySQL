SELECT * FROM TB_DEPARTAMENTO;
SELECT * FROM TB_FUNCIONARIO;
SELECT * FROM TB_LOCALIZACOES_DEPARTAMENTOS;
SELECT * FROM TB_PROJETO;
SELECT * FROM TB_TRABALHA_EM;
SELECT * FROM TB_DEPENDENTE;

SELECT * FROM tb_projeto WHERE Local_Projeto = 'Mauá';
SELECT * FROM tb_funcionario WHERE data_nascimento >= '1965-01-01';
SELECT * FROM tb_funcionario WHERE YEAR(data_nascimento) >= 1965; -- pega só o ano do campo data_nascimento, que deve ser maior ou igual a 1965
SELECT * FROM tb_funcionario WHERE Numero_Departamento = 5;
SELECT cpf FROM tb_funcionario WHERE Numero_Departamento = 5; -- aparece só o CPF

-- levando em conta dois ou mais parâmetros depois do where
SELECT * FROM TB_TRABALHA_EM WHERE NUMERO_PROJETO = '1' AND HORAS = '33';
SELECT * FROM tb_projeto WHERE Numero_Projeto = 10 AND Numero_Departamento  = 4;
SELECT * FROM TB_TRABALHA_EM WHERE NUMERO_PROJETO = 1 OR NUMERO_PROJETO = 2;

-- selecionando dois ou mais itens na tabela
SELECT nome_projeto, numero_projeto FROM tb_projeto;

-- criando um apelido (alias) para determinado atributo: AS
SELECT nome_projeto AS 'NOME DO PROJETO', numero_projeto AS 'NUMERO DO PROJETO' FROM tb_projeto;

-- distinct: mostra os resultados sem repetir dados que são iguais
SELECT DISTINCT cpf_supervisor FROM tb_funcionario WHERE Numero_Departamento = 5;

-- union: junta os resultados das tabelas em questão
SELECT cpf FROM tb_funcionario WHERE Numero_Departamento = 5
UNION
SELECT DISTINCT cpf_supervisor FROM tb_funcionario WHERE Numero_Departamento = 5;
