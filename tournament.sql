-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Helps avoid errors
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

-- connect to new db
\c tournament;

-- Creates tables inside the 'tournament' DB
-- Provides id and name of players
CREATE TABLE players (
	ID serial PRIMARY KEY,
	name text
);

-- Provides the winner/losers ID from each match
CREATE TABLE each_match (
	winner_id INTEGER references players,
	loser_id INTEGER references players,
	PRIMARY KEY(winner_id, loser_id)
);

-- Provides how many wins each player has
CREATE VIEW wins AS
	SELECT players.id, count(each_match.winner_id) 
	AS wins
	FROM players
	LEFT JOIN each_match
	ON players.id=each_match.winner_id
	GROUP BY players.id
	ORDER BY wins
	DESC;

-- Provides how many matches each player has played
CREATE VIEW matches AS
	SELECT players.id, count(each_match.*) 
	AS matches
	FROM players
	LEFT JOIN each_match
	ON players.id=each_match.winner_id
	OR players.id=each_match.loser_id
	GROUP BY players.id
	ORDER BY players.id;

-- Provides a list of players with their wins and matches
CREATE VIEW player_standings AS
	SELECT players.id, players.name, wins.wins, matches.matches
	FROM players
	JOIN wins
	ON players.id=wins.id
	JOIN matches
	ON wins.id=matches.id
	ORDER BY wins.wins 
	DESC, players.id 
	ASC;