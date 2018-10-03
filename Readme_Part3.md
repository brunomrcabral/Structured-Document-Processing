# Semântica
O terceiro trabalho prático tem por objetivo a criação de metadados referentes às coleções de receitas desenvolvidas nos trabalhos anteriores. A produção de documentos RDF-XML com os metadados deve usar uma transformação XSLT sobre o respetivo documento XML contendo a coleção de receitas.

Os metadados descrevendo a coleção de receitas devem indicar:

- Informação genérica (título, autor, data , etc);
- Tabela de conteúdos (índice) ;


Os metadados deverão usar, sempre que possível, vocabulários normalizados, como o Dublin Core e o Friend-of-a-friend. No entanto, nem todas as propriedades necessárias para descrever uma coleção de receitas com o grau de detalhe pedido estão disponíveis nesses vocabulários.

O vocabulário específico deste domínio deve ser formalizado em RDF Schema. Devem começar por definir as classes associadas aos metadados e relaciona-las numa hierarquia de tipos, tendo em atenção que essa estrutura raramente segue a estrutura sintática do documento XML.

As classes devem servir de base para a definição das propriedades que constituem o vocabulário específico do domínio das coleções de receitas. Devem procurar que as propriedades sejam definidas sobre classes tão genéricas quanto possível.
