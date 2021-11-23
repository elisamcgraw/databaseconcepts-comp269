-- NBA in-class Project

DROP DATABASE IF EXISTS nba;
CREATE DATABASE nba;
use nba;

-- Tables
CREATE TABLE teams
(
team_id				INT PRIMARY KEY		AUTO_INCREMENT,
team				VARCHAR(200)		NOT NULL,
player_id			INT					DEFAULT NULL REFERENCES players(player_id)
);

CREATE TABLE players_positions
(
position_id			INT		 	PRIMARY KEY		AUTO_INCREMENT,
position			VARCHAR(50)			NOT NULL,
player_id			INT					DEFAULT NULL REFERENCES players(player_id)
);

CREATE TABLE players_universities
(
university_id		INT		PRIMARY KEY		AUTO_INCREMENT,
university			VARCHAR(200)		NOT NULL,
player_id			INT					DEFAULT NULL REFERENCES players(player_id)
);

CREATE TABLE countries
(
country_id			INT 	PRIMARY KEY		AUTO_INCREMENT,
country				VARCHAR(200)		NOT NULL,
player_id			INT					DEFAULT NULL REFERENCES players(player_id)
);

CREATE TABLE arenas	
(
arena_id			INT PRIMARY KEY		AUTO_INCREMENT,
arena_name 			VARCHAR(200)		NOT NULL,
team_id 			INT 				DEFAULT NULL,

CONSTRAINT arena_home_team_fk 		
	FOREIGN KEY (team_id)
    REFERENCES teams(team_id)
);

CREATE TABLE games
(
team_id				INT 				DEFAULT NULL,
game_date			DATETIME			DEFAULT NULL,
arena_id			INT					DEFAULT NULL,

CONSTRAINT game_team_fk
	FOREIGN KEY  (team_id)
    REFERENCES teams(team_id),
CONSTRAINT 	game_arena_fk
	FOREIGN KEY  (arena_id)
	REFERENCES arenas(arena_id)
);

CREATE TABLE players
(
player_id 			INT PRIMARY KEY		AUTO_INCREMENT,
player_first_name 	VARCHAR(200)		NOT NULL,
player_last_name	VARCHAR(200)		NOT NULL,
team_id				INT					DEFAULT NULL,
player_height		VARCHAR(10)			NOT NULL,
player_weight		VARCHAR(10)			NOT NULL,
player_age			VARCHAR(10)			NOT NULL,
position_id			INT					DEFAULT NULL,
country_id			INT					DEFAULT NULL,
university_id		INT					DEFAULT NULL,

CONSTRAINT players_teams_fk
    FOREIGN KEY (team_id)
    REFERENCES teams(team_id),
CONSTRAINT position_fk
	FOREIGN KEY (position_id)
    REFERENCES players_positions(position_id),
CONSTRAINT country_fk
	FOREIGN KEY (country_id)
    REFERENCES countries (country_id),
CONSTRAINT university_fk
	FOREIGN KEY (university_id)
    REFERENCES players_universities(university_id)
);


-- Insert
INSERT INTO teams (team_id, team) VALUES
(1,'Lakers'),
(2,'Bulls'),
(3,'Celtics'),
(4,'Magic'),
(5,'Knicks');

INSERT INTO players_universities(university_id,university) VALUES
(1, 'Duke'),
(2,'UCLA'),
(3,'Kentucky'),
(4,'UNLV'),
(5,'Florida St'),
(6,'Kansas');

INSERT INTO countries(country_id, country) VALUES
(1,'Germany'),
(2,'Serbai'),
(3,'Croatia'),
(4,'USA');

INSERT INTO players_positions(position_id, position) VALUES
(1, 'Shooting Guard'),
(2,'Small Forward'),
(3,'Point Guard'),
(4,'Center');

INSERT INTO arenas (arena_id,arena_name) VALUES
(1,'Wells Fargo'),
(2,'American Airlines'),
(3,'Staples Center'),
(4,'Quicken Loans Arena'),
(5,'United Center');

INSERT INTO players (player_first_name, player_last_name, player_height, player_weight, player_age) VALUES
('Giannis', 'Antetokoumpo','6 11','242','23'),
('Mike', 'Conlev', '6 1', '175', '25'),
('Stephen', 'Curry', '6 3' , '190', '30'),
('DeMar', 'DeRozan', '6 7', '230', '27'),
('Kyrie','Irving', '6 5', '225', '29'),
('John', 'Wall','6 4', '210','28'),
('Thaddeus','Young','6 8' ,'221','30');








