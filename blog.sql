CREATE DATABASE blog;
\c blog;
CREATE TABLE usuarios(
id SERIAL,
email VARCHAR(50),
PRIMARY KEY(id)
);
CREATE TABLE post(
id SERIAL,
usuario_id INT,
titulo VARCHAR(50),
fecha DATE,
PRIMARY KEY(id),
FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);
CREATE TABLE comentarios(
id SERIAL,
usuario_id INT,
post_id INT,
texto VARCHAR(30),
fecha DATE,
PRIMARY KEY(id),
FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
FOREIGN KEY(post_id) REFERENCES post(id)
);


SELECT usuario.email, usuario.id, post.titulo FROM post
INNER JOIN usuarios
ON usuarios.id = post.usuario_id;

SELECT usuario.email, post.id, post.titulo FROM post
INNER JOIN usuarios
ON usuarios.id = post.usuario_id WHERE id = 5;


SELECT usuario.email, post.id, comentarios.texto FROM usuarios
INNER JOIN comentarios
ON usuarios.id = comentarios.usuarios_id WHERE usuario.email != 'usuario06@gmail.com' ;

SELECT usuario.id, usuario.email FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id WHERE post.usuario_id IS NULL;

SELECT post.titulo, comentarios.texto FROM post
FULL OUTER JOIN comentarios
ON post.id = comenntarios.post_id;


SELECT usuarios.id, email.usuarios FROM usuarios
INNER JOIN post
ON usuarios.id = post.usuario_id WHERE DATE BETWEEN '2020-06-01' AND '2020-06-30';

--4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5
SELECT usuario.email, post.id, post.titulo FROM post
INNER JOIN usuarios
ON usuarios.id = post.usuario_id WHERE id = 5;
--5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
--por el usuario con email usuario06@hotmail.com.

SELECT usuario.email, post.id, comentarios.texto FROM usuarios
INNER JOIN comentarios
ON usuarios.id = comentarios.usuarios_id WHERE usuario.email != 'usuario06@gmail.com' ;
--6. Listar los usuarios que no han publicado ningún post.

SELECT usuario.id, usuario.email FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id WHERE post.usuario_id IS NULL;

--7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
--comentarios)
SELECT * FROM post AS p
LEFT JOIN comentarios AS com
ON p.id = com.post_id ORDER BY com.post_id ASC;

--8. Listar todos los usuarios que hayan publicado un post en Junio
SELECT u.* , p.fecha FROM usuarios AS u
INNER JOIN post AS P
ON u.id = p.usuario_id WHERE fecha BETWEEN '2020-06-01' AND '2020-06-30';

where extract(month from p.fecha) = 06;