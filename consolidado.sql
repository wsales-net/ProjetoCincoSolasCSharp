GO
 -- EXEMPLO: LIVRO, PREGAÇÃO, WHATSAPP-AUDIO, PODCAST, SITE
If Object_Id('CategoriaAnotacaoEvangelho') Is Null
CREATE TABLE CategoriaAnotacaoEvangelho (
	Id INT IDENTITY,
	Descricao VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkCategoriaAnotacaoEvangelho PRIMARY KEY (ID)
)
GO
 -- EXEMPLO: BASICO, MEDIO, AVANÇADO
If Object_Id('NivelAnotacaoEvangelho') Is Null
CREATE TABLE NivelAnotacaoEvangelho (
	Id INT IDENTITY,
	Nivel INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkNivelAnotacaoEvangelho PRIMARY KEY (ID)
)
GO
 -- DESCRICAO: CONTROLE DE CLASSIFICAR POR 5 ESTRELAS
If Object_Id('ClassificacaoAnotacaoEvangelho') Is Null
CREATE TABLE ClassificacaoAnotacaoEvangelho (
	Id INT IDENTITY,
	Classificacao INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkClassificacaoAnotacaoEvangelho PRIMARY KEY (ID)
)
GO
 -- DESCRICAO: COMENTÁRIO DE USUÁRIOS PARA CADA ANOTAÇÃO
If Object_Id('ComentarioAnotacaoEnvagelho') Is Null
CREATE TABLE ComentarioAnotacaoEnvagelho (
	Id INT IDENTITY, 
	Cometario VARCHAR(1000),
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkComentarioAnotacaoEnvagelho PRIMARY KEY (ID)
)
GO
 -- DESCRICAO: ANOTAÇÃO DE CADA CONTEUDO
If Object_Id('AnotacaoEvangelho') Is Null
CREATE TABLE AnotacaoEvangelho (
	Id INT IDENTITY,
	IdCategoriaAnotacaoEvangelho INT NOT NULL,
	IdNivelAnotacaoEvangelho INT NOT NULL,
	IdComentarioAnotacaoEnvagelho INT,
	Titulo VARCHAR(20) NOT NULL,
	Descricao VARCHAR(MAX) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
	CONSTRAINT PkAnotacaoEvangelho PRIMARY KEY (Id),
	CONSTRAINT FkAnotacaoEvangelho_x_CategoriaEvangelho FOREIGN KEY (IdCategoriaAnotacaoEvangelho) 
	REFERENCES CategoriaAnotacaoEvangelho(Id)
) 
GO
 -- EXEMPLO: REDENÇÃO, SALVAÇÃO, PURIFICAÇÃO, JUSTIFICAÇÃO, ETC
 -- DESCRICAO: TAGS PARA CADA ANOTAÇÃO
If Object_Id('Tag') Is Null
CREATE TABLE Tag (
	ID INT IDENTITY,
	Titulo VARCHAR(20),
	CONSTRAINT PkTag PRIMARY KEY (Id)
)
GO
 -- DESCRICAO: TABELA INTERMEDIÁRIA
If Object_Id('AnotacaoEvangelhoTag') Is Null
CREATE TABLE AnotacaoEvangelhoTag
(
	ID INT IDENTITY,
	IdAnotacaoEvangelho INT NOT NULL,
	IdTag INT NOT NULL,
	CONSTRAINT PkAnotacaoEvangelhoTag PRIMARY KEY (Id), 
	CONSTRAINT FkAnotacaoEvangelhoTag_x_AnotacaoEvangelho FOREIGN KEY (IdAnotacaoEvangelho) REFERENCES AnotacaoEvangelho (Id),
	CONSTRAINT FkAnotacaoEvangelhoTag_x_Tag FOREIGN KEY (IdTag) REFERENCES Tag (Id)
)

GO
If Object_Id('Pessoa') Is Null
CREATE TABLE Pessoa (
	Id INT IDENTITY,
	IdEnderecoPessoa INT NOT NULL,
	IdFuncaoMinisterial INT NOT NULL,
	IdTelefone INT NOT NULL,
	IdEstadoCivil INT NOT NULL,
	Nome VARCHAR(15) NOT NULL,
	SobreNome VARCHAR(60) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento datetime NOT NULL,
	NomeMae VARCHAR(30),
	NomePai VARCHAR(30),
	RG VARCHAR(12) UNIQUE,
	CPF VARCHAR(14) UNIQUE,
	Email VARCHAR(30) UNIQUE,
	DataRegistro datetime NOT NULL,
	Ativo BIT NOT NULL,
	Foto VARCHAR,
  	CONSTRAINT PkPessoa PRIMARY KEY (Id)
)

GO

If Object_Id('FuncaoMinisterial') Is Null
CREATE TABLE FuncaoMinisterial (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
  	CONSTRAINT PkFuncaoMinisterial PRIMARY KEY (Id)
)

GO

If Object_Id('Dizimo') Is Null
CREATE TABLE Dizimo (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada datetime NOT NULL,
	Observacao VARCHAR(500),
  	CONSTRAINT PkDizimo PRIMARY KEY (Id)
)

GO

If Object_Id('Usuario') Is Null
CREATE TABLE Usuario (
	Id INT NOT NULL,
	IdPerfil INT NOT NULL,
	IdPessoa INT NOT NULL,
	Usuario VARCHAR(20) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
  	CONSTRAINT PkUsuario PRIMARY KEY (Id)
)

GO

If Object_Id('Venda') Is Null
CREATE TABLE Venda (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
	Desconto decimal(5,2) NOT NULL,
	ValorPago decimal(5,2) NOT NULL,
  	CONSTRAINT PkVenda PRIMARY KEY (Id)
)

GO

If Object_Id('Cidade') Is Null
CREATE TABLE Cidade (
	Id INT NOT NULL,
	IdEstado INT NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
  	CONSTRAINT PkCidade PRIMARY KEY (Id)
)

GO

If Object_Id('Estado') Is Null
CREATE TABLE Estado (
	Id INT NOT NULL,
	UF VARCHAR(2) NOT NULL UNIQUE,
  	CONSTRAINT PkEstado PRIMARY KEY (Id)
)

GO

If Object_Id('Endereco') Is Null
CREATE TABLE Endereco (
	Id INT NOT NULL,
	IdCidade INT NOT NULL,
	Cep VARCHAR(9) NOT NULL UNIQUE,
	Logradouro VARCHAR(50) NOT NULL,
	Bairro VARCHAR(70) NOT NULL,
	Numero INT NOT NULL,
	Complemento VARCHAR(20),
  	CONSTRAINT PkEndereco PRIMARY KEY (Id)
)

GO

If Object_Id('Oferta') Is Null
CREATE TABLE Oferta (
	Id INT NOT NULL,
	IdPessoa INT,
	Valor decimal(6,2) NOT NULL,
	DataEntrada datetime NOT NULL,
	Observacao VARCHAR(500),
  	CONSTRAINT PkOferta PRIMARY KEY (Id)
)

GO

If Object_Id('ItemVenda') Is Null
CREATE TABLE ItemVenda (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
  	CONSTRAINT PkItemVenda PRIMARY KEY (Id)
)

GO

If Object_Id('Categoria') Is Null
CREATE TABLE Categoria (
	Id INT NOT NULL,
	Descricao VARCHAR(20) NOT NULL UNIQUE,
  	CONSTRAINT PkCategoria PRIMARY KEY (Id)
)

GO

If Object_Id('Produto') Is Null
CREATE TABLE Produto (
	Id INT NOT NULL,
	IdCategoria INT NOT NULL,
	Nome VARCHAR(30) NOT NULL UNIQUE,
	Valor decimal(5,2) NOT NULL,
	Descricao VARCHAR(500) NOT NULL,
  	CONSTRAINT PkProduto PRIMARY KEY (Id)
)

GO

If Object_Id('ContaReceber') Is Null
CREATE TABLE ContaReceber (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdFormaPagamento INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada datetime NOT NULL,
	Observacao VARCHAR(500),
  	CONSTRAINT PkContaReceber PRIMARY KEY (Id)
)

GO

If Object_Id('FormaPagamento') Is Null
CREATE TABLE FormaPagamento (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
  	CONSTRAINT PkFormaPagamento PRIMARY KEY (Id)
)

GO

If Object_Id('Publico') Is Null
CREATE TABLE Publico (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	Classificacao VARCHAR(5) NOT NULL,
  	CONSTRAINT PkPublico PRIMARY KEY (Id)
)

GO

If Object_Id('Evento') Is Null
CREATE TABLE Evento (
	Id INT NOT NULL,
	IdPublico INT NOT NULL,
	IdEnderecoPessoa INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Data date NOT NULL,
	Hora time NOT NULL,
	Descricao VARCHAR(500),
	Numero INT NOT NULL,
	PontoReferencia VARCHAR(30),
  	CONSTRAINT PkEvento PRIMARY KEY (Id)
)

GO

If Object_Id('Telefone') Is Null
CREATE TABLE Telefone (
	Id INT NOT NULL,
	IdEstado INT NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Servico VARCHAR(10) NOT NULL,
  	CONSTRAINT PkTelefone PRIMARY KEY (Id)
)

GO

If Object_Id('Orcamento') Is Null
CREATE TABLE Orcamento (
	Id INT NOT NULL,
	TotalDizimo decimal(6,2) NOT NULL,
	TotalOferta decimal(6,2) NOT NULL,
  	CONSTRAINT PkOrcamento PRIMARY KEY (Id)
)

GO

If Object_Id('ContaPagar') Is Null
CREATE TABLE ContaPagar (
	Id INT NOT NULL,
	IdTipoConta INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataVencimento datetime NOT NULL,
	DataPagamento datetime,
  	CONSTRAINT PkContaPagar PRIMARY KEY (Id)
)

GO

If Object_Id('TipoContaPagar') Is Null
CREATE TABLE TipoContaPagar (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
  	CONSTRAINT PkTipoContaPagar PRIMARY KEY (Id)
)

GO

If Object_Id('Perfil') Is Null
CREATE TABLE Perfil (
	Id INT NOT NULL,
	Nome VARCHAR(20) NOT NULL UNIQUE,
  	CONSTRAINT PkPerfil PRIMARY KEY (Id)
)

GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [FkPessoa_x_Endereco] FOREIGN KEY ([IdEnderecoPessoa]) REFERENCES [Endereco]([Id])
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [FkPessoa_x_Endereco]
GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [FkPessoa_x_FuncaoMinisterial] FOREIGN KEY ([IdFuncaoMinisterial]) REFERENCES [FuncaoMinisterial]([Id])
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [FkPessoa_x_FuncaoMinisterial]
GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [FkPessoa_x_Telefone] FOREIGN KEY ([IdTelefone]) REFERENCES [Telefone]([Id])
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [FkPessoa_x_Telefone]

GO
ALTER TABLE [Dizimo] WITH CHECK ADD CONSTRAINT [FkDizimo_x_Pessoa] FOREIGN KEY ([IdPessoa]) REFERENCES [Pessoa]([Id])
GO
ALTER TABLE [Dizimo] CHECK CONSTRAINT [FkDizimo_x_Pessoa]

GO
ALTER TABLE [Usuario] WITH CHECK ADD CONSTRAINT [FkUsuario_x_Perfil] FOREIGN KEY ([IdPerfil]) REFERENCES [Perfil]([Id])
GO
ALTER TABLE [Usuario] CHECK CONSTRAINT [FkUsuario_x_Perfil]
GO
ALTER TABLE [Usuario] WITH CHECK ADD CONSTRAINT [FkUsuario_x_Pessoa] FOREIGN KEY ([IdPessoa]) REFERENCES [Pessoa]([Id])
GO
ALTER TABLE [Usuario] CHECK CONSTRAINT [FkUsuario_x_Pessoa]

GO
ALTER TABLE [Venda] WITH CHECK ADD CONSTRAINT [FkVenda_x_Pessoa] FOREIGN KEY ([IdPessoa]) REFERENCES [Pessoa]([Id])
GO
ALTER TABLE [Venda] CHECK CONSTRAINT [FkVenda_x_Pessoa]

GO
ALTER TABLE [Cidade] WITH CHECK ADD CONSTRAINT [FkCidade_x_Estado] FOREIGN KEY ([IdEstado]) REFERENCES [Estado]([Id])
GO
ALTER TABLE [Cidade] CHECK CONSTRAINT [FkCidade_x_Estado]

GO
ALTER TABLE [Endereco] WITH CHECK ADD CONSTRAINT [FkEndereco_x_Cidade] FOREIGN KEY ([IdCidade]) REFERENCES [Cidade]([Id])
GO
ALTER TABLE [Endereco] CHECK CONSTRAINT [FkEndereco_x_Cidade]

GO
ALTER TABLE [Oferta] WITH CHECK ADD CONSTRAINT [FkOferta_x_Pessoa] FOREIGN KEY ([IdPessoa]) REFERENCES [Pessoa]([Id])
GO
ALTER TABLE [Oferta] CHECK CONSTRAINT [FkOferta_x_Pessoa]

GO
ALTER TABLE [ItemVenda] WITH CHECK ADD CONSTRAINT [FkItemVenda_x_Venda] FOREIGN KEY ([IdVenda]) REFERENCES [Venda]([Id])
GO
ALTER TABLE [ItemVenda] CHECK CONSTRAINT [FkItemVenda_x_Venda]
GO
ALTER TABLE [ItemVenda] WITH CHECK ADD CONSTRAINT [FkItemVenda_x_Produto] FOREIGN KEY ([IdProduto]) REFERENCES [Produto]([Id])
GO
ALTER TABLE [ItemVenda] CHECK CONSTRAINT [FkItemVenda_x_Produto]

GO
ALTER TABLE [Produto] WITH CHECK ADD CONSTRAINT [FkProduto_x_Categoria] FOREIGN KEY ([IdCategoria]) REFERENCES [Categoria]([Id])
GO
ALTER TABLE [Produto] CHECK CONSTRAINT [FkProduto_x_Categoria]

GO
ALTER TABLE [ContaReceber] WITH CHECK ADD CONSTRAINT [FkContaReceber_x_Venda] FOREIGN KEY ([IdVenda]) REFERENCES [Venda]([Id])
GO
ALTER TABLE [ContaReceber] CHECK CONSTRAINT [FkContaReceber_x_Venda]
GO
ALTER TABLE [ContaReceber] WITH CHECK ADD CONSTRAINT [FkContaReceber_x_FormaPagamento] FOREIGN KEY ([IdFormaPagamento]) REFERENCES [FormaPagamento]([Id])
GO
ALTER TABLE [ContaReceber] CHECK CONSTRAINT [FkContaReceber_x_FormaPagamento]

GO
ALTER TABLE [Evento] WITH CHECK ADD CONSTRAINT [FkEvento_x_Publico] FOREIGN KEY ([IdPublico]) REFERENCES [Publico]([Id])
GO
ALTER TABLE [Evento] CHECK CONSTRAINT [FkEvento_x_Publico]
GO
ALTER TABLE [Evento] WITH CHECK ADD CONSTRAINT [FkEvento_x_Endereco] FOREIGN KEY ([IdEnderecoPessoa]) REFERENCES [Endereco]([Id])
GO
ALTER TABLE [Evento] CHECK CONSTRAINT [FkEvento_x_Endereco]

GO
ALTER TABLE [Telefone] WITH CHECK ADD CONSTRAINT [FkTelefone_x_Estado] FOREIGN KEY ([IdEstado]) REFERENCES [Estado]([Id])
GO
ALTER TABLE [Telefone] CHECK CONSTRAINT [FkTelefone_x_Estado]

GO
ALTER TABLE [ContaPagar] WITH CHECK ADD CONSTRAINT [FkContaPagar_x_TipoContaPagar] FOREIGN KEY ([IdTipoConta]) REFERENCES [TipoContaPagar]([Id])
GO
ALTER TABLE [ContaPagar] CHECK CONSTRAINT [FkContaPagar_x_TipoContaPagar]
