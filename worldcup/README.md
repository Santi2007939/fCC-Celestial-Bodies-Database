# SQL Project fCC: World Cup Database

## Description:
This is a database of the World Cup in 2014 and 2018, the data is provided by a "txt" file. I only do this to revise PSQL and resolve the freeCodeCamp project. Please, don't take this as something important, only entertainment.

<p align="center">
  <img width="400" height="400" src="src/icon.png">
</p>

## Setup:
In "worldcup.sql" revise all "TO owner" you need to change it to your user.

### Setup database
```BASH
  psql -U postgres < worldcup.sql
```

### Setup data
The information is in the "games.csv" file, if you want, you can edit the data.
```BASH
  ./insert_data.sh
```

### Call queries
There are queries, which will give you different information
```BASH
  ./queries.sh
```

### Save changes
```BASH
  pg_dump -cC --inserts -U (psql-user) universe > universe.sql
```

## Tables

### teams
| team_id |     name      |
|---------|---------------|
|       1 | France|
|       2 | Croatia|
|       3 | Belgium|
|       4 | England|
|       5 | Russia|
|       6 | Sweden|
 |      7 | Brazil|
|       8 | Uruguay|

<p align="center">
  <img width="150" height="150" src="src/teams.png">
</p>

### games
| game_id | year |     round     | winner_id | opponent_id | winner_goals | opponent_goals |
|---------|------|---------------|-----------|-------------|--------------|----------------|
|       1 | 2018 | Final         |         1 |           2 |            4 |              2|
|       2 | 2018 | Third Place   |         3 |           4 |            2 |              0|
|       3 | 2018 | Semi-Final    |         2 |           4 |            2 |              1|

<p align="center">
  <img width="150" height="150" src="src/games.png">
</p>

## Consults

### Consult #1
List of teams who played in the 2014 'Eighth-Final' round:

```SQL
  SELECT team_name FROM (SELECT teams_winner.name AS team_name FROM games LEFT JOIN teams AS teams_winner ON teams_winner.team_id = games.winner_id WHERE year='2014' AND round='Eighth-Final' UNION SELECT teams_loser.name AS team_name FROM games LEFT JOIN teams AS teams_loser ON teams_loser.team_id = games.opponent_id  WHERE year='2014' AND round='Eighth-Final') AS all_teams ORDER BY team_name
```

### Consult #2
Year and team name of all the champions:

```SQL
  SELECT year, name FROM games FULL JOIN teams ON teams.team_id = games.winner_id WHERE round='Final' ORDER BY year
```
