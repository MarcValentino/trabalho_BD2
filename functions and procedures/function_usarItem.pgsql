CREATE OR REPLACE FUNCTION atacar(id_instancia_atacante INT, id_instancia_defensor INT, id_movimento INT)
RETURNS VOID AS $$
DECLARE
    dano INT;
BEGIN
    SELECT dano_base INTO dano 
    FROM movimento 
    WHERE id = id_movimento;

    UPDATE instanciaPokemon
    SET hp_atual = GREATEST(hp_atual - dano, 0)
    WHERE id = id_instancia_defensor;

    -- Adicione aqui lógica adicional se necessário.
END;
$$ LANGUAGE plpgsql;
