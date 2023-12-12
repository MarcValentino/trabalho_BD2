CREATE OR REPLACE FUNCTION comprarItem(id_treinador_compra INT, id_item_comprar INT, quantidade_compra INT)
RETURNS VOID AS $$
DECLARE
    preco_total INT;
    dinheiro_carteira INT;
BEGIN
    SELECT preco * quantidade_compra INTO preco_total 
    FROM item 
    WHERE id = id_item_comprar;

    SELECT dinheiro INTO dinheiro_carteira
    FROM treinador
    WHERE id = id_treinador_compra;

    IF (dinheiro_carteira >= preco_total) THEN

        UPDATE treinador 
        SET dinheiro = dinheiro_carteira - preco_total 
        WHERE id = id_treinador_compra;

        IF EXISTS (SELECT * FROM itemTreinador WHERE id_treinador = id_treinador_compra AND id_item = id_item_comprar) THEN
            UPDATE itemTreinador 
            SET quantidade = quantidade + quantidade_compra 
            WHERE id_treinador = id_treinador_compra AND id_item = id_item_comprar;
        ELSE
            INSERT INTO itemTreinador (id_treinador, id_item, quantidade) 
            VALUES (id_treinador_compra, id_item_comprar, quantidade_compra);
        END IF;

    ELSE
        RAISE EXCEPTION 'Dinheiro insuficiente.';
    END IF;
END;
$$ LANGUAGE plpgsql;
