--id,Pelicula,Año estreno,Director
CREATE DATABASE peliculas;
\c peliculas
CREATE TABLE peliculas (
 id INT,
 Pelicula VARCHAR(255),
 Año_estreno CHAR(4),
 Director VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE reparto (
 id INT,
 actor VARCHAR(50),
  FOREIGN KEY(id) REFERENCES peliculas(id)
);

\copy peliculas FROM '/home/alicia/Documentos/DESAFIO_LATAM/progresql/progresql_clase2_10062021/archivos/peliculas.csv' csv header;
COPY 100

SELECT  * FROM peliculas;

\copy reparto FROM '/home/alicia/Documentos/DESAFIO_LATAM/progresql/progresql_clase2_10062021/archivos/reparto.csv' csv header;

SELECT  * FROM reparto;
#
-- Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE id = 2;

--Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT * FROM reparto WHERE actor = 'Harrison Ford';

--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
--manera ascendente.

SELECT pelicula FROM peliculas WHERE Año_estreno BETWEEN '1990' AND '1999' ORDER BY pelicula ASC;
--  Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
--nombrado para la consulta como “longitud_titulo”.

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX(LENGTH(pelicula)) FROM peliculas;

-- nombre de la pelicula y solo un nombre del actor de pelicula

SELECT actor , pelicula FROM reparto
INNER JOIN peliculas
ON reparto.id = peliculas.id
WHERE peliculas.id = 2
LIMIT 1;