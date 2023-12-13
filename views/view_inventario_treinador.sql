CREATE OR REPLACE VIEW view_inventario_treinador AS
SELECT T.id AS id_treinador, T.nome AS nome_treinador, IT.id AS id_item, IT.quantidade AS quantidade_item,
       I.nome AS nome_item, I.tipo_item AS tipo_item, I.descricao AS descricao_item
FROM treinador AS T
JOIN itemTreinador AS IT ON T.id = IT.id_treinador
JOIN item AS I ON IT.id_item = I.id;