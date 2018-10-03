# Definição do tipo de documento

O tipo de documento para uma coleção de receitas deve ser definido quer em DTD quer em XSD, fazendo em cada caso o melhor uso possível da capacidade expressiva da respetiva linguagem. Devem ser entregues alguns documentos instância produzidos com cada uma das definições, ilustrando todo o tipo de elementos e atributos definidos.

Uma receita é um texto anotado, contendo uma lista de ingredientes e uma lista de passos para a executar. Além disso, uma receita poderá ter informação genérica, em que apenas o nome é obrigatório, incluindo (mas não limitada a);

- Nome da receita;
- Identificador;
- Categoria (por exemplo: entrada, sobremesa, salada, ...
- Dificuldade (por exemplo: simples, médio, díficil);
- Tempo (em minutos, ou: rápido, médio, lento)
- Custo (por exemplo, barato, médio, caro);
- Calorias (valor numérico) ilustração uma imagem do resultado final.

O início de cada receita tem de existir uma lista com todos os ingredientes. Cada ingrediente tem de poder ser identificado e deve poder conter a indicação de

- Identificador
- Quantidade do ingrediente (um número)
- Unidade de medida (exemplo: grama, chávena)
- No texto que descreve a receita deverá estar identificado cada ingrediente, relacionado-o com a lista prévia. Além disso, a descrição de uma receita pode referir uma outra. Por exemplo, a receita de bacalhau gratinado pode referir a recita de béchamel, em vez de repetir.

A descrição da receita pode estar organizada numa lista de passos. Cada passo poderá ter uma ilustração (um URL de uma imagem ou vídeo). No entanto, estes passos podem ser omitidos e a receita descrita num único parágrafo.

Um documento é uma coleção de receitas constituída por um cabeçalho e organizada numa hierarquia. Os elementos da hierarquia são a parte, a seção e a subseção, sendo a primeira a mais geral e a última a mais específica. Todos estes elementos estruturais, se existirem, têm de ter um título, podendo também ter um texto introdutório e uma ilustração (URL de imagem).

Estes elementos estruturais devem poder ser encaixados de uma forma consistente e também omitidos. Por exemplo, poderão haver apenas partes, ou apenas secções, mas havendo partes e secções, cada secção tem e estar dentro de uma parte. Do mesmo modo, havendo uma subsecção esta tem de estar contida numa secção e não pode estar imediatamente debaixo de uma parte. No entanto, qualquer destes elementos pode ser omitido.

Exemplos de informações constante no cabeçalho da coleção de receitas são:
- Título do conjunto de receitas;
- Autor(es) da compilação de receitas;
- Data de publicação;
- Resumo texto introdutório opcional.
