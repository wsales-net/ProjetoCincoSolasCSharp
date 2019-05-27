-- VERIFICAR ID TELEFONE E TABELA TELEFONE INTEGRAÇÃO

GO
 -- EXEMPLO: LIVRO, PREGAÇÃO, WHATSAPP-AUDIO, PODCAST, SITE
-- CategoriaAnotacaoEvangelho
-- ------------------------------------------------------------
If Object_Id('CategoriaAcaoEvangelho') Is Null

CREATE TABLE CategoriaAnotacaoEvangelho (
	Id INT IDENTITY,
	Descricao VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkCategoriaAnotacaoEvangelho PRIMARY KEY (ID)
)
GO


 -- EXEMPLO: BASICO, MEDIO, AVANÇADO
-- NivelAnotacaoEvangelho
------------------------------------------------------------
If Object_Id('NivelAnotacaoEvangelho') Is Null

CREATE TABLE NivelAnotacaoEvangelho (
	Id INT IDENTITY,
	Nivel INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkNivelAnotacaoEvangelho PRIMARY KEY (ID)
)
GO


 -- DESCRICAO: CONTROLE DE CLASSIFICAR POR 5 ESTRELAS
-- ClassificacaoAnotacaoEvangelho
------------------------------------------------------------
If Object_Id('ClassificacaoAnotacaoEvangelho') Is Null

CREATE TABLE ClassificacaoAnotacaoEvangelho (
	Id INT IDENTITY,
	Classificacao INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkClassificacaoAnotacaoEvangelho PRIMARY KEY (ID)
)
GO

 -- DESCRICAO: COMENTÁRIO DE USUÁRIOS PARA CADA ANOTAÇÃO
-- ComentarioAnotacaoEnvagelho
------------------------------------------------------------
If Object_Id('ComentarioAnotacaoEnvagelho') Is Null

CREATE TABLE ComentarioAnotacaoEnvagelho (
	Id INT IDENTITY, 
	Cometario VARCHAR(1000),
	DataRegistro DATETIME DEFAULT GETDATE(),
	CONSTRAINT PkComentarioAnotacaoEnvagelho PRIMARY KEY (ID)
)
GO

 -- DESCRICAO: ANOTAÇÃO DE CADA CONTEUDO
 -- AnotacaoEvangelho
------------------------------------------------------------
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
 -- Tag
------------------------------------------------------------
If Object_Id('Tag') Is Null

CREATE TABLE Tag (
	ID INT IDENTITY,
	Titulo VARCHAR(20),
	CONSTRAINT PkTag PRIMARY KEY (Id)
)
GO


 -- DESCRICAO: TABELA INTERMEDIÁRIA
 -- AnotacaoEvangelhoTag
------------------------------------------------------------
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

BEGIN TRAN
 -- Membro
------------------------------------------------------------
If Object_Id('Membro') Is Null

CREATE TABLE Membro (
	Id INT IDENTITY,
	IdEndereco INT NOT NULL,
	IdEstadoCivil INT NOT NULL,
	IdProfissao INT NOT NULL,
	Nome VARCHAR(15) NOT NULL,
	Sobrenome VARCHAR(60) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento DATETIME NOT NULL,
	NomeMae VARCHAR(30),
	NomePai VARCHAR(30),
	Rg VARCHAR(12),
	Cpf VARCHAR(14),
	CpfConjuge VARCHAR(14),
	NomeConjuge VARCHAR(14),
	Batizado BIT NOT NULL,
	Observacao VARCHAR(1000),
	DataRegistro DATETIME NOT NULL,
	Ativo BIT DEFAULT(1),
	Foto VARCHAR,
  	CONSTRAINT PkPessoa PRIMARY KEY (Id),
  	CONSTRAINT UQRgPessoa UNIQUE (Rg),
  	CONSTRAINT UQCpfPessoa UNIQUE (Cpf),
  	CONSTRAINT UQCpfConjugePessoa UNIQUE (Cpf),
	CONSTRAINT CHKIdPessoa CHECK (Id > 0)
)
GO
--MinisterioAnterior

-- EstadoCivil
-- ------------------------------------------------------------
If Object_Id('EstadoCivil') Is Null

CREATE TABLE EstadoCivil(
	Id int NOT NULL,
	Nome varchar(25) NOT NULL,
	Ativo bit NOT NULL,
  	CONSTRAINT PkEstadoCivil PRIMARY KEY (Id)
)
GO

-- Profissao
-- ------------------------------------------------------------
If Object_Id('Profissao') Is Null

CREATE TABLE Profissao (
	Id int IDENTITY(1,1) NOT NULL,
	Nome varchar(256) NOT NULL,
	Ativo bit NOT NULL,
  	CONSTRAINT PkProfissao PRIMARY KEY (Id)
)
GO


-- Dump of table curso
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [Curso];

CREATE TABLE Curso (
	Id INT IDENTITY,
	Nome VARCHAR(255) NOT NULL,
  	CONSTRAINT PkCurso PRIMARY KEY (Id),
	CONSTRAINT CHKIdCurso CHECK ([Id] > 0)
);

INSERT INTO Curso ([nome])
VALUES ('Integração Ministerial')


-- Dump of table exercicio
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [Exercicio];

CREATE TABLE Exercicio (
	Id int IDENTITY,
	IdSecao int NOT NULL,
	Pergunta varchar(500) NOT NULL,
	RespostaOficial varchar(500) NOT NULL,
	CONSTRAINT PkExercicio PRIMARY KEY (Id),
	CONSTRAINT CHKIdExercicio CHECK ([Id] > 0)
);

-- Dump of table Turma
-- -----------------------------------------------------------
DROP TABLE IF EXISTS [Turma];

CREATE TABLE Turma (
	Id int NOT NULL IDENTITY,
	IdLider	int NOT NULL,
	IdMembro int NOT NULL,
	DataInicio datetime NOT NULL,
	DataFim	date NOT NULL,
	CONSTRAINT PkTurma PRIMARY KEY (Id),
	CONSTRAINT CHKIdTurma CHECK ([Id] > 0)
);


-- Dump of table matricula
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [Matricula];

CREATE TABLE Matricula (
	Id int IDENTITY,
	IdMembro int NOT NULL,
	IdCurso int NOT NULL,
	DataMatricula datetime NOT NULL,
	CONSTRAINT PkMatricula PRIMARY KEY (Id),
	CONSTRAINT CHKIdMatricula CHECK ([Id] > 0)
);


-- Dump of table nota
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [nota];

CREATE TABLE Nota (
	Id int check ([id] > 0) NOT NULL IDENTITY,
	IdResposta int,
	Nota int,
	CONSTRAINT PkNota PRIMARY KEY (Id),
	CONSTRAINT CHKIdNota CHECK ([Id] > 0)
);


-- Dump of table resposta
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [Resposta];

CREATE TABLE Resposta (
	Id int IDENTITY,
	IdExercicio int,
	IdMembro int,
	RespostaDada varchar(500),
	CONSTRAINT PkResposta PRIMARY KEY (Id),
	CONSTRAINT CHKIdResposta CHECK ([Id] > 0)
);


-- Dump of table secao
-- ------------------------------------------------------------
DROP TABLE IF EXISTS [Secao];

CREATE TABLE Secao (
	Id int IDENTITY,
	IdCurso int NOT NULL,
	Titulo varchar(255) NOT NULL,
	Explicacao varchar(1000) NOT NULL,
	Numero int NOT NULL,
	CONSTRAINT PkSecao PRIMARY KEY (Id),
	CONSTRAINT CHKIdSecao CHECK ([Id] > 0)
)
ALTER TABLE Secao ADD CONSTRAINT DFTitulo DEFAULT '' FOR Titulo


-- Lider
-- ------------------------------------------------------------
If Object_Id('Lider') Is Null

CREATE TABLE Lider (
	Id INT IDENTITY,
	IdEndereco INT NOT NULL,
	IdEstadoCivil INT NOT NULL,
	IdProfissao INT NOT NULL,
	IdFuncaoMinisterial INT NOT NULL,
	IdSalarioMinisterial INT,
	Nome VARCHAR(15) NOT NULL,
	Sobrenome VARCHAR(60) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	DataNascimento DATETIME NOT NULL,
	NomeMae VARCHAR(30),
	NomePai VARCHAR(30),
	Rg VARCHAR(12) UNIQUE,
	Cpf VARCHAR(14) UNIQUE,
	CpfConjuge VARCHAR(14) UNIQUE,
	NomeConjuge VARCHAR(14),
	Batizado BIT DEFAULT(1),
	Observacao VARCHAR(1000),
	DataRegistro DATETIME NOT NULL,
	Ativo BIT DEFAULT(1),
	Foto VARCHAR,
  	CONSTRAINT PkPessoa PRIMARY KEY (Id)
)
GO


-- Endereco
-- ------------------------------------------------------------
If Object_Id('Endereco') Is Null

CREATE TABLE Endereco (
	Id INT NOT NULL,
	IdCidade INT NOT NULL,
	Cep VARCHAR(9) NOT NULL UNIQUE,
	Logradouro VARCHAR(50) NOT NULL,
	Bairro VARCHAR(70) NOT NULL,
	Numero INT NOT NULL,
	Complemento VARCHAR(20),
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkEndereco PRIMARY KEY (Id)
)

GO
If Object_Id('DonsEspirituais') Is Null
CREATE TABLE DonsEspirituais (
	Id INT IDENTITY,
	IdMembro INT NOT NULL,
	IdLider INT NOT NULL,
	Descricao VARCHAR(30) NOT NULL,
  	CONSTRAINT PkDonsEspirituais PRIMARY KEY (Id)
)
GO

--If Object_Id('Ministerio') Is Null
--	CREATE TABLE Ministerio (
--	);
--)

GO

If Object_Id('TipoEmail') Is Null
CREATE TABLE TipoEmail (
	Id INT NOT NULL,
	TipoEmail VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkTipoEmail PRIMARY KEY (Id)
)

GO

If Object_Id('Email') Is Null
CREATE TABLE Email (
	Id INT IDENTITY,
	IdPessoa INT NOT NULL,
	IdTipoEmail INT NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Observacao VARCHAR(500),
	EmailPrincipal BIT NOT NULL,
	Excluido BIT DEFAULT (0),
	Notificado BIT DEFAULT (0),
	Confirmado BIT DEFAULT (0),
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkFuncaoMinisterial PRIMARY KEY (Id)
)

GO

If Object_Id('FuncaoMinisterial') Is Null
CREATE TABLE FuncaoMinisterial (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkFuncaoMinisterial PRIMARY KEY (Id)
)

GO

If Object_Id('Dizimo') Is Null
CREATE TABLE Dizimo (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
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
	DataRegistro DATETIME DEFAULT GETDATE(),
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
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkVenda PRIMARY KEY (Id)
)

GO

If Object_Id('Cidade') Is Null
CREATE TABLE Cidade (
	Id INT NOT NULL,
	IdEstado INT NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkCidade PRIMARY KEY (Id)
)

GO

If Object_Id('Estado') Is Null
CREATE TABLE Estado (
	Id INT NOT NULL,
	UF VARCHAR(2) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkEstado PRIMARY KEY (Id)
)

GO

If Object_Id('Oferta') Is Null
CREATE TABLE Oferta (
	Id INT NOT NULL,
	IdPessoa INT,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
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
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkItemVenda PRIMARY KEY (Id)
)

GO

If Object_Id('Categoria') Is Null
CREATE TABLE Categoria (
	Id INT NOT NULL,
	Descricao VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
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
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkProduto PRIMARY KEY (Id)
)

GO

If Object_Id('ContaReceber') Is Null
CREATE TABLE ContaReceber (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdFormaPagamento INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkContaReceber PRIMARY KEY (Id)
)

GO

If Object_Id('FormaPagamento') Is Null
CREATE TABLE FormaPagamento (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkFormaPagamento PRIMARY KEY (Id)
)

GO

If Object_Id('Publico') Is Null
CREATE TABLE Publico (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	Classificacao VARCHAR(5) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkPublico PRIMARY KEY (Id)
)

GO

If Object_Id('Evento') Is Null
CREATE TABLE Evento (
	Id INT NOT NULL,
	IdPublico INT NOT NULL,
	IdEndereco INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Data date NOT NULL,
	Hora time NOT NULL,
	Descricao VARCHAR(500),
	Numero INT NOT NULL,
	PontoReferencia VARCHAR(30),
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkEvento PRIMARY KEY (Id)
)

GO

If Object_Id('Telefone') Is Null
CREATE TABLE Telefone (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	IdTipoTelefone INT NOT NULL,
	IdEstado INT NOT NULL,
	Ddd INT NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Servico VARCHAR(10) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkTelefone PRIMARY KEY (Id)
)

GO

If Object_Id('TipoTelefone') Is Null
CREATE TABLE TipoContaPagar (
	Id INT NOT NULL,
	TipoTelefone VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkTipoContaPagar PRIMARY KEY (Id)
)

GO

If Object_Id('Orcamento') Is Null
CREATE TABLE Orcamento (
	Id INT NOT NULL,
	TotalDizimo decimal(6,2) NOT NULL,
	TotalOferta decimal(6,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkOrcamento PRIMARY KEY (Id)
)

GO

If Object_Id('ContaPagar') Is Null
CREATE TABLE ContaPagar (
	Id INT NOT NULL,
	IdTipoConta INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataVencimento DATETIME NOT NULL,
	DataPagamento DATETIME,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkContaPagar PRIMARY KEY (Id)
)

GO

If Object_Id('TipoContaPagar') Is Null
CREATE TABLE TipoContaPagar (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkTipoContaPagar PRIMARY KEY (Id)
)

GO

If Object_Id('Perfil') Is Null
CREATE TABLE Perfil (
	Id INT NOT NULL,
	Nome VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
  	CONSTRAINT PkPerfil PRIMARY KEY (Id)
)

GO
ALTER TABLE Pessoa WITH CHECK ADD CONSTRAINT FkPessoa_x_Endereco FOREIGN KEY (IdEndereco) REFERENCES Endereco(Id)
GO
ALTER TABLE Pessoa ADD CONSTRAINT CHK_PessoaSexo CHECK (SEXO = 'M' OR SEXO = 'F');
GO
ALTER TABLE Pessoa CHECK CONSTRAINT FkPessoa_x_Endereco
GO
ALTER TABLE Pessoa WITH CHECK ADD CONSTRAINT FkPessoa_x_FuncaoMinisterial FOREIGN KEY (IdFuncaoMinisterial) REFERENCES FuncaoMinisterial(Id)
GO
ALTER TABLE Pessoa CHECK CONSTRAINT FkPessoa_x_FuncaoMinisterial
GO
ALTER TABLE Pessoa WITH CHECK ADD CONSTRAINT FkPessoa_x_Telefone FOREIGN KEY (IdTelefone) REFERENCES Telefone(Id)
GO
ALTER TABLE Pessoa CHECK CONSTRAINT FkPessoa_x_Telefone

GO
ALTER TABLE Email WITH CHECK ADD CONSTRAINT FkEmail_x_Pessoa FOREIGN KEY (IdPessoa) REFERENCES Telefone(Id)
GO
ALTER TABLE Email CHECK CONSTRAINT FkEmail_x_Pessoa
GO
CREATE UNIQUE INDEX UQ_Email ON dbo.Email(IdPessoa, Email);

GO
ALTER TABLE Dizimo WITH CHECK ADD CONSTRAINT FkDizimo_x_Pessoa FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
GO
ALTER TABLE Dizimo CHECK CONSTRAINT FkDizimo_x_Pessoa

GO
ALTER TABLE Usuario WITH CHECK ADD CONSTRAINT FkUsuario_x_Perfil FOREIGN KEY (IdPerfil) REFERENCES Perfil(Id)
GO
ALTER TABLE Usuario CHECK CONSTRAINT FkUsuario_x_Perfil
GO
ALTER TABLE Usuario WITH CHECK ADD CONSTRAINT FkUsuario_x_Pessoa FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
GO
ALTER TABLE Usuario CHECK CONSTRAINT FkUsuario_x_Pessoa

GO
ALTER TABLE Venda WITH CHECK ADD CONSTRAINT FkVenda_x_Pessoa FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
GO
ALTER TABLE Venda CHECK CONSTRAINT FkVenda_x_Pessoa

GO
ALTER TABLE Cidade WITH CHECK ADD CONSTRAINT FkCidade_x_Estado FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
GO
ALTER TABLE Cidade CHECK CONSTRAINT FkCidade_x_Estado

GO
ALTER TABLE Endereco WITH CHECK ADD CONSTRAINT FkEndereco_x_Cidade FOREIGN KEY (IdCidade) REFERENCES Cidade(Id)
GO
ALTER TABLE Endereco CHECK CONSTRAINT FkEndereco_x_Cidade

GO
ALTER TABLE Oferta WITH CHECK ADD CONSTRAINT FkOferta_x_Pessoa FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
GO
ALTER TABLE Oferta CHECK CONSTRAINT FkOferta_x_Pessoa

GO
ALTER TABLE ItemVenda WITH CHECK ADD CONSTRAINT FkItemVenda_x_Venda FOREIGN KEY (IdVenda) REFERENCES Venda(Id)
GO
ALTER TABLE ItemVenda CHECK CONSTRAINT FkItemVenda_x_Venda
GO
ALTER TABLE ItemVenda WITH CHECK ADD CONSTRAINT FkItemVenda_x_Produto FOREIGN KEY (IdProduto) REFERENCES Produto(Id)
GO
ALTER TABLE ItemVenda CHECK CONSTRAINT FkItemVenda_x_Produto

GO
ALTER TABLE Produto WITH CHECK ADD CONSTRAINT FkProduto_x_Categoria FOREIGN KEY (IdCategoria) REFERENCES Categoria(Id)
GO
ALTER TABLE Produto CHECK CONSTRAINT FkProduto_x_Categoria

GO
ALTER TABLE ContaReceber WITH CHECK ADD CONSTRAINT FkContaReceber_x_Venda FOREIGN KEY (IdVenda) REFERENCES Venda(Id)
GO
ALTER TABLE ContaReceber CHECK CONSTRAINT FkContaReceber_x_Venda
GO
ALTER TABLE ContaReceber WITH CHECK ADD CONSTRAINT FkContaReceber_x_FormaPagamento FOREIGN KEY (IdFormaPagamento) REFERENCES FormaPagamento(Id)
GO
ALTER TABLE ContaReceber CHECK CONSTRAINT FkContaReceber_x_FormaPagamento

GO
ALTER TABLE Evento WITH CHECK ADD CONSTRAINT FkEvento_x_Publico FOREIGN KEY (IdPublico) REFERENCES Publico(Id)
GO
ALTER TABLE Evento CHECK CONSTRAINT FkEvento_x_Publico
GO
ALTER TABLE Evento WITH CHECK ADD CONSTRAINT FkEvento_x_Endereco FOREIGN KEY (IdEndereco) REFERENCES Endereco(Id)
GO
ALTER TABLE Evento CHECK CONSTRAINT FkEvento_x_Endereco

GO
ALTER TABLE Telefone WITH CHECK ADD CONSTRAINT FkTelefone_x_Estado FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
GO
ALTER TABLE Telefone CHECK CONSTRAINT FkTelefone_x_Estado

GO
ALTER TABLE ContaPagar WITH CHECK ADD CONSTRAINT FkContaPagar_x_TipoContaPagar FOREIGN KEY (IdTipoConta) REFERENCES TipoContaPagar(Id)
GO
ALTER TABLE ContaPagar CHECK CONSTRAINT FkContaPagar_x_TipoContaPagar
