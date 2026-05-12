# 📚 Biblioteca Digital - Projeto de Banco de Dados

> Trabalho final da disciplina **Banco de Dados** (2026.1) – Engenharia de Software

## 🎯 Objetivo

Desenvolver um banco de dados relacional para gerenciar uma biblioteca digital, abrangendo:

- Cadastro de usuários, livros, autores, editoras e categorias
- Controle de empréstimos, reservas e multas
- Consultas SQL complexas (junções, agregação, subconsultas)
- Extensão tecnológica com Python

## 📁 Arquivos do projeto

| Arquivo | Descrição |
|---------|------------|
| `tabelas.sql` | Cria o banco `biblioteca_digital` e todas as tabelas (10 entidades) |
| `povoamento.sql` | Insere dados de exemplo (mínimo 10 registros por tabela) |
| `consultas.sql` | 10 consultas SQL obrigatórias (BETWEEN, JOIN, UNION, GROUP BY, etc.) |
| `biblioteca_conexao.py` | Script Python que conecta ao MySQL e executa consultas |
| `.env.example` | Exemplo de configuração de ambiente (credenciais) |
| `minimundo.md` | Descrição das regras de negócio e relacionamentos (modelo conceitual textual) |
| `dicionario_dados.md` | Especificação de todos os atributos, domínios e restrições das tabelas |
| `biblioteca_digital_MER.jpeg` | Diagrama Entidade-Relacionamento (modelo conceitual) |
| `biblioteca_digital_DER.jpeg` | Diagrama Entidade-Relacional (modelo lógico – chaves, tipos) |
| `normalizacao.md` | Justificativa da 1ª, 2ª e 3ª Forma Normal |
| `algebra_relacional.md` | Representação de 5 consultas em notação algébrica (σ, π, ⨝, γ, τ, ℒ) |

## ⚙️ Como executar

### 1. Banco de dados
- Certifique-se de ter o **MySQL** instalado e rodando.
- Execute os scripts **na ordem**:
  ```sql
  source tabelas.sql;
  source povoamento.sql;
  ```
  (ou copie/cole no DBeaver/Workbench)

### 2. Consultas SQL
- Abra `consultas.sql` no seu cliente SQL e execute cada uma separadamente.

### 3. Script Python (extensão tecnológica)
```bash
# Instale as dependências
pip install mysql-connector-python python-dotenv

# Configure o arquivo .env (copie .env.example para .env e edite)
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha
DB_DATABASE=biblioteca_digital
DB_PORT=3306

# Execute
python biblioteca_conexao.py
```

## ✅ Requisitos cumpridos

- [x] 10 tabelas (acima do mínimo de 8)
- [x] Chaves primárias, estrangeiras e normalização (3FN)
- [x] 10 consultas SQL com todos os operadores exigidos
- [x] Álgebra relacional (5 consultas)
- [x] Script Python funcional

## 🧑‍💻 Integrantes

- Ícaro Matos Castelo Branco
- Kaik Araújo Cabral
- João Paulo Moura Santiago

Projeto acadêmico – sem fins comerciais.
