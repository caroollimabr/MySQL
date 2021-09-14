-- VIEW: crie uma visão para diminuir a subconsulta
-- views > botão direto > Create View > Botão Apply
CREATE VIEW `vw_maiores_embalagens` AS
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM