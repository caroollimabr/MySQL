-- deleção de tabelas

-- desliga constraint para deletar tabelas sem problemas
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE tb_departamento;

DROP TABLE tb_funcionario;
DROP TABLE tb_localizacoes_departamentos;
DROP TABLE tb_Projeto;
DROP TABLE tb_trabalha_em;
DROP TABLE tb_dependente;

-- liga constraint
SET FOREIGN_KEY_CHECKS = 1;
