CREATE DATABASE post;

CREATE TABLE post (
    id SERIAL,
    nombre VARCHAR(25),
    fecha DATE,
    contenido VARCHAR,
    descripcion VARCHAR,
    PRIMARY KEY (id)
);

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (1, 'Pamela', current_date, 'contenido 1', 'descripcion 1');

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (2, 'Pamela', current_date, 'contenido 2', 'descripcion 2');

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (3, 'Carlos', current_date, 'contenido 3', 'descripcion 3');

ALTER TABLE post
ADD titulo VARCHAR(20);

UPDATE post SET titulo = 'titulo 1'
WHERE id = 1;

UPDATE post SET titulo = 'titulo 2'
WHERE id = 2;

UPDATE post SET titulo = 'titulo 3'
WHERE id = 3;

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (4, 'Pedro', current_date, 'contenido 4', 'descripcion 4');

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (5, 'Pedro', current_date, 'contenido 5', 'descripcion 5');

DELETE FROM  post WHERE nombre = 'Carlos';

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES (6, 'Carlos', current_date, 'contenido 6', 'descripcion 6');


-- punto 2--

CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    fecha DATE,
    hora TIME,
    contenido VARCHAR,
    PRIMARY KEY(id),
    FOREIGN KEY(post_id) REFERENCES post(id)
);

INSERT INTO  (post_id, fecha, hora, contenido) 
VALUES (1, current_date, current_time,'el re contenido re ortiva');

INSERT INTO  (post_id, fecha, hora, contenido) 
VALUES (2, current_date, current_time,'el re contenido re ortiva imanacion');

INSERT INTO  (post_id, fecha, hora, contenido) 
VALUES (6, current_date, current_time,'el re contenido re ortiva imanacion, eso dale');

INSERT INTO post (id, nombre, fecha, contenido, descripcion) 
VALUES ('Margarita', current_date, 'contenido 7', 'descripcion 7');

INSERT INTO  (post_id, fecha, hora, contenido) 
VALUES (7, current_date, current_time,'padsa el numero');
