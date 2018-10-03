# Transformações de documentos
O objetivo deste trabalho é transformar os documentos do tipo coleção de receitas anteriormente definidos com DTD e XSD. Se for necessário podem ser feitas alterações a essas definições por forma a corrigir deficiências ou a facilitar o processo de transformação. Esta transformação tem o duplo objetivo de

- Fornecer uma visualização da coleção receitas
- Complementar a validação da coleção de receitas
- Visualização

A visualização da coleção de receitas é fundamentalmente um texto formatado em XHTML, ou HTML compatível com as regras de boa formação do XML. O coleção de receitas formatada deve apresentar:

- Uma "folha de rosto" com título, autores, data, resumo, etc;
- Um tabela de conteúdos com os títulos dos elementos estruturais da coleção de receitas (partes, seções, subseções) com possibilidade de navegação para esses pontos;
- Uma página de separação por cada elemento estrutural, com o título formatado proporcionalmente à sua importância contendo também os textos e imagens que lhe possam estar associados;
- Um cabeçalho para cada receita, com o título destacado, seguida da informação genérica relativa à receita, como a dificuldade, o tempo de preparação ou a ilustração; ;
- Depois do cabeçalho, é apresentado a listas de ingredientes;
- Um texto formatado por cada receita em que:
- Cada passo aparece num parágrafos autónomos e numerado automaticamente, incluindo eventuais ilustrações;
- As referências a ingredientes são indicadas com o seu nome formatado a negrito;
- As referências a outras receitas devem permitir a navegação para essas receitas.
## Validação
Existem requisitos formais a que um tipo documento deve obedecer que não podem ser validados usando linguagens como o DTD ou o XML Schema. Esses requisitos poderiam ser validados usando o Schematron, por exemplo, que se baseia em asserções expressas em XPath para produzir uma espécie de relatório. Neste trabalho vamos apenas usar a própria transformação para fazer algumas validações deste tipo. A validação efetuada durante o processo de transformação deve assinalar pelo menos as seguintes situações.

A validação por ID/IDREF do XML verifica a entidade referencial assumindo a existência de um único conjunto de identificadores. No entanto as coleções de receitas usam IDs para ingredientes e para receitas, que podem ser inadvertidamente trocados sem que isso seja detetado pelos validadores, mas deve ser assinalado pela transformação.
A verificação da integridade referencial garante que todos os elementos referidos estão definidos, mas não que todos os elementos definidos são referidos. No entanto todas os ingredientes declarados no coleção de receitas devem efetivamente ser referidas nas cenas, caso contrário isso deve ser assinalado.
Esta transformação irá verificar (pelo menos) este conjunto de asserções, produzindo mensagens de aviso no caso de estas não se verificarem. A produção destas mensagens não deve abortar o processo de transformação. Os avisos devem ser escritos na saída standard da transformação (stdout) e não no documento objetivo.
