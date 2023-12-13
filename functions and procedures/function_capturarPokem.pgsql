CREATE OR REPLACE FUNCTION capturarPokemon(id_instancia INT, id_treinador_atual INT) 
RETURNS VOID AS $$
DECLARE
    hp_maximo INT;
    hp_atual_instancia INT;
    pokeballs INT;
    existeTreinador int;
BEGIN

    SELECT id_treinador INTO existeTreinador 
    FROM instanciaPokemon 
    WHERE id = id_instancia;

    
    IF existeTreinador IS NULL THEN
        

        SELECT hp_base INTO hp_maximo 
        FROM especiePokemon 
        WHERE id = (SELECT id_especie FROM instanciaPokemon WHERE id = id_instancia);

        SELECT hp_atual INTO hp_atual_instancia
        FROM instanciaPokemon 
        WHERE id = id_instancia;
        
        -- faça o raise com valor do hp atual e o hp_maximo
        

        IF hp_atual_instancia <= (0.3 * hp_maximo) THEN

            SELECT quantidade INTO pokeballs 
            FROM itemTreinador 
            WHERE id_treinador = id_treinador_atual AND id_item = (SELECT id FROM item WHERE nome LIKE '%Ball' LIMIT 1);
            
            IF pokeballs >= 1 THEN

                UPDATE itemTreinador 
                SET quantidade = quantidade - 1 
                WHERE id_treinador = id_treinador_atual AND id_item = (SELECT id FROM item WHERE nome  LIKE '%Ball' LIMIT 1);

                UPDATE instanciaPokemon 
                SET id_treinador = id_treinador_atual
                WHERE id = id_instancia;

                IF pokeballs = 1 THEN
                    DELETE FROM itemTreinador 
                    WHERE id_treinador = id_treinador_atual AND id_item = (SELECT id FROM item WHERE nome  LIKE '%Ball' LIMIT 1);
                END IF;
            
            END IF;
        END IF;
    END IF;

END;
$$ LANGUAGE plpgsql;

