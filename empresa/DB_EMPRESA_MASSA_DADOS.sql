SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO tb_departamento (Nome_Departamento,Numero_Departamento,Cpf_Gerente,Data_Inicio_Gerente)
VALUES ('Pesquisa',5,'33344555587','1988-05-22'),
('Administração',4,'98765432168','1995-01-01'),
('Matriz',1,'88866555576','1981-06-19');

INSERT INTO tb_dependente (Cpf_Funcionario,Nome_Dependente,Sexo,Data_Nascimento,Parentesco)
VALUES
('33344555587','Alicia','F','1986-04-05','Filha'),
('33344555587','Tiago','M','1983-10-25','Filho'),
('33344555587','Janaína','F','1958-05-03','Esposa'),
('98765432168','Antonio','M','1942-02-18','Marido'),
('12345678966','Michael','M','1988-04-01','Filho'),
('12345678966','Alicia','F','1988-12-30','Filha'),
('12345678966','Elizabeth','F','1967-05-05','Esposa');

INSERT INTO tb_funcionario (Primeiro_Nome,Nome_Meio,Ultimo_Nome,Cpf,Data_Nascimento,Endereco,Sexo,Salario,Cpf_Supervisor,Numero_Departamento)
VALUES
('João','B','Silva','12345678966','1965-09-01','Rua das Flores 751 São Paulo SP','M','30000','33344555587','5'),
('Fernando','T','Wong','33344555587','1955-08-12','Rua da Lapa 34 São Paulo SP','M','40000','88866555576','5'),
('Alice','J','Zelaya','99988777767','1968-01-19','Rua Souza Lima 35 Curitiba PR','F','25000','98765432168','4'),
('Jeniffer','S','Souza','98765432168','1941-06-20','Av Arthur de Lima 54 Santo André','F','43000','88866555576','4'),
('Ronaldo','K','Lima','66688444476','1962-09-15','Rua Rebouças 65 Piracicaba SP','M','38000','33344555587','5'),
('Joice','A','Leite','45345345376','1972-07-31','Av. Lucas Obes 74 São Paulo SP','F','25000','33344555587','5'),
('André','V','Pereira','98798798733','1969-03-29','Rua Timbira 35 São Paulo SP','M','25000','98765432168','4'),
('Jorge','E','Brito','88866555576','1937-11-10','Rua do Horto 35 Sáo Paulo SP','M','55000','','1');

INSERT INTO tb_Localizacoes_Departamentos (Numero_departamento,Local)
VALUE (1,'São Paulo'),(4,'Mauá'),(5,'Santo André'),(5,'Itu'),(5,'São Paulo');

INSERT INTO tb_projeto (Nome_Projeto,Numero_Projeto,Local_Projeto,Numero_Departamento)
VALUES
('Reorganização','20','São Paulo','1'),
('Produto Y','2','Itu','5'),
('Novos Benefícios','30','Mauá','4'),
('Produto X','1','Santo André','4'),
('Informatização','10','Mauá','4'),
('Produto Z','3','São Paulo','5');

INSERT INTO tb_trabalha_em (Cpf_Funcionario,Numero_Projeto,Horas)
VALUES
('12345678966','1',32.5),
('12345678966','2',7.5),
('66688444476','3',40),
('45345345376','1',20),
('45345345376','2',20),
('33344555587','2',10),
('33344555587','3',10),
('33344555587','10',10),
('33344555587','20',10),
('99988777767','30',30),
('99988777767','10',10),
('98798798733','10',35),
('98798798733','30',5),
('98765432168','30',5),
('98765432168','20',20),
('88866555576','20',0);

SET FOREIGN_KEY_CHECKS = 1;

