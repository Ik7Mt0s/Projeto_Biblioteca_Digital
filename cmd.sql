USE biblioteca_digital

SHOW TABLES;
SELECT * FROM autor;
SELECT * FROM livro;

SELECT * from livro_autor

UPDATE livro 
SET 
    titulo = 'Laços de Família',
    isbn = '978-85-359-1234-5',   -- ISBN fictício, mas único
    ano_publicacao = 1960,
    num_paginas = 176,
    id_categoria = 1,              -- Romance (ou mantenha 10? geralmente Romance)
    id_editora = 1                 -- Companhia das Letras (você pode escolher outra)
WHERE id_livro = 12;