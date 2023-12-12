CREATE OR REPLACE FUNCTION usarItem(id_treinador_uso INT, id_item_usar INT)
RETURNS VOID AS $$
BEGIN
    UPDATE itemTreinador
    SET quantidade = quantidade - 1
    WHERE id_treinador = id_treinador_uso AND id_item = id_item_usar AND quantidade > 0;

    IF (SELECT quantidade FROM itemTreinador WHERE id_treinador = id_treinador_uso AND id_item = id_item_usar) = 0 THEN
        DELETE FROM itemTreinador
        WHERE id_treinador = id_treinador_uso AND id_item = id_item_usar;
    END IF;
END;
$$ LANGUAGE plpgsql;
