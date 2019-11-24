# Exercício prático SQL - DDL e DML

3. Selecionar o título, ano publicação, quantidade de exemplares e valor médio de aquisição dos livros adquiridos no ano de 2019, cujo assunto seja "Literatura Brasileira".

    ```
    +-------------------------+-----------+----------------------+-----------------------+
    | Titulo                  | AnoPublic | COUNT(e.CodExemplar) | AVG(e.ValorAquisicao) |
    +-------------------------+-----------+----------------------+-----------------------+
    | Grande Sertão: Veredas  |      1956 |                    2 |                  52.5 |
    | Helena                  |      1876 |                    2 |                  13.5 |
    +-------------------------+-----------+----------------------+-----------------------+
    ```

4. Selecionar o título, a data de empréstimo e o valor da multa, se houver, dos exemplares que o aluno "Bernardo Valadares" pegou na biblioteca.

    ```
    +---------+------------+-------+
    | Titulo  | Data       | Multa |
    +---------+------------+-------+
    | A Coisa | 2018-02-01 |     5 |
    +---------+------------+-------+
    ```

5. Selecionar os alunos que não têm nenhum empréstimo.

    ```
    +--------+-------------+------------+---------+
    | Codigo | Nome        | DataNasc   | Cidade  |
    +--------+-------------+------------+---------+
    |     10 | Maria Clara | 2002-05-05 | Sabará  |
    +--------+-------------+------------+---------+
    ```

6. Listar o nome de todos os alunos e a quantidade de empréstimos registrados para cada um deles. Mesmo os alunos que não têm nenhum empréstimo devem aparecer nessa lista.

    ```
    +--------------------+----------------------+
    | Nome               | COUNT(em.CodEmprest) |
    +--------------------+----------------------+
    | Bernardo Valadares |                    1 |
    | Raquel Moraes      |                    2 |
    | Júlio Reis         |                    3 |
    | Paula Santos       |                    1 |
    | Joaquim Oliveira   |                    1 |
    | Rafael Cardoso     |                    7 |
    | Ana Clara          |                   13 |
    | Sara Pena          |                    1 |
    | Cláudio Carvalho   |                    7 |
    | Maria Clara        |                    0 |
    +--------------------+----------------------+
    ```

7. Selecionar o nome dos autores de livros cujo assunto é "Literatura Brasileira".

    ```
    +-----------------------+
    | NomeAut               |
    +-----------------------+
    | João Guimarães Rosa   |
    | Machado de Assis      |
    +-----------------------+
    ```

8. Selecionar o nome dos alunos que pegaram pelo menos 10 livros distintos no ano de 2019.

    ```
    +-----------+
    | Nome      |
    +-----------+
    | Ana Clara |
    +-----------+
    ```

9. Selecionar o nome dos autores que publicaram algum livro com o autor "NAVATHE".

    ```
    +----------------+
    | NomeAut        |
    +----------------+
    | Naphtali Rishe |
    +----------------+
    ```

10. Selecionar o nome dos autores que publicaram mais livros que o autor "NAVATHE".

    ```
    +----------------+
    | NomeAut        |
    +----------------+
    | J.K. Rowling   |
    | Pedro Bandeira |
    +----------------+
    ```

11. Selecionar o nome do aluno e o valor médio de suas multas, para os alunos cujo valor médio das multas seja superior ao valor médio das dos alunos de "BELO HORIZONTE".

    ```
    +-------------------+-------------------+
    | Nome              | AVG(ie.Multa)     |
    +-------------------+-------------------+
    | Raquel Moraes     |                 9 |
    | Paula Santos      |                 8 |
    | Cláudio Carvalho  | 8.142857142857142 |
    +-------------------+-------------------+
    ```

12. Selecionar o nome dos alunos cujo número total de empréstimos seja superior ao número de empréstimos de livros do auto "MACHADO DE ASSIS".

    ```
    +-------------------+
    | Nome              |
    +-------------------+
    | Rafael Cardoso    |
    | Ana Clara         |
    | Cláudio Carvalho  |
    +-------------------+
    ```

13. Selecionar o nome das editoras cujo número de livros publicados seja superior ao número de livros da editora "CAMPUS".

    ```
    +-----------------------------+
    | NomeEdit                    |
    +-----------------------------+
    | Rocco                       |
    | Moderna                     |
    | IEEE Computer Society Press |
    +-----------------------------+
    ```

14. Selecionar o título do livro e o nome do aluno para os livros emprestados em setembro de 2019 devolvidos em até dois dias após o empréstimo.

    ```
    +----------------------------------+-----------+
    | Titulo                           | Nome      |
    +----------------------------------+-----------+
    | Harry Potter e a Pedra Filosofal | Ana Clara |
    | As Crônicas de Gelo e Fogo       | Ana Clara |
    +----------------------------------+-----------+
    ```

15. Selecionar o título do(s) livro(s) com o maior número de empréstimos em 2019.

    ```
    +----------------------------------+----------------------+
    | Titulo                           | COUNT(ie.CodEmprest) |
    +----------------------------------+----------------------+
    | Harry Potter e a Pedra Filosofal |                    2 |
    +----------------------------------+----------------------+
    ```

16. Selecionar o título do livro e o Código do exemplar para os exemplares cujo valor de aquisição seja superior ao valor médio dos exemplares da mesma editora.

    ```
    +--------------------------------------------+-------------+
    | Titulo                                     | CodExemplar |
    +--------------------------------------------+-------------+
    | Harry Potter e a Pedra Filosofal           |           1 |
    | A Coisa                                    |           4 |
    | A Droga da Obediência                      |           5 |
    | A Droga da Obediência                      |           6 |
    | As Crônicas de Gelo e Fogo                 |           8 |
    | Grande Sertão: Veredas                     |          10 |
    | Harry Potter e a Câmara Secreta            |          11 |
    | Harry Potter e a Câmara Secreta            |          12 |
    | Harry Potter e o Prisioneiro de Azkaban    |          13 |
    | Harry Potter e o Cálice de Fogo            |          16 |
    | Harry Potter e a Ordem da Fênix            |          17 |
    | Harry Potter e a Ordem da Fênix            |          18 |
    | Harry Potter e as Relíquias da Morte       |          21 |
    | Anjo da Morte                              |          25 |
    | Droga de Americana                         |          29 |
    | Droga de Americana                         |          30 |
    | Databases: Theory, Design and Applications |          31 |
    | Parallel Architectures                     |          33 |
    | Helena                                     |          35 |
    | O Instituto                                |          38 |
    +--------------------------------------------+-------------+
    ```