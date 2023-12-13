CREATE OR REPLACE VIEW view_treinadores_pokemon_escolhidos AS
SELECT T.id AS id_treinador, T.nome AS nome_treinador,
       IP.id AS id_instancia_pokemon, IP.nome_dado AS nome_pokemon,
       EP.hp_base AS hp_base_pokemon, IP.hp_atual AS hp_atual_pokemon,
       EP.ataque_base AS ataque_base_pokemon, IP.ataque_atual AS ataque_atual_pokemon,
       EP.defesa_base AS defesa_base_pokemon, IP.defesa_atual AS defesa_atual_pokemon
FROM treinador AS T
JOIN instanciaPokemon AS IP ON T.id = IP.id_treinador
JOIN especiePokemon AS EP ON IP.id_especie = EP.id
WHERE IP.escolhido = TRUE;