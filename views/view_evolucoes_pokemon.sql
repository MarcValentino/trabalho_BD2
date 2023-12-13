CREATE OR REPLACE VIEW view_evolucoes_pokemon AS
SELECT EP.nome AS especie_atual, EP.id AS id_especie_atual, EP.hp_base AS hp_base_atual, EP.ataque_base AS ataque_base_atual, EP.defesa_base AS defesa_base_atual,
       EP2.nome AS especie_evolucao, EP2.id AS id_especie_evolucao, EP2.hp_base AS hp_base_evolucao, EP2.ataque_base AS ataque_base_evolucao, EP2.defesa_base AS defesa_base_evolucao
FROM especiePokemon AS EP
JOIN evolucaoPokemon AS EV ON EP.id = EV.id_pokemon_anterior
JOIN especiePokemon AS EP2 ON EV.id_evolucao = EP2.id;