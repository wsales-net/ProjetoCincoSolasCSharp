 

DROP TABLE IF EXISTS [Pessoa]

GO
DROP TABLE IF EXISTS [Funcao]

GO
DROP TABLE IF EXISTS [Dizimo]

GO
DROP TABLE IF EXISTS [Usuario]

GO
DROP TABLE IF EXISTS [Venda]

GO
DROP TABLE IF EXISTS [Cidade]

GO
DROP TABLE IF EXISTS [Estado]

GO
DROP TABLE IF EXISTS [Endereco]

GO
DROP TABLE IF EXISTS [Oferta]

GO
DROP TABLE IF EXISTS [ItemVenda]

GO
DROP TABLE IF EXISTS [Categoria]

GO
DROP TABLE IF EXISTS [Produto]

GO
DROP TABLE IF EXISTS [ContaReceber]

GO
DROP TABLE IF EXISTS [FormaPagamento]

GO
DROP TABLE IF EXISTS [Publico]

GO
DROP TABLE IF EXISTS [Evento]

GO
DROP TABLE IF EXISTS [Telefone]

GO
DROP TABLE IF EXISTS [Orcamento]

GO
DROP TABLE IF EXISTS [ContaPagar]

GO
DROP TABLE IF EXISTS [TipoContaPagar]

GO
DROP TABLE IF EXISTS [Perfil]

GO
DROP TABLE IF EXISTS [TipoTelefone]

GO


CREATE TABLE [Pessoa] (
	Id integer NOT NULL,
	EnderecoId integer NOT NULL,
	FuncaoId integer NOT NULL,
	TelefoneId integer NOT NULL,
	Nome varchar(15) NOT NULL,
	SobreNome varchar(60) NOT NULL,
	Sexo varchar(1) NOT NULL,
	DataNascimento datetime NOT NULL,
	Numero integer NOT NULL,
	Complemento varchar(20),
	RG varchar(12) UNIQUE,
	CPF varchar(14) UNIQUE,
	Email varchar(30) UNIQUE,
	Ativo binary NOT NULL,
	Foto varchar,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_PESSOA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Funcao] (
	Id integer NOT NULL,
	Descricao varchar(15) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_FUNCAO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Dizimo] (
	Id integer NOT NULL,
	PessoaId integer NOT NULL,
	Valor decimal(6,2) NOT NULL,
	Observacao varchar(500),
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_DIZIMO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Usuario] (
	Id integer NOT NULL,
	PerfilId integer NOT NULL,
	PessoaId integer NOT NULL,
	Usuario varchar(20) NOT NULL UNIQUE,
	Senha varchar(30) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataUltimoAcesso datetime,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Venda] (
	Id integer NOT NULL,
	PessoaId integer NOT NULL,
	Valor decimal(5,2) NOT NULL,
	Desconto decimal(5,2) NOT NULL,
	ValorPago decimal(5,2) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_VENDA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cidade] (
	Id integer NOT NULL,
	EstadoId integer NOT NULL,
	Descricao varchar(100) NOT NULL,
  CONSTRAINT [PK_CIDADE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Estado] (
	Id integer NOT NULL,
	UF varchar(2) NOT NULL UNIQUE,
  CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Endereco] (
	Id integer NOT NULL,
	CidadeId integer NOT NULL,
	Cep varchar(9) NOT NULL UNIQUE,
	Logradouro varchar(50) NOT NULL,
	Bairro varchar(70) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_ENDERECO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Oferta] (
	Id integer NOT NULL,
	PessoaId integer,
	Valor decimal(6,2) NOT NULL,
	Observacao varchar(500),
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_OFERTA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ItemVenda] (
	Id integer NOT NULL,
	VendaId integer NOT NULL,
	ProdutoId integer NOT NULL,
	Quantidade integer NOT NULL,
	Valor decimal(5,2) NOT NULL,
  CONSTRAINT [PK_ITEMVENDA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Categoria] (
	Id integer NOT NULL,
	Descricao varchar(20) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Produto] (
	Id integer NOT NULL,
	CategoriaId integer NOT NULL,
	Nome varchar(30) NOT NULL UNIQUE,
	Valor decimal(5,2) NOT NULL,
	Descricao varchar(500) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ContaReceber] (
	Id integer NOT NULL,
	VendaId integer NOT NULL,
	FormaPagamentoId integer NOT NULL,
	Valor decimal(6,2) NOT NULL,
	Observacao varchar(500),
	DataCadastro datetime NOT NULL,
	DataAtualizacao decimal NOT NULL,
  CONSTRAINT [PK_CONTARECEBER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [FormaPagamento] (
	Id integer NOT NULL,
	Descricao varchar(15) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
  CONSTRAINT [PK_FORMAPAGAMENTO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Publico] (
	Id integer NOT NULL,
	Descricao varchar(10) NOT NULL UNIQUE,
	Classificacao varchar(5) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_PUBLICO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Evento] (
	Id integer NOT NULL,
	PublicoId integer NOT NULL,
	EnderecoId integer NOT NULL,
	Nome varchar(100) NOT NULL,
	Data date NOT NULL,
	Hora time NOT NULL,
	Descricao varchar(500),
	Numero integer NOT NULL,
	PontoReferencia varchar(30),
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_EVENTO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Telefone] (
	Id integer NOT NULL,
	EstadoId integer NOT NULL,
	Numero varchar(10) NOT NULL,
	Servico varchar(10) NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
	TipoTelefone integer NOT NULL,
  CONSTRAINT [PK_TELEFONE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Orcamento] (
	Id integer NOT NULL,
	TotalDizimo decimal(6,2) NOT NULL,
	TotalOferta decimal(6,2) NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_ORCAMENTO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ContaPagar] (
	Id integer NOT NULL,
	TipoContaId integer NOT NULL,
	Descricao varchar(10) NOT NULL,
	Valor decimal(6,2) NOT NULL,
	DataVencimento datetime NOT NULL,
	DataCadastro datetime NOT NULL,
	DataAtualizacao binary NOT NULL,
  CONSTRAINT [PK_CONTAPAGAR] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [TipoContaPagar] (
	Id integer NOT NULL,
	Descricao varchar(10) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_TIPOCONTAPAGAR] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Perfil] (
	Id integer NOT NULL,
	Nome varchar(20) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_PERFIL] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [TipoTelefone] (
	Id integer NOT NULL,
	Nome varchar(20) NOT NULL UNIQUE,
	DataCadastro datetime NOT NULL,
	DataAtualizacao datetime NOT NULL,
  CONSTRAINT [PK_TIPOTELEFONE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [Pessoa_fk0] FOREIGN KEY ([EnderecoId]) REFERENCES [Endereco]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [Pessoa_fk0]
GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [Pessoa_fk1] FOREIGN KEY ([FuncaoId]) REFERENCES [Funcao]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [Pessoa_fk1]
GO
ALTER TABLE [Pessoa] WITH CHECK ADD CONSTRAINT [Pessoa_fk2] FOREIGN KEY ([TelefoneId]) REFERENCES [Telefone]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Pessoa] CHECK CONSTRAINT [Pessoa_fk2]
GO


ALTER TABLE [Dizimo] WITH CHECK ADD CONSTRAINT [Dizimo_fk0] FOREIGN KEY ([PessoaId]) REFERENCES [Pessoa]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Dizimo] CHECK CONSTRAINT [Dizimo_fk0]
GO

ALTER TABLE [Usuario] WITH CHECK ADD CONSTRAINT [Usuario_fk0] FOREIGN KEY ([PerfilId]) REFERENCES [Perfil]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Usuario] CHECK CONSTRAINT [Usuario_fk0]
GO
ALTER TABLE [Usuario] WITH CHECK ADD CONSTRAINT [Usuario_fk1] FOREIGN KEY ([PessoaId]) REFERENCES [Pessoa]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Usuario] CHECK CONSTRAINT [Usuario_fk1]
GO

ALTER TABLE [Venda] WITH CHECK ADD CONSTRAINT [Venda_fk0] FOREIGN KEY ([PessoaId]) REFERENCES [Pessoa]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Venda] CHECK CONSTRAINT [Venda_fk0]
GO

ALTER TABLE [Cidade] WITH CHECK ADD CONSTRAINT [Cidade_fk0] FOREIGN KEY ([EstadoId]) REFERENCES [Estado]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Cidade] CHECK CONSTRAINT [Cidade_fk0]
GO


ALTER TABLE [Endereco] WITH CHECK ADD CONSTRAINT [Endereco_fk0] FOREIGN KEY ([CidadeId]) REFERENCES [Cidade]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Endereco] CHECK CONSTRAINT [Endereco_fk0]
GO

ALTER TABLE [Oferta] WITH CHECK ADD CONSTRAINT [Oferta_fk0] FOREIGN KEY ([PessoaId]) REFERENCES [Pessoa]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Oferta] CHECK CONSTRAINT [Oferta_fk0]
GO

ALTER TABLE [ItemVenda] WITH CHECK ADD CONSTRAINT [ItemVenda_fk0] FOREIGN KEY ([VendaId]) REFERENCES [Venda]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ItemVenda] CHECK CONSTRAINT [ItemVenda_fk0]
GO
ALTER TABLE [ItemVenda] WITH CHECK ADD CONSTRAINT [ItemVenda_fk1] FOREIGN KEY ([ProdutoId]) REFERENCES [Produto]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ItemVenda] CHECK CONSTRAINT [ItemVenda_fk1]
GO


ALTER TABLE [Produto] WITH CHECK ADD CONSTRAINT [Produto_fk0] FOREIGN KEY ([CategoriaId]) REFERENCES [Categoria]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Produto] CHECK CONSTRAINT [Produto_fk0]
GO

ALTER TABLE [ContaReceber] WITH CHECK ADD CONSTRAINT [ContaReceber_fk0] FOREIGN KEY ([VendaId]) REFERENCES [Venda]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ContaReceber] CHECK CONSTRAINT [ContaReceber_fk0]
GO
ALTER TABLE [ContaReceber] WITH CHECK ADD CONSTRAINT [ContaReceber_fk1] FOREIGN KEY ([FormaPagamentoId]) REFERENCES [FormaPagamento]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ContaReceber] CHECK CONSTRAINT [ContaReceber_fk1]
GO



ALTER TABLE [Evento] WITH CHECK ADD CONSTRAINT [Evento_fk0] FOREIGN KEY ([PublicoId]) REFERENCES [Publico]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Evento] CHECK CONSTRAINT [Evento_fk0]
GO
ALTER TABLE [Evento] WITH CHECK ADD CONSTRAINT [Evento_fk1] FOREIGN KEY ([EnderecoId]) REFERENCES [Endereco]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Evento] CHECK CONSTRAINT [Evento_fk1]
GO

ALTER TABLE [Telefone] WITH CHECK ADD CONSTRAINT [Telefone_fk0] FOREIGN KEY ([EstadoId]) REFERENCES [Estado]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Telefone] CHECK CONSTRAINT [Telefone_fk0]
GO
ALTER TABLE [Telefone] WITH CHECK ADD CONSTRAINT [Telefone_fk1] FOREIGN KEY ([TipoTelefone]) REFERENCES [TipoTelefone]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Telefone] CHECK CONSTRAINT [Telefone_fk1]
GO


ALTER TABLE [ContaPagar] WITH CHECK ADD CONSTRAINT [ContaPagar_fk0] FOREIGN KEY ([TipoContaId]) REFERENCES [TipoContaPagar]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [ContaPagar] CHECK CONSTRAINT [ContaPagar_fk0]
GO



