-- ==================================================
-- BANCO DE DADOS: biblioteca_digital
-- PROJETO: Biblioteca Digital - 10 entidades
-- ==================================================
CREATE DATABASE IF NOT EXISTS biblioteca_digital;
USE biblioteca_digital;

-- 1. USUARIO
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nasc DATE,
    telefone VARCHAR(20)
);

-- 2. CATEGORIA
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- 3. EDITORA
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

-- 4. AUTOR
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE,
    nacionalidade VARCHAR(50)
);

-- 5. LIVRO
CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    ano_publicacao INT,
    num_paginas INT,
    id_categoria INT NOT NULL,
    id_editora INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
);

-- 6. LIVRO_AUTOR (associativa para N:N entre Livro e Autor)
CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- 7. EMPRESTIMO
CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- 8. ITEM_EMPRESTIMO
CREATE TABLE item_emprestimo (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    data_devolucao_real DATE,
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- 9. RESERVA
CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    data_solicitacao DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- 10. MULTA
CREATE TABLE multa (
    id_multa INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE,
    status VARCHAR(20) DEFAULT 'pendente',
    id_item_emprestimo INT UNIQUE NOT NULL,
    FOREIGN KEY (id_item_emprestimo) REFERENCES item_emprestimo(id_item)
);