USE prueba;

DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Author;

-- Creo tabla de autores
CREATE TABLE Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Creo tabla de publicaciones
CREATE TABLE Post (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Inserto autores
INSERT INTO Author (name) VALUES 
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

-- Inserto publicaciones
INSERT INTO Post (author_id, title, word_count, views) VALUES
(1, 'Best Paint Colors', 814, 14),
(2, 'Small Space Decorating Tips', 1146, 221),
(1, 'Hot Accessories', 986, 105),
(1, 'Mixing Textures', 765, 22),
(2, 'Kitchen Refresh', 1242, 307),
(1, 'Homemade Art Hacks', 1002, 193),
(3, 'Refinishing Wood Floors', 1571, 7542);

-- Consulto información unificada
SELECT p.title, a.name AS author, p.word_count, p.views
FROM Post p
JOIN Author a ON p.author_id = a.author_id;