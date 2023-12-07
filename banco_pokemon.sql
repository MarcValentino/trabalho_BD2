create table if not exists regiao (
	id serial primary key,
	nome varchar(255)
);

create table if not exists especiePokemon (
    id serial primary key,
    nome varchar(255),
    hp_base int,
    ataque_base int,
    defesa_base int
);

create table if not exists especieRegiao(
	id serial primary key,
	id_regiao int,
	id_especie int,
	foreign key (id_regiao) references regiao(id),
	foreign key (id_especie) references especiePokemon(id)
);

create table if not exists evolucaoPokemon (
	id serial primary key,
	id_pokemon_anterior int,
	id_evolucao int,
	xp_necessario int,
	foreign key (id_pokemon_anterior) references especiePokemon(id),
	foreign key (id_evolucao) references especiePokemon(id)
);

create table if not exists treinador (
	id serial primary key,
	nome varchar(255),
	genero varchar(255),
	dinheiro int
);

create table if not exists instanciaPokemon (
	id serial primary key,
	id_especie int,
	id_treinador int,
	nome_dado varchar(255),
	xp_atual int,
    escolhido boolean default false,
	hp_atual int,
	ataque_atual int,
	defesa_atual int,
	foreign key (id_especie) references especiePokemon(id),
	foreign key (id_treinador) references treinador(id)
);

create table if not exists tipo (
	id serial primary key,
	nome_tipo varchar(255)
);

create table if not exists movimento (
	id serial primary key,
	id_tipo int,
	nome_movimento varchar(255),
	dano_base int,
	foreign key (id_tipo) references tipo(id)
);

create table if not exists especieTipo (
	id serial primary key,
	id_especie int,
	id_tipo int,
	foreign key (id_especie) references especiePokemon(id),
	foreign key (id_tipo) references tipo(id)
);

create table if not exists item (
	id serial primary key,
	nome varchar(255),
	tipo_item varchar(255),
	preco int,
	descricao text
);

create table if not exists itemTreinador (
	id serial primary key,
	id_treinador int,
	id_item int,
	quantidade int,
	foreign key (id_treinador) references treinador(id),
	foreign key (id_item) references item(id)
);

create table if not exists efeito (
	id serial primary key,
	nome varchar(255),
	descricao text
);

create table if not exists instanciaEfeito (
	id serial primary key,
	id_instancia int,
	id_efeito int,
	turnos_restantes int,
	foreign key (id_instancia) references instanciaPokemon(id),
	foreign key (id_efeito) references efeito(id)
);

create table if not exists movimentoEfeito (
	id serial primary key,
	id_movimento int,
	id_efeito int,
	foreign key (id_movimento) references movimento(id),
	foreign key (id_efeito) references efeito(id)
);

create table if not exists insignia (
	id serial primary key,
	nome varchar(255)
);

create table if not exists instanciaInsignia (
	id serial primary key,
	id_insignia int,
	id_treinador int,
	foreign key (id_insignia) references insignia(id),
	foreign key (id_treinador) references treinador(id)
);
