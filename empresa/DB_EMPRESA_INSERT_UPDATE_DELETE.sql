/* INSERT INTO tb_funcionario VALUES
('8859483743','1973-05-16','Maria','R','Oliveira',
'Rua Altamira 23',18000, 'F', '8859483743', 1); */

UPDATE tb_funcionario SET NUMERO_DEPARTAMENTO = 2
WHERE CPF = '8859483743';

UPDATE tb_funcionario SET SALARIO = 1.1 * SALARIO
WHERE NUMERO_DEPARTAMENTO = 1;

/* INSERT INTO tb_funcionario 
(CPF, DATA_NASCIMENTO, PRIMEIRO_NOME, NOME_MEIO, ULTIMO_NOME,
ENDERECO, CPF_SUPERVISOR, SALARIO, SEXO, NUMERO_DEPARTAMENTO)
VALUES
('35785747845','1987-09-11','Marcelo','V','Silva',
'Rua Utubaiana', '3248493205', 12000, 'F',  1); */

UPDATE tb_funcionario SET ENDERECO = 'Av Sousa Numero 100',
SALARIO = 13000 WHERE CPF = '35785747845';

UPDATE tb_funcionario SET ENDERECO = 'Av Sousa Numero 100',
SALARIO = 13000 WHERE CPF = '35785747845';

DELETE FROM tb_funcionario WHERE CPF = '35785747845';

-- tem foreign key, não vai dar certo, tem foreign key que faz referência a outra tabela
DELETE FROM tb_funcionario WHERE CPF = '8859483743';



