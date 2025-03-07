CREATE schema musicview;

USE musicview;

CREATE TABLE usuarios (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
contraseña VARCHAR(250) NOT NULL,
fecha_usuario TIMESTAMP NOT NULL
);

CREATE TABLE artista (
id_artista INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (200) NOT NULL,
nacionalidad VARCHAR (100),
fecha_nacimiento DATE,
description TEXT
); 

CREATE TABLE albumes (
id_album INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (200) NOT NULL,
id_artista INT NOT NULL, 
año INT NOT NULL,
duracion INT,
description TEXT,
puntuacion_promedio DECIMAL CHECK (puntuacion_promedio BETWEEN 1 AND 10)
);
CREATE TABLE generos (
id_generos INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL
);
CREATE TABLE reseñas (
id_reseña INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_album INT NOT NULL,
puntuacion INT CHECK (puntuacion BETWEEN 1 AND 10),
description TEXT, 
fecha TIMESTAMP
);
CREATE TABLE listas (
id_lista INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
nombre VARCHAR(150) NOT NULL,
description TEXT,
fecha_de_creacion TIMESTAMP
);

ALTER TABLE albumes ADD CONSTRAINT fk_album_artista 
FOREIGN KEY (id_artista) REFERENCES artista (id_artista);

ALTER TABLE reseñas ADD CONSTRAINT fk_reseña_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario);

ALTER TABLE reseñas ADD CONSTRAINT fk_reseña_album
FOREIGN KEY (id_album) REFERENCES albumes (id_album);

ALTER TABLE listas ADD CONSTRAINT fk_lista_usuario
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);