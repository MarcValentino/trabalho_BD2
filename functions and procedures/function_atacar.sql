CREATE OR REPLACE FUNCTION atacar(id_instancia_atacante INT, id_instancia_defensor INT, id_movimento_atacante INT)
RETURNS VOID AS $$
DECLARE
    dano INT;
    id_efeito INT;
BEGIN

    SELECT dano_base INTO dano 
    FROM movimento 
    WHERE id = id_movimento_atacante;

    UPDATE instanciaPokemon
    SET hp_atual = GREATEST(hp_atual - dano, 0)
    WHERE id = id_instancia_defensor;

    SELECT EXISTS(SELECT * FROM movimentoEfeito WHERE id_movimento = id_movimento_atacante) INTO id_efeito;

    IF existe_efeito THEN

        INSERT INTO instanciaEfeito (id_instancia, id_efeito, turnos_restantes)
        VALUES (id_instancia_defensor, id_efeito, 5); 
        
    END IF;
END;
$$ LANGUAGE plpgsql;
