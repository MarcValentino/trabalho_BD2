CREATE OR REPLACE VIEW view_regiao_pokemon AS
SELECT IP.id AS id_instancia, E.nome AS nome_pokemon, R.nome AS nome_regiao
FROM instanciaPokemon AS IP
JOIN especieRegiao AS ER ON IP.id_especie = ER.id_especie
JOIN regiao AS R ON ER.id_regiao = R.id
JOIN especiePokemon AS E ON IP.id_especie = E.id;