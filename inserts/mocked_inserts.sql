INSERT INTO regiao (nome) VALUES
('Kanto'),
('Johto'),
('Hoenn'),
('Sinnoh'),
('Unova');

INSERT INTO especiePokemon (nome, hp_base, ataque_base, defesa_base) VALUES
('Bulbasaur', 45, 49, 49),
('Charmander', 39, 52, 43),
('Squirtle', 44, 48, 65),
('Pikachu', 35, 55, 40),
('Eevee', 55, 55, 50);

INSERT INTO especieRegiao (id_regiao, id_especie) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

INSERT INTO evolucaoPokemon (id_pokemon_anterior, id_evolucao, xp_necessario) VALUES
(1, 2, 100),
(2, 3, 120),
(4, 5, 150);

INSERT INTO treinador (nome, genero, dinheiro) VALUES
('Ash', 'Male', 1000),
('Misty', 'Female', 800),
('Brock', 'Male', 1200);

INSERT INTO instanciaPokemon (id_especie, id_treinador, nome_dado, xp_atual, escolhido, hp_atual, ataque_atual, defesa_atual) VALUES
(1, 1, 'Bulby', 50, true, 45, 49, 49),
(3, 1, 'Squirt', 30, false, 44, 48, 65),
(4, 2, 'Pika', 20, true, 35, 55, 40);

INSERT INTO tipo (nome_tipo) VALUES
('Water'),
('Fire'),
('Grass'),
('Electric'),
('Normal');

INSERT INTO movimento (id_tipo, nome_movimento, dano_base) VALUES
(1, 'Hydro Pump', 90),
(2, 'Flamethrower', 95),
(3, 'Vine Whip', 45),
(4, 'Thunderbolt', 90),
(5, 'Tackle', 40);

INSERT INTO especieTipo (id_especie, id_tipo) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 4),
(5, 5);

INSERT INTO item (nome, tipo_item, preco, descricao) VALUES
('Potion', 'Healing', 50, 'Restores 20 HP'),
('Poke Ball', 'Capture', 100, 'Captures wild Pokemon'),
('Super Potion', 'Healing', 150, 'Restores 50 HP');

INSERT INTO itemTreinador (id_treinador, id_item, quantidade) VALUES
(1, 1, 3),
(2, 2, 5),
(3, 3, 2);

INSERT INTO efeito (nome, descricao) VALUES
('Paralysis', 'Temporarily paralyzes the Pokemon'),
('Poison', 'Poisons the Pokemon over time'),
('Confusion', 'Causes the Pokemon to become confused');

INSERT INTO instanciaEfeito (id_instancia, id_efeito, turnos_restantes) VALUES
(1, 1, 3),
(3, 2, 2);

INSERT INTO movimentoEfeito (id_movimento, id_efeito) VALUES
(1, 1),
(2, 2),
(3, 3);
