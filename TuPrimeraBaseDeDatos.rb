# cat << EOF > ~/.sqliterc
# .headers on
# .mode column
# EOF

#
# SQLite version 3.8.5 2014-08-15 22:37:57
# Enter ".help" for usage hints.

# sqlite>

CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(64) NOT NULL,
  apellido  VARCHAR(64) NOT NULL,
  email VARCHAR(128) UNIQUE NOT NULL,
  fecha_nacimiento DATETIME NOT NULL,
  genero VARCHAR(10) NOT NULL
);

INSERT INTO usuarios
 (nombre, apellido, email, fecha_nacimiento, genero)
 VALUES
 ('Carlos', 'Ribero', 'carlos@yahoo.com', '1970-11-03', 'masculino');

 SELECT * FROM usuarios;

 INSERT INTO usuarios
 (nombre, apellido, email, fecha_nacimiento, genero)
 VALUES
 ('Karla', 'Robinson', 'karla@g.com', '1992-13-12', 'femenino');

 ALTER TABLE usuarios ADD COLUMN apodo VARCHAR(64);
.schema usuarios

sqlite> UPDATE usuarios
   ...> SET apodo = "Charlie"
   ...> WHERE id = 1;

UPDATE usuarios
SET apodo = "Kar"
WHERE id = 2;

SELECT * FROM usuarios;

UPDATE usuarios
SET apellido = "Rivero", fecha_nacimiento = "1980-11-03"
WHERE id = 1;