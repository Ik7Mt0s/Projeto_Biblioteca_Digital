import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv
import os

load_dotenv()

config = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'user': os.getenv('DB_USER', 'root'),
    'password': os.getenv('DB_PASSWORD'),
    'database': os.getenv('DB_DATABASE', 'biblioteca_digital'),
    'port': int(os.getenv('DB_PORT', 3306))
}

def conectar():
    """Estabelece conexão com o banco de dados."""
    try:
        conexao = mysql.connector.connect(**config)
        if conexao.is_connected():
            print("✅ Conectado ao MySQL - banco 'biblioteca_digital'")
            return conexao
    except Error as e:
        print(f"❌ Erro ao conectar: {e}")
        return None

def executar_consulta(conexao, query, descricao):
    """Executa uma consulta SELECT e exibe os resultados formatados."""
    try:
        cursor = conexao.cursor(dictionary=True)
        cursor.execute(query)
        resultados = cursor.fetchall()
        print(f"\n📊 {descricao} ({len(resultados)} registro(s)):")
        print("-" * 70)
        for i, linha in enumerate(resultados, 1):
            print(f"{i}. {linha}")
        cursor.close()
    except Error as e:
        print(f"⚠️ Erro na consulta '{descricao}': {e}")

def main():
    conexao = conectar()
    if not conexao:
        return

    # 1. Top 5 livros mais emprestados (LIMIT + JOIN + GROUP BY + ORDER BY)
    query1 = """
        SELECT l.titulo, COUNT(ie.id_livro) AS total_emprestimos
        FROM livro l
        JOIN item_emprestimo ie ON l.id_livro = ie.id_livro
        GROUP BY l.id_livro
        ORDER BY total_emprestimos DESC
        LIMIT 5
    """
    executar_consulta(conexao, query1, "Top 5 livros mais emprestados")

    # 2. Usuários com empréstimos em atraso ou não devolvidos (LEFT JOIN + condição)
    query2 = """
        SELECT DISTINCT u.nome, u.email
        FROM usuario u
        JOIN emprestimo e ON u.id_usuario = e.id_usuario
        JOIN item_emprestimo ie ON e.id_emprestimo = ie.id_emprestimo
        WHERE ie.data_devolucao_real IS NULL 
           OR ie.data_devolucao_real > e.data_prevista
    """
    executar_consulta(conexao, query2, "Usuários com empréstimos em atraso ou não devolvidos")

    # 3. Total de livros por categoria (GROUP BY + LEFT JOIN + COUNT)
    query3 = """
        SELECT c.nome AS categoria, COUNT(l.id_livro) AS total_livros
        FROM categoria c
        LEFT JOIN livro l ON c.id_categoria = l.id_categoria
        GROUP BY c.id_categoria
    """
    executar_consulta(conexao, query3, "Total de livros por categoria")

    # 4. Resumo financeiro de multas (SUM + CASE)
    query4 = """
        SELECT 
            SUM(CASE WHEN status = 'paga' THEN valor ELSE 0 END) AS total_pago,
            SUM(CASE WHEN status = 'pendente' THEN valor ELSE 0 END) AS total_pendente,
            COUNT(CASE WHEN status = 'pendente' THEN 1 END) AS quant_pendentes
        FROM multa
    """
    executar_consulta(conexao, query4, "Resumo financeiro de multas")

    # 5. Livros escritos por autores brasileiros (INNER JOIN múltiplo)
    query5 = """
        SELECT l.titulo, a.nome AS autor
        FROM livro l
        JOIN livro_autor la ON l.id_livro = la.id_livro
        JOIN autor a ON la.id_autor = a.id_autor
        WHERE a.nacionalidade = 'Brasileira'
    """
    executar_consulta(conexao, query5, "Livros de autores brasileiros")

    # Fecha a conexão
    conexao.close()
    print("\n🔌 Conexão encerrada.")

if __name__ == "__main__":
    main()
