SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%Y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE '%ia'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
 WHERE name LIKE '%o__o%'

SELECT name FROM world
 WHERE name LIKE '____'

SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >= 200000000

SELECT name, GDP/population FROM world
WHERE population >= 200000000

SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

SELECT name FROM world
WHERE name LIKE ('%United%')

SELECT name, population, area FROM world
WHERE (area >= 3000000) OR (population >= 250000000)

SELECT name, population, area FROM world
WHERE (area >= 3000000) XOR (population >= 250000000)

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world
WHERE continent = 'South America'

SELECT name, ROUND(GDP/population, -3) FROM world
WHERE GDP >= 1000000000000

SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital

SELECT name FROM world
WHERE name LIKE '%a%' AND
name LIKE '%e%' AND
name LIKE '%i%' AND
name LIKE '%o%' AND
name LIKE '%u%' AND
name NOT LIKE '% %'

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
WHERE continent = 'Europe' AND GDP/population > (SELECT GDP/population FROM world WHERE name = 'United Kingdom')

SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%') FROM world
WHERE continent = 'Europe'

SELECT SUM(population)
FROM world

SELECT DISTINCT continent FROM world

SELECT SUM(GDP) FROM world
WHERE continent = 'Africa'

SELECT COUNT(name) FROM world
WHERE area >= 1000000

SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name) FROM world
GROUP BY continent

SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

SELECT team1, team2, player FROM game JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid = id)
 WHERE gtime<=10

 SELECT mdate, teamname FROM eteam JOIN game ON (eteam.id = team1)
WHERE coach = 'Fernando Santos'

SELECT player FROM goal JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
  FROM game JOIN goal ON (id = matchid) 
    WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER')

    SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON (eteam.id=teamid)
 GROUP BY teamname

 SELECT stadium, COUNT(*) FROM game JOIN goal ON (matchid = id)
GROUP BY stadium

SELECT id, mdate, COUNT(*)
FROM game
JOIN goal
ON id = matchid
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY id, mdate;

