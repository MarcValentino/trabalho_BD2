-- Quais são as evoluções de um Pokémon com id X?
SELECT ep.id_pokemon_anterior, ep1.nome as nome_anterior, ep.id_evolucao, ep2.nome AS nome_evolucao, ep.xp_necessario
FROM evolucaoPokemon ep
JOIN especiePokemon ep1 ON ep.id_pokemon_anterior = ep1.id
JOIN especiePokemon ep2 ON ep.id_evolucao = ep2.id
WHERE ep1.id = 1;

-- Todos os pokémons de um treinador
SELECT ip.*, ep.nome AS nome_especie
FROM instanciaPokemon ip
JOIN especiePokemon ep ON ip.id_especie = ep.id
WHERE ip.id_treinador = 2;

-- Todos os itens na mochila de um treinador
SELECT it.*, itt.quantidade
FROM itemTreinador itt
JOIN item it ON itt.id_item = it.id
WHERE itt.id_treinador = 2;

-- Todos os pokémons que spawnam em uma região
SELECT ep.*, er.id_regiao
FROM especieRegiao er
JOIN especiePokemon ep ON er.id_especie = ep.id
WHERE er.id_regiao = 1;

-- Quantidade de treinadores por insignia
select i.nome, i.id, COUNT(*) AS quantidade_treinadores
FROM instanciaInsignia ii
join insignia i on i.id = ii.id_insignia
group by i.id
order by i.id;

-- Quais treinadores têm todas as insígnias
SELECT t.id, t.nome
FROM treinador t
WHERE NOT EXISTS (
    SELECT i.id
    FROM insignia i
    WHERE NOT EXISTS (
        SELECT 1
        FROM instanciaInsignia ii
        WHERE ii.id_insignia = i.id AND ii.id_treinador = t.id
    )
);

-- Movimentos que causam determinado efeito
SELECT m.*, e.nome AS nome_efeito
FROM movimentoEfeito me
JOIN movimento m ON me.id_movimento = m.id
JOIN efeito e ON me.id_efeito = e.id
WHERE e.nome = 'dano';

-- Movimentos que um Pokémon X pode aprender
SELECT m.*, et.id_especie
FROM especieTipo et
JOIN movimento m ON et.id_tipo = m.id_tipo
WHERE et.id_especie = 2;

-- Condições que estão afetando um determinado Pokémon
SELECT e.*, ie.turnos_restantes
FROM instanciaEfeito ie
JOIN efeito e ON ie.id_efeito = e.id
WHERE ie.id_instancia = 1;

-- Quais são os 10 Pokémon mais populares (contagem de indivíduos de cada espécie)
SELECT ep.id, ep.nome, COUNT(*) AS quantidade
FROM instanciaPokemon ip
JOIN especiePokemon ep ON ip.id_especie = ep.id
GROUP BY ep.id, ep.nome
ORDER BY quantidade DESC
LIMIT 10;

-- Quais são os 10 Pokémon mais fáceis de encontrar (os que aparecem em mais regiões)
SELECT ep.id, ep.nome, COUNT(DISTINCT er.id_regiao) AS quantidade_regioes
FROM especieRegiao er
JOIN especiePokemon ep ON er.id_especie = ep.id
GROUP BY ep.id, ep.nome
ORDER BY quantidade_regioes DESC
LIMIT 10;
