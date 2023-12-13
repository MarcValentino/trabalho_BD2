CREATE INDEX idx_evolucaoPokemon_id_pokemon_anterior
ON evolucaoPokemon using hash (id_pokemon_anterior);

CREATE INDEX idx_evolucaoPokemon_id_evolucao
ON evolucaoPokemon using hash (id_evolucao);

CREATE INDEX idx_especiePokemon_id
ON especiePokemon using hash (id);

CREATE INDEX idx_instanciaPokemon_id_treinador
ON instanciaPokemon using hash (id_treinador);

CREATE INDEX idx_instanciaPokemon_id_especie
ON instanciaPokemon using hash (id_especie);

CREATE INDEX idx_itemTreinador_id_treinador
ON itemTreinador using hash (id_treinador);

CREATE INDEX idx_itemTreinador_id_item
ON itemTreinador using hash (id_item);

CREATE INDEX idx_item_id
ON item using hash (id);

CREATE INDEX idx_especieRegiao_id_regiao
ON especieRegiao using hash (id_regiao);

CREATE INDEX idx_instanciaInsignia_id_insignia
ON instanciaInsignia using hash (id_insignia);

CREATE INDEX idx_insignia_id
ON insignia using hash (id);

CREATE INDEX idx_movimentoEfeito_id_efeito
ON movimentoEfeito using hash (id_efeito);

CREATE INDEX idx_movimento_id
ON movimento using hash (id);

CREATE INDEX idx_especieTipo_id_especie
ON especieTipo using hash (id_especie);

CREATE INDEX idx_movimento_id_tipo
ON movimento using hash (id_tipo);

CREATE INDEX idx_instanciaEfeito_id_instancia
ON instanciaEfeito using hash (id_instancia);

CREATE INDEX idx_efeito_id
ON efeito using hash (id);

CREATE INDEX idx_especieRegiao_id_especie
ON especieRegiao using hash (id_especie);