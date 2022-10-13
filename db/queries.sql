

-- INSERT
INSERT INTO teams("name", created_at, updated_at) VALUES ('Englaterra', now(), now());

-- SELECT 
SELECT t.id, t."name", t.created_at, t.updated_at FROM teams t;

-- UPDATE 
UPDATE teams SET name = 'Inglaterra' WHERE id = 30;

-- DELETE 
DELETE FROM teams WHERE id = 30;

-- INNER JOIN
SELECT t."name" as "Team", g.title as "Cantidad de juegos"
FROM games g
INNER JOIN teams t on t.id = g.team1_id OR t.id = g.team2_id;

-- LEFT JOIN
SELECT t."name" as "Team", g.title as "Cantidad de juegos"
FROM teams t
LEFT JOIN games g on t.id = g.team1_id OR t.id = g.team2_id;

-- RIGHT JOIN
SELECT t."name" as "Team", g.title as "Cantidad de juegos"
FROM games g
RIGHT JOIN teams t on t.id = g.team1_id OR t.id = g.team2_id;

-- FULL OUTER JOIN
SELECT b.id as "Board ID", g.title, b.score1 as "Board score 1", b.score2 as "Board score 2", g.team1_score as "Game score 1", g.team2_score as "Game score 2"
FROM boards b
FULL OUTER JOIN games g on g.id = b.games_id;
