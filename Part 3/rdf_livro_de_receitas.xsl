<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE rdf:RDF [
 <!ENTITY rdf  "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
 <!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#">
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:foaf="http://xmlns.com/foaf/spec/" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:rel="http://www.dcc.fc.up.pt/~zp/Livro_De_Receitas/">


	<xsl:template match="/">
		<rdf:RDF>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>

	<xsl:template match="livro_de_receitas">

		<rdf:Description rdf:about="{cabeçalho/titulo_do_conjunto_de_receitas/text()}">
			<rdf:type rdf:resource="livro_de_receitas" />
			<dc:title>
				<xsl:value-of select="cabeçalho/titulo_do_conjunto_de_receitas" />
			</dc:title>
			<xsl:apply-templates select="cabeçalho/autor" />
			<dc:date>
				<xsl:value-of select="cabeçalho/data_publicaçao" />
			</dc:date>
			<dc:description>
				<xsl:value-of select="cabeçalho/resumo" />
			</dc:description>
			<xsl:apply-templates select="corpo/parte|corpo/secçao|corpo/sub_secçao" />

		</rdf:Description>

	</xsl:template>



	<xsl:template match="autor">
		<dc:author>
			<xsl:value-of select="text()" />
		</dc:author>
		<foaf:name>
			<xsl:value-of select="text()" />
		</foaf:name>
	</xsl:template>

	<xsl:template match="parte">
		<rel:indice>
			<rel:Parte>
				<rel:titulo>
					<xsl:value-of select="titulo" />
				</rel:titulo>


				<xsl:apply-templates select="secçao" />
			</rel:Parte>
		</rel:indice>
	</xsl:template>

	<xsl:template match="secçao">
		<rel:indice>
			<rel:Secçao>

				<rel:titulo>
					<xsl:value-of select="titulo" />
				</rel:titulo>

				<xsl:apply-templates select="sub_secçao" />
			</rel:Secçao>
		</rel:indice>
	</xsl:template>


	<xsl:template match="sub_secçao">
		<rel:indice>
			<rel:Sub_Secçao>

				<rel:titulo>
					<xsl:value-of select="titulo" />
				</rel:titulo>

				<xsl:apply-templates select="receita" />
			</rel:Sub_Secçao>
		</rel:indice>
	</xsl:template>

	<xsl:template match="receita">
		<rel:indice>
			<rel:Receita>

				<rel:titulo>
					<xsl:value-of select="nome" />
				</rel:titulo>
			</rel:Receita>
		</rel:indice>
	</xsl:template>
</xsl:stylesheet>