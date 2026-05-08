USE biblioteca_digital;
SHOW TABLES;

-- ================================================================= --
SELECT id_emprestimo, data_emprestimo, data_prevista, id_usuario
FROM emprestimo
WHERE data_emprestimo BETWEEN '2026-04-20' AND '2026-04-25'
ORDER BY data_emprestimo DESC;

-- ================================================================= --
-- Usuários com empréstimo
SELECT id_usuario, nome FROM usuario
WHERE id_usuario IN (SELECT DISTINCT id_usuario FROM emprestimo);

-- Usuários sem empréstimo
SELECT id_usuario, nome FROM usuario
WHERE id_usuario NOT IN (SELECT DISTINCT id_usuario FROM emprestimo);

-- ================================================================= --
SELECT titulo, num_paginas, ano_publicacao
FROM livro
WHERE num_paginas >= 500 OR ano_publicacao >= 2000;

-- ================================================================= --
SELECT l.titulo, COUNT(ie.id_livro) AS total_emprestimos
FROM livro l
JOIN item_emprestimo ie ON l.id_livro = ie.id_livro
GROUP BY l.id_livro
ORDER BY total_emprestimos DESC
LIMIT 5;

-- ================================================================= --
SELECT c.nome AS categoria, COUNT(l.id_livro) AS total_livros
FROM categoria c
LEFT JOIN livro l ON c.id_categoria = l.id_categoria
GROUP BY c.id_categoria;

-- ================================================================= --
SELECT 
    SUM(valor) AS total_multas,
    MIN(valor) AS menor_multa,
    MAX(valor) AS maior_multa
FROM multa;

-- ================================================================= --
SELECT e.id_emprestimo, u.nome AS usuario, l.titulo AS livro, e.data_emprestimo
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id_usuario
JOIN item_emprestimo ie ON e.id_emprestimo = ie.id_emprestimo
JOIN livro l ON ie.id_livro = l.id_livro;

-- ================================================================= --
SELECT u.id_usuario, u.nome, e.id_emprestimo, e.data_emprestimo
FROM usuario u
LEFT JOIN emprestimo e ON u.id_usuario = e.id_usuario
ORDER BY u.nome;

-- ================================================================= --
SELECT a.nome AS autor, l.titulo AS livro
FROM livro_autor la
RIGHT JOIN autor a ON la.id_autor = a.id_autor
LEFT JOIN livro l ON la.id_livro = l.id_livro;

-- ================================================================= --
-- UNION (sem duplicatas)
SELECT titulo AS descricao, 'livro' AS tipo FROM livro
UNION
SELECT nome, 'usuario' FROM usuario;

-- UNION ALL (mantém todas as linhas)
SELECT titulo, 'livro' FROM livro
UNION ALL
SELECT nome, 'usuario' FROM usuario;