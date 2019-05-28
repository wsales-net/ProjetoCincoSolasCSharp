BEGIN TRAN

-- VERIFICAR ID TELEFONE E TABELA TELEFONE INTEGRAÇÃO

GO
-- EXEMPLO: LIVRO, PREGAÇÃO, WHATSAPP-AUDIO, PODCAST, SITE
-- CategoriaAcaoEvangelho
--------------------------------------------------------------
If Object_Id('CategoriaAcaoEvangelho') Is Null

CREATE TABLE CategoriaAnotacaoEvangelho (
	Id INT IDENTITY,
	Descricao VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- EXEMPLO: BASICO, MEDIO, AVANÇADO
-- NivelAnotacaoEvangelho
------------------------------------------------------------
If Object_Id('NivelAnotacaoEvangelho') Is Null

CREATE TABLE NivelAnotacaoEvangelho (
	Id INT IDENTITY,
	Nivel INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- DESCRICAO: CONTROLE DE CLASSIFICAR POR 5 ESTRELAS
-- ClassificacaoAnotacaoEvangelho
------------------------------------------------------------
If Object_Id('ClassificacaoAnotacaoEvangelho') Is Null

CREATE TABLE ClassificacaoAnotacaoEvangelho (
	Id INT IDENTITY,
	Classificacao INT NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO

-- DESCRICAO: COMENTÁRIO DE USUÁRIOS PARA CADA ANOTAÇÃO
-- ComentarioAnotacaoEnvagelho
------------------------------------------------------------
If Object_Id('ComentarioAnotacaoEnvagelho') Is Null

CREATE TABLE ComentarioAnotacaoEnvagelho (
	Id INT IDENTITY, 
	Cometario VARCHAR(1000),
	DataRegistro DATETIME DEFAULT GETDATE(),
);
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
);
GO


-- EXEMPLO: REDENÇÃO, SALVAÇÃO, PURIFICAÇÃO, JUSTIFICAÇÃO, ETC
-- DESCRICAO: TAGS PARA CADA ANOTAÇÃO
-- TagTag------------------------------------------------------------
If Object_Id('Tag') Is Null

CREATE TABLE Tag (
	ID INT IDENTITY,
	Titulo VARCHAR(20),
);
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
);
GO


-- EstadoCivil
--------------------------------------------------------------
If Object_Id('EstadoCivil') Is Null

CREATE TABLE EstadoCivil(
	Id int NOT NULL,
	Nome varchar(25) NOT NULL,
	Ativo bit NOT NULL,
);
GO


-- Estado
--------------------------------------------------------------
If Object_Id('Estado') Is Null

CREATE TABLE Estado (
	Id INT NOT NULL,
	UF VARCHAR(2) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Cidade
--------------------------------------------------------------
If Object_Id('Cidade') Is Null

CREATE TABLE Cidade (
	Id INT NOT NULL,
	IdEstado INT NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- EnderecoEndereco
--------------------------------------------------------------
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
);
GO


-- Profissao
--------------------------------------------------------------
If Object_Id('Profissao') Is Null

CREATE TABLE Profissao (
	Id int IDENTITY(1,1) NOT NULL,
	Nome varchar(256) NOT NULL,
	Ativo bit NOT NULL,
);
GO


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
      );
GO


-- Curso
--------------------------------------------------------------
If Object_Id('Curso') Is Null

CREATE TABLE Curso (
	Id INT IDENTITY,
	Nome VARCHAR(255) NOT NULL,
);
GO

-- Exercicio
--------------------------------------------------------------
If Object_Id('Exercicio') Is Null

CREATE TABLE Exercicio (
	Id int IDENTITY,
	IdSecao int NOT NULL,
	Pergunta varchar(500) NOT NULL,
	RespostaOficial varchar(500) NOT NULL,
);
GO


-- TurmaTurma
-------------------------------------------------------------
If Object_Id('Turma') Is Null

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
If Object_Id('Matricula') Is Null

CREATE TABLE Matricula (
	Id int IDENTITY,
	IdMembro int NOT NULL,
	IdCurso int NOT NULL,
	DataMatricula datetime NOT NULL,
);
GO


-- Nota
--------------------------------------------------------------
If Object_Id('Nota') Is Null

CREATE TABLE Nota (
	Id int check (id > 0) NOT NULL IDENTITY,
	IdResposta int,
	Nota int,
);
GO


-- respostaResposta
--------------------------------------------------------------
If Object_Id('Resposta') Is Null

CREATE TABLE Resposta (
	Id int IDENTITY,
	IdExercicio int,
	IdMembro int,
	RespostaDada varchar(500),
);
GO


-- secaoSecao
--------------------------------------------------------------
If Object_Id('Secao') Is Null

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
If Object_Id('FuncaoMinisterial') Is Null

CREATE TABLE FuncaoMinisterial (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- AtividadeMembro
--------------------------------------------------------------
If Object_Id('AtividadeMembro') Is Null

CREATE TABLE AtividadeMembro (
	Id INT NOT NULL,
	IdMembro INT,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Lider
--------------------------------------------------------------
If Object_Id('Lider') Is Null

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
If Object_Id('DonsEspirituais') Is Null

CREATE TABLE DonsEspirituais (
	Id INT IDENTITY,
	IdPessoa INT NOT NULL,
	Descricao VARCHAR(30) NOT NULL,
);
GO


-- TipoEmail
--------------------------------------------------------------
If Object_Id('TipoEmail') Is Null

CREATE TABLE TipoEmail (
	Id INT NOT NULL,
	TipoEmail VARCHAR(15) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Email
--------------------------------------------------------------
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
);
GO


-- Dizimo
--------------------------------------------------------------
If Object_Id('Dizimo') Is Null

CREATE TABLE Dizimo (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- PerfilPerfil
--------------------------------------------------------------
If Object_Id('Perfil') Is Null

CREATE TABLE Perfil (
	Id INT NOT NULL,
	Nome VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);


-- Usuario
--------------------------------------------------------------
If Object_Id('Usuario') Is Null

CREATE TABLE Usuario (
	Id INT NOT NULL,
	IdPerfil INT NOT NULL,
	IdPessoa INT NOT NULL,
	Usuario VARCHAR(20) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Venda
--------------------------------------------------------------
If Object_Id('Venda') Is Null

CREATE TABLE Venda (
	Id INT NOT NULL,
	IdPessoa INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
	Desconto decimal(5,2) NOT NULL,
	ValorPago decimal(5,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Oferta
--------------------------------------------------------------
If Object_Id('Oferta') Is Null

CREATE TABLE Oferta (
	Id INT NOT NULL,
	IdPessoa INT,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Categoria
--------------------------------------------------------------
If Object_Id('Categoria') Is Null

CREATE TABLE Categoria (
	Id INT NOT NULL,
	Descricao VARCHAR(20) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Produto
--------------------------------------------------------------
If Object_Id('Produto') Is Null

CREATE TABLE Produto (
	Id INT NOT NULL,
	IdCategoria INT NOT NULL,
	Nome VARCHAR(30) NOT NULL UNIQUE,
	Valor decimal(5,2) NOT NULL,
	Descricao VARCHAR(500) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- ItemVenda
--------------------------------------------------------------
If Object_Id('ItemVenda') Is Null

CREATE TABLE ItemVenda (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdProduto INT NOT NULL,
	Quantidade INT NOT NULL,
	Valor decimal(5,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- FormaPagamento
--------------------------------------------------------------
If Object_Id('FormaPagamento') Is Null

CREATE TABLE FormaPagamento (
	Id INT NOT NULL,
	Descricao VARCHAR(15) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- ContaReceber
--------------------------------------------------------------
If Object_Id('ContaReceber') Is Null

CREATE TABLE ContaReceber (
	Id INT NOT NULL,
	IdVenda INT NOT NULL,
	IdFormaPagamento INT NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataEntrada DATETIME NOT NULL,
	Observacao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Publico
--------------------------------------------------------------
If Object_Id('Publico') Is Null

CREATE TABLE Publico (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	Classificacao VARCHAR(5) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- Evento
--------------------------------------------------------------
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
);
GO


-- Telefone
--------------------------------------------------------------
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
);
GO


-- Orcamento
--------------------------------------------------------------
If Object_Id('Orcamento') Is Null

CREATE TABLE Orcamento (
	Id INT NOT NULL,
	TotalDizimo decimal(6,2) NOT NULL,
	TotalOferta decimal(6,2) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- TipoContaPagar
--------------------------------------------------------------
If Object_Id('TipoContaPagar') Is Null

CREATE TABLE TipoContaPagar (
	Id INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL UNIQUE,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO


-- ContaPagar
--------------------------------------------------------------
If Object_Id('ContaPagar') Is Null

CREATE TABLE ContaPagar (
	Id INT NOT NULL,
	IdTipoConta INT NOT NULL,
	Descricao VARCHAR(10) NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataVencimento DATETIME NOT NULL,
	DataPagamento DATETIME,
	DataRegistro DATETIME DEFAULT GETDATE(),
);
GO

--ROLLBACK
