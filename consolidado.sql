-- VERIFICAR ID TELEFONE E TABELA TELEFONE INTEGRAÇÃO

GO
-- EXEMPLO: LIVRO, PREGAÇÃO, WHATSAPP-AUDIO, PODCAST, SITE
-- CategoriaAcaoEvangelho
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'CategoriaAnotacaoEvangelho')
DROP TABLE CategoriaAnotacaoEvangelho
CREATE TABLE CategoriaAnotacaoEvangelho (
	Id INT IDENTITY,
	Descricao VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- EXEMPLO: BASICO, MEDIO, AVANÇADO
-- NivelAnotacaoEvangelho
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'NivelAnotacaoEvangelho')
DROP TABLE NivelAnotacaoEvangelho
CREATE TABLE NivelAnotacaoEvangelho (
	Id INT IDENTITY,
	Nivel INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- DESCRICAO: CONTROLE DE CLASSIFICAR POR 5 ESTRELAS
-- ClassificacaoAnotacaoEvangelho
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ClassificacaoAnotacaoEvangelho')
DROP TABLE ClassificacaoAnotacaoEvangelho
CREATE TABLE ClassificacaoAnotacaoEvangelho (
	Id INT IDENTITY,
	Classificacao INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO

-- DESCRICAO: COMENTÁRIO DE USUÁRIOS PARA CADA ANOTAÇÃO
-- ComentarioAnotacaoEnvagelho
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ComentarioAnotacaoEnvagelho')
DROP TABLE ComentarioAnotacaoEnvagelho
CREATE TABLE ComentarioAnotacaoEnvagelho (
	Id INT IDENTITY, 
	Cometario VARCHAR(1000),
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO

-- DESCRICAO: ANOTAÇÃO DE CADA CONTEUDO
-- AnotacaoEvangelho
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'AnotacaoEvangelho')
DROP TABLE AnotacaoEvangelho
CREATE TABLE AnotacaoEvangelho (
	Id INT IDENTITY,
	IdCategoriaAnotacaoEvangelho INT NOT NULL,
	IdNivelAnotacaoEvangelho INT NOT NULL,
	IdComentarioAnotacaoEnvagelho INT,
	Titulo VARCHAR(20) NOT NULL,
	Descricao VARCHAR(MAX) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- EXEMPLO: REDENÇÃO, SALVAÇÃO, PURIFICAÇÃO, JUSTIFICAÇÃO, ETC
-- DESCRICAO: TAGS PARA CADA ANOTAÇÃO
-- TagTag------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Tag')
DROP TABLE Tag
CREATE TABLE Tag (
	ID INT IDENTITY,
	Titulo VARCHAR(20),
);
GO


-- DESCRICAO: TABELA INTERMEDIÁRIA
-- AnotacaoEvangelhoTag
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'AnotacaoEvangelhoTag')
DROP TABLE AnotacaoEvangelhoTag
CREATE TABLE AnotacaoEvangelhoTag
(
	ID INT IDENTITY,
	IdAnotacaoEvangelho INT NOT NULL,
	IdTag INT NOT NULL,
);
GO


-- EstadoCivil
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'EstadoCivil')
DROP TABLE EstadoCivil
CREATE TABLE EstadoCivil(
	Id int NOT NULL,
	Nome varchar(25) NOT NULL,
	Ativo bit NOT NULL,
);
GO


-- Estado
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Estado')
DROP TABLE Estado
CREATE TABLE Estado (
	Id INT NOT NULL,
	UF VARCHAR(2) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Cidade
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Cidade')
DROP TABLE Cidade
CREATE TABLE Cidade (
	Id INT NOT NULL,
	IdEstado INT NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- EnderecoEndereco
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Endereco')
DROP TABLE Endereco
CREATE TABLE Endereco (
	Id INT NOT NULL,
	IdCidade INT NOT NULL,
	Cep VARCHAR(9) NOT NULL UNIQUE,
	Logradouro VARCHAR(50) NOT NULL,
	Bairro VARCHAR(70) NOT NULL,
	Numero INT NOT NULL,
	Complemento VARCHAR(20),
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Profissao
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Profissao')
DROP TABLE Profissao
CREATE TABLE Profissao (
	Id int IDENTITY(1,1) NOT NULL,
	Nome varchar(256) NOT NULL,
	Ativo bit NOT NULL,
);
GO


-- Membro
------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Membro')
DROP TABLE Membro
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
      );
GO


-- Curso
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Curso')
DROP TABLE Curso
CREATE TABLE Curso (
	Id INT IDENTITY,
	Nome VARCHAR(255) NOT NULL,
);
GO

-- Exercicio
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Exercicio')
DROP TABLE Exercicio
CREATE TABLE Exercicio (
	Id int IDENTITY,
	IdSecao int NOT NULL,
	Pergunta varchar(500) NOT NULL,
	RespostaOficial varchar(500) NOT NULL,
);
GO


-- TurmaTurma
-------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Turma')
DROP TABLE Turma
CREATE TABLE Turma (
	Id int NOT NULL IDENTITY,
	IdLider	int NOT NULL,
	IdMembro int NOT NULL,
	DataInicio datetime NOT NULL,
	DataFim	date NOT NULL,
);
GO


-- Matricula
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Matricula')
DROP TABLE Matricula
CREATE TABLE Matricula (
	Id int IDENTITY,
	IdMembro int NOT NULL,
	IdCurso int NOT NULL,
	DataMatricula datetime NOT NULL,
);
GO


-- Nota
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Nota')
DROP TABLE Nota
CREATE TABLE Nota (
	Id int check (id > 0) NOT NULL IDENTITY,
	IdResposta int,
	Nota int,
);
GO


-- respostaResposta
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Resposta')
DROP TABLE Resposta
CREATE TABLE Resposta (
	Id int IDENTITY,
	IdExercicio int,
	IdMembro int,
	RespostaDada varchar(500),
);
GO


-- secaoSecao
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Secao')
DROP TABLE Secao
CREATE TABLE Secao (
	Id int IDENTITY,
	IdCurso int NOT NULL,
	Titulo varchar(255) NOT NULL,
	Explicacao varchar(1000) NOT NULL,
	Numero int NOT NULL,
);
GO


-- FuncaoMinisterial
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'FuncaoMinisterial')
DROP TABLE FuncaoMinisterial
CREATE TABLE FuncaoMinisterial (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- AtividadeMembro
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'AtividadeMembro')
DROP TABLE AtividadeMembro
CREATE TABLE AtividadeMembro (
	Id INT NOT NULL,
	IdMembro INT,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Lider
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Lider')
DROP TABLE Lider
CREATE TABLE Lider (
	Id INT IDENTITY,
	IdEndereco INT NOT NULL,
	IdEstadoCivil INT NOT NULL,
	IdProfissao INT NOT NULL,
	IdFuncaoMinisterial INT NOT NULL,
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
	Salario Decimal(18,2),
	Ativo BIT DEFAULT(1),
	Foto VARCHAR,
);
GO


-- DonsEspirituais
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'DonsEspirituais')
DROP TABLE DonsEspirituais
CREATE TABLE DonsEspirituais (
	Id INT IDENTITY,
	IdPessoa INT NOT NULL,
	Descricao VARCHAR(30) NOT NULL,
);
GO


-- TipoEmail
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'TipoEmail')
DROP TABLE TipoEmail
CREATE TABLE TipoEmail (
	Id INT NOT NULL,
	TipoEmail VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Email
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Email')
DROP TABLE Email
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
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Dizimo
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Dizimo')
DROP TABLE Dizimo
CREATE TABLE Dizimo (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- PerfilPerfil
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Perfil')
DROP TABLE Perfil
CREATE TABLE Perfil (
	Id INT NOT NULL,
	Nome VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);


-- Usuario
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Usuario')
DROP TABLE Usuario
CREATE TABLE Usuario (
	Id INT NOT NULL,
	IdPerfil INT NOT NULL,
	IdPessoa INT NOT NULL,
	Usuario VARCHAR(20) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Venda
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Venda')
DROP TABLE Venda
CREATE TABLE Venda (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
	Desconto decimal(5,2) NOT NULL,
	ValorPago decimal(5,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Oferta
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Oferta')
DROP TABLE Oferta
CREATE TABLE Oferta (
	Id INT NOT NULL,
	IdPessoa INT,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Categoria
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Categoria')
DROP TABLE Categoria
CREATE TABLE Categoria (
	Id INT NOT NULL,
	Descricao VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Produto
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Produto')
DROP TABLE Produto
CREATE TABLE Produto (
	Id INT NOT NULL,
	IdCategoria INT NOT NULL,
	Nome VARCHAR(30) NOT NULL UNIQUE,
	Valor decimal(5,2) NOT NULL,
	Descricao VARCHAR(500) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- ItemVenda
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ItemVenda')
DROP TABLE ItemVenda
CREATE TABLE ItemVenda (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- FormaPagamento
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'FormaPagamento')
DROP TABLE FormaPagamento
CREATE TABLE FormaPagamento (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- ContaReceber
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ContaReceber')
DROP TABLE ContaReceber
CREATE TABLE ContaReceber (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdFormaPagamento INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Publico
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Publico')
DROP TABLE Publico
CREATE TABLE Publico (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	Classificacao VARCHAR(5) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Evento
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Evento')
DROP TABLE Evento
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
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Telefone
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Telefone')
DROP TABLE Telefone
CREATE TABLE Telefone (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	IdTipoTelefone INT NOT NULL,
	IdEstado INT NOT NULL,
	Ddd INT NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Servico VARCHAR(10) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- Orcamento
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Orcamento')
DROP TABLE Orcamento
CREATE TABLE Orcamento (
	Id INT NOT NULL,
	TotalDizimo decimal(6,2) NOT NULL,
	TotalOferta decimal(6,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- TipoContaPagar
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'TipoContaPagar')
DROP TABLE TipoContaPagar
CREATE TABLE TipoContaPagar (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO


-- ContaPagar
--------------------------------------------------------------
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'ContaPagar')
DROP TABLE ContaPagar
CREATE TABLE ContaPagar (
	Id INT NOT NULL,
	IdTipoConta INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataVencimento DATETIME NOT NULL,
	DataPagamento DATETIME,
	DataRegistro DATETIME DEFAULT GETDATE()
);
GO
