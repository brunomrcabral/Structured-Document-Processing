<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" encoding="UTF-8" method="html" />
	
	<xsl:key use="@id_receita" name="Receita" match="receita"/>
	<xsl:key use="@id_ingrediente" name="Ingrediente" match="ingrediente"/>

	<xsl:template match="livro_de_receitas">
		<html>
			<head>
			<link rel="stylesheet" type="text/css" href="trab2.css" />
				<title>Trabalho 2 - PDE</title>
				
				<!-- Estrutura do documneto -->
				<xsl:variable name="nPartes" select="count(/corpo/parte)" />
				<xsl:variable name="nSecçoes" select="count(/corpo/secçao)" />
				<xsl:variable name="nSub_secçoes" select="count(/corpo/sub_secçao)" />
				<xsl:variable name="nReceitas" select="count(/corpo/receita)" />
				
				<xsl:if test="$nPartes > 0 and $nSecçoes > 0 and $nSub_secçoes > 0 and $nReceitas > 0 ">
					<xsl:message terminate="no">
						Erro: Livro de receitas  mal construido
					</xsl:message>
				</xsl:if>
				
				<!-- Estrutura do Descriçao -->
				<xsl:variable name="nPassos" select="count(//passo)" />
				<xsl:variable name="nTexto" select="count(//texto)" />
				
				<xsl:if test="$nPassos = 0 and $nTexto = 0">
					<xsl:message terminate="no">
					passos -> <xsl:value-of select="$nPassos"/> 
					texto -> <xsl:value-of select="$nTexto"/> 
						Erro: Falta de descriçao
					</xsl:message>
				</xsl:if>
				
				<!-- Referencia a ingredientes -->
				<xsl:variable name="nIngredientes" select="count(//ingrediente)" />
				<xsl:variable name="nRefer" select="count(//ref_ingrediente)"/>
				
				<xsl:if test="$nIngredientes &gt; $nRefer">
					<xsl:message terminate="no">
					<!-- N_ingredientes -> <xsl:value-of select="$nIngredientes"/> -->
					<!-- N_refer -> <xsl:value-of select="$nRefer"/> -->
						Erro: Falta de referencias a ingredientes
					</xsl:message>
				</xsl:if>
				
				
			</head>
			
				<body>
					<xsl:apply-templates select="cabeçalho"/>   
					<xsl:apply-templates select="corpo"/>
				</body>
		</html>
	</xsl:template>
	
	<!-- Folha de rosto -->
	<xsl:template match="cabeçalho">
		
		<div id="cabecalho">
			<h1>
				<xsl:value-of select="titulo_do_conjunto_de_receitas"/>
			</h1>
		
		
			<div id="autores">
				<xsl:value-of select="autor" />
			</div>
			
			<div id="data_publicaçao">				
				<xsl:value-of select="data_publicaçao" />	
			</div>
			
			<div id="resumo">
				<xsl:value-of select="resumo"/>
			</div>
		</div>
		<br/>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="corpo">
		<div id="corpo">
			<h2> Navegação</h2>
			
			<div id="navegacao">
				<xsl:if test="parte">
					<xsl:apply-templates select="parte" mode="indice" />
				</xsl:if>
				
				<xsl:if test="secçao">
					<xsl:apply-templates select="secçao" mode="indice" />
				</xsl:if>
				
				<xsl:if test="sub_secçao">
					<xsl:apply-templates select="sub_secçao" mode="indice" />
				</xsl:if>
				
				<xsl:if test="receita">
					<xsl:apply-templates select="receita" mode="indice" />
				</xsl:if>
			</div>
			
			
			<div id="conteudo">
			
				<xsl:if test="parte">
					<xsl:apply-templates select="parte" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="secçao">
					<xsl:apply-templates select="secçao" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="sub_secçao">
					<xsl:apply-templates select="sub_secçao" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="receita">
					<xsl:apply-templates select="receita" mode="conteudo" />
				</xsl:if>
				
			</div>
		</div>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="parte" mode="indice">
		<li>
			<a href="#{generate-id()}"> <xsl:value-of select="titulo"/> </a>
		</li>
		
		<ul>
			<xsl:apply-templates select="secçao" mode="indice"/>
		</ul>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="secçao" mode="indice">
		<li>
			<a href="#{generate-id()}"> <xsl:value-of select="titulo"/> </a>
		</li>
		
		<ul>
			<xsl:apply-templates select="sub_secçao" mode="indice"/>
		</ul>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="sub_secçao" mode="indice">
		<li>
			<a href="#{generate-id()}"> <xsl:value-of select="titulo"/> </a>
		</li>
		
		<ul>
			<xsl:apply-templates select="receita" mode="indice"/>
		</ul>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="receita" mode="indice">
		<li>
			<a href="#{generate-id(key('Receita', @id_receita))}"> <xsl:value-of select="nome"/> </a>
		</li>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="parte" mode="conteudo">
		<xsl:for-each select=".">
			<div id="parte">
			
			<h2>
				<a name="{generate-id()}">
					<xsl:value-of select="titulo"/>
				</a>
			</h2>
			
			<p> <xsl:value-of select="texto_introdutorio"/> </p>
			
			<xsl:if test="secçao">
				<xsl:apply-templates select="secçao" mode="conteudo" />
			</xsl:if>
			
			<xsl:if test="sub_secçao">
				<xsl:apply-templates select="sub_secçao" mode="conteudo" />
			</xsl:if>
			
			<xsl:if test="receita">
				<xsl:apply-templates select="receita" mode="conteudo" />
			</xsl:if>
			
			<xsl:if test="url">
					<xsl:apply-templates select="url" />
				</xsl:if>
			
			</div>
		</xsl:for-each>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="secçao" mode="conteudo">
		<xsl:for-each select=".">
			<div id="secçao">
				<h3>
					<a name="{generate-id()}">
						<xsl:value-of select="titulo"/>
					</a>
				</h3>
				
				<p> <xsl:value-of select="texto_introdutorio"/> </p>
				
				<xsl:if test="sub_secçao">
					<xsl:apply-templates select="sub_secçao" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="receita">
					<xsl:apply-templates select="receita" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="url">
					<xsl:apply-templates select="url" />
				</xsl:if>
			</div>
		</xsl:for-each>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="sub_secçao" mode="conteudo">
		<xsl:for-each select=".">
			<div id="sub_secçao">
			
				<h4>
					<a name="{generate-id()}">
						<xsl:value-of select="titulo"/>
					</a>
				</h4>
				
				<p> <xsl:value-of select="texto_introdutorio"/> </p>
				
				<xsl:if test="receita">
					<xsl:apply-templates select="receita" mode="conteudo" />
				</xsl:if>
				
				<xsl:if test="url">
					<xsl:apply-templates select="url" />
				</xsl:if>
			</div>
		</xsl:for-each>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="receita" mode="conteudo">
		<xsl:for-each select=".">
			
			<fieldset id="receita">
			
				<legend>
					<a name="{key('Receita', @receita)}{generate-id()}">
						<xsl:value-of select="nome"/>
					</a>
				</legend>
				
				<xsl:if test="url">
					<xsl:apply-templates select="url" />
				</xsl:if>
				
				<p>
					<b>Dificuldade: </b> <xsl:value-of select="@dificuldade"/>
				</p>
				
				<p> 
					<b>Tempo: </b> <xsl:value-of select="@tempo"/> 
				</p>
			 	
			 	<p>
			 		<b>Calorias: </b> <xsl:value-of select="calorias"/> Kcal
			 	</p>
				
				<xsl:if test="ingredientes">
					<xsl:apply-templates select="ingredientes" />
				</xsl:if>
				
				<xsl:if test="descriçao">
					<xsl:apply-templates select="descriçao" />
				</xsl:if>
			</fieldset>
			
		</xsl:for-each>
	</xsl:template>
	
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="ingredientes">
		<div id="ingredientes">
			<h4>Lista de ingredientes</h4>
			<xsl:for-each select="ingrediente">
				
				<xsl:number format="1 - "/>
				<a name="{key('Ingrediente', @ingrediente)}{generate-id()}">
					<xsl:value-of select="./nome" /> : <xsl:value-of select="./quantidade" /> <xsl:value-of select="./unidade" /> <br/>	
				</a>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template match="descriçao">
		<div id="descriçao">
			<h4>Procedimento</h4>
			
			<xsl:if test="passos">
					<xsl:apply-templates select="passos" />
			</xsl:if>
			
			<xsl:if test="texto">
					<xsl:apply-templates select="texto" />
			</xsl:if>
			
		</div>
	</xsl:template>
	
	
	<xsl:template match="passos">
				
		<xsl:for-each select="passo">
			<p>
				<xsl:apply-templates />
			</p>
		</xsl:for-each>

	</xsl:template>
	
	<!-- **************  -->
	
	<xsl:template match="passo">
		<xsl:apply-templates/>	
	</xsl:template>
	
	
	<xsl:template match="texto">
		
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>
	
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	
	
	<xsl:template match="ref_ingrediente">
	<xsl:element name="b">
		<a href="#{generate-id(key('Ingrediente', @id_ingrediente))}" > 
			<xsl:variable name="aux" select="@id_ingrediente"/>
			<xsl:value-of select="//ingrediente[@id_ingrediente = $aux]/nome"/>
		</a>
		</xsl:element>
	</xsl:template>	
	
	
	<xsl:template match="ref_receita">
		<a href="#{generate-id(key('Receita', @id_receita))}"> 
			<xsl:variable name="aux" select="@id_receita"/>
			<xsl:value-of select="//receita[@id_receita = $aux]/nome"/>
		</a>
	</xsl:template>
	
	
	<xsl:template match="url">
		
		<xsl:element name="img">
              <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
              </xsl:attribute>
              <xsl:attribute name="alt" >
              	<xsl:value-of select="@alt"/>
              </xsl:attribute>
             
             
        </xsl:element>
		
	</xsl:template>
</xsl:stylesheet>
