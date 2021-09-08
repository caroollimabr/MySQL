-- inner joins
SELECT
tb_projeto.nome_projeto, tb_funcionario.Primeiro_Nome -- quero ver esses dois atributos
FROM tb_funcionario
INNER JOIN tb_departamento ON tb_funcionario.CPF = tb_departamento.Cpf_Gerente -- mostra quais campos são iguais e ligam as duas tabelas
INNER JOIN tb_projeto ON tb_funcionario.Numero_Departamento = tb_projeto.Numero_Departamento;

-- todos os funcionários do depto 5 que trabalham + de 10h/semana no proj 10
SELECT tb_funcionario.primeiro_nome, tb_funcionario.nome_meio, tb_funcionario.ultimo_nome
FROM tb_funcionario 
INNER JOIN tb_trabalha_em ON tb_funcionario.cpf = tb_trabalha_em.cpf_funcionario
WHERE tb_funcionario.numero_departamento = 5 AND tb_trabalha_em.numero_projeto = 10
AND tb_trabalha_em.horas >= 10;

SELECT * FROM tb_funcionario WHERE sexo = 'F';
SELECT Primeiro_Nome, Ultimo_Nome, CPF
 FROM tb_funcionario WHERE sexo = 'F';
 
 -- produto cartesiano: retorna dados tendo em vista duas ou mais tabelas
 -- select * from tb_bla, tb_bla2
SELECT tb_funcionario.Primeiro_Nome, 
tb_funcionario.Ultimo_Nome, 
tb_funcionario.CPF, 
tb_dependente.* -- quero todos os campos da tabela
FROM tb_funcionario, tb_dependente 
WHERE tb_funcionario.sexo = 'F';
 
SELECT tb_funcionario.Primeiro_Nome,
tb_funcionario.Ultimo_Nome,
tb_funcionario.CPF, 
tb_dependente.*
FROM tb_funcionario, tb_dependente 
WHERE tb_funcionario.sexo = 'F'
AND tb_funcionario.Cpf = tb_dependente.Cpf_Funcionario;

SELECT tb_funcionario.Primeiro_Nome, 
tb_funcionario.Ultimo_Nome, 
tb_dependente.Nome_Dependente
FROM tb_funcionario, tb_dependente 
WHERE tb_funcionario.sexo = 'F'
AND tb_funcionario.Cpf = tb_dependente.Cpf_Funcionario;
 
 