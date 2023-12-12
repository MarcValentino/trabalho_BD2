CREATE OR REPLACE FUNCTION verifica_limite_pokemon()
RETURNS TRIGGER AS $$
DECLARE
    qtd_pokemon INTEGER;
    max_pokemon INTEGER := 6;
BEGIN
    SELECT COUNT(*) INTO qtd_pokemon
    FROM instanciaPokemon
    WHERE id_treinador = NEW.id_treinador AND escolhido = TRUE;

    IF qtd_pokemon >= max_pokemon THEN
        RAISE EXCEPTION 'Limite máximo de Pokémon na equipe atingido!';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_verifica_limite
BEFORE INSERT OR UPDATE ON instanciaPokemon
FOR EACH ROW
EXECUTE FUNCTION verifica_limite_pokemon();