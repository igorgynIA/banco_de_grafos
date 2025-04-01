//Colocamos aqui as consultas que devem ser feitas para manipular o banco previamente criado, tirando visualizações interessantes para o projeto

//Visualizar os treinadores
MATCH (n:COACH) RETURN n;

//Visualizar os joagdores
MATCH (n:PLAYER) RETURN n;

//Visualizar os times
MATCH (n:TEAM) RETURN n;

//Visualizar a relação de companheiro de times
MATCH p=()-[:TEAMMATES]->() RETURN p;

//Visualizar a relação entre treinadores e times
MATCH p=()-[:COACHES_FOR]->() RETURN p LIMIT 25;

//Visualizar relação entre treinadores e jogadores
MATCH p=()-[:COACHES]->() RETURN p;

//Tabela com nome dos jodores e suas respectivas idades
MATCH (player:PLAYER) RETURN player.name, player.age;

//Jogadores com mais de 30 anos
MATCH (n) WHERE n.age > 30 RETURN n;

//filtra um jogador em específico
MATCH (player:PLAYER)
WHERE player.name = "Jayson Tatum"
RETURN player;

//Times que possuem jogadores maiores que 2 metros
MATCH (player: PLAYER), (team: TEAM)
WHERE player.height > 2.00
RETURN player, team;


////// SIMULAÇÃO DA TROCA ENTRE ANTHONY EDWARDS E LUKA DONCIC //////////Q
// Trocar relações SAINDO de doncic para anthony
//Alternativa "Esperta" para não ter que reconstruir relações de fato, apenas alteramos os dados

// Passo 1: pegar os dados de cada jogador
MATCH (a:PLAYER {name: "Luka Doncic"}), (b:PLAYER {name: "Anthony Davis"})
WITH a, b,
     a.name AS nameA, a.age AS ageA, a.number AS numberA, a.height AS heightA, a.weight AS weightA,
     b.name AS nameB, b.age AS ageB, b.number AS numberB, b.height AS heightB, b.weight AS weightB

// Passo 2: trocar os dados
SET a.name = nameB, a.age = ageB, a.number = numberB, a.height = heightB, a.weight = weightB,
    b.name = nameA, b.age = ageA, b.number = numberA, b.height = heightA, b.weight = weightA