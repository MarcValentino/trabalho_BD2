CREATE OR REPLACE FUNCTION evoluirPokemon(id_instancia_pokemon INT)
RETURNS VOID AS $$
DECLARE
    xp_instancia_atual INT;
    xp_necessario INT;
    nova_especie_id INT;
    nova_hp_base INT;
    novo_ataque_base INT;
    nova_defesa_base INT;
    continuar BOOLEAN := TRUE;
BEGIN
    -- Obter XP atual da instância do Pokémon
    SELECT xp_atual INTO xp_instancia_atual FROM instanciaPokemon WHERE id = id_instancia_pokemon;

    WHILE continuar LOOP
        -- Encontrar a próxima evolução
        SELECT e.id_evolucao, e.xp_necessario, p.hp_base, p.ataque_base, p.defesa_base INTO nova_especie_id, xp_necessario, nova_hp_base, novo_ataque_base, nova_defesa_base
        FROM evolucaoPokemon e
        INNER JOIN especiePokemon p ON e.id_evolucao = p.id
        WHERE e.id_pokemon_anterior = ( SELECT id_especie 
                                        FROM instanciaPokemon 
                                        WHERE id = id_instancia_pokemon
                                        );

        -- Verificar se o XP atual é suficiente para evoluir
        IF xp_instancia_atual >= xp_necessario AND nova_especie_id IS NOT NULL THEN
            -- Atualizar a espécie na instância do Pokémon
            UPDATE instanciaPokemon SET id_especie = nova_especie_id, hp_atual = nova_hp_base, ataque_atual = novo_ataque_base, defesa_atual = nova_defesa_base
            WHERE id = id_instancia_pokemon;

        ELSE
            continuar := FALSE;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
