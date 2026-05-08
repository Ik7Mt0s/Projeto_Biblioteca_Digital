-- ==================================================
-- POPULANDO O BANCO "biblioteca_digital"
-- Mínimo de 10 registros por tabela
-- ==================================================

USE biblioteca_digital;

-- 1. CATEGORIA (10 registros)
INSERT INTO categoria (nome, descricao) VALUES
('Romance', 'Livros que abordam relações amorosas e emocionais'),
('Ficção Científica', 'Narrativas futuristas e tecnológicas'),
('Fantasia', 'Mundos imaginários, magia e criaturas míticas'),
('Suspense', 'Histórias que geram tensão e mistério'),
('Biografia', 'Relatos da vida de pessoas reais'),
('Autoajuda', 'Livros com foco em desenvolvimento pessoal'),
('Infantil', 'Literatura voltada para crianças'),
('Didático', 'Material educacional e paradidático'),
('História', 'Obras sobre eventos e períodos históricos'),
('Poesia', 'Coletâneas de poemas e versos');

-- 2. EDITORA (10 registros)
INSERT INTO editora (nome, endereco, telefone) VALUES
('Companhia das Letras', 'Rua Augusta, 123 - São Paulo/SP', '(11) 3123-4567'),
('Intrínseca', 'Av. Rio Branco, 456 - Rio de Janeiro/RJ', '(21) 2345-6789'),
('Rocco', 'Rua Buenos Aires, 78 - Curitiba/PR', '(41) 3456-7890'),
('Editora 34', 'Av. Paulista, 1000 - São Paulo/SP', '(11) 4567-8901'),
('Aleph', 'Rua da Glória, 202 - São Paulo/SP', '(11) 5678-9012'),
('Darkside', 'Rua Pereira Estéfano, 456 - São Paulo/SP', '(11) 6789-0123'),
('Suma', 'Av. Prestes Maia, 500 - São Paulo/SP', '(11) 7890-1234'),
('Planeta', 'Rua do Rosário, 111 - Rio de Janeiro/RJ', '(21) 8901-2345'),
('Leya', 'Rua Desembargador Paula, 98 - Belo Horizonte/MG', '(31) 9012-3456'),
('Record', 'Av. Almirante Barroso, 112 - Rio de Janeiro/RJ', '(21) 1234-5678');

-- 3. AUTOR (10 registros)
INSERT INTO autor (nome, data_nasc, nacionalidade) values
('Machado de Assis', '1839-06-21', 'Brasileira'),
('Clarice Lispector', '1920-12-10', 'Brasileira'),
('J.R.R. Tolkien', '1892-01-03', 'Britânica'),
('Agatha Christie', '1890-09-15', 'Britânica'),
('Isaac Asimov', '1920-01-02', 'Norte-americana'),
('Yuval Noah Harari', '1976-02-24', 'Israelense'),
('Augusto Cury', '1958-10-02', 'Brasileira'),
('Stephen King', '1947-09-21', 'Norte-americana'),
('J.K. Rowling', '1965-07-31', 'Britânica'),
('Dan Brown', '1964-06-22', 'Norte-americana'),
('Árthur Conan Doyle', '1859-05-22', 'Britânico'),
('Antoine de Saint-Exupéry', '1900-06-29', 'Francesa');

-- 4. USUARIO (12 registros – acima do mínimo)
INSERT INTO usuario (nome, email, data_nasc, telefone) VALUES
('Ana Paula Souza', 'ana@email.com', '1990-03-12', '(11) 91234-5678'),
('Carlos Eduardo Lima', 'carlos@email.com', '1985-07-22', '(21) 92345-6789'),
('Fernanda Oliveira', 'fernanda@email.com', '1995-11-01', '(31) 93456-7890'),
('João Pedro Santos', 'joao@email.com', '2000-05-18', '(41) 94567-8901'),
('Mariana Costa', 'mariana@email.com', '1988-09-30', '(51) 95678-9012'),
('Rafael Gomes', 'rafael@email.com', '1992-12-05', '(61) 96789-0123'),
('Patrícia Alves', 'patricia@email.com', '1998-04-17', '(71) 97890-1234'),
('Lucas Martins', 'lucas@email.com', '2001-08-25', '(81) 98901-2345'),
('Beatriz Rocha', 'beatriz@email.com', '1993-06-14', '(11) 99012-3456'),
('Thiago Nunes', 'thiago@email.com', '1980-10-10', '(21) 90123-4567'),
('Camila Mendes', 'camila@email.com', '1997-02-28', '(31) 91234-5670'),
('Diego Barbosa', 'diego@email.com', '1982-09-03', '(41) 92345-6781');

-- 5. LIVRO (12 registros)
INSERT INTO livro (titulo, isbn, ano_publicacao, num_paginas, id_categoria, id_editora) VALUES
('Dom Casmurro', '978-85-359-0277-6', 1899, 320, 1, 1),
('A Hora da Estrela', '978-85-254-3108-0', 1977, 120, 1, 3),
('O Senhor dos Anéis - A Sociedade do Anel', '978-85-325-2850-0', 1954, 576, 3, 3),
('Assassinato no Expresso Oriente', '978-85-766-3111-0', 1934, 256, 4, 8),
('Eu, Robô', '978-65-5521-289-1', 1950, 320, 2, 5),
('Sapiens: Uma Breve História da Humanidade', '978-85-982-6823-7', 2011, 464, 9, 10),
('Ansiedade: Como Enfrentar o Mal do Século', '978-85-553-2099-4', 2014, 192, 6, 7),
('It: A Coisa', '978-85-748-9678-0', 1986, 1152, 4, 2),
('Harry Potter e a Pedra Filosofal', '978-85-325-2901-9', 1997, 320, 3, 3),
('O Código Da Vinci', '978-85-766-3003-3', 2003, 416, 4, 8),
('O Pequeno Príncipe', '978-85-636-2027-5', 1943, 96, 7, 4),
('Poesias Completas de Drummond', '978-85-359-0012-2', 2002, 600, 10, 1),
('Sherlock Holmes: Um Estudo em Vermelho', '978-85-7652-310-5', 1887, 144, 4, 10);

-- 6. LIVRO_AUTOR (associações – mínimo 12 registros)
INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),   -- Dom Casmurro → Machado de Assis
(2, 2),   -- A Hora da Estrela → Clarice Lispector
(3, 3),   -- Sociedade do Anel → Tolkien
(4, 4),   -- Assassinato no Expresso Oriente → Agatha Christie
(5, 5),   -- Eu, Robô → Asimov
(6, 6),   -- Sapiens → Harari
(7, 7),   -- Ansiedade → Augusto Cury
(8, 8),   -- It → Stephen King
(9, 9),   -- Harry Potter → J.K. Rowling
(10, 10), -- O Código Da Vinci → Dan Brown
(11, 12),  -- Pequeno Príncipe → autor: Antoine de Saint-Exupéry
(12, 2),  -- Laços de Família → Clarice 
(13, 12); -- Sherlock Holmes → Arthur Conan Doyle


-- 7. EMPRESTIMO (12 registros)
INSERT INTO emprestimo (data_emprestimo, data_prevista, id_usuario) VALUES
('2026-04-20', '2026-05-04', 1),
('2026-04-21', '2026-05-05', 2),
('2026-04-22', '2026-05-06', 3),
('2026-04-23', '2026-05-07', 4),
('2026-04-24', '2026-05-08', 5),
('2026-04-25', '2026-05-09', 6),
('2026-04-26', '2026-05-10', 7),
('2026-04-27', '2026-05-11', 8),
('2026-04-28', '2026-05-12', 9),
('2026-04-29', '2026-05-13', 10),
('2026-04-30', '2026-05-14', 11),
('2026-05-01', '2026-05-15', 12);

-- 8. ITEM_EMPRESTIMO (12 itens, um para cada empréstimo, mas poderia ser mais)
INSERT INTO item_emprestimo (data_devolucao_real, id_emprestimo, id_livro) VALUES
-- Empréstimo 1: devolvido no prazo
('2026-05-04', 1, 1),
-- Empréstimo 2: atrasado (devolução 05/07)
('2026-05-07', 2, 2),
-- Empréstimo 3: atrasado (devolução 05/10)
('2026-05-10', 3, 3),
-- Empréstimo 4: devolvido antes do prazo
('2026-05-05', 4, 4),
-- Empréstimo 5: não devolvido ainda (NULL)
(NULL, 5, 5),
-- Empréstimo 6: devolvido no prazo
('2026-05-09', 6, 6),
-- Empréstimo 7: atrasado
('2026-05-15', 7, 7),
-- Empréstimo 8: devolvido no prazo
('2026-05-11', 8, 8),
-- Empréstimo 9: ainda não devolvido
(NULL, 9, 9),
-- Empréstimo 10: devolvido com atraso
('2026-05-20', 10, 10),
-- Empréstimo 11: devolvido no prazo
('2026-05-14', 11, 11),
-- Empréstimo 12: não devolvido
(NULL, 12, 12);

-- 9. RESERVA (12 registros)
INSERT INTO reserva (data_solicitacao, status, id_usuario, id_livro) VALUES
('2026-05-01', 'pendente', 1, 5),
('2026-05-02', 'cancelada', 2, 3),
('2026-05-03', 'atendida', 3, 1),
('2026-05-04', 'pendente', 4, 8),
('2026-05-05', 'pendente', 5, 10),
('2026-05-06', 'atendida', 6, 2),
('2026-05-07', 'cancelada', 7, 9),
('2026-05-08', 'pendente', 8, 4),
('2026-05-09', 'pendente', 9, 6),
('2026-05-10', 'atendida', 10, 7),
('2026-05-11', 'pendente', 11, 12),
('2026-05-12', 'pendente', 12, 11);

-- 10. MULTA (10 registros – associada aos itens de empréstimo em atraso)
-- Itens com atraso: id_item 2, 3, 7, 10 (e possivelmente outros).
-- Vamos criar multas para cada item atrasado e também itens não devolvidos (consideramos multa pendente)
INSERT INTO multa (valor, data_pagamento, status, id_item_emprestimo) VALUES
(15.00, '2026-05-08', 'paga', 2),   -- atraso 2 dias
(22.50, NULL, 'pendente', 3),       -- atraso 3 dias, ainda não paga
(35.00, NULL, 'pendente', 7),       -- atraso maior
(42.00, '2026-05-25', 'paga', 10),  -- atraso 7 dias
(12.00, NULL, 'pendente', 5),       -- item não devolvido (id_item 5)
(18.00, NULL, 'pendente', 9),       -- item não devolvido (id_item 9)
(8.50, '2026-05-20', 'paga', 1),    -- item 1 não estava atrasado? Mas podemos criar multa por outros motivos (dano). Exemplo.
(20.00, NULL, 'pendente', 6),       -- item 6 devolvido no prazo, multa extra opcional
(30.00, '2026-05-30', 'paga', 12),  -- item 12 ainda não devolvido, criamos multa pendente mas pagou
(5.00, '2026-05-15', 'paga', 4);    -- item 4 devolvido antes, multa leve

-- Fim do script de povoamento.