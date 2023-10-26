/* Create Database */
CREATE DATABASE baseball_db;

USE baseball_db;

/* Create Tables */

CREATE TABLE teams (
  team_id INT AUTO_INCREMENT PRIMARY KEY,
  team_name VARCHAR(50)
);

CREATE TABLE players (
  player_id INT AUTO_INCREMENT PRIMARY KEY,  
  team_id INT,
  player_name VARCHAR(50),  
  position ENUM('pitcher', 'catcher', 'infielder', 'outfielder'),
  bat BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE pitchers (
  pitcher_id INT PRIMARY KEY,
  FOREIGN KEY (pitcher_id) REFERENCES players(player_id),
  wins INT,
  losses INT, 
  era DECIMAL(3,2)
);

CREATE TABLE catchers (
  catcher_id INT PRIMARY KEY,
  FOREIGN KEY (catcher_id) REFERENCES players(player_id),
  assists INT,
  passed_balls INT
);

CREATE TABLE infielders (
  infielder_id INT PRIMARY KEY,
  FOREIGN KEY (infielder_id) REFERENCES players(player_id),
  assists INT,
  errors INT
);

CREATE TABLE outfielders (
  outfielder_id INT PRIMARY KEY,
  FOREIGN KEY (outfielder_id) REFERENCES players(player_id),
  assists INT, 
  errors INT
);

CREATE TABLE batters (
  batter_id INT PRIMARY KEY,
  FOREIGN KEY (batter_id) REFERENCES players(player_id),
  at_bats INT,
  hits INT,
  homeruns INT,
  batting_avg DECIMAL(3,2)
);

/* Views for Python */

CREATE VIEW player_info AS
  SELECT player_id, player_name, position
  FROM players;

CREATE VIEW batter_stats AS
  SELECT batter_id, at_bats, hits, homeruns, batting_avg
  FROM batters;

/* Insert Data */

INSERT INTO teams (team_name) 
VALUES
  ('Tigers');

/* Players */

INSERT INTO players (team_id, player_name, position)
VALUES
  (1, 'John Smith', 'catcher'),
  (1, 'Mike Johnson', 'catcher'),

  (1, 'David Price', 'pitcher'),
  (1, 'Max Scherzer', 'pitcher'),
  (1, 'Justin Verlander', 'pitcher'),
  (1, 'Rick Porcello', 'pitcher'),
  (1, 'Chris Sale', 'pitcher'),

  (1, 'Miguel Cabrera', 'infielder'),
  (1, 'Ian Kinsler', 'infielder'),
  (1, 'Jose Altuve', 'infielder'),
  (1, 'Elvis Andrus', 'infielder'),
  (1, 'Francisco Lindor', 'infielder'),
  (1, 'Xander Bogaerts', 'infielder'),
  (1, 'Carlos Correa', 'infielder'),  
  (1, 'Javier Baez', 'infielder'),
  (1, 'Trevor Story', 'infielder'),
  (1, 'Alex Bregman', 'infielder'),

  (1, 'Mike Trout', 'outfielder'),
  (1, 'Bryce Harper', 'outfielder'),
  (1, 'Mookie Betts', 'outfielder'),
  (1, 'J.D. Martinez', 'outfielder'),
  (1, 'Christian Yelich', 'outfielder'),
  (1, 'Ronald Acuna Jr.', 'outfielder'),
  (1, 'Aaron Judge', 'outfielder'),
  (1, 'Giancarlo Stanton', 'outfielder'),
  (1, 'George Springer', 'outfielder'),
  (1, 'Charlie Blackmon', 'outfielder');

/* Catchers */

INSERT INTO catchers (catcher_id, assists, passed_balls)
VALUES
  (1, 75, 3),
  (2, 50, 1);

/* Pitchers */

INSERT INTO pitchers (pitcher_id, wins, losses, era)
VALUES
  (3, 10, 5, 3.20),
  (4, 12, 6, 2.90),
  (5, 9, 8, 4.15),
  (6, 7, 9, 4.60),
  (7, 5, 4, 3.80);

/* Infielders */

INSERT INTO infielders (infielder_id, assists, errors) 
VALUES
  (8, 82, 7),
  (9, 75, 10),
  (10, 90, 5),
  (11, 100, 11),
  (12, 120, 9),
  (13, 88, 12),
  (14, 92, 8),
  (15, 98, 10),
  (16, 85, 7),
  (17, 90, 9);

/* Outfielders */

INSERT INTO outfielders (outfielder_id, assists, errors)
VALUES 
  (18, 3, 1),
  (19, 5, 2), 
  (20, 4, 0),
  (21, 8, 3),
  (22, 2, 1),
  (23, 10, 1),
  (24, 5, 1),
  (25, 7, 2), 
  (26, 6, 0),
  (27, 2, 1);

 /* Batters */

INSERT INTO batters (batter_id, at_bats, hits, homeruns, batting_avg)
VALUES
  (8, 450, 125, 30, .278),
  (9, 425, 112, 22, .264),
  (10, 375, 98, 15, .261), 
  /*... other batter stats ...*/
  (18, 500, 140, 35, .280);