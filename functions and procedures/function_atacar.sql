CREATE OR REPLACE FUNCTION atacar(id_instancia_atacante INT, id_instancia_defensor INT, id_movimento_atacante INT)
RETURNS VOID AS $$
DECLARE
    dano INT;
    id_efeito_defensor INT;
    existe_efeito BOOLEAN;
    esta_com_efeito BOOLEAN;
    turnos_restantes_atacante INT;

BEGIN

    SELECT EXISTS(SELECT 1 FROM instanciaEfeito WHERE id_instancia = id_instancia_atacante) INTO esta_com_efeito;
    IF esta_com_efeito THEN

        SELECT turnos_restantes INTO turnos_restantes_atacante
        FROM instanciaEfeito
        WHERE id_instancia = id_instancia_atacante;

        UPDATE instanciaEfeito
        SET turnos_restantes = turnos_restantes_atacante - 1 
        WHERE id_instancia = id_instancia_atacante;

        IF turnos_restantes_atacante = 1 THEN
            DELETE FROM instanciaEfeito
            WHERE id_instancia = id_instancia_atacante;
        END IF;

    ELSE
        SELECT dano_base INTO dano 
        FROM movimento 
        WHERE id = id_movimento_atacante;

        UPDATE instanciaPokemon
        SET hp_atual = GREATEST(hp_atual - dano, 0)
        WHERE id = id_instancia_defensor;

        SELECT EXISTS(SELECT 1 FROM movimentoEfeito WHERE id_movimento = id_movimento_atacante) INTO existe_efeito;

        IF existe_efeito THEN

            SELECT id_efeito INTO id_efeito_defensor 
            FROM movimentoEfeito 
            WHERE id_movimento = id_movimento;


            INSERT INTO instanciaEfeito (id_instancia, id_efeito, turnos_restantes)
            VALUES (id_instancia_defensor, id_efeito_defensor, 5); 
        END IF;  
    END IF;
END;
$$ LANGUAGE plpgsql;
