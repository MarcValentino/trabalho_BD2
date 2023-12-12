CREATE OR REPLACE FUNCTION verifica_tipo_movimento_pokemon()
RETURNS TRIGGER AS $$
DECLARE
    tipos_pokemon INTEGER[];
    tipo_movimento INTEGER;
BEGIN
    SELECT ARRAY(SELECT id_tipo FROM especieTipo WHERE id_especie = (SELECT id_especie FROM instanciaPokemon WHERE id = NEW.id_instancia)) INTO tipos_pokemon;

    SELECT id_tipo INTO tipo_movimento FROM movimento WHERE id = NEW.id_movimento;

    IF NOT (tipo_movimento = ANY(tipos_pokemon)) THEN
        RAISE EXCEPTION 'O movimento não é do mesmo tipo que o Pokémon!';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verifica_tipo_movimento
BEFORE INSERT ON instanciaMovimento
FOR EACH ROW
EXECUTE FUNCTION verifica_tipo_movimento_pokemon();