**Minimundo -- Biblioteca Digital**

**Contexto Geral**

Uma biblioteca municipal decidiu implantar um sistema digital para
gerenciar seu acervo de livros, seus usuários, os empréstimos
realizados, as reservas de títulos, as multas por atraso e os dados de
autores e editoras. O sistema deverá controlar todo o ciclo de vida de
um empréstimo, desde a solicitação até a devolução, garantindo a
integridade dos dados e fornecendo relatórios gerenciais. A seguir, são
descritos os requisitos funcionais e as regras de negócio identificadas.

**Entidades e Relacionamentos (Regras de Negócio)**

1.  **Usuário** -- Toda pessoa que deseja utilizar os serviços da
    biblioteca deve se cadastrar. O sistema armazena seu nome, e-mail,
    data de nascimento e telefone. Um usuário pode **realizar muitos
    empréstimos** ao longo do tempo, mas cada empréstimo pertence a
    um **único usuário**. Da mesma forma, um usuário pode **fazer muitas
    reservas** de livros, e cada reserva está associada a um único
    usuário.

2.  **Livro** -- Representa uma obra disponível no acervo. Cada livro
    possui título, ISBN, ano de publicação e número de páginas. Um
    livro **pertence a uma única categoria** (ex.: Romance, Ciência,
    História), mas uma categoria pode **conter muitos livros**. Um livro
    pode ser **escrito por um ou mais autores** (relacionamento
    muitos-para-muitos), e um autor pode **escrever muitos livros**.
    Além disso, um livro é **publicado por uma única editora**, e uma
    editora pode **publicar muitos livros**.

3.  **Categoria** -- Classifica os livros por assunto. Possui nome e
    descrição. Serve para organizar consultas e recomendações.

4.  **Autor** -- Pessoa responsável pela criação intelectual da obra. O
    sistema guarda seu nome, data de nascimento e nacionalidade. Um
    autor pode escrever muitos livros, e um livro pode ter vários
    autores.

5.  **Editora** -- Empresa responsável pela publicação do livro.
    Armazena nome, endereço e telefone. Uma editora pode publicar muitos
    livros.

6.  **Empréstimo** -- Registra a retirada de um ou mais livros por um
    usuário. Contém a data do empréstimo e a data prevista para
    devolução. Um empréstimo **gera um ou mais itens de empréstimo**,
    pois um usuário pode levar vários livros de uma só vez. Cada
    empréstimo está associado a um único usuário.

7.  **Item_Empréstimo** -- Representa cada livro concreto que foi
    emprestado dentro de um empréstimo. Possui a data de devolução real
    (preenchida quando o livro é devolvido). Um item de empréstimo
    refere-se a um único livro e a um único empréstimo. Este item é
    fundamental para controlar devoluções parciais e calcular multas por
    atraso individualmente.

8.  **Reserva** -- Permite que um usuário manifeste interesse por um
    livro que está indisponível (ex.: todos os exemplares emprestados).
    Armazena a data da solicitação e o status (ex.: \"pendente\",
    \"cancelada\", \"atendida\"). Um usuário pode fazer muitas reservas,
    e um livro pode ter muitas reservas associadas (em diferentes
    momentos). A reserva será automaticamente removida ou convertida em
    empréstimo quando o livro retornar.

9.  **Multa** -- Gerada automaticamente quando a data de devolução real
    de um item de empréstimo ultrapassa a data prevista do empréstimo.
    Contém o valor calculado (ex.: R$ 1,00 por dia de atraso), a data
    de pagamento (se paga) e o status (ex.: \"pendente\", \"paga\"). Um
    item de empréstimo pode gerar **no máximo uma multa**, e cada multa
    está associada a um único item de empréstimo. A multa também se
    relaciona indiretamente ao usuário através do empréstimo original.

**Regras de Negócio Complementares**

- Um usuário não pode ter mais de **5 livros emprestados
  simultaneamente**.

- A duração padrão do empréstimo é de **14 dias**.

- Se um livro estiver reservado por outro usuário, não é possível
  renovar o empréstimo.

- O pagamento de uma multa é obrigatório para que o usuário realize
  novos empréstimos.

- A reserva tem validade de **48 horas** após a notificação de
  disponibilidade; caso não seja retirada, é cancelada.

- As consultas obrigatórias do sistema incluirão: listar usuários com
  multas pendentes, livros mais emprestados por categoria, empréstimos
  em atraso, reservas ativas por usuário e faturamento estimado com
  multas (funções de agregação, junções, união, etc.).

**Quantidade de Entidades (atendendo ao exigido)**

O minimundo descrito envolve **9 entidades** (superando as 8 mínimas
exigidas):

- Usuário

- Livro

- Categoria

- Autor

- Editora

- Empréstimo

- Item_Empréstimo

- Reserva

- Multa