# Normalização do Banco de Dados

Com base na análise do esquema do projeto **Biblioteca Digital**, o banco de dados atende plenamente aos requisitos da **3ª Forma Normal (3FN)**, garantindo integridade, eliminação de redundâncias e prevenção de anomalias de atualização.

## 1ª Forma Normal (1FN) – Atomicidade e Chave Primária

A 1FN exige que cada coluna contenha valores atômicos (indivisíveis) e que cada tabela possua uma chave primária única.

- **Atomicidade:** Todas as colunas das tabelas (`usuario`, `livro`, `emprestimo`, etc.) armazenam apenas um valor por campo. Exemplos: `telefone` contém um único número, `titulo` é um texto simples, `data_emprestimo` é uma data. Não há listas ou campos multivalorados.
- **Chave Primária:** Cada tabela possui uma chave primária definida:
  - `usuario (id_usuario)`
  - `categoria (id_categoria)`
  - `editora (id_editora)`
  - `autor (id_autor)`
  - `livro (id_livro)`
  - `livro_autor (id_livro, id_autor)` – chave composta
  - `emprestimo (id_emprestimo)`
  - `item_emprestimo (id_item)`
  - `reserva (id_reserva)`
  - `multa (id_multa)`

Todos os atributos não chave dependem da respectiva chave primária.

## 2ª Forma Normal (2FN) – Dependência Total da Chave

A 2FN aplica-se a tabelas com chave primária composta, exigindo que nenhum atributo não chave dependa de apenas parte da chave.

No modelo, a única tabela com chave composta é `livro_autor (id_livro, id_autor)`. Esta tabela não possui atributos não chave – serve apenas para associar livros e autores. Portanto, **não há dependências parciais**, atendendo perfeitamente à 2FN.

## 3ª Forma Normal (3FN) – Ausência de Dependências Transitivas

A 3FN exige que a tabela já esteja na 2FN e que nenhum atributo não chave dependa de outro atributo não chave (ou seja, que não existam dependências transitivas).

O esquema separa as entidades em tabelas independentes, utilizando **chaves estrangeiras** para referenciar os dados completos apenas quando necessário:

- A tabela `livro` contém `id_categoria` e `id_editora` como chaves estrangeiras. Os detalhes da categoria (`nome`, `descricao`) e da editora (`nome`, `endereço`) residem em suas próprias tabelas, evitando repetição.
- A tabela `emprestimo` contém `id_usuario`, e os dados do usuário estão apenas em `usuario`.
- `item_emprestimo` referencia `id_emprestimo` e `id_livro`; `multa` referencia `id_item_emprestimo`. Em nenhum caso um atributo não chave determina outro atributo não chave.

Dessa forma, **não há dependências transitivas**, e o banco está em **3FN**.
