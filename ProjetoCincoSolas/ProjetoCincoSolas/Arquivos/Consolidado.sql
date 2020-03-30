IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'TagFraseCrista')
DROP TABLE TagFraseCrista;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'TagFrase')
DROP TABLE TagFrase;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'FraseCrista')
DROP TABLE FraseCrista;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'AutorFraseCrista')
DROP TABLE AutorFraseCrista;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'AssuntoFrase')
DROP TABLE AssuntoFrase;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'FonteFraseCrista')
DROP TABLE FonteFraseCrista;

CREATE TABLE AutorFraseCrista (	
	Id INT IDENTITY,
	Nome VARCHAR(30) NOT NULL,
	Descricao VARCHAR(max),
	DataRegistro DATETIME DEFAULT GETDATE()
	CONSTRAINT PKAutorFraseCrista PRIMARY KEY (Id),
	CONSTRAINT UC_AutorFraseCrista UNIQUE (Nome)
);
GO

CREATE TABLE AssuntoFrase (	
	Id INT IDENTITY,
	Assunto VARCHAR(60) NOT NULL,
	Descricao VARCHAR(50),
	DataRegistro DATETIME DEFAULT GETDATE()
	CONSTRAINT PKAssuntoFrase PRIMARY KEY (Id),
	CONSTRAINT UC_AssuntoFrase UNIQUE (Assunto)
);
GO

-- EXEMPLO: LIVRO, PALESTRA, WHATSAPP, PODCAST, SITE
CREATE TABLE FonteFraseCrista (	
	Id INT IDENTITY,
	Fonte VARCHAR(30) NOT NULL,
	Descricao VARCHAR(500),
	DataRegistro DATETIME DEFAULT GETDATE()
	CONSTRAINT PKFonteFraseCrista PRIMARY KEY (Id),
	CONSTRAINT UC_FonteFraseCrista UNIQUE (Fonte)
);
GO

-- EXEMPLO: Devemos contribuir de acordo com nossa renda, para que Deus não faça com que nossa renda torne-se proporcional ao que damos. Anônimo
-- DESCRICAO: FRASE DE CADA CONTEUDO
CREATE TABLE FraseCrista (	
	Id INT IDENTITY,
	IdAutorFraseCrista INT,
	IdAssuntoFrase INT,
	IdFonteFraseCrista INT,
	Titulo VARCHAR(20),
	Frase VARCHAR(1000) NOT NULL,
	DataRegistro DATETIME DEFAULT GETDATE()
	CONSTRAINT PKFraseCrista PRIMARY KEY (Id),
	CONSTRAINT UC_FraseCrista UNIQUE (Frase)
);
GO
ALTER TABLE FraseCrista
ADD CONSTRAINT FKFraseCrista_x_AutorFraseCrista FOREIGN KEY (IdAutorFraseCrista) REFERENCES AutorFraseCrista (Id);
ALTER TABLE FraseCrista
ADD CONSTRAINT FKFraseCrista_x_AssuntoFrase FOREIGN KEY (IdAssuntoFrase) REFERENCES AssuntoFrase (Id);
ALTER TABLE FraseCrista
ADD CONSTRAINT FKFraseCrista_x_FonteFraseCrista FOREIGN KEY (IdFonteFraseCrista) REFERENCES FonteFraseCrista  (Id);
GO

CREATE TABLE TagFrase (
	Id INT IDENTITY,
	Tag VARCHAR(30),
	CONSTRAINT PkTagFrase PRIMARY KEY (Id),
	CONSTRAINT UC_TagFrase UNIQUE (Tag)
)
GO

CREATE TABLE TagFraseCrista
(
	ID INT IDENTITY,
	IdTagFrase INT NOT NULL,
	IdFraseCrista INT NOT NULL,
	CONSTRAINT PkAnotacaoEvangelhoTag PRIMARY KEY (Id), 
	CONSTRAINT FkTagFraseCrista_x_FraseCrista FOREIGN KEY (IdFraseCrista) REFERENCES FraseCrista (Id),
	CONSTRAINT FkTagFraseCrista_x_TagFrase FOREIGN KEY (IdTagFrase) REFERENCES TagFrase (Id)
)
GO

insert into AutorFraseCrista(Nome, Descricao)
values ('Josemar Bessa','Pastor Reformado Calvinista da igreja evangelica cidade jardim.')
,('Anônimo', null)
,('Richard Baxter', null)
,('J. Blanchard', null)
,('William E. Channing', null)
,('G. B. Cheever', null)
,('Jim Elliot', null)
,('Matthew Henry', null)
,('Adrian Rogers', null)
,('Richard Sibbes', null)
,('J. H. Thornwell', null)
,('A. W. Tozer', null)
,('Adam Clarke', null)
,('Albert Einstein', null)
,('Thomas Adams', null)
,('E. H. Chapin', null)
,('Stephen Charnock', null)
,('Thomas Fuller', null)
,('William S. Plumer', null)
,('J. I. Packer', null)
,('Thomas Watson', null)
,('Lawrence R. Axelson', null)
,('Calvin Coolidge', null)
,('Bryan Green', null)
,('Roswell C. Long', null)
,('Austin Phelps', null)
,('Richard Watson', null)
,('W. H. Cadman', null)
,('Thomas Carlyle', null)
,('Herbert M. Carson', null)
,('William Cowper', null)
,('Frank Gabelein', null)
,('Clarence E. MacCartney', null)
,('Oswald B. Milligan', null)
,('J. Oswald Sanders', null)
,('Geoffrey Thomas', null)
,('William Temple', null)
,('Harvey F. Ammerman', null)
,('João Calvino', null)
,('John W. Everett', null)
,('Geoffrey R. King', null)
,('Isobel Kuhn', null)
,('C. S. Lewis', null)
,('J. A. Motyer', null)
,('A. W. Pink', null)
,('David Shepherd', null)
,('Gerald Vann', null)
,('Clarence Walworth', null)
,('Edward Young', null)
,('Ambrósio', null)
,('Thomas Brooks', null)
,('W. J. Cameron', null)
,('Thomas Goodwin', null)
,('Theodor Haecker', null)
,('William Hendriksen', null)
,('Jeremy Taylor', null)
,('John Trapp', null)
,('M. R. Vincent', null)
,('Phillips Brooks', null)
,('Thomas Edison', null)
,('Thomas Guthrie', null)
,('Robert Murray MCheyne', null)
,('S. I. McMillen', null)
,('Publilius Syrius', null)
,('Agostinho', null)
,('Walter Cradock', null)
,('Northcote Deck', null)
,('John Flavel', null)
,('Sidney J. Harris', null)
,('Martinho Lutero', null)
,('Billy Sunday', null)
,('James W. Alexander', null)
,('Ernest Blevins', null)
,('Frederick W. Faber', null)
,('Walter Savage Landor', null)
,('I. D. E. Thomas', null)
,('Harry Thompson', null)
,('Hugh of St. Victor', null)
,('W. S. Landor', null)
,('A. Raine', null)
,('Ralph Waldo Emerson', null)
,('Os Guinness', null)
,('Vance Havner', null)
,('J. C. Ryle', null)
,('F. F. Bruce', null)
,('Nathaniel Emmons', null)
,('Abraham Kuyper', null)
,('Francis Schaeffer', null)
,('Mary Slessor', null)
,('John R. W. Stott', null)
,('W. H. Griffith Thomas', null)
,('C. T. Studd', null)
,('Jill Briscoe', null)
,('Josh McDowell', null)
,('Gordon Palmer', null)
,('William Penn', null)
,('David Watson', null)
,('Richard Braunstein', null)
,('Johannes Von Goethe', null)
,('F. B. Meyer', null)
,('Stephen Olford', null)
,('Juan Carlos Ortiz', null)
,('Corrie Ten Boom', null)
,('John Boys', null)
,('Roger Forster', null)
,('William Gurnall', null)
,('Thomas Merton', null)
,('Frederick Sampson', null)
,('C. H. Spurgeon', null)
,('P. W. Heward', null)
,('Lawrence Pearsall Jacks', null)
,('A. Plummer', null)
,('John C. Whitcomb', null)
,('Epicuro', null)
,('R. A. Killen', null)
,('Tomás de Aquino', null)
,('Andrew Bonar', null)
,('John Newton', null)
,('J. A. Bengel', null)
,('Sigmund Freud', null)
,('Billy Graham', null)
,('Thomas Haliburton', null)
,('George Muller', null)
,('J. Charles Stern', null)
,('Kenneth Wuest', null)
,('Richard Cecil', null)
,('James Janeway', null)
,('Joyce Baldwin', null)
,('Edmund Burke', null)
,('A. J. Gordon', null)
,('Timothy Cruso', null)
,('Geoffrey King', null)
,('D. Martyn Lloyd-Jones', null)
,('Dick Lucas', null)
,('Ernest Plant', null)
,('Samuel Clark', null)
,('Lorinus', null)
,('D. L. Moody', null)
,('Augusto H. Strong', null)
,('Charles Wesley', null)
,('François Fenelon', null)
,('John Owen', null)
,('William Dyer', null)
,('Basilea Schlink', null)
,('William Secker', null)
,('George Whitefield', null)
,('Joseph Addison', null)
,('Lewis W. Dillwyn', null)
,('Andrew Fausset', null)
,('Phillip Henry', null)
,('John Mason', null)
,('William Nevins', null)
,('Ralph Venning', null)
,('André Gide', null)
,('Henry Wordsworth Longfellow', null)
,('Hans Rookmaaker', null)
,('John Buchan', null)
,('C. A. Coulson', null)
,('Dwight D. Eisenhower', null)
,('Tomas Fuller', null)
,('Michael Green', null)
,('Mohandas Gandhi', null)
,('George Herbert', null)
,('Roswell D. Hitchcock', null)
,('Abraham Lincoln', null)
,('Louis Nizer', null)
,('Jean-Paul Sartre', null)
,('H. G. Wells', null)
,('James Whitaker', null)
,('P. T. Forsyth', null)
,('Roy Hession', null)
,('Joel Horne', null)
,('Len North', null)
,('Alan Redpath', null)
,('J. Vaughan', null)
,('Walter J. Chantry', null)
,('John Cordelier', null)
,('Arthur C. Custance', null)
,('Ralph Erskine', null)
,('Thomas Manton', null)
,('J. Furman Miller', null)
,('Watchman Nee', null)
,('Samuel Rutherford', null)
,('W. E. Sangster', null)
,('Josif Ton', null)
,('J. E. Vaux', null)
,('Thomas à Kempis', null)
,('Jonathan Edwards', null)
,('Sócrates', null)
,('Richard Whately', null)
,('Ernest Baker', null)
,('Horatius Bonar', null)
,('John Bonar', null)
,('Darrel Bridges', null)
,('James Buchanan', null)
,('Walter Chantry', null)
,('John Elias', null)
,('Charles G. Finney', null)
,('David McKee', null)
,('G. Campbell Morgan', null)
,('Iain H. Murray', null)
,('J. Edwin Orr', null)
,('Vernon Patterson', null)
,('Wilbur M. Smith', null)
,('Erlo Stegan', null)
,('James A. Stewart', null)
,('Arthur Skevington Wood', null)
,('George Chapman', null)
,('Benjamin Disraeli', null)
,('Thomas Goowin', null)
,('Tácito', null)
,('Donald Grey Barnhouse', null)
,('John William Burgon', null)
,('Robert Horn', null)
,('Orígenes', null)
,('R. C. Sproul', null)
,('William Tyndale', null)
,('Edward John Carnell', null)
,('Thomas Cranmer', null)
,('Carl F. Henry', null)
,('Ezekiel Hopkins', null)
,('Erroll Hulse', null)
,('Leon Morris', null)
,('R. A. Torrey', null)
,('Jerônimo', null)
,('Alexander MacLaren', null)
,('Dietrich Bonhoeffer', null)
,('John Brown', null)
,('Edith Deen', null)
,('Dinsdale T. Young', null)
,('James Montgomery Boice', null)
,('Isaac Newton', null)
,('John Wesley', null)
,('Joseph Alleine', null)
,('Frank Cooke', null)
,('Josiah Condor', null)
,('J. H. Merle DAubigné', null)
,('Will H. Houghton', null)
,('Robert Johnstone', null)
,('A. T. Pierson', null)
,('Isaac Watts, Senr', null)
,('Immanuel Kant', null)
,('Augustus H. Strong', null)
,('S. Barton Babbage', null)
,('Albert Barnes', null)
,('J. H. Bernard', null)
,('Timothy Dwight', null)
,('Martin Anstey', null)
,('Oswald Chambers', null)
,('John Donne', null)
,('Richard B. Gaffin', null)
,('A. A. Hodge', null)
,('Thomas Taylor', null)
,('Fred Catherwood', null)
,('Paul B. Levertoff', null)
,('Chester A. Pennington', null)
,('Rowland Hill', null)
,('Henry D. Thoreau', null)
,('Jacques Saurin', null)
,('Henry Ward Beecher', null)
,('Thomas Chalmers', null)
,('G. B. Duncan', null)
,('Paul Frost', null)
,('Richard Fuller', null)
,('Milo H. Gates', null)
,('Elbert Hubbard', null)
,('Thomas Jefferson', null)
,('Blaise Pascal', null)
,('Arthur Schopenhauer', null)
,('W. Graham Scroggie', null)
,('W. G. T. Shedd', null)
,('Geoffrey Wilson', null)
,('Hugh Latimer', null)
,('Francis Quarles', null)
,('George Swinnock', null)
,('Wayne Mack', null)
,('Thomas V. Moore', null)
,('Cecil Myers', null)
,('Henry Smith', null)
,('Robert Bolton', null)
,('J. C. P. Cockerton', null)
,('William Jenkyn', null)
,('Christopher Nesse', null)
,('Crisóstomo', null)
,('Henri Abraham Cesar Malan', null)
,('Thomas Moore', null)
,('Archibald Alexander', null)
,('D. Martin Lloyd-Jones', null)
,('Andrew Gray', null)
,('Isaac Milner', null)
,('Alexander Peden', null)
,('Thomas Wilson', null)
,('Gerhard Bergmann', null)
,('Tryon Edwards', null)
,('Michael Faraday', null)
,('Carl Gustav Jung', null)
,('J. B. Phillips', null)
,('Benjamim B. Warfield', null)
,('John Bunyan', null)
,('Samuel Chadwick', null)
,('Ben Jonson', null)
,('Charles Caldwell Ryrie', null)
,('Robert South', null)
,('Francisco Xavier', null)
,('John Andrew Holmer', null)
,('Foy Valentine', null)
,('Ronald J. Sider', null)
,('William Bates', null)
,('E. M. Bounds', null)
,('Willard Cantelon', null)
,('Charles E. Fuller', null)
,('Charles Hummel', null)
,('William R. Inge.', null)
,('Leonard Ravenhill', null)
,('John Stam', null)
,('D. Elton Trueblood', null)
,('Lenin', null)
,('Andrew Ben Loo', null)
,('Frederick H. Olert', null)
,('Stephen Travis', null)
,('Derek Cleave', null)
,('Joseph Caryl', null)
,('Ronald Eyre', null)
,('Samuel Johnson', null)
,('Alfred North Whitehead', null)
,('Eric Alexander', null)
,('Robert H. Benson', null)
,('Mary S. Wood', null)
,('Augustus S. Strong', null)
,('James Denney', null)
,('Joseph Hall', null)
,('Ole Hallesby', null)
,('Anna Jameson', null)
,('William Morley Punshon', null)
,('J. P. Senn', null)
,('Lawrence Sterne', null)
,('Isaac Watts', null)
,('William Mason', null)
,('Friedrich Krummacher', null)
,('Benjamin Franklin', null)
,('Victor Alfsen', null)
,('George MacDonald', null)
,('John Penry', null)
,('Richard Treffry', null)
,('Billy Bray', null)
,('Thomas Hooker', null)
,('Joseph Parker', null)
,('Eugenia Price.', null)
,('John Berridge', null)
,('Friedrich Tholuck', null)
,('Richard Glover', null)
,('John Knox', null)
,('Plutarco', null)
,('Ambrose Bierce', null)
,('Andrew Anderson', null)
,('Ernest F. Kevan', null)
,('Warren Wiersbe', null)
,('J. H. Barrows', null)
,('John Caiger', null)
,('Edwin Conklin', null)
,('George Davis', null)
,('John Gill', null)
,('James Clerk Maxwell', null)
,('John Stuart Mill', null)
,('Stuart Olyott', null)
,('Louis Pasteur', null)
,('Jonathan Swift', null)
,('Herbert W. Cragg', null)
,('David Otis Fuller', null)
,('William Law', null)
,('Hannah More', null)
,('Handley C. G. Moule', null)
,('James S. Stewart', null)
,('G. K. Chesterton', null)
,('John R. De Witt', null)
,('Alexander Duff', null)
,('R. T. Kendall', null)
,('Søren Kierkegaard', null)
,('Paul O. Kroon', null)
,('Lionel Fletcher', null)
,('Robert B. Munger', null)
,('Theodore Robinson', null)
,('Samuel Wilberforce', null)
,('Frederick P. Wood', null)
,('Thomas Arnold', null)
,('Doug Barnett', null)
,('Benjamim Disraeli', null)
,('Benjamim Franklin', null)
,('Robert J. Hastings', null)
,('C. A. Joyce', null)
,('Thomas Lye', null)
,('Henry E. Manning', null)
,('A. B. Simpson', null)
,('Harold St. John', null)
,('John Tillotson', null)
,('Percy Ray', null)
,('Lewis Sperry Chafer', null)
,('Kenneth Cragg', null)
,('Donald English', null)
,('Alan Stibbs', null)
,('H. C. Trumbull', null)
,('Horace Bushnell', null)
,('Donald MacLeod', null)
,('Paul Tournier', null)
,('Anthony Norris Groves', null)
,('Duane Hulse', null)
,('Publius Mimus', null)
,('Andrew Murray', null)
,('Robert Rodenmayer', null)
,('Oswald J. Smith', null)
,('A. B. Alcott', null)
,('Theodore Parker', null)
,('William Booth', null)
,('David Livingstone', null)
,('Thomas Browne', null)
,('R. B. Kuiper', null)
,('Clark Pinnock', null)
,('Bertrand Russell', null)
,('Henry W. Shaw', null)
,('Malcolm Watts', null)
,('Richard Whateley', null)
,('Owen Feltham', null)
,('C. C. Grafton', null)
,('Ian Barclay', null)
,('John Sanderson', null)
,('Walter Scott', null)
,('Leslie Carter', null)
,('Joseph Hart', null)
,('T. G. Jalland', null)
,('John Henry Jowett', null)
,('G. S. Lee', null)
,('Paul S. Rees', null)
,('Thomas Zimmerman', null)
,('Frances Ridley Havergal', null)
,('Henry Scott', null)
,('George Gallup', null)
,('W. Holloway Main', null)
,('Voltaire', null)
,('E. B. De Condillac', null)
,('Johann Keil', null)
,('W. Ian Thomas', null)
,('Marcianus Aristides', null)
,('G. D. B. Pepper', null)
,('Elisabeth Elliot', null)
,('Ralph P. Martin', null)
,('Gerhard Tersteegen', null)
,('Saphir P. Athyal', null)
,('Leighton Ford', null)
,('John Murray', null)
,('F. J. Delitzsch', null)
,('William Carey', null)
,('William Gouge', null)
,('Henri Amiel', null)
,('William Newton Clarke', null)
,('Joseph Cook', null)
,('Francis Bacon', null)
,('Henry Drummond', null)
,('Daniel Rowlands', null)
,('B. B. Warfield', null)
,('J. M. L. Monsabre', null)
,('Ludovico Ariosto', null)
,('Josiah Conder', null)
,('Spiros Zodhiates', null)
,('Chambers', null)
,('George Elliot', null)
,('Winston Churchill', null)
,('J. C. MacAuley', null)
,('Robert Murray MCheine', null)
,('Clyde Narramore', null)
,('Daniel Wilson', null)
,('Thomas Charles', null)
,('Epicteto', null)
,('Roger LEstrange', null)
,('Hugh Martin', null)
,('Kenneth F. W. Prior', null)
,('John D. Rockefeller', null)
,('Frederick Saunders', null)
,('Sêneca', null)
,('Herbert Spencer', null)
,('Tertuliano', null)
,('Fred Mitchell', null)
,('Henry Law', null)
,('Ian MacPherson', null)
,('A. Lindsay Glegg', null)
,('F. R. Maltby', null)
,('G. Raymond Carlson', null)
,('Harry Kilbride', null)
,('G. A. Studdert Kennedy', null)
,('M. Arnaud', null)
,('Joseph Irons', null)
,('Peter Lewis', null)
,('Al Martin', null)
,('Victor Budgen', null)
,('Robert Cleath', null)
,('Charles F. Deems', null)
,('V. Raymond Edman', null)
,('Webb B. Garrison', null)
,('David K. Wachtel', null)
,('Paul Washer', null)
GO

insert into AssuntoFrase(Assunto)
values ('Abnegação')
,('Acaso')
,('Ações')
,('Adoção')
,('Adoração - Bênçãos')
,('Adoração - Essência')
,('Adoração - Importância')
,('Agradecimento')
,('Álcool')
,('Alegria')
,('Aliança')
,('Amabilidade')
,('Ambição')
,('Amizade')
,('Amor A Cristo')
,('Amor A Deus')
,('Amor Aos Outros - Definição')
,('Amor Aos Outros - Efeitos')
,('Amor Aos Outros - Em Contraste Com A Concupiscência')
,('Amor Aos Outros - Importância')
,('Amor Aos Outros - Medida')
,('Amor Aos Outros - Prática')
,('Aniquilação')
,('Anjos')
,('Ansiedade')
,('Antinomismo')
,('Apatia')
,('Apostasia')
,('Arrependimento - Bênçãos')
,('Arrependimento - Essência')
,('Arrependimento - Falso')
,('Arrependimento - Importância')
,('Arrependimento - E Santidade')
,('Arrependimento - Urgência')
,('Arte')
,('Ateísmo')
,('Ativismo')
,('Autocrucificação')
,('Auto-Exame')
,('Avivamento')
,('Bajulação')
,('Bíblia - Autoria Divina')
,('Bíblia - Autoridade')
,('Bíblia - E Cristo')
,('Bíblia - E O Espírito Santo')
,('Bíblia - Importância')
,('Bíblia - Inerrância')
,('Bíblia - Influência E Poder')
,('Bíblia - Plenitude')
,('Bíblia - Preservação')
,('Bíblia - Propósito')
,('Bíblia - Submissão À')
,('Bíblia - Supremacia')
,('Bíblia - Unidade')
,('Boas Obras')
,('Boatos')
,('Bondade')
,('Calúnia')
,('Caráter')
,('Caridade')
,('Casamento')
,('Censura')
,('Certeza')
,('Céu - Glória')
,('Céu - Lar Eterno Do Cristão')
,('Céu - Perfeição')
,('Céu - Preparação Para')
,('Céu - Presença De Deus')
,('Ciência')
,('Ciúmes')
,('Cobiça')
,('Compaixão')
,('Complacência')
,('Comunhão')
,('Comunhão Com Cristo')
,('Comunhão Com Deus')
,('Comunismo')
,('Concupiscência')
,('Confissão')
,('Conhecimento')
,('Conhecimento De Deus')
,('Consagração')
,('Consciência - E A Bíblia')
,('Consciência - E Deus')
,('Consciência - Importância')
,('Consciência - E Pecado')
,('Consciência - Poder')
,('Contentamento')
,('Contrição')
,('Controvérsias')
,('Conversão')
,('Convicção De Pecado')
,('Coração')
,('Coragem')
,('Covardia')
,('Crescimento')
,('Criação')
,('Cristão')
,('Cristianismo - Características')
,('Cristianismo - Definição')
,('Cristianismo - Singularidade')
,('Críticas - Feitas')
,('Críticas - Recebidas')
,('Cruz')
,('Culpa')
,('Dar')
,('Decepções')
,('Dedicação')
,('Depravação')
,('Depressão')
,('Desejos')
,('Desespero')
,('Desonestidade')
,('Determinação')
,('Deus - Amor')
,('Deus - Bondade')
,('Deus - Condescendência')
,('Deus - Eternidade')
,('Deus - Existência')
,('Deus - Fidelidade')
,('Deus - Glória')
,('Deus - Imutabilidade ')
,('Deus - Independência')
,('Deus - Inescrutabilidade')
,('Deus - Ira')
,('Deus - Nome')
,('Deus - Onipotência')
,('Deus - Onipresença')
,('Deus - Onisciência')
,('Deus - Paciência')
,('Deus - Perfeição')
,('Deus - Propósitos')
,('Deus - Sabedoria')
,('Deus - Santidade ')
,('Deus - Soberania')
,('Dever')
,('Dia Do Senhor')
,('Difamação')
,('Dificuldades')
,('Dinheiro')
,('Direção')
,('Disciplina')
,('Discipulado')
,('Dízimo')
,('Dons Espirituais')
,('Dor')
,('Doutrina')
,('Dúvida')
GO

INSERT INTO FonteFraseCrista (Fonte, Descricao)
VALUES ('Perolas Para Vida' ,'Perolas para a vida, citado por John Blanchard extraido de um arquivo Pdf, contém citações que servem de inspiração para comunicadores cristãos.')
GO 

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando o "eu" não é negado, ele é necessariamente adorado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A morte perde metade de suas armas quando negamos em primeiro lugar os prazeres e interesses da carne.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É mais fácil dar qualquer coisa que tenhamos do que dar-nos a nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as grandes virtudes trazem a marca registrada da abnegação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William E. Channing' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'À medida que o homem morre para o eu, ele cresce em vida diante de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. B. Cheever' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aqueles que conhecem o grande e terno coração de Jeová, certamente serão levados a negar seus próprios amores, para participar da expressão do Seu amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jim Elliot' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A primeira lição na escola de Cristo é a abnegação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há grande diferença entre negar coisas a si mesmo e negar-se a si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Adrian Rogers' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O auto-esvaziamento prepara o transbordamento espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A abnegação é indispensável para que gozemos paz e conforto espirituais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. H. Thornwell' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há uma doce teologia do coração que só se aprende na escola da renúncia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ABNEGAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A doutrina do acaso é a bíblia do tolo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ACASO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se a vida é um acidente, não é possível que ela tenha qualquer propósito, pois acidente e propósito excluem-se um ao outro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ACASO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não existe nada chamado acaso ou acidente; essas palavras expressam meramente nossa ignorância acerca de alguma causa verdadeira e imediata.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Adam Clarke ' and ass.assunto = 'ACASO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não sou capaz de crer que Deus joga dados com o mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Albert Einstein' and ass.assunto = 'ACASO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A prática é a alma do conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'AÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda ação de nossa vida toca alguma corda que vibrará na eternidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'E. H. Chapin' and ass.assunto = 'AÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As ações do homem são os melhores indicadores de seus princípios.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'AÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As ações são o fruto próprio do conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'AÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A prática é a própria vida da piedade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'AÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoção dá-nos o privilégio de filhos; a regeneração, a natureza de filhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'ADOÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adoção... é o privilégio mais sublime que o evangelho oferece; mais ainda do que a própria justificação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'ADOÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoção foi uma graça muito grande que Adão desfrutou no paraíso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ADOÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é para a vida cristã o que a corda é para o relógio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lawrence R. Axelson' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens só começam a crescer quando começam a adorar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Calvin Coolidge' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em nossa adoração deve haver o poder sobrenatural que nos faz compreender o sentido de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Bryan Green' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Manifestando reverência, aprendemos obediência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração liberta a personalidade, conferindo uma nova perspectiva à vida, integrando-a às diversas maneiras de viver. Ela ainda traz à vida as virtudes da humildade, lealdade, devoção e retidão de atitude, renovando e reavivando o espírito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roswell C. Long' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na mais elevada devoção, perdemos a consciência de nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Austin Phelps' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há mais restauradora alegria em cinco minutos de adoração do que em cinco noites de folia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não conheço outro prazer tão rico, tão puro, tão santificador em suas influências ou ainda tão constante em seus benefícios como aquele que resulta da verdadeira e espiritual adoração a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Watson' and ass.assunto = 'ADORAÇÃO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira adoração exalta a Deus, colocando-o em Seu devido lugar em nossas vidas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração cristã é a resposta obediente à Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. H. Cadman' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é uma maravilha transcendente. ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Carlyle' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adorar a Deus é compreender o propósito com o qual Ele nos criou.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Herbert M. Carson' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é o reconhecimento da criatura acerca da grandeza do seu criador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Herbert M. Carson' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mais querido ídolo que conheço Seja ele quem for, Ajuda-me a derrubá-lo do teu trono, E a adorar somente a Ti, Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Cowper' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Reverência é essencial à adoração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frank Gabelein' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adoração é aquilo a que consagramos nosso interesse, nosso entusiasmo e nossa devoção.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Clarence E. MacCartney' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adoração... é dar ao Senhor a glória que Lhe é devida como resposta ao que Ele nos revelou e fez em Seu Filho Jesus Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Oswald B. Milligan' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adoração é a contemplação extasiada de Deus, da forma como Ele se revelou em Cristo e em Sua Palavra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Oswald Sanders' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na verdadeira adoração, os homens... pouco pensam nas formas de adorar; seus pensamentos estão em Deus. A verdadeira adoração caracteriza-se por auto-obliteração e pela falta de qualquer autoconsciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey Thomas' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é a submissão de toda nossa natureza a Deus. É a vivificação da consciência mediante Sua santidade, o nutrir da mente com Sua verdade, a purificação da imaginação por Sua beleza, o abrir do coração ao Seu amor e a entrega da vontade ao Seu propósito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Temple' and ass.assunto = 'ADORAÇÃO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se adorássemos como devemos, não nos preocuparíamos como fazê-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração vem antes do serviço, e o Rei, antes dos negócios do Rei.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que adoramos determina aquilo em que nos transformamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Harvey F. Ammerman' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O primeiro fundamento da justiça é sem dúvida a adoração a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que não tem o hábito de adorar não passa de um par de óculos por trás do qual não há olhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Carlyle' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens carnais contentam-se com o "ato" de adoração; eles não têm desejo de comunhão com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John W. Everett' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada prepara melhor o coração para a adoração ao Senhor do que contemplar a Sua beleza e perfeição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frank Gabelein' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração pública não nos isenta da adoração secreta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é a função mais elevada da alma humana.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey R. King' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Adorar e venerar são tão necessários quanto analisar e explicar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isobel Kuhn' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que tenta diminuir a glória de Deus, recusando-se a adorá-lO, é como um lunático que deseja apagar o sol, escrevendo a palavra "escuridão" nas paredes de sua cela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda a nossa vida... deve ser dirigida de tal maneira para Deus que não importa o que nos atinja tristeza ou alegria seja imediatamente refletido para cima, para a Sua presença.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As nossas mentes são constituídas de tal forma que não podem, ao mesmo tempo, concentrar-se no Senhor e fixar-se no casaco novo ou chapéu para o próximo inverno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração é algo que se relaciona com Deus mais do que qualquer outra coisa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sou chamado a adorar um Deus que não vejo, mas não para submeter-me a um Deus que não posso conhecer e provar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David Shepherd' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Somos chamados a uma preocupação perene com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Afirmo que a maior tragédia do mundo de hoje é que Deus fez o homem à Sua imagem e o criou para adorá-lO, formou-o para tocar a harpa da adoração diante de Sua face, dia e noite, mas ele falhou, deixando cair a harpa; e ela jaz sem som a seus pés.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A adoração não faz parte da vida cristã; ela é a própria vida cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Gerald Vann' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Orar é menos do que adorar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Clarence Walworth' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas vezes, a postura na adoração é nada mais do que impostura.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem não é feito para questionar, mas para adorar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Edward Young' and ass.assunto = 'ADORAÇÃO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum dever é mais urgente do que o de demonstrar gratidão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ambrósio' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dar graças a Deus é vibrar as cordas da alma ao toque suave da benevolência divina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um homem agradecido é valorizado a peso de ouro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um coração agradecido está em festa contínua.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. J. Cameron' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As mais doces bênçãos são conseguidas com oração e usufruídas com ação de graças.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Goodwin' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A alegria insensível ao agradecimento é sempre suspeita.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Theodor Haecker' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A oração sem agradecimento é como um pássaro sem asas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Hendriksen' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Agradecer é bom, mas viver agradecido é melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em cada canteiro do livro de Salmos estão plantadas as sementes do agradecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jeremy Taylor' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Agradecimentos de coração precisam ser dados a Deus: não da boca para fora, mas do fundo do coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão está indeciso entre bênçãos recebidas e bênçãos esperadas; portanto, ele deve sempre dar graças.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'M. R. Vincent' and ass.assunto = 'AGRADECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O álcool não torna as pessoas capazes de fazer melhor o que deve ser feito. Ele as torna menos envergonhadas de fazê-lo incorretamente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O álcool jamais afoga as mágoas; somente as irriga.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Beba como um peixe apenas se você beber o que o peixe bebe.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O jovem que faz pose com um copo de bebida na mão faria bem em considerar qual dos dois deveria jogar fora: a bebida ou ele próprio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O vinho é um vira-casaca: primeiro um amigo, depois um impostor e, por fim, um inimigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se pudéssemos eliminar do país a intemperança, dificilmente haveria pobreza suficiente para exercitar de forma sadia os impulsos de caridade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Phillips Brooks' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tenho uma utilidade melhor para meu cérebro do que envenená-lo com álcool. Colocar álcool no cérebro humano é como colocar areia nas engrenagens de um motor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Edison' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uísque é uma boa coisa no seu devido lugar. Não há nada melhor para preservar um corpo depois de morto. Se você quer preservar o corpo de um homem morto, coloque-o no uísque; se quer matar um homem vivo, coloque uísque nele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Guthrie' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sempre que vejo uma tabuleta: "Autorizado a vender bebidas alcoólicas" penso que se trata de uma licença para arruinar almas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma outra droga conhecida pelo homem é mais amplamente usada nem mais freqüentemente responsável por mortes, ferimentos ou crimes do que a bebida alcoólica.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'S. I. McMillen' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O vinho tem afogado mais pessoas do que o mar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Publilius Syrius' and ass.assunto = 'ÁLCOOL'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Alegria é a bandeira desfraldada na fortaleza do coração quando o Rei está em casa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A alegria é o resultado natural da obediência do cristão à vontade revelada de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira alegria resplandece no escuro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão deve ser um "aleluia" da cabeça aos pés.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Pegue um santo, coloque-o sob quaisquer circunstâncias, e ele saberá como regozijar-se no Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter Cradock' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um cristão sem alegria é um difamador de seu Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Northcote Deck' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jó era mais feliz na desgraça do que Adão no paraíso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, '"Prazer" e "alegria" não apenas não são sinônimos como também podem ser profundamente diferentes como céu e inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sidney J. Harris' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Alegria santa é o óleo que lubrifica as rodas de nossa obediência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Alegria é negócio sério no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão deve ser uma doxologia viva.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sem alegria, nada pode ser bem feito, e uma boa consciência é o alicerce para a alegria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você não tem alegria na vida cristã, existe vazamento em algum lugar de seu cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Sunday' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há tanta diferença entre as alegrias espirituais e as terrenas quanto entre um banquete saboreado e outro pintado na parede.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ALEGRIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cada interrupção da paz com Deus não é necessariamente uma interrupção da aliança com ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ALIANÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A aliança da graça é o título de propriedade do santo no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ALIANÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda aliança é um feixe de promessas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ALIANÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O vínculo da aliança é capaz de suportar os fardos mais pesados do crente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'ALIANÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Está ocupado demais quem está muito ocupado para ser amável.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James W. Alexander' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda hora é hora de ser amável.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amabilidade é uma linguagem que o surdo pode ouvir e o cego pode ver.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O melhor exercício para fortalecer o coração é abaixar-se e levantar os que estão caídos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ernest Blevins' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Palavras amáveis são a música do mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick W. Faber' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amabilidade em nós é o mel que alivia a ferroada da indelicadeza nos outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter Savage Landor' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus tem um método secreto para recompensar seus santos: ele toma providências para que eles se tornem os primeiros beneficiados por sua própria beneficência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'I. D. E. Thomas' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seja amável. Lembre-se de que todos os que você encontra estão enfrentando uma batalha difícil.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Harry Thompson' and ass.assunto = 'AMABILIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ambição, como a morte, nunca se farta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se existe algo pior do que a ascensão social no mundo é a ascensão eclesiástica na igreja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que deseja honra não a merece.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ambição é miséria enfeitada, veneno secreto, praga oculta, executora do engano, mãe da hipocrisia, progenitora da inveja, o primeiro dos defeitos, ofensora da santidade e aquela que cega os corações, transformando medicamentos em doenças e remédios em males. Os lugares altos nunca deixam de ser incômodos, e as coroas estão sempre repletas de espinhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando procuramos honras, desviamo-nos de Jesus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hugh of St. Victor' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ambição nada mais é que a avareza sobre pernas de pau.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. S. Landor' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você pode atingir o topo da escada e então descobrir que ela não está apoiada na parede certa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. Raine' and ass.assunto = 'AMBIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amigo é alguém que se achega quando todo mundo se afasta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os cristãos podem não se ver face a face; no entanto, podem andar lado a lado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada é mais perigoso do que nos juntarmos aos ímpios.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única forma de ter um amigo é ser amigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph Waldo Emerson' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada é mais estimulante do que amigos que falam a verdade em amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Os Guinness' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há pessoas com as quais não concordamos, mas não precisamos afastá-las de nossa amizade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amizade falsa é pior do que dinheiro falso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'AMIZADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A questão ainda é a mesma: Você ama a Jesus? O amor é a resposta para a apatia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'AMOR A CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maior prova de nosso amor a Cristo é a obediência às leis de Cristo... O amor é a raiz; a obediência é o fruto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AMOR A CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De todas as coisas que nos irão surpreender na manhã da ressurreição, esta, creio eu, é a que mais causará surpresa: que amamos tão pouco a Cristo durante nossa vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'AMOR A CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maior e melhor coisa que pode ser dita acerca de um homem é que ele amou ao Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Eu odiaria minha própria alma se descobrisse que ela não ama a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor e a obediência a Deus estão de tal maneira entrelaçados um com o outro que a existência de um implica a presença do outro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. F. Bruce' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A obediência a Deus é a prova infalível de um amor sincero e supremo por ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Nathaniel Emmons' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nosso amor pelo Senhor não merece nem mesmo ser mencionado, mas seu amor por nós nunca será suficientemente exaltado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Até mesmo o coração de Deus tem sede de amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Abraham Kuyper' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor da criatura para com o Criador requer necessariamente obediência; caso contrário, não tem qualquer sentido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Schaeffer' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é a única coisa com que podemos pagar a Deus na mesma moeda... Não podemos pagar-lhe tintim por tintim, mas devemos amá-lo generosamente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'AMOR A DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ciúme, considerado de maneira adequada, é um elemento essencial do verdadeiro amor: é... o anelo incessante pelo bem-estar do ser amado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'AMOR AOS OUTROS - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amar = viver em favor de.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Mary Slessor' and ass.assunto = 'AMOR AOS OUTROS - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amor é mais serviço do que sentimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'AMOR AOS OUTROS - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amor é a expressão de toda a criação num culto de auto-sacrifício.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. H. Griffith Thomas' and ass.assunto = 'AMOR AOS OUTROS - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é a chave mestra de um lar feliz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMOR AOS OUTROS - Efeitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um coração que ama incendeia outro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'AMOR AOS OUTROS - Efeitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dever leva-nos a fazer tudo bem feito; o amor leva-nos a fazê-lo com beleza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Phillips Brooks' and ass.assunto = 'AMOR AOS OUTROS - Efeitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A suspeita subtrai, a fé adiciona, mas o amor multiplica. Ele abençoa duplamente: aquele que o dá e aquele que o recebe.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. T. Studd' and ass.assunto = 'AMOR AOS OUTROS - Efeitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mundo está repleto das ruínas do que eros prometeu mas não foi capaz de fornecer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jill Briscoe' and ass.assunto = 'AMOR AOS OUTROS - em Contraste com a Concupiscência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor pode esperar para dar; a concupiscência é que não pode esperar para receber.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Josh McDowell' and ass.assunto = 'AMOR AOS OUTROS - em Contraste com a Concupiscência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor não é cego. A concupiscência o é. Se o amor fosse cego, Deus também seria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Gordon Palmer' and ass.assunto = 'AMOR AOS OUTROS - em Contraste com a Concupiscência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A diferença entre concupiscência e amor é que este é fixo, e aquele, volúvel. O amor cresce ao ser desfrutado; a concupiscência se desgasta; e a razão disso é que o primeiro nasce da união de almas; o outro, da união de sentidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Penn' and ass.assunto = 'AMOR AOS OUTROS - em Contraste com a Concupiscência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A expressão "amor livre" é uma contradição de palavras. Se é livre, não é amor; se é amor, não é livre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David Watson' and ass.assunto = 'AMOR AOS OUTROS - em Contraste com a Concupiscência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor cristão é a marca registrada da vida cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É possível dar sem amor, mas é impossível amar sem dar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Braunstein' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Somos formados e moldados por aquilo que amamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Johannes Von Goethe' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor fraternal é a marca dos discípulos de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é o sentimento que orienta a alma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Qualquer que seja o serviço ou a obediência que prestamos a Deus ou ao homem, se disso o amor é excluído, a lei não se cumpre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. B. Meyer' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amor é o poder nuclear que conserva unido o corpo da igreja cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Olford' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é o oxigênio do reino dos céus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Juan Carlos Ortiz' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é a mais difícil lição do cristianismo; por isso, devemos ter o maior cuidado em aprendê-la.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Penn' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é a mais soberana de todas as virtudes cristãs.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor deve ser a linha que orienta toda a sua conduta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Somos o que amamos, não o que sabemos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca se entra em contato tão íntimo com o oceano do amor de Deus como quando se perdoa e ama seus inimigos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Corrie Ten Boom' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se alguém diz ser cristão sem possuir amor, está simplesmente enganando a si próprio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey Thomas' and ass.assunto = 'AMOR AOS OUTROS - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A prova do amor está em sua capacidade de sofrer pelo objeto de sua afeição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor tem dois encargos principais: um é dar, o outro, perdoar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Boys' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O manto do amor é muito grande.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor precisa amar, ainda que não ganhe nada com isso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roger Forster' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As cadeias do amor são mais fortes do que as do medo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor busca apenas uma coisa: o bem do ser amado. Ele deixa todos os outros elementos secundários por conta de si mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Merton' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A medida de nosso amor pelos outros pode ser em grande parte determinada pela freqüência e intensidade de nossas orações em favor deles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor vai além da segurança.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick Sampson' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem pode amar a um santo como santo, a não ser que ele mesmo seja santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é o uniforme de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor perfeito não conhece porquês.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'AMOR AOS OUTROS - Medida'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitos amam da boca para fora, mas os piedosos amam de coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor não diz: "Dê-me", mas, sim, "Deixe que eu lhe dê!"' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jill Briscoe' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor é prático; se não for assim, não é amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'P. W. Heward' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém saberá o que você quer dizer quando fala que Deus é amor se você não agir segundo o que fala.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lawrence Pearsall Jacks' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Enquanto a obediência é a justiça em relação a Deus, o amor é a justiça em relação aos outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. Plummer' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seja o que for o amor, ele não é passivo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick Sampson' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor cristão não é vítima de nossas emoções, mas servo de nossa vontade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amor sem obediência é um substituto satânico para o plano de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John C. Whitcomb' and ass.assunto = 'AMOR AOS OUTROS - Prática'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens não temem que a morte seja aniquilação, mas, sim, que ela não o seja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Epicuro' and ass.assunto = 'ANIQUILAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O ímpio não será aniquilado pela segunda morte como julgamento de seus pecados, da mesma forma como Cristo não foi aniquilado quando pagou a pena de nossos pecados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. A. Killen' and ass.assunto = 'ANIQUILAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os anjos são mensageiros e ministros. A função deles é executar o plano da providência divina, até mesmo nas coisas terrenas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tomás de Aquino' and ass.assunto = 'ANJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os anjos nunca serão reis. Sempre serão servos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Bonar' and ass.assunto = 'ANJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os anjos são os despenseiros e administradores da beneficência divina para conosco.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'ANJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um anjo é uma criatura espiritual sem corpo, criada por Deus para o serviço da cristandade e da igreja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'ANJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se dois anjos fossem enviados do céu para executar uma ordem divina, um para dirigir um império e outro para varrer uma rua do mesmo império, nenhum deles sentiria qualquer inclinação para trocar de serviço.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Newton' and ass.assunto = 'ANJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ansiedade e oração opõem-se uma à outra mais do que água e fogo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Bengel' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ansiedade nunca fortalece você para o amanhã; ela apenas o enfraquece para o dia de hoje.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ansiedade é o fenômeno fundamental e o problema central de todas as neuroses.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sigmund Freud' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ansiedade é o resultado natural de centralizarmos nossas esperanças em qualquer coisa menor do que Deus e sua vontade para nós.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Graham' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Levar preocupações para a cama é dormir com uma carga às costas. ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Haliburton' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O começo da ansiedade é o fim da fé; e o começo da verdadeira fé é o fim da ansiedade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Muller' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mentes e corações inquietos tomarão decisões incertas e não conseguirão firmar-se na graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Charles Stern' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ansiedade é uma autocontradição da verdadeira humildade. ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Kenneth Wuest' and ass.assunto = 'ANSIEDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A pessoa que diz que pode viver descuidadamente porque não está debaixo da lei, mas debaixo da graça, precisa verificar bem se não está debaixo da ira.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ANTINOMISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O antinomismo coloca a graça de Deus em oposição a seu governo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Cecil' and ass.assunto = 'ANTINOMISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Argumentar com base na misericórdia para levar ao pecado é a lógica do diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Janeway' and ass.assunto = 'ANTINOMISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As pessoas que não têm Cristo como Rei para reinar sobre elas jamais terão seu sangue para salvá-las.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ANTINOMISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Água e religião paradas congelam mais depressa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'APATIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando Deus fala, permanecer apático é uma prova de ateísmo prático.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joyce Baldwin' and ass.assunto = 'APATIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única coisa necessária para o triunfo do mal é que os homens bons não façam nada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Edmund Burke' and ass.assunto = 'APATIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se nos tornarmos desatentos para com o dever, logo nos tornaremos apáticos para com ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'APATIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se a doutrina da perfeição sem pecado é heresia, a doutrina da satisfação com imperfeição pecaminosa é heresia ainda maior.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. J. Gordon' and ass.assunto = 'APATIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você quer fugir de Deus, o diabo lhe emprestará tanto as esporas como o cavalo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca olhe para trás, a não ser que você queira ir naquela direção.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A apostasia nunca começa com uma forte explosão... começa de modo silencioso, vagaroso, sutil e insidioso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A apostasia é uma perversão que conduz ao mal, depois de uma aparente conversão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Timothy Cruso' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém mergulha tão profundamente no inferno como aqueles que chegaram mais perto do céu, visto que caem de maior altura.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um cristão em declínio necessariamente é um cristão em dúvida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A graça em decadência é como um homem a quem são arrancadas as pernas por causa da enfermidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Estamos tão abaixo do normal que se nos tornássemos normais, o povo pensaria que éramos anormais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para alguns de nós, a maior habilidade parece ser a de afastar-se do bom Pastor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey King' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desviado é um homem que, por causa da relação que teve com Deus, nunca pode desfrutar bem qualquer outra coisa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos estaríamos constantemente desviando-nos, se não fosse a graça de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Dick Lucas' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A apostasia é causada por uma vida cristã relaxada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ernest Plant' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Precisamos dar à apostasia seu verdadeiro nome: adultério espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Schaeffer' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Santos sem santidade são a tragédia do cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cai nas profundezas maiores do inferno quem volta atrás.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'APOSTASIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o pecado e teu coração estão separados, Cristo e teu coração estão unidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ARREPENDIMENTO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada tornará o rosto dos filhos de Deus mais belos do que lavá-los todas as manhãs em lágrimas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Clark' and ass.assunto = 'ARREPENDIMENTO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento, se verdadeiro, atinge a raiz da iniqüidade, e livra dela o coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ARREPENDIMENTO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento é o estado mais feliz depois do estado de impecabilidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lorinus' and ass.assunto = 'ARREPENDIMENTO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O brilho do sol é sempre mais doce depois que conhecemos as sombras; você sentirá essa mesma doçura ao voltar para Jesus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'ARREPENDIMENTO - Bênçãos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento é a mudança da mente; a regeneração é a mudança do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento é uma fonte perene, na qual as águas de uma tristeza santa estão sempre fluindo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Abandonar o pecado é deixá-lo sem nenhum pensamento oculto de voltar para eles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento é a lágrima nos olhos da fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento é uma transformação completa do coração natural do homem com respeito ao pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando a Palavra de Deus converte um homem, tira dele o desespero, mas não a capacidade de arrepender-se.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem arrepende-se de verdade somente quando aprende que o pecado o tornou incapaz de arrepender-se sem a ajuda da graça renovadora de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augusto H. Strong' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira água benta não é aquela que o papa esparge, mas a que é destilada dos olhos arrependidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ó Jesus, cheio de graça e de verdade, Mais cheio de graça do que eu de maldade, Mais uma vez eu busco tua face gloriosa; Abre teus braços, recebe-me com ternura amorosa, Cura gratuitamente meu pecado cruel E, a despeito disso, ama este pecador infiel.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles Wesley' and ass.assunto = 'ARREPENDIMENTO - Essência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas pessoas que parecem arrepender-se são como marinheiros que lançam ao mar seus pertences em uma tempestade, ansiando novamente por eles quando chega a bonança.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ARREPENDIMENTO - Falso'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que bate no peito mas não emenda seus caminhos, não remove seus pecados; antes os enrijece.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'ARREPENDIMENTO - Falso'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nosso orgulho sente desgosto por nossas falhas, e muitas vezes confundimos esse desgosto com o verdadeiro arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'ARREPENDIMENTO - Falso'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado deve ser ocasião para grande tristeza, quando não há tristeza em pecar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'ARREPENDIMENTO - Falso'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os olhos podem estar rasos d água, e o coração, empedernido. O damasco pode estar macio por fora, mas dentro tem uma semente dura.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'ARREPENDIMENTO - Falso'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento e fé são graças que recebemos, não alvos que alcançamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento e fé são irmãos gêmeos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão que parou de se arrepender parou de crescer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém vai para o porto seguro da glória sem navegar pelo canal estreito do arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Dyer' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sempre que Deus pretende dar vida, ele dá arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento é o único portão pelo qual o evangelho é recebido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Basilea Schlink' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitos têm oportunidade para o arrependimento, mas não tem a graça do arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Expirar é tão necessário à vida quanto inspirar. Para aceitarmos a Cristo é necessário que rejeitemos tudo o que é contrário a ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Precisamos arrepender-nos de nosso arrependimento e lavar nossas lágrimas no sangue de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Whitefield' and ass.assunto = 'ARREPENDIMENTO - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento é o abandono de determinada ação, devido à convicção de que ela ofendeu a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Addison' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Verdadeiro arrependimento é parar de pecar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ambrósio' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento não é uma idéia; é uma ação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na verdade, nunca se arrependeu do pecado aquele cujo coração ainda não se voltou contra todo pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você precisa sair do pecado para sair-se bem com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arrependimento sem mudança de vida é como ficar bombeando sem consertar o vazamento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lewis W. Dillwyn' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tanto a pureza quanto o perdão são desejados por todos os que verdadeiramente se arrependem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Fausset' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os que professam arrependimento precisam praticá-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você nunca deve pensar em pecado sem se arrepender.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Phillip Henry' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não voltar a fazer determinada coisa é a essência do mais verdadeiro arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O arrependimento começa na humilhação do coração e termina na reforma da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Mason' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O verdadeiro arrependimento consiste de ficar o coração quebrantado por causa do pecado e de romper com o pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Nevins' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aviso que vocês não escaparão do inferno, se não tiverem inclinação para escapar das coisas que o formam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David Shepherd' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A fé que recebe a Cristo precisa ser acompanhada pelo arrependimento que rejeita o pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A idéia de que Deus perdoará o rebelde que não desistiu de sua rebelião é contrária tanto à Escritura quanto ao bom senso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ARREPENDIMENTO - e Santidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se deixarmos passar o tempo para nos arrependermos, ficaremos arrependidos para sempre de termos deixado passar o tempo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma religião que não começa com arrependimento com certeza terminará ali mesmo talvez tarde demais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ainda que um arrependimento eterno manifeste-se depois desta vida, ele será inútil.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca é cedo para se arrepender, porque não se sabe quão depressa pode ser tarde demais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o hoje de Deus é cedo demais para teu arrependimento, teu amanhã pode ser tarde demais para que ele o aceite.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Pecado e inferno estão casados, a não ser que o arrependimento anuncie o divórcio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que prometeu perdão para os que se arrependem não prometeu arrependimento para os que pecam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph Venning' and ass.assunto = 'ARREPENDIMENTO - Urgência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as artes procedem de Deus e devem ser consideradas criações divinas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'ARTE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A arte é um trabalho de Deus junto com um artista; quanto menos o artista fizer, melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'André Gide' and ass.assunto = 'ARTE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A arte é dom de Deus e deve ser usada para Sua glória.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Wordsworth Longfellow' and ass.assunto = 'ARTE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A arte existe porque Deus desejou a sua existência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hans Rookmaaker' and ass.assunto = 'ARTE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para ser ateu, é necessário uma medida de fé infinitamente maior do que para admitir todas as grandes verdades que o ateísmo nega.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Addison' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O ateísmo é a morte da esperança, o suicídio da alma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É tão difícil um ateu encontrar Deus quanto um ladrão encontrar um policial.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um problema que um ateu enfrenta é que ele não tem com quem conversar quando está só.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem diz "Deus não existe", a não ser aquele que tem interesse em que ele não exista.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mundo ainda está esperando pelo primeiro ateu sábio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem não acredita na existência de Deus é mais vil do que um demônio. Negar que Deus existe é uma espécie de ateísmo que não será encontrado nem no inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ateu é um homem que não tem nenhum meio invisível de sustento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Buchan' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Negar a existência de Deus é praticamente a mesma coisa que fechar um olho. Talvez seja esta a razão por que Deus nos deu dois olhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. A. Coulson' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para ser ateu não é preciso ter cérebro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Dwight D. Eisenhower' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O ateu está um passo à frente do diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tomas Fuller' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sempre me pareceu inteiramente absurdo o fato de um ateu manifestar tão profunda consideração pelos produtos de um universo no qual o acaso é rei.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Green' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Admira-me encontrar uma pessoa inteligente que luta contra algo que ela mesma não crê absolutamente que exista.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Mohandas Gandhi' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O diabo divide o mundo entre o ateísmo e a superstição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Herbert' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A moralidade ateísta não é impossível, mas nunca satisfará nossos objetivos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roswell D. Hitchcock' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Posso entender que é possível olhar para o chão e ser ateu, mas não posso conceber como alguém pode olhar para o céu e dizer que Deus não existe.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Abraham Lincoln' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A melhor resposta a um ateu é oferecer-lhe um bom jantar e perguntar-lhe se ele crê que existe um cozinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Louis Nizer' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ateísmo é um negócio cruel e de longo prazo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jean-Paul Sartre' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em seu coração, a religião do ateu tem um vazio com a forma de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'H. G. Wells' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há ateus em trincheiras nem em botes salva-vidas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Whitaker' and ass.assunto = 'ATEÍSMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ativismo nos negócios do Rei não é desculpa para negligenciar o Rei.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem tem o direito de levar uma vida de tão grande contemplação a ponto de negligenciar o serviço devido a seu próximo, nem tem o direito de entregar-se de tal forma a uma vida ativa a ponto de esquecer-se da contemplação de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É perigosamente possível que a atividade não seja nada mais do que um corre-corre atordoado em volta de um vazio central.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Precisamos ter cuidado para não sentirmos que, se não estivermos de pé fazendo algo, o Senhor não estará atuando.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em muitas igrejas de hoje temos movimentação mas não unção.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É possível ser muito ativo no serviço de Cristo e ainda esquecer de amá-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'P. T. Forsyth' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Temos estado ocupados demais em cortar madeira para gastar tempo e afiar o machado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O fato de nos concentrarmos em serviço e atividade para Deus muitas vezes pode impedir-nos de alcançar a verdade, o próprio Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roy Hession' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É difícil ver Jesus quando se está com pressa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joel Horne' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um dos maiores perigos da vida espiritual é viver em função de suas próprias atividades. Em outras palavras, a atividade não está em seu devido lugar como algo que você faz, mas tornou-se algo que o leva a manter-se em movimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cuidado com a esterilidade de uma vida atarefada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Len North' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não nos iremos livrar da doença do pecado aumentando nossas atividades.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alan Redpath' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Estar sempre pregando, ensinando, falando, escrevendo e realizando obras em público é inquestionavelmente um sinal de zelo.Mas não é sinal de zelo segundo o conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Algumas vezes penso que seria melhor para a igreja se proclamássemos uma moratória de atividades durante cerca de seis semanas e tão somente esperássemos em Deus para ver o que ele está planejando fazer por nós.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Grande parte da atividade de muito obreiro cristão é o túmulo de sua vida espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Vaughan' and ass.assunto = 'ATIVISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A vida oferece apenas duas alternativas: crucificação com Cristo ou autodestruição sem Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conceito de ressurreição é aceito por todos, mas o assunto anterior da autocrucificação tem preço mais elevado do que a maioria dos homens está disposta a pagar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mate o pecado antes que ele o mate.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz precisa ser carregada; não temos liberdade de passar por cima dela ou de evitá-la.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Morrer para nosso conforto, nossas ambições e nossos planos faz parte da própria essência do cristianismo' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A mortificação da carne é a vivificação do espírito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Carregar a cruz é a escolha consciente de uma alternativa dolorosa motivada pelo amor a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter J. Chantry' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sem cruz não se segue a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter J. Chantry' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos os cristãos vivem uma vida de morte para si mesmos; este é o segredo de sua surpreendente vitalidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Cordelier' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A crucificação é algo feito para nós; não é algo que fazemos em nosso favor. Só podemos iniciá-la tomando a cruz, mediante uma decisão completa e honesta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur C. Custance' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O crente mortifica-se porque está em paz com Deus; o legalista o faz para poder apaziguar a Deus por meio de sua mortificação... para ter de que se gloriar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph Erskine' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há outra forma de viver esta vida cristã a não ser mediante uma contínua morte para o eu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem tem uma cruz de veludo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Temos ordem de carregar, não de construir nossa cruz. Deus, em sua providência, concederá uma para nós.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus cria a partir do nada. Portanto, enquanto o homem não se reduzir a nada, Deus não poderá fazer nada com ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristãos mortificados são a glória de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, '"Crucificada" é o único adjetivo com o qual se descreve a vida cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Furman Miller' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um dia morri para George Muller, para suas opiniões e preferências, gosto e vontade; morri para o mundo, sua aprovação ou censura; morri para a aprovação ou acusação até mesmo de meus irmãos e amigos; e desde então tenho procurado apenas apresentar-me aprovado diante de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Muller' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Que significa para mim estar "crucificado"? Penso que a resposta resume-se magistralmente nas palavras com as quais a multidão referiu-se a Jesus: "Fora com ele!" ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Watchman Nee' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Esteja matando o pecado ou ele o estará matando.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que interrompe a mortificação anula todos os esforços com vistas à santidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz de Cristo é o mais suave fardo que eu já carreguei; é um peso como as asas para um pássaro, como as velas para um veleiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo tem um segredo desconhecido pelos comunistas ou capitalistas... como morrer para o eu. Este segredo torna-nos invencíveis.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. E. Sangster' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Preparem-se, meus jovens amigos, para se tornarem cada vez mais fracos; preparem-se para mergulhar a níveis cada vez mais baixos de auto-estima; preparem-se para a auto-aniquilação e orem para que Deus apresse este processo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon ' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para termos aroma suave diante de Deus, precisamos ser quebrados e derramados, não somente ser recipientes de perfume suave.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. T. Studd' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando você coloca a vida no altar, quando se prontifica e aceita morrer, você se torna invencível. Não tem mais nada a perder.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Josif Ton' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para os "cristãos artificiais" de nossos dias, Jesus sempre precisa experimentar a morte, pois tudo o que desejam ouvir é outro sermão acerca de como Ele morreu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz é mais fácil para aquele que a carrega do que para aquele que a arrasta pelo caminho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. E. Vaux' and ass.assunto = 'AUTOCRUCIFICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O autoconhecimento humilde é um caminho mais seguro para Deus do que uma busca profunda de erudição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas à Kempis' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O auto-exame é a melhor cura para a auto-estima.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo, as Escrituras, o coração do homem e os ardis de Satanás são as coisas que devem ser estudadas e sondadas em primeiro lugar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando olho para dentro de meu coração e observo minha iniqüidade, ele parece um abismo infinitamente mais fundo do que o próprio inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jonathan Edwards' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maneira de provar a si mesmo, a maneira de provar qualquer homem, é olhar debaixo da superfície.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca podemos pedir com demasiada freqüência ou seriedade que Deus nos torne honestos para conosco.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O auto-exame é o tão conhecido caminho para a perfeição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma vida não examinada não é digna de ser vivida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sócrates' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os pecados secretos, à semelhança de conspiradores secretos, precisam ser expulsos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que não valoriza o auto-exame pode estar bem certo de que as coisas precisam ser examinadas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É bom desmascarar os nossos pecados, para que eles não nos desmascarem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora nem sempre recorramos à condenação de nós mesmos, é sempre seguro suspeitar de nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Whately' and ass.assunto = 'AUTO-EXAME'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um avivamento pode produzir barulho, mas não é nisso que ele consiste. O fator essencial é a obediência de todo o coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ernest Baker' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É mais fácil falar de avivamento do que lançar-se nele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Horatius Bonar' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Avivamento é a substituição da forma da piedade pelo seu poder vivo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Bonar' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Avivamento não é a tampa explodindo, mas o fundo caindo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Darrel Bridges' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um avivamento da religião... consiste em nova vida espiritual transmitida aos mortos e de nova saúde espiritual transmitida aos vivos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Buchanan' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em nosso desejo bíblico por avivamento, precisamos recusar-nos a buscar qualquer experiência que se proponha a eliminar nossa fraqueza natural.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter Chantry' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando Deus visita sua igreja de acordo com suas promessas, os efeitos que se seguem fazem o povo gritar: "Este é o dedo de Deus!"' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Elias' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos os ministros devem ser ministros de avivamento, e toda pregação deve ser pregação de avivamento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles G. Finney' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todo avivamento que já aconteceu na história do mundo ou na história da igreja deu grande ênfase à santidade de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Graham' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Avivamento não é descer a rua com um grande tambor; é subir ao Calvário em grande choro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roy Hession' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Avivamento é uma série de novos começos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David McKee' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devemos viver de tal maneira que, quando Deus começar sua grande marcha triunfal, nos unamos ao primeiro batalhão e tomemos parte nas primeiras vitórias.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. Campbell Morgan' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em qualquer avivamento bíblico, eleva-se o padrão; ele não fica suspenso enquanto outro tipo de cristianismo é introduzido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Iain H. Murray' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A espera de um avivamento geral não é desculpa para não desfrutar o avivamento pessoal.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Olford' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A melhor definição de avivamento é "tempos de refrigério... na presença do Senhor".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Edwin Orr' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Avivamento significa a obra de Deus restaurando a uma... igreja, de maneira incomum, os padrões que o Novo Testamento estabelece como inteiramente comuns.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O verdadeiro avivamento sempre começou e resultou em separação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vernon Patterson' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um avivamento provém de Deus, ou então não é absolutamente avivamento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Wilbur M. Smith' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus está mais disposto a dar avivamento do que nós a recebê-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Erlo Stegan' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O verdadeiro espírito do avivamento está fora do controle do organizador e do propagandista. Ele não pode ser criado por técnicas nem promovido pela tinta das impressoras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James A. Stewart' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É inútil grandes grupos de crentes gastarem horas e mais horas implorando que Deus mande um avivamento. Se não pretendemos nos reformar, também não devemos orar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em certo sentido, o Pentecoste nunca mais poderá acontecer de novo. Em outro sentido, ele pode estar sempre acontecendo, visto que estamos vivendo na era do Espírito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur Skevington Wood' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O avivamento não é uma invenção terrena; é uma criação celestial.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur Skevington Wood' and ass.assunto = 'AVIVAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bajulação tem virado mais cabeças do que o mau hálito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não teria medo de ser reprovado se não amasse a lisonja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bajulação é a rede invisível do diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Bajuladores se parecem com amigos assim como lobos se parecem com cães.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Chapman' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Fale com um homem a respeito dele próprio, e ele irá ouvi-lo durante horas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamin Disraeli' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há grande perigo quando um coração orgulhoso encontra-se com lábios bajuladores.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os bajuladores são os piores dentre os animais domados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Da mesma forma como o ferro de passar alisa as maiores rugas de um tecido, também as línguas bajuladoras agem com relação aos atos mais monstruosos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Goowin' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as outras bajulações seriam inofensivas se não bajulássemos a nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os bajuladores são a pior espécie de inimigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tácito' and ass.assunto = 'BAJULAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caminho mais curto para entender a Bíblia é aceitar o fato de que Deus está falando em cada linha.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald Grey Barnhouse' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia não diz que suas palavras foram inspiradas por Deus, mas que foram sopradas por Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia não é nada mais do que a voz dAquele que se assenta no trono. Cada livro, cada capítulo, cada sílaba, cada letra da Bíblia é um pronunciamento direto do Altíssimo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John William Burgon' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Observe... que a mesma reverência que temos para com Deus também se deve à Escritura, porque ela procede unicamente dele, e não há nada do homem presente nela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é a carta que Deus nos enviou; a oração é uma carta que enviamos a Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As palavras das Escrituras devem ser consideradas palavras do Espírito Santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus agracionou-nos com sua autobiografia, de forma que podemos conhecer e ter seus pensamentos em todas as áreas de nossa vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Horn' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A teologia não é nada mais do que a gramática da língua do Espírito Santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As Escrituras Sagradas vêm da plenitude do Espírito, de modo que não há nada nos profetas, na lei, no evangelho ou nas epístolas que não desça da majestade divina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Orígenes' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os escritores bíblicos não inventaram suas próprias palavras, de acordo com as coisas que haviam aprendido, mas apenas expressaram as palavras que receberam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia parece uma orquestra sinfônica, tendo o Espírito Santo como seu maestro; cada instrumento foi trazido voluntária, espontânea e criativamente para tocar suas notas exatamente como o grande maestro queria, embora nenhum dos músicos pudesse ouvir a música como um todo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A inerrância afirma que a Bíblia não é nada menos do que revelação, revelação que procede de um Deus pessoal e transcendente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. C. Sproul' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia fala no tom de voz do próprio Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As Escrituras emanam de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Tyndale' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é a biblioteca do Espírito Santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'BÍBLIA - Autoria Divina'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A fé vacilará se a autoridade das Escrituras Sagradas perder sua força sobre os homens. Precisamos render-nos à autoridade da Bíblia, pois ela não pode conduzir mal nem ser mal conduzida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A autoridade da Bíblia não provém da capacidade de seus autores humanos, mas do caráter de seu Autor divino.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é o cetro pelo qual o Rei celestial governa sua igreja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quer gostemos quer não, estamos limitados aos ensinos da Bíblia para nossa informação acerca de todas as doutrinas da fé cristã, e isto inclui a doutrina da visão que a Bíblia tem de si mesma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Edward John Carnell' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Palavra de Deus está acima da igreja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Cranmer' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Palavra de Deus ou é absoluta ou é obsoleta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há apenas uma única coisa realmente inevitável: é necessário que as Escrituras se cumpram.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Carl F. Henry' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é o estatuto do reino de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ezekiel Hopkins' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda experiência precisa ser subordinada à disciplina das Escrituras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Erroll Hulse' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia foi o único livro que Jesus citou, e isso nunca como base para uma discussão, mas para resolver uma questão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leon Morris' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossa visão de Deus precisa ser controlada não pelo que vemos no mundo, mas pelo que a Bíblia nos autoriza a crer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Iain H. Murray' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A religião em que nosso Senhor foi criado era, antes e acima de tudo, uma religião de sujeição à autoridade de uma Palavra divina escrita.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um simples cristão com a Bíblia na mão pode dizer que a maioria está errada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Schaeffer' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdade das Escrituras destrói a especulação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. C. Sproul' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia, toda a Bíblia e nada mais do que a Bíblia, é a religião da igreja de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem verdadeiramente sábio é aquele que sempre crê na Bíblia contra a opinião de qualquer outro homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. A. Torrey' and ass.assunto = 'BÍBLIA - Autoridade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando você está lendo um livro em um quarto escuro e acha isto difícil, leva-o para perto de uma janela para receber mais luz. Da mesma forma, leve sua Bíblia a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'BÍBLIA - e Cristo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jesus considerava-se a chave para as Escrituras, e estas a chave para ele próprio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'BÍBLIA - e Cristo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A divindade de Cristo é a doutrina-chave das Escrituras. Rejeite-a, e a Bíblia tornar-se-á um amontoado de palavras sem qualquer tema que lhe dê unidade. Aceite-a, e a Bíblia tornar-se-á uma revelação compreensível e ordenada de Deus na pessoa de Jesus Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Oswald Sanders' and ass.assunto = 'BÍBLIA - e Cristo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo é o alvo das Escrituras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'BÍBLIA - e Cristo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A compreensão adequada das Escrituras só ocorre por meio do Espírito Santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - e o Espírito Santo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que tem o Espírito Santo no coração e as Escrituras na mão tem tudo de que precisa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander MacLaren' and ass.assunto = 'BÍBLIA - e o Espírito Santo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o Espírito Santo nos guia em tudo, Ele irá fazê-lo de acordo com as Escrituras, e nunca de maneira contrária a elas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Muller' and ass.assunto = 'BÍBLIA - e o Espírito Santo'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não tente tornar a Bíblia importante; ela já é importante em si mesma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Dietrich Bonhoeffer' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As doutrinas da Bíblia são todas práticas, e suas leis, todas razoáveis. Cada doutrina tem seu portanto prático, e cada lei seu porquê doutrinário.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Brown' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia jamais envelhece.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Edith Deen' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As Escrituras Sagradas, por serem uma regra tanto de nossos deveres para com Deus como de nossas expectativas a respeito dEle são de muito maior utilidade e benefício para nós do que o dia ou a noite, do que ar que respiramos ou a luz do sol.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Arranhe a superfície das Escrituras onde quiser, e você descobrirá uma fatia de vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur Skevington Wood' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na Bíblia não há histórias antigas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Dinsdale T. Young' and ass.assunto = 'BÍBLIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em parte alguma pode haver falsidade no sentido literal das Escrituras Sagradas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tomás de Aquino' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Creio firmemente que nenhum daqueles autores errou em qualquer aspecto quando escreveu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se a Bíblia contém erros, não é a Palavra de Deus, por mais digna de confiança que seja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Montgomery Boice' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aprendi a atribuir infalibilidade apenas aos livros chamados canônicos, de forma que creio confiantemente que nenhum de seus autores cometeu erros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma ciência é mais bem comprovada do que a religião da Bíblia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Newton' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Atribuirei todas as aparentes incoerências da Bíblia à minha própria ignorância.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Newton' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus escreve com uma pena que nunca borra, fala com uma língua que nunca erra, age com uma mão que nunca falha.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca devemos alterar Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se há algum erro na Bíblia, então pode haver mil erros. Se há uma falsidade sequer naquele livro, ele não proveio do Deus da verdade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'BÍBLIA - Inerrância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Palavra gera fé e também regenera.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Alleine' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossa fé é alimentada pelo que está claro nas Escrituras e testada pelo que é obscuro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Senhor não brilha sobre nós, exceto quando tomamos Sua Palavra como nossa luz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A não ser que a Palavra de Deus ilumine o caminho, toda a vida dos homens estará envolta em trevas e nevoeiro, de forma que eles inevitavelmente irão perder-se.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O alicerce de qualquer reforma realizada pelo Espírito Santo é o esclarecimento da Palavra de Deus ao povo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frank Cooke' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Que importa não ter resposta em nenhuma voz ouvida? Teus oráculos, a Palavra escrita,Ainda transmitem conselho e orientação, Compreensíveis para o reto coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Josiah Condor' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única reforma verdadeira é a que emana da Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. H. Merle DAubigné' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As Escrituras ensinam-nos a melhor maneira de viver, a mais nobre forma de sofrer e o modo mais confortável de morrer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há diabo nos dois primeiros capítulos da Bíblia nem nos dois últimos. Graças a Deus por um livro que elimina o diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Palavra de Deus é o instrumento pelo qual o Espírito de Deus transforma o cristão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Horn' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se metade dos esforços empregados em atacar ou defender a Bíblia fossem gastos em explicá-la, como seria elevado o nível da vida comum.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Will H. Houghton' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A lei divina, da maneira como é vista pelo cristão, exibe liberdade, propicia liberdade e é liberdade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Johnstone' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não fiz nada: a Palavra fez e realizou tudo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Enquanto outros livros informam e poucos reformam, só este livro transforma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. T. Pierson' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Escritura não é apenas pura, é também purificadora.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma multidão de leigos que leia a Bíblia é a defesa mais eficiente de uma nação contra o erro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A síntese de todos os conselhos que lhes posso oferecer, necessários para reger o comportamento de vocês para com Deus e o homem, em qualquer circunstância, lugar ou condição da vida, encontra-se na bendita Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Watts, Senr' and ass.assunto = 'BÍBLIA - Influência e Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é tão completa quanto qualquer outro dom de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é uma fonte inesgotável de todas as verdades. A existência da Bíblia é a maior bênção que a humanidade jamais experimentou.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Immanuel Kant' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Fiz uma aliança com Deus: que Ele não me mande visões, nem sonhos nem mesmo anjos. Estou satisfeito com o dom das Escrituras Sagradas, que me dão instrução abundante e tudo o que preciso conhecer tanto para esta vida quanto para a que há de vir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nas Escrituras, cada florzinha é uma campina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma pedra preciosa daquele oceano vale todos os pedregulhos dos regatos da terra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nas Escrituras divinas, há vaus e profundezas; vaus onde o cordeiro pode passar, e profundezas onde o elefante pode nadar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se quando eu chegar ao céu o Senhor me disser: "Spurgeon, quero que você pregue por toda a eternidade", responderei: "Senhor, dá-me uma Bíblia, é tudo de que preciso".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não esperamos nenhum novo mundo em nossa astronomia nem nenhuma nova Bíblia em nossa teologia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é uma mina de diamantes, um colar de pérolas, a espada do espírito; um mapa pelo qual o cristão navega para a eternidade; o roteiro pelo qual anda todos os dias; o relógio pelo qual acerta sua vida; a balança com a qual pesa suas ações.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todo o conhecimento que você deseja ter está em um único livro: a Bíblia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'BÍBLIA - Plenitude'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É um milagre a maneira pela qual Deus tem preservado seu livro durante tanto tempo! Como é bom e glorioso ter a Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Preservação'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão percebe que os dentes do tempo roem todos os livros, menos a Bíblia... Dezenove séculos de experiência a têm provado. Ela passou pelo furor da crítica que nenhum outro volume sofreu; suas verdades espirituais suportaram as chamas e saíram ilesas até do cheiro de queimado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. E. Sangster' and ass.assunto = 'BÍBLIA - Preservação'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando a poeira da batalha assentar-se, ouviremos todos os sessenta e seis livros declararem com o apóstolo Paulo: "Não te faças nenhum mal, que todos aqui estamos".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. H. Griffith Thomas' and ass.assunto = 'BÍBLIA - Preservação'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há dois temas dominantes na Bíblia: um é a narrativa da sedução do homem pelo pecado; outro é a salvação do homem por Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'S. Barton Babbage' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia, como revelação de Deus, não tem a intenção de nos dar todas as informações que pudéssemos desejar nem de resolver todas as questões com as quais a alma humana vive perplexa, mas a de transmitir o suficiente para ser um guia seguro para o porto do descanso eterno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Albert Barnes' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A salvação, a salvação do homem, é o objetivo final de toda a Bíblia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. H. Bernard' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é uma janela na prisão deste mundo, através da qual podemos olhar para a eternidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Timothy Dwight' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O celeiro da Palavra de Deus nunca teve a intenção de servir à mera pesquisa nem mesmo principalmente ao estudo, mas, sim, de servir de sustento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia dá a si mesma o nome de alimento. O valor do alimento não está na discussão que ele suscita, mas na nutrição que fornece.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Will H. Houghton' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As Escrituras não foram dadas para aumentar nosso conhecimento, mas para mudar nossa vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia produz a graça e ao mesmo tempo serve-lhe de alimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quero conhecer uma coisa: o caminho para o céu... O próprio Deus dignou-se a ensinar o caminho... Ele o escreveu em um livro. Oh, dá-me esse livro! A qualquer preço, dá-me o livro de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'BÍBLIA - Propósito'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A qualificação mais importante exigida do leitor da Bíblia não é erudição, mas, sim, rendição; não perícia, mas disposição de ser guiado pelo Espírito de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martin Anstey' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devo concordar com as Escrituras canônicas sem desacordo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que não está preparado para prestar obediência à Palavra de Deus não é capaz nem de ouvi-la corretamente. Por isso as parábolas tornam-se janelas para algumas pessoas e muros para outras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há partes da Bíblia difíceis de interpretar, mas nenhuma me leva a duvidar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cuidado com a racionalização da Palavra de Deus obedeça a ela!' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Oswald Chambers' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De todos os comentários acerca das Escrituras, os bons exemplos são os melhores e mais vivos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Donne' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto mais reverência tivermos pela Palavra de Deus, mais alegria encontraremos nela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Diante da Palavra, todos precisam ceder.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Minha consciência é escrava da Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Poucos tremem diante da Palavra de Deus. Poucos, quando a lêem, ouvem a voz cheia de majestade de Jeová.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Submeter-se à Palavra de Deus é um ato de fé; qualquer questionamento ou tentativa de alterá-la é demonstração de incredulidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Onde a Bíblia não tem voz, não devemos ter ouvidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os praticantes da Palavra são os melhores ouvintes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sou fanático pela Bíblia. Eu a sigo em todas as coisas, tanto pequenas como grandes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'BÍBLIA - Submissão à'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é entre os livros aquilo que Cristo é entre os homens.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BÍBLIA - Supremacia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Da mesma forma como Deus é a única pessoa santa, a Escritura é o único livro santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'BÍBLIA - Supremacia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto a esse grande livro, preciso dizer que ele é a melhor dádiva de Deus ao homem. Tudo o que o bom Salvador deu ao mundo foi comunicado por meio desse livro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Abraham Lincoln' and ass.assunto = 'BÍBLIA - Supremacia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitos livros em minha biblioteca estão agora desatualizados. Foram bons enquanto eram novos, à semelhança das roupas que usei quando tinha dez anos de idade; mas eu cresci e as deixei para trás. Ninguém jamais deixa para trás as Escrituras por ter crescido; esse livro se amplia e é mais conhecido à medida que passam nossos anos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BÍBLIA - Supremacia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ainda que eu tivesse a língua dos anjos, mesmo assim não poderia expressar a excelência da Bíblia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'BÍBLIA - Supremacia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia toda é o contexto em que qualquer passagem bíblica deve ser considerada e aplicada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BÍBLIA - Unidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia é uma unidade, e esta unidade é tão clara que o Novo Testamento funciona como intérprete infalível do Antigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard B. Gaffin' and ass.assunto = 'BÍBLIA - Unidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As doutrinas da Bíblia não são isoladas, mas inter-relacionadas; portanto, o ponto de vista acerca de uma doutrina necessariamente afetará o ponto de vista aceito a respeito de outra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. A. Hodge' and ass.assunto = 'BÍBLIA - Unidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdade de Deus sempre concorda consigo mesma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'BÍBLIA - Unidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mesmo Testador fez ambos os Testamentos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Taylor' and ass.assunto = 'BÍBLIA - Unidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Somos salvos não por nossos feitos, mas pelo sacrifício de Cristo por nossos defeitos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Fred Catherwood' and ass.assunto = 'BOAS OBRAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando deixamos passar despercebidas nossas boas obras, Deus, certamente, as observa mais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'BOAS OBRAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora... os discípulos devam ser vistos praticando boas obras, eles não devem praticar boas obras para serem vistos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul B. Levertoff' and ass.assunto = 'BOAS OBRAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma quantidade de boas obras pode fazer de nós boas pessoas. Precisamos ser bons antes de poder fazer o bem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Chester A. Pennington' and ass.assunto = 'BOAS OBRAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Faça todo o bem que puder, de todas as formas, a todas as pessoas, enquanto for possível.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'BOAS OBRAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dizem que onde há fumaça há fogo, mas a fumaça pode ser nada mais do que poeira e nevoeiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'BOATOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não creia em metade do que você ouve; não repita metade do que crê; quando ouvir uma notícia negativa, divida-a por dois, depois por quatro, e não diga nada acerca do restante dela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'BOATOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bondade existente no coração sobe até o rosto e imprime ali sua beleza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'BONDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Podemos fazer mais sendo bons do que de qualquer outra forma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Rowland Hill' and ass.assunto = 'BONDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bondade é o único investimento que nunca falha.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry D. Thoreau' and ass.assunto = 'BONDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bondade de Deus é a raiz de toda bondade; e a nossa bondade, se temos alguma, origina-se em Sua bondade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Tyndale' and ass.assunto = 'BONDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Calúnia é algo que entra pelo ouvido e sai pela boca extremamente ampliado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CALÚNIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não pode ser infligida aos homens injúria maior do que lhes ferir a reputação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CALÚNIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A calúnia é um defeito que golpeia duplamente, ferindo tanto aquele que a comete quanto aquele contra quem é cometida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jacques Saurin ' and ass.assunto = 'CALÚNIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter de um homem é medido exatamente por suas reações diante das injustiças da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nem as maiores riquezas podem resgatar a pobreza de caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A reputação é preciosa, mas o caráter não tem preço.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Reputação é o que os homens pensam que você é; caráter é o que Deus sabe que você é.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As circunstâncias nunca formam o caráter; elas meramente o revelam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tudo na vida é um teste para o caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que és aos olhos de Deus, é o que tu verdadeiramente és.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas à Kempis' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A felicidade não é a finalidade da vida, mas sim o caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Ward Beecher' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter com que descemos à sepultura, quando morremos, é o mesmo caráter com que reapareceremos na ressurreição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Chalmers' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O fruto do Espírito não é entusiasmo nem ortodoxia; é caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. B. Duncan' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter, assim como uma cerca, não pode ser fortalecido por uma caiação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul Frost' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Homens e irmãos, a simples confiança em Deus é o ingrediente mais importante da grandiosidade moral do caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Fuller' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O melhor teste do caráter é verificado na intensidade e força de gratidão que temos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Milo H. Gates' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Senhor conhece pelo nome aqueles que são seus, mas nós os reconhecemos pelo caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A reputação de muitos homens não conheceria seu caráter se o encontrasse na rua.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Elbert Hubbard' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A abundância material sem caráter é o caminho mais certo para a destruição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Jefferson' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter é como uma árvore, e a reputação é como sua sombra. A sombra é o que nos faz lembrar da árvore, a árvore é o objeto real.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Abraham Lincoln ' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Caráter é o que o homem é no escuro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ortodoxia de palavras é blasfêmia, a menos que seja sustentada pela superioridade de caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Blaise Pascal' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens mostram seu caráter de maneira mais clara nas trivialidades, quando não estão sendo observados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur Schopenhauer' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A graça de Deus fará muito pouco por nós se resolvermos não fazer nada por nós mesmos. Deus chama-nos para cooperarmos com Ele no aperfeiçoamento do caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. Graham Scroggie' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter humano é inútil na proporção em que lhe falta aversão ao pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. G. T. Shedd' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As ações dos homens formam um indicador infalível de seu caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey Wilson' and ass.assunto = 'CARÁTER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A caridade dá a si mesma riqueza, a cobiça toma e continua pobre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A caridade é o próprio uniforme de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hugh Latimer' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maior caridade do mundo é a comunicação da verdade divina àqueles que a desconhecem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander MacLaren' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O maior brilho de inteligência é de valor incalculavelmente mais baixo do que a menor fagulha de caridade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Nevins' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O lugar da caridade é como o de Deus: em toda parte.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Quarles' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A caridade é o melhor caminho para a abundância; quem mais dá, mais recebe.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'CARIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Assim como pela criação Deus de um fez dois, pelo casamento, ele de dois fez um.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não olhe a seu redor procurando com quem vai se casar; olhe para cima. Qualquer escolha diferente da de Deus significará um desastre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Casamento é mais do que encontrar a pessoa certa; é ser a pessoa certa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca se una a alguém que se recuse unir-se a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O compromisso de tomar uma mulher como esposa leva o homem a compartilhar toda sua vida com ela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter J. Chantry' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Como terminariam logo as sessões de aconselhamento matrimonial se maridos e esposas competissem seriamente em negar-se a si mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter J. Chantry' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus fez o casal humano de tal forma que é natural ao marido liderar, e à esposa seguir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Hendriksen' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os filhos de um homem são pedaços dele, mas a esposa é ele próprio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A mulher foi feita de uma costela tirada do lado de Adão; não de sua cabeça para governar sobre ele, nem de seu pé para ser pisada por ele; mas de seu lado, para ser igual a ele, debaixo de seu braço para ser protegida, e perto de seu coração para ser amada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um mais um é igual a um pode não ser um conceito matemático correto, mas é uma descrição exata da intenção de Deus para a relação matrimonial.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Wayne Mack' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é testemunha de toda cerimônia de casamento, e será testemunha de qualquer violação de seus votos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas V. Moore' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um casamento bem-sucedido é sempre um triângulo: o homem, a mulher e Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Cecil Myers' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não criou a mulher para ser uma competidora, mas, sim, uma companheira.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick Sampson' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Antes de ter qualquer outra vocação, o homem foi chamado para ser marido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Smith' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há sempre o perigo de o casamento tirar o gume afiado da paixão por Jesus e pelas almas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. T. Studd' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Procure elogiar sua esposa, mesmo que isso a amedronte a princípio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Sunday' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus amarra com tanta força os laços do matrimônio que nem a morte nem o inferno podem desatá-los.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CASAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A censura é um negócio que pode ser feito com muito pouco capital.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CENSURA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A censura é um talento que deve ser enterrado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CENSURA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As pessoas que têm por objetivo encontrar falhas, raramente encontram outra coisa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CENSURA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada é mais fácil de encontrar do que falhas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CENSURA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando estiver procurando falhas para corrigir, olhe para o espelho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CENSURA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A fé que nunca é assaltada por dúvidas não passa de uma ilusão. Certamente, a certeza que está sempre certa nada mais é do que um sonho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Bolton' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um alma dominada pela certeza não está disposta a ir para o céu sem companhia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza é a glória em botão, é a periferia do paraíso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza torna mais leves as grandes aflições, mais breves as longas e mais suaves as amargas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto mais a alma estiver amoldada a Cristo, mais confiante estará de seu interesse nele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora nenhum homem mereça certeza por sua obediência, Deus geralmente coroa a obediência com certeza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza é o fruto que brota da raiz da fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza vem de Deus tanto quanto a fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. P. Cockerton' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza tem uma passagem estreita, e pode ser comprimida com um pequeno pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza é, como foi, a nata da fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma certeza bem firmada do céu e da felicidade, em vez de encher o homem com orgulho, irá torná-lo e mantê-lo verdadeiramente humilde.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Penso que a principal evidência da diferença entre a certeza verdadeira e a falsa baseia-se no fato de que a verdadeira produz humildade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. A. Hodge' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado não pode nunca despojar completamente um santo de sua jóia, sua graça; mas pode furtar-lhe a chave do cofre, sua certeza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Jenkyn' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Espírito Santo não é cético, e as coisas que Ele grava em nosso coração não são dúvidas ou opiniões, mas afirmações, mais seguras e mais dignas de confiança do que o próprio sentido ou a vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A fé é nossa garantia; a certeza da fé é a garantia de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Christopher Nesse' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A certeza da esperança é mais que vida. É saúde, força, poder, vigor, atividade, energia, coragem, beleza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém mais do que Deus é necessário para assegurar-nos o amor de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o sacerdócio de todos os crentes é o primeiro fruto da justificação, a "certeza" é o segundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma carta pode estar escrita, embora não esteja selada; assim a graça pode estar escrita em nosso coração, e o Espírito Santo pode não lhe fixar o selo da certeza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A santificação é a semente; a certeza é a flor que se origina dela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A jóia da certeza é mais bem guardada no cofre de um coração humilde.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CERTEZA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu pagará qualquer prejuízo que possamos sofrer para ganhá-lo; mas nada pode pagar o prejuízo de perdê-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em nada, a não ser no céu, vale a pena colocar nosso coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu não é uma recompensa condicional, mas um relacionamento consumado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se um homem sofresse todas as tristezas de todos os santos do mundo, nem mesmo isso o tornaria merecedor de uma hora de glória no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Crisóstomo' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não é morte fechar os olhos Há muito turvados por lágrimas. Para que se abram no descanso final  A fim de passar ali, a doce vida eternal.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henri Abraham Cesar Malan' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se é doce ser o trigo do Senhor que cresce aqui, quanto mais ser recolhido a seu celeiro! ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A terra não tem tristeza que o céu não possa curar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Moore' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma brisa do paraíso extinguirá todos os ventos adversos da terra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'CÉU - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu é uma realidade não vista pelos olhos de carne, manifestada pela revelação e recebida pela fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Archibald Alexander' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu é um lugar preparado para pessoas preparadas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os que vivem no Senhor nunca se vêem uns aos outros pela última vez.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em nosso primeiro paraíso, o Éden, havia um caminho de saída, mas não havia forma de entrar de novo. Mas, quanto ao paraíso celestial, há um caminho de entrada, mas não há forma de sair de novo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um cachorro sente-se em casa neste mundo porque este é o único mundo em que um cachorro viverá. Nós não nos sentimos em casa neste mundo porque fomos feitos para um mundo melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os que conhecem a Deus e a Cristo já estão nos arredores da vida eterna.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Minha opinião acerca de tudo o que me acontece dever ser regida por estas três coisas: a compreensão que tenho acerca de quem sou, a consciência que tenho de para onde vou, indo e o conhecimento que tenho do que me espera quando eu chegar lá.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martin Lloyd-Jones' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando chegar ao céu, verei ali três coisas impressionantes: a primeira será ver muita gente que não esperava ver ali; a segunda será não encontrar muita gente que esperava ali encontrar; e a terceira e mais maravilhosa de todas, será encontrar a mim mesmo ali.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Newton' and ass.assunto = 'CÉU - Lar Eterno do Cristão'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu começa onde o pecado termina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há testas enrugadas no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há remorso no céu, nem lágrimas de pesar, nem repensar, nem causas perdidas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O céu seria um verdadeiro inferno para uma pessoa perversa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nas ruas da nova Jerusalém lá do alto, ninguém jamais se queixará de que os outros têm demais ou de que eles próprios têm pouco.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há crenças errôneas no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Gray' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se um homem perverso chegasse ao céu, sentir-se-ia como um porco em um jardim florido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Rowland Hill' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se é proibido rir no céu, não quero ir para lá.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma das felicidades do céu será o fato de que nunca mais os santos terão mal-entendidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Milner' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo e sua cruz são inseparáveis nesta vida; contudo, eles se separam à porta do céu. Não há lugar para guardar cruzes no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando uma águia estiver feliz em uma gaiola de ferro, quando uma ovelha estiver satisfeita na água, quando uma coruja estiver contente no fulgor do meio-dia ou ainda quando um peixe estiver alegre em terra seca, então, e só então, admitirei que o homem não-santificado estará feliz no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se um ladrão entrasse no céu sem ser transformado, começaria batendo as carteiras dos anjos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CÉU - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto mais do céu desejamos, menos da terra cobiçamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É certo que todos os que vão para o céu de agora em diante começam seu céu aqui e já têm o coração ali.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Senhor Jesus Cristo não leva para o céu ninguém que Ele não tenha santificado na terra. Esta Cabeça viva não admite membros mortos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De fato, a santidade é aperfeiçoada no céu; mas o começo dela está invariavelmente reservado a este mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Graça é glória em formação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander Peden' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A glória precisa ter início na graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém vai para o céu se já não enviou para lá seu coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Wilson' and ass.assunto = 'CÉU - Preparação para'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo é o centro das atenções no céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Archibald Alexander' and ass.assunto = 'CÉU - Presença de Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Só Deus é quem faz o céu ser céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CÉU - Presença de Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O estado celestial é organizado de forma a expressar visivelmente o que Deus pensa da cruz de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'CÉU - Presença de Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O coração humilde é o trono de Deus quanto à sua presença em graça; o céu é seu trono quanto à sua presença em glória' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CÉU - Presença de Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ciência pode acrescentar anos à sua vida, mas só Cristo pode acrescentar vida a seus anos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um Deus provado pela ciência não seria Deus. Pois só posso provar aquilo que segundo a criação é inferior a mim, aquilo que está à minha disposição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Gerhard Bergmann' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As próprias ciências de onde surgiram objeções à religião, à medida que progrediram, removeram aquelas objeções e, por fim, forneceram plena confirmação à Palavra inspirada de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tryon Edwards' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Eu apenas traço as linhas que fluem de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Albert Einstein' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca encontrei nada incompatível entre as coisas do homem que podem ser conhecidas por seu espírito e as coisas mais elevadas concernentes a seu futuro, que não podem ser conhecidas por aquele espírito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Faraday' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De fato, não existe conflito entre uma fé em Deus bem-informada e os resultados seguros da ciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Green' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado lançou o homem em mais problemas do que a ciência é capaz de livrá-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem pensa que pode haver um conflito real entre ciência e religião deve ser muito inexperiente em ciência ou muito ignorante em religião.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Phillip Henry' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ciência não pode resolver os problemas morais do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Carl Gustav Jung' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens tornaram-se cientistas porque esperavam encontrar lei na natureza, e esperavam encontrar lei na natureza porque criam em um Legislador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma ciência é mais bem provada do que a religião da Bíblia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Newton' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Infelizmente, para as pessoas de mente científica, Deus não pode ser descoberto ou demonstrado por meios puramente científicos. Mas, na verdade isso não prova nada; simplesmente significa que estão sendo usados instrumentos errados para esse trabalho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. B. Phillips' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus disse que Jonas foi engolido por uma baleia, então a baleia engoliu a Jonas, e não precisamos de nenhum cientista para medir a garganta da baleia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A moda atual de usar a ciência para confirmar o cristianismo não prova a veracidade da fé cristã, mas a incerteza que corrói o coração dos que precisam recorrer à ciência para que esta dê respeitabilidade à fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maneira científica de considerar o mundo não é mais errada do que a maneira de um fabricante de vidro olhar para uma janela. Este modo de considerar as coisas tem seu devido lugar.  Não obstante, a janela foi colocada ali não para ser olhada, mas para que se olhasse através dela; e o mundo está fora de propósito, a não ser que quando olhamos através dele, nossos olhos não se fixem nele, mas no Deus que o criou.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamim B. Warfield' and ass.assunto = 'CIÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os ciúmes são a matéria-prima do homicídio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CIÚMES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas coisas agradáveis passam ao largo da vida quando os ciúmes assumem o poder.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CIÚMES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os ciúmes nunca se consideram fortes o bastante.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Bunyan' and ass.assunto = 'CIÚMES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A caridade dá a si mesma riqueza; a cobiça toma e continua pobre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas tribulações são causadas porque nossos sonhos são maiores do que nossos ganhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cobiça é a doença que está fazendo secar a vida de nossa igreja em todos os sentidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem sempre se contenta, embora tenha pouco é muito mais feliz, do que aquele que está sempre cobiçando, embora tenha muito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A alma do homem é infinita naquilo que cobiça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ben Jonson' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cuidado... com o início da cobiça, pois você não sabe onde ela terminará.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Pode-se cobiçar quando se tem pouco, muito ou o suficiente, pois a cobiça vem do coração e não das circunstâncias da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles Caldwell Ryrie' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cobiça está no começo e no fim do alfabeto do diabo o primeiro defeito que aparece na natureza corrupta e o último que morre.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert South' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cobiça é o embriaguez sem bebida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há melhor antídoto contra cobiçar aquilo que é dos outros do que satisfazer-se com o que é seu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A coceira da cobiça faz com que o homem meta a unha em tudo o que é dos outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tenho ouvido milhares de confissões, mas jamais alguma sobre a cobiça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francisco Xavier' and ass.assunto = 'COBIÇA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Compaixão é o que faz uma pessoa sentir dor quando a outra é ferida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMPAIXÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As pessoas não irão interessar-se pelo que você sabe até saberem que você se interessa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMPAIXÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão deve demonstrar pela compaixão o mesmo interesse que demonstra pelas doutrinas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'COMPAIXÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há melhor exercício para o coração do que abaixar-se e levantar os outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Andrew Holmer ' and ass.assunto = 'COMPAIXÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus se interessa, Deus se preocupa. E, visto que ele se interessa, seu povo também tem a obrigação de interessar-se pelos outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Foy Valentine' and ass.assunto = 'COMPAIXÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O golpe fatal para o progresso é a auto-satisfação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMPLACÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum cristão deve ser complacente com sua condição espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'COMPLACÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando nos sentimos melhor estando despreocupados, quando todas as coisas correm de acordo com nossa vontade e prazer, é então que, muitas vezes, estamos mais longe de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hugh Latimer' and ass.assunto = 'COMPLACÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A calma que nos faz dormir pode ser mais fatal do que uma tempestade que nos mantém bem acordados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'COMPLACÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A complacência é inimiga mortal do progresso espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'COMPLACÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem é feito para a sociedade, e os cristãos, para a comunhão dos santos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COMUNHÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não devemos impor nenhuma condição para a aceitação de nossos irmãos, a não ser as que Deus impôs para aceitá-los.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COMUNHÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para os primeiros cristãos, koinonia não era a "comunhão" enfeitada de passeios quinzenais patrocinados pela igreja. Não era chá, biscoitos e conversas sofisticadas no salão social depois do sermão. Era um compartilhar incondicional de suas vidas com os outros membros do corpo de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ronald J. Sider' and ass.assunto = 'COMUNHÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Usemos o mundo, mas deleitemo-nos no Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ligar-se a Cristo é o segredo de desligar-se do mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto mais amamos a Cristo, mais temos prazer em estar a sós com Ele. Os que se amam gostam de estar a sós uma com a outra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você não vive em Cristo, está morto para Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Rowland Hill' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma masmorra com Cristo é um trono, e um trono sem Cristo é um inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Agradar a Cristo é viver uma vida em comunhão tão profunda com Ele que a nossa maneira de viver é caracterizada pela ansiedade de conhecer todos os Seus desejos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. Graham Scroggie' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em quarenta anos nunca passei quinze minutos acordado sem pensar em Jesus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'COMUNHÃO COM CRISTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você é um fracasso em sua vida de devoção, é um impostor em todas as outras coisas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus sente prazer em nós quando sentimos prazer nEle.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A comunhão com Deus é o princípio do céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Bates' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tenho mais a ver com Deus do que com o mundo todo; sim, mais relação com Ele em um dia do que com todo o mundo a vida toda.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Olhe para a Fonte; só o fato de olhar lhe dará sede.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Bonar' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem que vive perto de Deus vive em vão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Horatius Bonar' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Estar pouco com Deus é fazer pouco para Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'E. M. Bounds' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão pode ter uma comunhão tão preciosa com Deus quando seus olhos estão rasos dágua como quando seu coração está cheio de gozo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O acesso a Deus está aberto somente para seus verdadeiros adoradores.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Posso suportar a perda de todas as coisas, exceto do toque de Deus na minha vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Willard Cantelon' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Comunhão com Deus significa luta com o mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles E. Fuller' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora a alma piedosa sempre deseje mais de Deus, ela nunca deseja mais do que Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Esperar em Deus é viver uma vida desejosa de sua pessoa. É deleitar-se em Deus, depender dele e consagrar-se a ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um período de tempo diário adequado para esperar em Deus... é a única maneira pela qual posso escapar da tirania das coisas urgentes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles Hummel' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se gastarmos dezesseis horas por dia em contato com coisas desta vida e apenas cinco minutos por dia em contato com Deus, será de admirar que as coisas desta vida sejam para nós duzentas vezes mais reais do que Deus?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William R. Inge.' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Atualmente estou tão ocupado que não posso passar menos de quatro horas por dia na presença de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devo gastar as melhores horas do dia em comunhão com Deus. É a minha ocupação mais nobre e mais frutífera, e não deve ser colocada em segundo plano.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As grandes águias voam sozinhas; os grandes leões caçam sozinhos; as grandes almas andam sozinhas, sozinhas com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leonard Ravenhill' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem jamais disse no final de seus dias: "Li a Bíblia, pensei em Deus, orei e cuidei de minha alma demasiadamente!"' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não é suficiente ter comunhão com a verdade, pois esta é impessoal. Precisamos ter comunhão com o Deus da verdade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. G. T. Shedd' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O meu Deus e eu somos bons companheiros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A água não se perde quando é despejada no mar, pois ali ela está em seu próprio ambiente. O cristão não se perde quando se lança sobre seu Senhor, sobre seu Salvador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se formos fracos em nossa comunhão com Deus, seremos fracos em tudo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tirem tudo o que tenho, mas não tirem a doçura de andar e conversar com o Rei da glória! ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Stam' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não se curvou à nossa pressa nervosa, nem adotou os métodos de nossa era mecânica. O homem que deseja conhecer a Deus precisa dedicar-lhe tempo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Só absortos em Deus, podemos manter um entusiasmo espiritual perpétuo, porque só Deus pode suprir novidade perene.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nas maiores profundezas da vida, os homens não falam a respeito de Deus, mas falam com Ele mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Elton Trueblood' and ass.assunto = 'COMUNHÃO COM DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única diferença entre capitalismo e comunismo é que, no capitalismo, o homem explora o homem e, no comunismo, acontece o contrário.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Que importa se 90% da população da Rússia morrer, se os 10% sobreviventes se converterem à fé comunista?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lenin' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos precisam ser ateus. Nunca alcançaremos nosso alvo enquanto o mito de Deus não for removido dos pensamentos do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lenin' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O comunismo é inimigo de Deus. Ele ataca e nega aquele que criou o céu e a terra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Ben Loo' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nós nos opomos ao comunismo não por causa da política, mas principalmente por causa de nossa fé em Deus, em Cristo, em sua Palavra, a Bíblia, e em sua igreja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Ben Loo' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O comunismo é o mais recente substituto diabólico do conceito cristão de reino de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick H. Olert' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O comunismo rebaixa os homens, Cristo os eleva.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leonard Ravenhill' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O comunismo é o inimigo satânico do cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem já ouviu falar de um marxista que no leito de morte tenha pedido que lhe fosse lido O Capital?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Travis' and ass.assunto = 'COMUNISMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossos olhos, quando fitam objetos pecaminosos, estão fora de sua vocação e da guarda de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'CONCUPISCÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Será que a concupiscência é tão doce ou tão lucrativa que valha a pena alguém queimar no inferno por causa dela?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CONCUPISCÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Concupiscência é apetite desenfreado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. B. Meyer' and ass.assunto = 'CONCUPISCÊNCIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A confissão dos pecados não substitui o ato de abandoná-los.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A confissão de pecados coloca a alma debaixo da bênção de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Antes de Deus poder libertar-nos, precisamos desenganar a nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O fato de alguém reconhecer que é pecador não é maior convicção de pecado do que crer na verdade acerca de Jesus é fé salvadora.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os pecados ocultados pelo homem nunca são cancelados por Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Confessar pecados não é informar a Deus, é concordar com Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Derek Cleave' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Grande parte de nossa dignidade está em reconhecer nossa indignidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maneira de cobrir nosso pecado é descobri-lo pela confissão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CONFISSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento dirige a consciência; a consciência aperfeiçoa o conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ter consciência da própria ignorância é um grande passo na direção do conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ignorância é sua enfermidade; o conhecimento deve ser sua cura.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento que incha por fim murchará.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Caryl' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Conhecimento na cabeça é como dinheiro guardado; conhecimento no coração é como dinheiro bem usado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não se pode encontrar o conhecimento reorganizando-se a própria ignorância.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ronald Eyre' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ação é o fruto adequado do conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento não passa de tolice, a não ser que seja guiado pela graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Herbert' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento sem integridade é perigoso e terrível.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Johnson' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os pecados de omissão são agravados pelo conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De que adianta o conhecimento mais profundo se tivermos os corações mais superficiais? ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leonard Ravenhill' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira fé e o conhecimento salvador andam de mãos dadas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ter orgulho do que se sabe é demonstração da maior ignorância.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jeremy Taylor' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento são os olhos que devem dirigir os pés da obediência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muito do conhecimento de um homem pode ser uma tocha que ilumina seu caminho para o inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A morte do conhecimento não é a ignorância, mas a ignorância da ignorância.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alfred North Whitehead' and ass.assunto = 'CONHECIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A evidência de que se conhece a Deus é a obediência a Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Eric Alexander' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'No mundo há somente uma coisa digna de ser buscada: o conhecimento de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert H. Benson' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para muitas pessoas, Deus não passa de um vulto lá em cima.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento de Deus não pode ligar o homem a ele assim como ver o sol não pode levá-lo ao céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um pouco de conhecimento de Deus vale muito mais do que uma grande quantidade de conhecimentos sobre Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando você percebe que a principal razão pela qual está aqui é conhecer a Deus, a maioria dos problemas da vida cai no devido lugar espontaneamente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Pode-se conhecer muito sobre a divindade sem haver muito conhecimento de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento divino não deixa o homem estagnado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. Graham Scroggie' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O conhecimento divino não é como a luz da lua, sob a qual adormecemos, mas como a luz do sol, sob a qual trabalhamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'CONHECIMENTO DE DEUS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Consagração é resolução que não tem medo de sacrifício.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONSAGRAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O corpo tem dois olhos, mas a alma deve ter apenas um.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'CONSAGRAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para que a consciência seja dirigida pelo Espírito de Deus, ela precisa ser governada pela Palavra de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Mary S. Wood' and ass.assunto = 'CONSCIÊNCIA - e a Bíblia'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De Deus a consciência é representante, espião, tabelião e vice-rei.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é o pregador de Deus em nosso íntimo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A distinção entre as ações virtuosas e pecaminosas foi gravada pelo Senhor no coração de todos os homens.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se não houvesse Deus, a consciência seria inútil.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ainda que os homens dêem as costas para a revelação de Deus nas Escrituras, mesmo assim ele fixa a verdade dela em seus corações.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Green' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é aquela vela do Senhor que ainda não foi totalmente apagada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência tem algo de divino em si mesma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é o vigário de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é um espelho da santidade de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus S. Strong' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é a representante da deidade em um pequeno mundo, o homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é a espiã de Deus e a supervisora do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se não existisse Bíblia para nos dizer que existe um Deus, a consciência poderia fazê-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONSCIÊNCIA - e Deus'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é para a alma o que o estômago é para o corpo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma boa consciência é um travesseiro macio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência avisa-nos como amigo antes de castigar-nos como juiz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Consciência é o julgamento que o homem faz de si mesmo, de acordo com o julgamento de Deus a respeito dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tomás de Aquino' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma boa consciência é o palácio de Cristo, templo do Espírito Santo, paraíso do deleite, descanso permanente dos santos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma boa consciência é a inseparável auxiliar da fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De todas as experiências humanas, a mais universal é a má consciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Denney' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maioria de nós segue nossa consciência como segue um carrinho de mão, empurramo-la à nossa frente, na direção em que desejamos ir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Graham' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É melhor ter um cão que deseja nos dizer, por meio de seus latidos, que há um ladrão em nosso quintal, do que um que fique sentado e quieto, deixando-nos ser roubados antes que tenhamos qualquer idéia do perigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Consciência em paz não é nada mais do que um recibo assinado pela mão de Deus de que a dívida que tínhamos para com sua justiça está totalmente paga.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Consciência em paz não é nada mais do que o eco da misericórdia que perdoa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Feliz é o homem que não culpa a si mesmo em particular, não é condenado pelos outros em público nem por Deus nas duas situações.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Hall' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência é uma coisa viva, sujeita a crescimento e a desenvolvimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ole Hallesby' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se tivermos o cuidado de manter uma boa consciência, podemos deixar por conta de Deus o cuidado com nosso bom nome.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A voz da consciência jamais foi silenciada sem prejuízo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anna Jameson' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Limpe sua consciência, e sua fé estará fora de perigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Jenkyn' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma boa consciência é o melhor tesouro já possuído, o melhor prazer já experimentado, a melhor honra já conferida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A covardia pergunta: "Isto é seguro?" A conveniência pergunta: "É oportuno?" A vaidade pergunta: "É agradável a todos?" A consciência pergunta: "É correto?"' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Morley Punshon' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dinheiro adquirido desonestamente nunca vale o que custou, enquanto uma boa consciência nunca custa tanto quanto vale.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. P. Senn' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não podemos fazer nada bem feito sem alegria, e uma boa consciência é a base para a alegria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jamais confie em um homem que não age com consciência em tudo que faz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lawrence Sterne' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma bajulação pode curar uma consciência má, e nenhuma calúnia pode ferir uma boa consciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Conserve sua consciência sempre leve e sensível. Se um único pecado forçar a entrada nessa frágil porção da alma e ali fixar residência, estará pavimentada a estrada para mil iniqüidades.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Watts' and ass.assunto = 'CONSCIÊNCIA - Importância'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma consciência culpada é um inferno na terra e aponta para outro no além.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A consciência culpada não precisa de acusador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A negligência do dever nunca aliviará o sentimento de culpa na consciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O tortura de uma consciência má é o inferno de uma alma viva.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maior violação da consciência é o maior dos pecados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos os dilúvios de pecado jamais poderão extinguir o amor de Deus por seu povo; mas uma única gota de pecado na consciência do cristão extinguirá sua paz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Mason' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitos homens têm consciência suficiente para temer o pecado, mas não suficiente para salvá-los dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado causa tristes convulsões na consciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONSCIÊNCIA - e Pecado'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma consciência culpada é como um redemoinho, atraindo para si coisas que de outra sorte passariam reto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'CONSCIÊNCIA - Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma consciência má é como um mar turbulento, que só pode ser acalmado pelo sinal da cruz de Cristo. É um verme que rói os ossos, cuja remoção requer nada menos do que o sangue do Filho de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Friedrich Krummacher' and ass.assunto = 'CONSCIÊNCIA - Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma consciência inquietante conserva a memória terrivelmente alerta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. E. Sangster' and ass.assunto = 'CONSCIÊNCIA - Poder'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A mente satisfeita é uma festa contínua.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Que suas riquezas consistam não na abundância de suas posses, mas na pequena quantidade de seus desejos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia ensina a nos contentarmos com o que temos, mas nunca com o que somos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão é chamado para tornar imateriais suas posses materiais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A melhor riqueza é não desejar riquezas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A satisfação faz com que os pobres tornem-se ricos; a insatisfação faz com que os ricos tornem-se pobres.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamin Franklin' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O contentamento consiste não em acrescentar mais combustível, mas em diminuir o fogo; não em multiplicar a riqueza, mas em diminuir os desejos humanos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Fuller' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A pessoa santificada é a única satisfeita no mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que está sempre satisfeito, embora tenha tão pouco, é muito mais feliz do que aquele que está sempre a cobiçar mesmo tendo tanto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem mais rico é aquele que com menos se contenta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sócrates' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma eventualidade é má para quem está satisfeito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jeremy Taylor' and ass.assunto = 'CONTENTAMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus pode fazer maravilhas com um coração quebrantado, se você lhe entregar todos os pedaços.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Victor Alfsen' and ass.assunto = 'CONTRIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A tristeza espiritual é um dom de Deus. Não há mão, a não ser a divina, que possa tornar o coração leve e sensível diante da visão e da convicção do pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONTRIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O coração quebrantado é o único coração sadio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'CONTRIÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A dissolução é filha da dissensão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo não consegue florescer em tempos de luta e contenda entre os que o professam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jonathan Edwards' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A pior coisa que podemos acrescentar a uma controvérsia religiosa é a ira.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A divisão tem feito mais para esconder Cristo dos olhos dos homens do que toda a infidelidade já praticada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George MacDonald' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A vontade de discutir e o zelo em favor de uma opinião, mais do que úteis à fé, são características negativas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jamais vi o Espírito de Deus atuar onde o povo do Senhor está dividido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tenho mais a fazer do que ser um homem contencioso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Penry' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Facções sempre produzem divisões.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O diabo adora pescar em águas agitadas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mais temível do que a controvérsia é o espírito de controvérsia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Treffry' and ass.assunto = 'CONTROVÉRSIAS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A conversão é uma obra profunda, uma obra no coração. Ela invade o homem, a mente, os membros e toda a vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Alleine ' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado deforma; a escola informa; Cristo transforma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Lembro-me de que tudo parecia-me novo... os campos, o gado, as árvores. Eu era como um homem novo em um mundo novo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Billy Bray' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A conversão não é um processo suave e fácil como algumas pessoas imaginam; se assim fosse, o coração do homem jamais teria sido comparado a um solo não cultivado, e a Palavra de Deus, a um arado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Bunyan' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Regeneração é mudança espiritual; conversão é ação espiritual.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A conversão não é nada mais do que o primeiro passo na vida cristã. Enquanto vivermos teremos cada vez mais de dar as costas para tudo o que é mau, voltando-nos para tudo o que é bom.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tryon Edwards' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A reflexão é o primeiro passo em direção à conversão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sem conversão, não há salvação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Regeneração é um ato único, completo em si mesmo e jamais repetido; conversão, como início da vida santificada, é o começo de um processo constante, infindável e progressivo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. A. Hodge' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O grande poder de Deus na conversão de um pecador é a mais misteriosa de todas as suas obras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Hooker' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As conversões precisam ser examinadas tanto quanto enumeradas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Parker' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Descobri que não havia apenas me convertido, eu fora invadida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Eugenia Price.' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira conversão dá segurança à pessoa, mas não lhe confere o direito de parar de vigiar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira conversão dá força e santidade ao homem, mas nunca lhe permite vangloriar-se.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando a Palavra de Deus converte um homem, tira dele seu desespero, mas não seu arrependimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CONVERSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma lei universal da vida cristã é que, quanto mais maduro um homem se torna, mais sensível ao pecado ele fica.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'À medida que nosso coração é lavado, tornamo-nos mais sensíveis de sua contaminação restante, da mesma forma como ficamos mais perturbados com uma única mancha em um casaco novo do que com mil em um velho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Berridge' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem começa a ser bom enquanto não se considera mau.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quanto mais santo, maior a consciência de pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. B. Duncan' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo não é doce enquanto o pecado não se faz amargo para nós.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A convicção de pecado é a convicção de um estado pecaminoso... é a convicção de um relacionamento errado com Deus, de ter ficado completamente aquém do que o homem deveria ser.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Bryan Green' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando os homens começam a se queixar mais de seus pecados do que de suas aflições, começa a surgir alguma esperança para eles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não tenho outro nome, senão o de pecador; pecador é meu nome; pecador, meu sobrenome.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O reconhecimento do pecado é o começo da salvação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não pode ordenar que a convicção de pecado surja quando você quiser.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em sua essência, convicção de pecado é a percepção de que seu relacionamento com Deus está errado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Recordando as multiformes bênçãos de Deus, aquela que me parece ser mais digna de gratidão é a convicção de pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Friedrich Tholuck' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Enquanto o homem não passa por dificuldades com seu coração, provavelmente não sairá das dificuldades com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum homem pode sentir o pecado, a não ser pela graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CONVICÇÃO DE PECADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tenho mais medo de meu coração do que do papa e de todos seus cardeais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CORAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Somente Deus vê o coração e somente o coração vê a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'CORAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O coração é um triângulo que só a Trindade pode preencher.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CORAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A coragem é o medo que fez suas orações.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CORAGEM'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Coragem não é ausência de medo, mas domínio sobre ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CORAGEM'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A coragem é absolutamente necessária à bondade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Glover' and ass.assunto = 'CORAGEM'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não temo a tirania do homem nem o que o diabo possa inventar contra mim.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Knox' and ass.assunto = 'CORAGEM'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A coragem consiste não em arriscar sem medo, mas em estar decidido quanto a uma causa justa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Plutarco' and ass.assunto = 'CORAGEM'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O covarde é alguém que em emergências perigosas pensa com as pernas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ambrose Bierce' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há ocasiões em que o silêncio é ouro, mas há outros em que é pura covardia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cão late quando seu dono é atacado. Eu seria um covarde se visse a verdade divina ser atacada e continuasse em silêncio, sem dizer nada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas pessoas que têm os pés bem rápidos quando não há perigo, encolhem-se quando há.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Algumas pessoas evitam deliberadamente qualquer coisa que as leve ao encontro de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. B. Phillips' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não posso suportar a covardia. Recuso-me a fazer do meu Deus e Salvador uma ficção.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. T. Studd' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Servo covarde é aquele que se envergonha da farda de seu senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'COVARDIA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um escultor pode abandonar seu trabalho e voltar a ele em outro dia, retomando onde parou. Mas o mesmo não acontece com o crescimento da alma. A obra da graça em nós cresce ou declina, aumenta ou diminui.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Anderson' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O maior espaço do mundo é o espaço para o aperfeiçoamento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Andar em círculos não é a mesma coisa que obter progresso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão que deixa de se arrepender deixa de crescer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há enorme diferença entre atividade e progresso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na época apostólica tudo se expandia por toda parte. Nenhum prêmio era dado a anões, nenhum estímulo a eternos infantes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'E. M. Bounds' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O crescimento espiritual consiste mais no crescimento da raiz que está fora do alcance da visão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A religião de algumas pessoas faz-me lembrar de um cavalinho de balanço, que se movimenta, mas não avança.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Rowland Hill' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Feliz é a pessoa que avança diariamente e não considera o que fez ontem, mas, sim, que progresso pode obter hoje.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jerônimo' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão perfeito é aquele que, tendo consciência de seus próprios fracassos, está decidido a avançar para o alvo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ernest F. Kevan' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Estou convencido de que nada está florescendo em minha alma, a não ser que ela esteja crescendo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão que está progredindo deve cultivar o olhar firme de uma pessoa que está vivendo no futuro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Assim como a desesperança do pecador de receber qualquer ajuda de si mesmo é o primeiro requisito para uma conversão real, também a perda de toda confiança em si mesmo é o principal fator para o crescimento do crente na graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A santificação é sempre uma obra progressiva.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O crescimento não é produto do esforço, mas da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Recuse-se a estar dentro da média geral.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um bom cristão não é como o sol de Ezequias, que recuou, nem como o sol de Josué, que permaneceu imóvel, mas como aquele que está sempre avançando em santidade e elevando-se no crescimento de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É melhor crescer em graça do que em dons.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A maneira correta de crescer é crescer menos aos seus próprios olhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando paramos de crescer, paramos de viver e passamos meramente a existir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Warren Wiersbe' and ass.assunto = 'CRESCIMENTO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os Himalaias são as letras em relevo sobre as quais nós, filhos cegos, passamos nossos dedos para pronunciar o nome de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. H. Barrows' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A razão simples, solitária, sublime, que a Bíblia atribui a cada coisa em toda a criação é que ela veio à existência pela vontade de Deus, porque Ele decidiu que deveria existir. Para o incrédulo, nenhuma explicação mais profunda é possível; para o crente, nenhuma é necessária.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não é um imitador, o diabo o é, pois não pode ser outra coisa; todas as coisas que Deus faz são originais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Caiger' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A probabilidade de a vida ter surgido por acidente é comparável à probabilidade de um dicionário completo ser resultado da explosão em uma indústria gráfica.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Edwin Conklin' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o universo pudesse ter criado a si mesmo, incorporaria os poderes de um criador, e seríamos forçados a concluir que o universo propriamente dito é um deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Davis' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tudo o que tenho visto ensina-me a confiar no Criador quanto a tudo o que não vejo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph Waldo Emerson' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cada obra de Deus serve para mostrar Sua glória e realçar a grandeza de Sua majestade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Gill' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nenhuma teoria sobre o universo que não necessite de um deus para fazê-lo funcionar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Clerk Maxwell' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O argumento da organização é irresistível. A natureza realmente dá testemunho de seu Criador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Stuart Mill' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém pode alegar que é ignorante da existência de Deus. Pode-se ver claramente que existe algo Invisível.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stuart Olyott' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A posteridade algum dia rirá da loucura do materialismo filosófico moderno. Quanto mais estudo a natureza, mais fico assombrado com o Criador.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Louis Pasteur' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cada uma das obras de Deus é grandiosa à sua maneira. Todos os anjos e todos os homens unidos não poderiam criar um gafanhoto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A suprema justificação para toda a criação é que Deus desejou sua existência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hans Rookmaaker' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para que o universo tivesse sido formado por uma confluência fortuita de átomos, eu deveria acreditar que qualquer confusão acidental do alfabeto geraria o mais engenhoso tratado de filosofia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jonathan Swift' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que pode ser mais insensato do que imaginar que toda esta excelente estrutura dos céus e da terra surgiram por acaso, quando toda a habilidade da arte não é capaz de construir uma ostra?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jeremy Taylor' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A criação é tanto um monumento ao poder de Deus quanto um espelho através do qual podemos ver sua sabedoria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Criar requer poder infinito. O mundo todo não pode criar uma mosca.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRIAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão é um homem possuído.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As ovelhas de Cristo são marcadas na orelha e no pé; elas ouvem a sua voz e o seguem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os melhores cristãos que existem entre nós são apenas cristãos em formação. De forma alguma são produtos acabados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão é chamado para viver uma vida sobrenatural, e a ele foi dado o poder para viver essa vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald Grey Barnhouse' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão não é alguém que teve um novo começo em sua vida, mas aquele que recebeu uma vida nova para começar com ela.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum verdadeiro cristão pertence a si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Entramos na família cristã por vocação e somos identificados nela por meio do caráter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Herbert W. Cragg' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você fosse preso por ser cristão, haveria provas suficientes para condená-lo? ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David Otis Fuller' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você é cristão, não é um cidadão deste mundo tentando chegar ao céu; mas, sim, um cidadão do céu abrindo caminho através deste mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Considero cristão de fato aquele que não se envergonha do evangelho nem é uma vergonha para ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristãos são feitos; não nascem prontos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jerônimo' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um Cristo que não esteja em nós é um Cristo que não é nosso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Law' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há um fato único que se pode colocar contra toda a perspicácia e argumentos dos incrédulos, a saber, que nenhum homem jamais se arrependeu de ser cristão em seu leito de morte.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hannah More' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um santo não é meramente um seguidor professo de Cristo, mas um seguidor professo conhecido pelo que professa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Handley C. G. Moule' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada perdem os que ganham a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão é uma pessoa estranha. Ele está tanto morto como vivo, é miserável e glorioso... Dirige-se para baixo e para cima ao mesmo tempo; pois, à medida que ele morre em pecado e miséria, e a morte natural aproxima-se, vive a vida da graça e cresce cada vez mais até alcançar a glória.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para um homem que vive para Deus nada é secular, tudo é sagrado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristão foi transplantado para um novo solo e um novo clima; tanto o solo como o clima são Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James S. Stewart' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Num sentido os santos do Senhor são um povo à parte, pertencendo-se mutuamente de um modo em que não pertencem a ninguém mais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os cristãos são retratos ambulantes de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'CRISTÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se seu cristianismo é confortável, está comprometido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não existe cristianismo fácil. Se é fácil, não é cristianismo; se é cristianismo, não é fácil.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O ideal cristão não foi testado e reprovado. Ele foi considerado difícil e por isso permaneceu sem ser experimentado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. K. Chesterton' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não existe cristianismo, se este não for praticado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. De Witt' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A temperatura adequada do cristianismo é a de ferro em brasa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander Duff' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é a fé para homens preparados para nadar contra a correnteza, é a religião dos radicais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Green' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo não é verdadeiro por causa de seus resultados. Ele dá resultado porque é verdadeiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Os Guinness' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo autêntico não é sofisticado, é na verdade simples.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. T. Kendall' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo começa com a doutrina do pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Søren Kierkegaard' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Vida cristã não é lutar por uma posição, mas a partir de uma posição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul O. Kroon' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo, se for falso, não tem valor; se for verdadeiro, tem valor infinito. A única coisa que lhe é impossível é ser "mais ou menos" importante.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nosso alvo deve ser um cristianismo que, como a seiva de uma árvore, corra por todo o tronco e folhas de nosso caráter, santificando tudo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem não entende a palavra "justificado" não entende o cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo não é meramente um programa de conduta; é o poder de uma nova vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamim B. Warfield' and ass.assunto = 'CRISTIANISMO - Características'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristianismo é obediência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é o caminho da cruz... teu sangue e suor possivelmente irão misturar-se aos de Cristo antes que tua vida termine.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lionel Fletcher' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo mais cristão é igual a cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey King' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristianismo é santidade universal em todas as partes da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Law' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, '"Crucificado" é o único adjetivo definido pelo qual se descreve a vida cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Furman Miller' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é uma religião a respeito de uma cruz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leon Morris' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristianismo é o poder de Deus na alma do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert B. Munger' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo não é um sistema de doutrina, mas um formador de novas criaturas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Newton' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é muito maior do que a doutrina cristã... a teologia jamais poderá tomar o lugar da fé.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Theodore Robinson' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristianismo é a entrega total de tudo o que conheço de mim a tudo o que conheço de Jesus Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Temple' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo pode ser reduzido a quatro ações: admitir, submeter-se, dedicar-se e transmitir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Wilberforce' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo não é meramente uma apólice de seguro para levar-nos ao céu; é o dobrar dos joelhos diante do senhorio de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick P. Wood' and ass.assunto = 'CRISTIANISMO - Definição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A diferença entre o cristianismo e todos os outros sistemas religiosos consiste principalmente nisto: em todas essas religiões vê-se o homem procurando a Deus, enquanto no cristianismo temos Deus procurando o homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Arnold' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Verificando outras correntes de fé, você encontrará grande quantidade de coisas verdadeiras e dignas, morais e boas, bem como muita coisa negativa. Mas você não encontrará nada que seja bom e verdadeiro que não possa ser encontrado em Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Michael Green' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É suficientemente claro que, se considerado com justiça em suas próprias premissas, o cristianismo exclui das outras religiões a verdade plena e a validade final.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Os Guinness' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as outras religiões são indiretas: o fundador fica de lado e apresenta outro orador... o cristianismo é a única que possui um discurso direto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Søren Kierkegaard' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca poderemos falar do fracasso do cristianismo. É impossível que ele fracasse. O que fracassa é a falsificação esfarrapada da coisa verdadeira, que nos dispomos a suportar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Geoffrey King' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é essencialmente a religião da ressurreição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James S. Stewart' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo... é a revelação de Deus, não o exame crítico do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James S. Stewart' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De fato, o cristianismo é velho, cada vez mais velho, ano após ano. No entanto, ele é também novo, cada vez mais novo, manhã após manhã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cristianismo é a única religião revelada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamim B. Warfield' and ass.assunto = 'CRISTIANISMO - Singularidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Apagar a estrela dos outros não faz a sua brilhar mais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca aponte o dedo para as falhas dos outros a não ser que ele faça parte da mão que irá ampará-los.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O melhor lugar para criticar o próximo é na frente do seu espelho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O crítico que começa consigo mesmo não terá tempo para criticar os outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nós, cristãos, jamais pensaríamos em atropelar intencionalmente outras pessoas com nosso carro; então, por que o faríamos com nossas palavras?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Doug Barnett' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Lembre-se de que sempre que você atira barro em alguém, está perdendo terreno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que parece muito preocupado com a degradação dos outros está normalmente preocupado com a promoção de si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É muito mais fácil ser crítico do que ser correto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamim Disraeli' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Limpe seus dedos antes de apontar para minhas manchas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Benjamim Franklin' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém é tão crítico das pequenas falhas quanto os culpados das grandes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Glover' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se não estivermos dispostos a ajudar uma pessoa a vencer suas falhas, há pouco valor em apontá-las.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert J. Hastings' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Duas coisas fazem muito mal ao coração: subir correndo escadas e criticar pessoas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. A. Joyce' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem que está muito ocupado em censurar os outros está sempre pouco ocupado em examinar a si próprio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Lye' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A crítica é a afirmação do sentimento de superioridade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry E. Manning' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A censura é um pecado agradável, extremamente complacente com nossa natureza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Manton' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Preferiria brincar com relâmpagos ou segurar em fios de alta tensão com sua corrente faiscante a pronunciar uma palavra precipitada contra qualquer servo de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. B. Simpson' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Apedrejar profetas é um trabalho inútil.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Harold St. John' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desejo de desgraçar os outros jamais teve origem na graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há maneira mais rápida de um homem fazer com que suas palavras sejam questionadas do que tentar diminuir o valor dos outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Tillotson' and ass.assunto = 'CRÍTICAS - Feitas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se os homens falarem mal de você, viva de forma que ninguém creia neles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não é só justo como também dever do cristão evitar ofender-se tanto quanto evitar ofender.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo ' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca tenha medo de testar a si mesmo com suas próprias palavras críticas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Preferiria que mestres verdadeiros e fiéis me repreendessem e me condenassem, e até mesmo reprovassem meus caminhos, a que hipócritas me bajulassem e me aplaudissem como santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando os outros nos chutam, algumas vezes isso é sinal de que estamos à frente deles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Percy Ray' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se vocês não fossem estranhos aqui, os cães do mundo não latiriam para vocês.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ficar irritado com as críticas é reconhecer que elas foram merecidas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tácito' and ass.assunto = 'CRÍTICAS - Recebidas'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz é o preço do meu perdão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz de Cristo sempre será ofensiva para o homem natural.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Justo sobre a cruz é o único ponto de contato entre o pecador e o poder salvador de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Lewis Sperry Chafer' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Livre para atrair por seu poder intrínseco, a cruz continua sendo o ímã das almas dos homens.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Kenneth Cragg' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O elemento surpreendente da cruz não é o sangue, mas o sangue de quem e com que propósito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald English' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz é o centro da história do mundo. A encarnação de Cristo e a crucificação de nosso Senhor são o centro ao redor do qual circulam todos os eventos de todos os tempos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander MacLaren' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem na verdade contemplou a cruz de Cristo não pode jamais falar de casos sem esperança.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. Campbell Morgan' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O poder salvador da cruz não depende de um acréscimo de fé; trata-se de um poder salvador tão grande que a própria fé flui dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Este acontecimento único da cruz de Cristo é uma revelação final tanto do caráter e da conseqüência do pecado humano quanto da maravilha e do sacrifício do amor divino.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alan Stibbs' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A cruz de Cristo é a coisa mais revolucionária que já apareceu entre os homens.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Calvário mostra como os homens podem ir longe no pecado, e como Deus pode ir longe para salvá-los.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'H. C. Trumbull' and ass.assunto = 'CRUZ'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A culpa é o próprio cerne da tristeza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Horace Bushnell' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem cai de acordo com as disposições da providência de Deus, mas cai também por suas próprias faltas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pavor de Deus é efeito da culpa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A culpa é para o perigo o que o fogo é para a pólvora.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada é mais pessoal do que a culpa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald MacLeod' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A culpa relaciona-se com o pecado da mesma forma como o lugar queimado relaciona-se com a labareda.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É o sentimento de culpa que nos faz ter vergonha de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A culpa está universalmente presente na alma humana, e não podemos tratar dela sem tratar das interrogações religiosas que ela levanta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul Tournier' and ass.assunto = 'CULPA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você não dá alguma coisa que Deus quer que você dê, você não a possui; ela o possui.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devemos contribuir de acordo com nossa renda, para que Deus não faça com que nossa renda torne-se proporcional ao que damos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dê a todos, para que a pessoa a quem você não der não venha a ser o próprio Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que nos torna ricos neste mundo não é o que tomamos, mas sim o que damos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Ward Beecher' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seu dinheiro pode fazer de você um missionário no estrangeiro sem que jamais deixe sua cidade, um evangelista sem nunca subir a um palanque, um pregador-radialista sem nunca ter entrado em um estúdio, um mestre da Bíblia sem nunca ter escrito um livro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É possível dar sem amor, mas é impossível amar sem dar' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Braunstein' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De quantas maldições e humilhações ficaríamos livres se o povo de Deus contribuísse conforme as Escrituras orientam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Estou convencido de que não há assunto sobre o qual a consciência cristã esteja mais mal-informada do que o da contribuição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que gastamos em piedade e caridade não é tributo pago a um tirano, mas resposta de gratidão a nosso Redentor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'James Denney' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Trabalhe arduamente, consuma pouco, dê muito, e tudo a Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anthony Norris Groves' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ganhamos a vida pelo que recebemos. Vivemos a vida pelo que damos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Duane Hulse' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dá duas vezes aquele que dá rapidamente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Publius Mimus' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se queremos que Deus abra seu tesouro, precisamos abrir o nosso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas V. Moore' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nós perguntamos quanto o homem dá; Cristo pergunta quanto ele retém.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Murray' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não darei valor às orações, ainda que intensas e freqüentes, de quem não dá esmolas de acordo com sua capacidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando damos a Deus tudo o que temos e somos, entregamos-lhe simplesmente o que lhe pertence.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há três espécies de contribuição: com ressentimento, por dever e com ações de graça. A contribuição com ressentimento diz: "Tenho de fazê-lo"; a contribuição por dever diz: "Devo fazê-lo"; a contribuição com ações de graças diz: "Quero fazê-lo".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Rodenmayer' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A graça não torna a contribuição algo opcional.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles Caldwell Ryrie' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única maneira de termos mais do que o suficiente para poupar é dar a Deus mais do que conseguimos poupar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Oswald J. Smith' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitos homens ficam de mãos vazias porque não conhecem a arte de repartir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se eu deixar mais de dez libras, vocês e toda a humanidade serão testemunhas de que vivi e morri como ladrão e bandido.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'DAR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Subimos ao céu escalando as ruínas de nossos planos mais queridos, descobrindo que nossos fracassos foram sucessos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. B. Alcott' and ass.assunto = 'DECEPÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há decepções para aqueles cujos desejos estão sepultados na vontade de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick W. Faber' and ass.assunto = 'DECEPÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'À luz da eternidade, veremos que aquilo que desejávamos teria sido fatal para nós e o que evitávamos era essencial a nosso bem-estar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'DECEPÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há muitas coisas que o mundo chama de decepção, mas não existe tal palavra no dicionário da fé. O que para os outros são decepções, para os crentes são indicações do caminho de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Newton' and ass.assunto = 'DECEPÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Muitas vezes as decepções são o sal da vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Theodore Parker' and ass.assunto = 'DECEPÇÕES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A grandeza do poder de um homem é a medida de sua capacidade de rendição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Booth' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Hoje estive diante de Deus e entreguei-lhe tudo o que tenho e o que sou, de forma que já não pertenço a mim mesmo de modo nenhum. Eu me entreguei completamente a Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jonathan Edwards' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não darei nenhum valor a qualquer coisa que eu tenha ou venha a possuir, a não ser que tenham valor para o reino de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David Livingstone' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Antes de podermos orar: "Venha o Teu reino", precisamos estar dispostos a orar: "Que o meu reino se vá".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alan Redpath' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristianismo é a dedicação total de tudo o que conheço a meu respeito a tudo o que conheço a respeito de Jesus Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Temple' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se todo o reino da natureza fosse meu, Seria mui pequena oferta dá-lo a Deus; Oh! Que amor maravilhoso, que amor tão divinal! Desejo dar minha alma, minha vida, meu ser total! ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Watts' and ass.assunto = 'DEDICAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Visto que o homem é depravado, ele não fará perguntas de valor eternal enquanto não for acordado de sua ilusão temporal.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Por ocasião da queda, os dons naturais do homem foram corrompidos pelo pecado, enquanto seus dons sobrenaturais perderam-se completamente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A pessoa não convertida está deliberadamente fora de rumo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nascemos em pecado e passamos a vida lutando contra suas conseqüências.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Existe a semente de todos os pecados, dos pecados mais vis e piores, no melhor dos homens.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem está naturalmente disposto a coroar qualquer coisa, menos Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossos corações corrompidos são oficinas do diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Browne' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devemos nossa criação a Deus, e nossa corrupção a nós mesmos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando olho para meu coração e enxergo minha iniqüidade, ele parece um abismo infinitamente mais profundo do que o próprio inferno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jonathan Edwards' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando nos conhecemos melhor, descobrimos que somos mais depravados do que pensávamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem não está evoluindo na direção do conhecimento de Deus. Ele foi criado com o conhecimento de Deus e desde então tem caminhado na direção oposta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Vance Havner' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A graça não corre no sangue, mas a corrupção sim. Pecador gera pecador, mas santo não gera santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem nasceu e vive em pecado; ele não pode fazer nada em favor de si mesmo, pois só é capaz de prejudicar-se a si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Søren Kierkegaard' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se ficasse por conta dos pecadores, totalmente depravados como são, a iniciativa de reagir com fé ao evangelho, por sua própria vontade, nenhum deles tomaria essa iniciativa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tão grande é a depravação do homem não-regenerado que, embora não haja nada que ele necessite mais do que o evangelho, não há nada que ele deseje menos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O pecado original está em nós como a barba. Barbeamo-nos hoje, parecemos apresentáveis e nosso rosto está limpo; amanhã nossa barba cresce de novo, e não pára de crescer enquanto permanecemos na terra. De maneira semelhante, o pecado original não pode ser extirpado de nós; ele brotará em nós enquanto vivermos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Depravação total significa... que a conversão está além da capacidade do homem natural.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald MacLeod' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nascemos iníquos; cada um tende a agradar a si mesmo, e a tendência de agradar ao eu é o início de toda a desordem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Blaise Pascal' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os mais profundos problemas do homem estão dentro dele mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Clark Pinnock' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus não fosse onisciente, o coração humano iria enganá-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É em nosso coração que está o mal, e é de lá que ele precisa ser arrancado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Bertrand Russell ' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jamais houve mãe que tivesse ensinado seu filho a ser um incrédulo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry W. Shaw' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ai de nós! Nosso coração é nosso maior inimigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem é um vilão infame. É corrupto por natureza e posteriormente pela prática.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A depravação é o grande obstáculo à fé, mas... a graça é a maneira pela qual Deus supera esse obstáculo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Malcolm Watts' and ass.assunto = 'DEPRAVAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossos sentimentos de depressão e desespero contam mais a nosso respeito do que a respeito de como as coisas realmente são.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEPRESSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os principais perigos para a mente do cristão são a depressão e o desânimo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'DEPRESSÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O sábio não deseja mais do que pode conseguir de maneira justa, usar de modo sóbrio, distribuir com alegria e abandonar com contentamento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DESEJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Freqüentemente desejamos muito mais aquilo que não devemos ter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DESEJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A vida do cristão é um estado de desejo santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jerônimo' and ass.assunto = 'DESEJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A inclinação constante do coração dos crentes é para o bem, para Deus, para a santidade, para a obediência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Owen' and ass.assunto = 'DESEJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se todos os nossos desejos fossem satisfeitos, a maioria dos nossos prazeres seria destruída.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Whateley' and ass.assunto = 'DESEJOS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desespero é a esperança totalmente morta; a presunção é a esperança totalmente louca.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desespero é uma obra-prima de Satanás; leva os homens diretamente para o inferno, assim como os demônios precipitaram a manada de porcos no abismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desespero é o desânimo do inferno, assim como a alegria é a serenidade do céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Donne' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que se desespera avilta a Divindade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Owen Feltham' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca desesperarei, pois tenho um Deus; nunca agirei presunçosamente, pois não passo de um homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Owen Feltham' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você pode desesperar de si mesmo o quanto quiser, mas nunca de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não desespera de você; portanto, você não deve desesperar de si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. C. Grafton' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Desespero e desânimo andam de mãos dadas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É impossível que entre em desespero o homem que lembra que seu Ajudador é onipotente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Jeremy Taylor' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Desespero é a obra-prima de Satanás.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O desespero destrói a capacidade de fazer empreendimentos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca desesperaremos enquanto tivermos Cristo como nosso líder!' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Whitefield ' and ass.assunto = 'DESESPERO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma das características da rebelião espiritual é trilhar caminhos escusos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ian Barclay' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada ofende mais a Deus do que a fraude nas relações pessoais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que é mal ganho nunca servirá bem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma iniqüidade da terra é mais comum do que o engano em suas várias formas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O afastamento da verdade testifica que primeiro a pessoa despreza a Deus e depois teme ao homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Plutarco' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se não houvesse leis contra o roubo, muitos de nós seriam ladrões.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Bertrand Russell' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda vez que o cristão sonega seu imposto de renda perverte e obscurece o evangelho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Sanderson' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Oh! que teia emaranhada estamos a preparar, Quando o terrível engano começamos a praticar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Walter Scott' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A morte honesta é melhor do que uma vida desonesta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sócrates' and ass.assunto = 'DESONESTIDADE'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não é a teologia que faz de um homem de valor aquilo que ele é, mas sim, a "trabalhologia".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leslie Carter' and ass.assunto = 'DETERMINAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cristo não deseja pessoas que se contentam com o possível, mas que agarram o impossível.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. T. Studd' and ass.assunto = 'DETERMINAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus não é uma bondade natural permissiva como muitos imaginam e por isso o arrastam na lama; é rigidamente justiça e por esse motivo Cristo morreu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald Grey Barnhouse' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossos grandes problemas são pequenos para o infinito poder de Deus, mas nossos pequenos problemas são grandes para seu amor de Pai.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald Grey Barnhouse' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus amou-nos quando não havia nada de bom para ser visto em nós, e nada de bom para ser dito por nós.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus ama a cada um dos seus como se houvesse apenas um deles para amar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus gosta mais de sorrir para seu povo justamente quando o mundo mais o desaprova.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A única base do amor de Deus é seu próprio amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus não amasse, não seria santo; se não fosse santo, não seria amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Newton Clarke ' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus, em seu amor, escolheu as pessoas... Cristo não morreu apenas por algumas propostas, mas por pessoas... Ele amou a nós, não ao que é nosso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Goodwin' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Como é bom o Deus que adoramos, Nosso Amigo fiel, imutável! Seu amor é tão grande quanto seu poder, Não tem medida, é infindável! ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Hart' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus é sempre sobrenatural, sempre um milagre, sempre a última coisa que poderíamos merecer. ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Horn' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não nos fez porque pretendia ganhar algo com isso, mas simplesmente por amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'T. G. Jalland' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nenhum náufrago perdido no mais profundo mar de iniqüidade que o profundo amor de Deus não possa alcançar e remir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Henry Jowett' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor divino, ao contrário do amor humano, não depende de seu objeto.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em vez de procurar falhas em Deus por causa de sua maneira totalmente justa de tratar certos pecadores que merecem o inferno, adoremo-lo por seu amor eterno, gracioso e salvador por outros justos que da mesma forma merecem a condenação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é amor, e a lei é a maneira pela qual ele nos ama. No entanto, também é verdade que Deus é lei, e o amor é a maneira pela qual ele nos governa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. S. Lee' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus não é conseguido porque somos dignos de amor, mas jorra como de um poço artesiano, das profundezas de sua natureza.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Alexander MacLaren' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Amor eterno significa que os remidos jamais serão objetos do ódio divino, mas não significa que nunca serão objetos da ira divina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald MacLeod' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Entendo que Deus tenha piedade do mundo, porque, quando ando por um hospital e vejo uma criança doente, tenho pena... mas o fato de Deus ter amado o mundo, quanto mais penso nisso, mais extasiado fico.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. B. Meyer' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É o amor de Deus que faz com que ele seja inimigo declarado do pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. Campbell Morgan' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus não mede ninguém pelo que é visível.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick Sampson' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, '"Deus amou tanto que deu..."! E a doação, tendo no centro o Calvário, não foi uma gota, mas uma torrente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul S. Rees' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus deixa depressa sua ira, mas nunca se arrepende do seu amor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há mudanças no amor de Jeová, embora possa haver mudanças na maneira em que ele é manifestado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É o amor de Deus que, invisível exteriormente, supre nossa vida interiormente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Charles Stern' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus escolheu-nos para seu amor e agora nos ama por causa de sua escolha.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A tua providência é grande e amável, Homens e animais recebem teu cuidar; Por toda a criação tu és o responsável, Mas os santos são teu interesse peculiar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Watts' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nunca se descuidou da condição dos perdidos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Zimmerman' and ass.assunto = 'DEUS - Amor'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus dá não apenas generosamente, mas genuinamente, não apenas com a mão aberta, mas com o coração cheio.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Bondade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nunca deixa de ser generoso, mesmo quando deixamos de ser gratos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Bondade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se eu pudesse escrever como gostaria a respeito da bondade de Deus para comigo, a tinta ferveria em minha caneta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frances Ridley Havergal' and ass.assunto = 'DEUS - Bondade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é justo, bom e solvente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Bondade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A bondade de Deus é a raiz de toda bondade; e a nossa bondade, se é que temos alguma, origina-se na bondade dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Tyndale' and ass.assunto = 'DEUS - Bondade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nunca se faz de filósofo diante de uma lavadeira.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'DEUS - Condescendência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Em nenhuma outra ocasião a condescendência de Deus se revela mais do que no ouvir das orações.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Austin Phelps' and ass.assunto = 'DEUS - Condescendência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A condescendência de Deus é igual à sua majestade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Scott' and ass.assunto = 'DEUS - Condescendência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pode morrer nem mentir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Eternidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é sua própria eternidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Eternidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A eternidade de Deus não é outra coisa senão a duração de Deus, e a duração de Deus não é outra coisa senão sua existência permanente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Eternidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há mistério maior do que a eternidade de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Eternidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não cabe a nós estabelecer um horário para o Criador do tempo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'DEUS - Eternidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é a melhor prova de si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que deixa Deus fora de seu raciocínio não sabe raciocinar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhuma palavra da Bíblia procura explicar Deus; Ele é tido como certo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A existência de Deus é o alicerce de toda a religião.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Eu poderia provar Deus estatisticamente. Considere tão-somente o corpo humano, a probabilidade de que todas as funções do organismo ocorram por si mesmas é um absurdo em estatística.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Gallup' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A existência de Deus não pode ser provada; mas, além disso, tal prova não deve ser tentada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Os Guinness' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não deve ser provado, mas proclamado; não discutido, mas aceito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Horn' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma das grandes necessidades atuais é uma profunda convicção de que Deus é.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. Holloway Main' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus não existisse, seria necessário inventá-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Voltaire' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Enquanto não encontra Deus, o homem começa sem princípio e acaba sem fim.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'H. G. Wells' and ass.assunto = 'DEUS - Existência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seria melhor alguém dizer que Deus não existe do que dizer que ele é infiel.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é sempre igual a si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Que consideração mais convincente deve ser levada em conta, para que nos tornemos fiéis a Deus, do que a fidelidade e a veracidade de Deus para conosco?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora os homens sejam falsos, Deus é fiel.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que Deus é para um santo é para todos os outros.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você nunca poderá entender a fidelidade de Deus se possuir uma visão míope dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Paul S. Rees' and ass.assunto = 'DEUS - Fidelidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Da mesma forma como não pode existir nenhum lugar sem Deus, nenhum lugar pode abranger e conter a Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A idéia mais perfeita de Deus que podemos formar nesta vida é de uma Causa Primeira independente, peculiar, infinita, eterna, onipotente, imutável, inteligente e livre, cujo poder estende-se sobre todas as coisas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'E. B. De Condillac' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A presença do Senhor é infinita; seu brilho, insuportável; sua majestade, terrível; seu domínio, ilimitado; sua soberania, incontestável.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é tão incomparável quanto imutável. Ele é infinitamente superior ao mais importante arcanjo, assim como esse arcanjo é superior a um verme.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que é a glória de Deus? É a manifestação de qualquer dos seus atributos. Em outras palavras, é a manifestação de Deus ao mundo. Assim, as coisas que glorificam a Deus são coisas que mostram as características de seu ser para o mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles Caldwell Ryrie' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nada pequeno em Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A criação nada pode acrescentar à riqueza ou à dignidade essenciais de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'DEUS - Glória'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A imutabilidade dos propósitos divinos é uma conseqüência necessária da imutabilidade da natureza de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Johann Keil' and ass.assunto = 'DEUS - Imutabilidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pode mudar para melhor, pois é perfeito; e, sendo perfeito, não pode mudar para pior.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'DEUS - Imutabilidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para Deus, a única diferença entre o futuro e o passado é que certas verdades tão eternas como o próprio Deus ainda não se tornaram parte da história humana.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'W. Ian Thomas' and ass.assunto = 'DEUS - Imutabilidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as razões de Deus provêm do interior de seu ser não-criado. Nada, desde a eternidade, entrou no ser de Deus, nada foi removido e nada mudou.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'DEUS - Imutabilidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma vez que Deus é auto-existente, Ele não é composto. Não há nele partes que devam ser alteradas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'DEUS - Imutabilidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não necessita de nada, mas todas as coisas necessitam de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Marcianus Aristides' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mesmo que Deus tivesse necessidades, nós não poderíamos supri-las, pois possuímos só o que Ele primeiro nos deu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Horn' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é a causa das causas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Christopher Nesse' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ele é aquele que está acima de tudo e em tudo, contudo é distinto de tudo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. D. B. Pepper' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é; se Ele não fosse, coisa alguma poderia ser.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é a causa de todas as causas, a alma de todas as almas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'DEUS - Independência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é mais verdadeiramente imaginado do que expresso, e existe mais verdadeiramente do que é imaginado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O máximo que conhecemos de Deus é nada em relação ao que Ele é.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tomás de Aquino' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem pode encontrar Deus, mas nunca sondá-lo inteiramente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não é verdadeiramente espiritual o cristão que não se alegra tanto em sua ignorância de Deus quanto em seu conhecimento sobre Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há em Deus infinitamente mais do que as línguas de homens e anjos podem expressar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus conhece o caminho por onde você anda; mas você não conhece o dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Elisabeth Elliot' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Devemos crer que Deus é grande sem medida, eterno sem tempo, e que contém todas as coisas sem limite; e quando os nossos pensamentos chegarem ao ápice, paremos, maravilhemo-nos e adoremo-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Hall' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Sempre que Deus está em ação, acontece o inexplicável.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph P. Martin' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca podemos imaginar que a existência do amor e da ira na mesma natureza seja sinal de uma personalidade dividida, visto que apenas a evidência de que Deus é maior do que nossa lógica finita pode explicar isso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não podemos julgar o Senhor segundo regras que aplicamos aos homens ou mesmo a anjos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um Deus compreendido não é absolutamente Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Gerhard Tersteegen' and ass.assunto = 'DEUS - Inescrutabilidade'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se o pecado é a contradição do homem em relação a Deus e à sua vontade expressa, Deus não pode ser complacente com o pecado e continuar sendo Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Saphir P. Athyal' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A realidade da ira de Deus faz parte da mensagem bíblica tanto quanto sua graça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Leighton Ford' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Através de qualquer porta por onde o pecado tente entrar, ali a ira de Deus nos encontra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Assim como as misericórdias de Deus se renovam a cada manhã para com seu povo, também sua ira se renova todas as manhãs contra os ímpios.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Assim como o pecado pertence a pessoas, a ira sobrevém àquelas que praticam o pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Murray' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A ira de Deus é sua justiça reagindo contra a injustiça.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ira... é a expressão do desagrado santo e amoroso de Deus para com o pecado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Arthur Skevington Wood' and ass.assunto = 'DEUS - Ira'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O nome de Deus é seu caráter revelado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Nome'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O nome de Deus é o próprio Deus em sua santidade revelada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. J. Delitzsch' and ass.assunto = 'DEUS - Nome'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As exigências do homem não esgotam os recursos de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus pode fazer mais em um momento do que o homem em um milênio. Se Deus é contra nós, quem será por nós?' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A água é mais forte do que a terra, o fogo mais forte do que a água, os anjos mais fortes do que os homens, e Deus mais forte do que todos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um com Deus é maioria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Carey' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O poder de Deus é a melhor guarda, a escolta mais segura e o castelo mais inabalável que qualquer pessoa pode ter.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gouge' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um Todo-Poderoso é mais do que todos os poderosos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pode ser abalado pela incompetência do homem nem pela inimizade de Satanás.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Watchman Nee' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você nunca precisará mais do que Deus pode suprir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nossa teologia jamais estará correta enquanto em nossos corações não investirmos Deus de infinito poder e perfeição.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Minha fé não tem leito em que possa dormir, a não ser na onipotência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Rutherford' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A glória da Onipotência é atuar mediante improbabilidades.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus tem todo o poder coerente com a perfeição infinita.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'DEUS - Onipotência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'De qualquer ponto da terra estamos igualmente perto do céu e do infinito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henri Amiel' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é um círculo infinito cujo centro está em toda parte e cuja circunferência não está em lugar nenhum.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Embora o céu seja o palácio de Deus, não é sua prisão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus não estiver em todas os lugares, ele não é Deus verdadeiro em lugar algum.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Newton Clarke' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há um Deus na ciência, um Deus na história e um Deus na consciência, e esses três são um.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Cook' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Esta é a coisa fundamental, a mais séria de todas: que estamos sempre na presença de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem pode esconder Deus de si próprio, mas não pode esconder a si próprio de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Secker' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não está preso nem limitado a lugar algum.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'DEUS - Onipresença'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Qualquer pessoa pode contar as sementes de uma maçã, mas só Deus pode contar as maçãs que brotarão de uma semente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não pode imaginar com muita freqüência que há um olho que nunca dorme, que lê o coração e registra nossos pensamentos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Bacon' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Assim como o cristão nunca está fora do alcance da mão de Deus, também não está fora do alcance do olho de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É consolador o fato de que Deus nunca pode ser pego de surpresa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frank Gabelein' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não apenas vê os homens, também vê através deles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A onisciência não pode ser separada da onipotência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que supre todas as necessidades vê e conhece tudo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nada que esteja além do alcance do olho de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Charles Stern' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus conhece-nos totalmente e cuida de nós a despeito desse conhecimento.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Charles Stern' and ass.assunto = 'DEUS - Onisciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é paciente porque é eterno.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DEUS - Paciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor de Deus pelos pecadores é maravilhoso, mas a paciência de Deus para com os santos de temperamento ruim é um mistério ainda mais profundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Drummond' and ass.assunto = 'DEUS - Paciência'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O caráter de Deus é um todo perfeito e glorioso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A harmonia do ser divino é resultado não de um equilíbrio perfeito de suas partes, mas da inexistência de partes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'DEUS - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pode enganar nem ser enganado; não pode enganar porque é a verdade, nem ser enganado porque é sabedoria.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'DEUS - Perfeição'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os propósitos de Deus sempre contam com sua provisão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus está no controle de todos os átomos de seu universo, e mesmo as coisas que parecem estar em contradição direta com seu amor um dia serão vistas como confirmação dinâmica de seu poder.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Toda felicidade atual do crente e toda sua felicidade futura originam-se nos eternos propósitos de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus sabe o que está fazendo e não tem nenhuma obrigação de nos dar qualquer explicação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Elisabeth Elliot' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nunca precisa mudar seus conselhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os propósitos de Deus são suas promessas ocultas; as promessas, seus propósitos revelados.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Phillip Henry' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mundo inteiro está ordenado e organizado de forma que tudo vá ao encontro das necessidades do povo de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. A. Motyer' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tudo o que acontece no mundo executa a mesma obra: a glória do Pai e a salvação de seus filhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Daniel Rowlands' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus cuida de nós, purifica-nos e continua sua obra em nós, até levar-nos ao fim de sua promessa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O que Deus faz, ele sempre teve o propósito de fazer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Augustus H. Strong' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A causa de Deus nunca corre perigo; o que ele começou na alma ou no mundo, levará até o fim.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'B. B. Warfield' and ass.assunto = 'DEUS - Propósitos'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus me concedesse sua onipotência por vinte e quatro horas, vocês veriam quantas mudanças eu efetuaria no mundo. Mas se ele me desse também sua sabedoria, eu deixaria as coisas como estão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. M. L. Monsabre' and ass.assunto = 'DEUS - Sabedoria'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A santidade de Deus e sua natureza não são coisas distintas, são a única coisa. A santidade de Deus é sua natureza, e a natureza de Deus é sua santidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A santidade em anjos e santos não é apenas uma qualidade, mas em Deus é a essência dele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A santidade de Deus está em sua glória, em sua graça e em suas riquezas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum atributo de Deus é mais desagradável para os pecadores do que sua santidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nós apenas aprendemos a nos comportar na presença de Deus e, se a consciência dessa presença enfraquece, a humanidade tende a divertir-se com isso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nenhum atributo de Deus é mais festejado pelos anjos e pelos homens redimidos quanto sua santidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pode ter mais santidade porque é perfeitamente santo; e não pode ter menos santidade porque é imutavelmente santo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'DEUS - Santidade '

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem propõe, Deus dispõe.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ludovico Ariosto' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Falar da soberania de Deus não é nada mais do que falar da sua Divindade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A soberania de Deus é aquele cetro de ouro em sua mão pelo qual ele faz todos se curvarem, seja por sua palavra, por suas obras, por suas misericórdias ou por seus juízos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ser Deus e ser soberano são coisas inseparáveis.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Senhor é Rei! Quem, pois, ousará. Resistir à sua vontade, desconfiar do seu cuidado, Murmurar contra seus sábios decretos. Ou duvidar de suas promessas de rei? ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Josiah Conder' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seja o que for que você faça, comece com Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Admitir a providência universal e negar a providência especial é incoerência. Seria o mesmo que falar de uma corrente sem elos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. A. Hodge' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus faz tudo o que faz porque é o que é.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não pára para consultar-nos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O ponto fixo do universo, o fato inalterável, é o trono de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. Campbell Morgan' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O mundo faz com que todos pareçamos anões; Deus faz com que o mundo pareça anão.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. I. Packer' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus é lei para si mesmo e... não tem nenhuma obrigação de prestar contas de suas atitudes a quem quer que seja.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Pink' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você vai ou não viver até chegar em casa hoje, depende absolutamente da vontade de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon ' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus pode desferir um golpe reto com uma vara torta.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nenhuma planta ou flor aqui embaixo Que não torne conhecida sua glória; Nuvens levantam-se, e tempestades sopram Mediante ordens provindas de seu trono.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Isaac Watts' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A soberania de Deus não é arbitrariedade, como alguns a julgam erroneamente, pois Deus tem suas razões, baseado em sua sabedoria infinita, as quais nem sempre decide revelar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Spiros Zodhiates' and ass.assunto = 'DEUS - Soberania'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dever adiado dá prazer ao diabo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus nos dá de si mesmo em promessas, precisamos dar-nos a ele em deveres.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Seu dever e glória é fazer todos os dias voluntariamente o que faríamos no último dia de nossa vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A negligência do dever nunca aliviará o sentimento de culpa da consciência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Doutrina sem dever é uma árvore sem frutos; dever sem doutrina é uma árvore sem raízes. Talbot W.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Chambers' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A eternidade não pode libertar-nos do dever.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Charnock' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A recompensa de um dever cumprido é o poder para cumprir outro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Elliot' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os que dão a Deus apenas a sombra do dever nunca podem esperar dele uma verdadeira recompensa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que abandona o dever depressa será abandonado para cometer um delito.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando a lei de Deus está escrita em nosso coração, nosso dever é nosso prazer.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não saiamos do caminho do dever, para que não entremos no caminho do perigo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Rowland Hill' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não consideraria pequeno nenhum dever, se você mesmo fosse grande.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George MacDonald' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem escapa de um dever evita um ganho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Theodore Parker' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dever prepara o coração para o dever.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'DEVER'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Cuide para que o dia do Senhor seja usado em santa preparação para a eternidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Baxter' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Profanar o dia do Senhor é uma prova tão grande de um coração profano como qualquer uma que possa ser encontrada em todo o Livro de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Faze do dia do Senhor o mercado para tua alma.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Bunyan' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O domingo é uma instituição divina, e não há dinheiro que a pague.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Winston Churchill' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Onde os domingos são negligenciados, toda a religião decai sensivelmente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A essência do dia de descanso não pode ser alterada sem que se altere a natureza do homem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. A. Hodge' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O domingo é o elo de ouro que fecha a corrente da semana.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. MacAuley' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O assassino que é arrastado à força e o homem bem-educado que desrespeita o dia do Senhor são iguais aos olhos de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheine' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mostre-me uma nação que abandonou o dia do Senhor e eu lhe mostrarei uma nação que se apropriou da semente da decadência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem foi feito para adorar todos os dias, mas o trabalho é eliminado no dia do Senhor para mostrar sua perspectiva no plano de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Clyde Narramore' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Um dia de descanso semanal aprisiona a nossa natureza selvagem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Christopher Nesse' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Penso que o bom senso, a razão e a consciência combinam-se para mostrar que, se não conseguirmos reservar para Deus um dia por semana, não poderemos viver como pessoas que certamente irão morrer um dia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dia do juízo será provavelmente um dia terrível para aqueles que desprezam o dia do Senhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Swinnock' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se alguém quiser matar o cristianismo, precisa abolir o domingo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Voltaire' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que quer preparar-se para o céu precisa honrar o dia de descanso aqui na terra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Daniel Wilson' and ass.assunto = 'DIA DO SENHOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Difamação é o mau hálito do cérebro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DIFAMAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Ninguém tem língua difamatória sem ter ouvidos difamatórios.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DIFAMAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quem contar fofocas para você fofocará de você.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DIFAMAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Afirmo isto como um fato: se todas as pessoas soubessem o que cada uma diz da outra, não haveria quatro amigos no mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Blaise Pascal' and ass.assunto = 'DIFAMAÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As dificuldades são recados de Deus; quando nos são enviadas, devemos considerá-las prova da confiança de Deus, uma gentileza da parte de Deus.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Ward Beecher' and ass.assunto = 'DIFICULDADES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando os problemas encontram os cristãos orando, eles fazem mais bem do que mal.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DIFICULDADES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há dificuldades em Deus. As dificuldades existem exclusivamente em nossa mente incrédula.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Charles' and ass.assunto = 'DIFICULDADES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'São as dificuldades que revelam quem os homens são.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Epicteto' and ass.assunto = 'DIFICULDADES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As dificuldades colocam os homens à prova.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Johannes Von Goethe' and ass.assunto = 'DIFICULDADES'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dinheiro é como a água do mar: quanto mais uma pessoa bebe, mais sede sente.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há bolsos em uma mortalha.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você pode apagar o sol se colocar uma moeda bem perto do olho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dinheiro é como esterco: só é bom se for espalhado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Bacon' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Poucas coisas testam mais profundamente a espiritualidade de uma pessoa do que a maneira como ela usa o dinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O amor ao dinheiro é para a igreja um mal maior do que a soma de todos os outros males do mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Tempo e dinheiro são os fardos mais pesados da vida, e os mortais mais infelizes são os que os têm mais do que são capazes de usar bem.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Johnson' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A verdadeira medida de nossa riqueza está em quanto valeríamos se perdêssemos todo nosso dinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Henry Jowett' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que serve a Deus por dinheiro servirá ao diabo por salário melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Roger LEstrange' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se a religião de um homem não afeta a maneira como ele usa o dinheiro, a religião desse homem é vã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Hugh Martin' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A chave de todo o nosso relacionamento com o dinheiro está na atitude de nossa mente para com ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Kenneth F. W. Prior' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O homem mais pobre que conheço é aquele que não tem nada mais do que dinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John D. Rockefeller' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dois terços de todas as lutas, brigas e processos judiciais no mundo originam-se de uma simples causa: dinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. C. Ryle' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Mamom é o maior senhor de escravos do mundo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frederick Saunders' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dinheiro ainda não deixou ninguém rico.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Sêneca' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dinheiro, o maior deus debaixo do céu.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Herbert Spencer' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nada do que é de Deus é obtido com dinheiro.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Tertuliano' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando tenho um pouco de dinheiro, livro-me dele tão logo seja possível, para que ele não encontre o caminho de meu coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Wesley' and ass.assunto = 'DINHEIRO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus sempre ilumina seus túneis.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Posso afirmar, por experiência própria, que 95% do conhecimento da vontade de Deus consiste em estar preparado para cumpri-la antes de conhecê-la.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Donald Grey Barnhouse' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aconselhe-se com Deus. Os céus elevam-se acima do inferno. A qualquer momento, Deus pode revelar-nos quais tramas estão sendo maquinadas lá contra você.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O diabo pode dirigi-lo de forma extraordinária... Há poderes que podem simular quase todas as coisas na vida cristã.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. Martyn Lloyd-Jones' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não sei por quais caminhos Deus me conduz, mas conheço bem meu guia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A vida do crente é um passeio dirigido, e o habilidoso guia é o guia de Abraão e o nosso guia. Ele conhece o final da jornada em vista e o melhor caminho para chegar lá.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Fred Mitchell' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Onde a glória de Deus repousa, não precisamos perguntar o caminho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Watchman Nee' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus promete guiar-nos não para livrar-nos da responsabilidade de pensar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A Bíblia não é uma espécie de horóscopo por meio do qual descobrimos nosso futuro... Eu não nego que Deus algumas vezes revele sua vontade particular iluminando um versículo das Escrituras. Mas este não é seu método habitual, e é altamente perigoso seguir tal suposta direção sem verificá-la e confirmá-la.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Minha convicção deliberada é de que o único caminho para chegar ao conhecimento da vontade divina com respeito a nós passa pela simplicidade de objetivos e pela oração fervorosa.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. H. Thornwell' and ass.assunto = 'DIREÇÃO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando Deus omite a correção, entra pelas portas a condenação.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Adams' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus sempre avisa antes de ferir.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As correções ministradas por Deus são nossas instruções; Seus açoites, nossas lições, e Suas chicotadas, nossos mestres.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus não esfregaria de maneira tão forte, se não fosse para eliminar a imundície e as manchas que há em Seu povo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando Deus ama, Ele aflige em amor, e sempre que o faz, cedo ou tarde, ensina a essas almas lições tais que serão proveitosas por toda a eternidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Não há nada mais temível do que o Senhor permitir que afrouxemos as rédeas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nada nega ao cristão, a não ser com o objetivo de dar-lhe algo melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Cecil' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus nunca fere, a não ser por amor, e nunca tira nada, a não ser para dar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Até mesmo nas condenações de Deus, podemos encontrar consolo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'François Fenelon' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus destrói o teu conforto com o único objetivo de destruir as tuas corrupções; as privações têm o objetivo de fazer morrer a devassidão; a pobreza tem o desígnio de matar o orgulho; as repreensões são consentidas para acabar com a ambição..' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Flavel' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'As feridas causadas por Deus curam; os beijos do pecado matam.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall ' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Quando somos açoitados, devemos orar para que sejamos ensinados e examinar a lei como a melhor revelação da providência. Não são os açoites propriamente ditos que produzem o bem, mas o ensinamento que os acompanha e que os elucida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Crente, não pense em um repouso sem perturbações, enquanto você não se livrar da carne. Há um ciclo incessante de tristeza e tentação nesta vida. Mas nunca despreze os açoites. Eles têm a voz da instrução. São aplicados pela mão de um Pai amoroso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Henry Law' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O cálice mais amargo com Cristo é melhor do que o cálice mais doce sem Ele.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ian MacPherson' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se nada mais separar-me de meus pecados, Senhor, envia-me chaga tão cruel e calamidade tão grande que me despertem do sono mundano.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Murray MCheyne' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O Pai celestial não tem filhos mimados. Ele os ama demais para permitir isso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Fred Mitchell' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os rudes entalhes da repreensão têm o único objetivo de colocar-nos no prumo, para que sejamos utilizados no edifício celestial.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'D. L. Moody' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nosso Pai celestial nunca tira nada de Seus filhos, a não ser que pretenda dar-lhes algo melhor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'George Muller' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A espada da justiça não nos ameaça mais, mas a vara da correção paternal ainda está em uso.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A dolorosa tesoura de podar está em mão seguras.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John R. W. Stott' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É com misericórdia e moderação que Deus castiga Seus filhos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Trapp' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus separa de nós aquilo que nos separaria dEle.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Ralph Venning' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O maior castigo de Deus é Ele não nos castigar.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Watson' and ass.assunto = 'DISCIPLINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'É custoso seguir a Jesus Cristo, mas custa mais não fazê-lo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Salvação sem discipulado é "graça barata".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Dietrich Bonhoeffer' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Abandonar tudo e seguir a Cristo é a maior coisa que uma alma vivente pode fazer na terra.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. Lindsay Glegg' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Jesus prometeu a seus discípulos três coisas: eles seriam totalmente corajosos, absurdamente felizes e estariam constantemente em problemas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'F. R. Maltby' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Discípulo é a pessoa que aprende a viver a vida que seu mestre vive.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Juan Carlos Ortiz' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Discipulado é mais do que conseguir conhecer o que o mestre conhece. É conseguir ser o que ele é.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Juan Carlos Ortiz' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Fazer um discípulo significa produzir uma cópia.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Juan Carlos Ortiz' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O recém-convertido é semelhante a um homem que aprendeu a dirigir em um país cujo tráfego orienta-se pelo lado esquerdo da rodovia e repentinamente encontra-se em outro país, forçado a dirigir à direita. Ele precisa desaprender o velho hábito e aprender o novo e, o que é mais sério, precisa aprender isso no meio do trânsito pesado.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'DISCIPULADO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se Deus lhe desse dez vezes o que você lhe dá, você conseguiria viver com isso? ' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DÍZIMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O dízimo não deve ser um teto em que paramos de contribuir, mas um piso a partir do qual começamos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DÍZIMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dar um décimo não é algo digno de vanglória.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'DÍZIMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus requer o dízimo, merece as ofertas, defende as economias e orienta as despesas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Stephen Olford' and ass.assunto = 'DÍZIMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Pode-se argumentar que no Antigo Testamento os dízimos eram pagos e, portanto, falando especificamente, não estão na categoria de contribuição voluntária. A contribuição cristã só começa quando damos mais do que um décimo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Kenneth F. W. Prior' and ass.assunto = 'DÍZIMO'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todos os dons de Cristo são como ele mesmo: espirituais e celestiais.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Brooks' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Na igreja de Cristo não há ninguém tão pobre que não possa compartilhar conosco algo de valor.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os dons espirituais não são brinquedos; são ferramentas do Espírito para que a obra de Deus seja feita com eficiência.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. Raymond Carlson' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dons espirituais não são prova de espiritualidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Samuel Chadwick' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não pode ter os dons de Cristo sem ter o governo de Cristo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. Lindsay Glegg' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Orgulhar-se dos dons rouba a bênção de Deus no uso deles.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Uma gota da graça vale um mar de dons.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Jenkyn' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os melhores dons são os que beneficiam todo o corpo. Não se encontra muita gente pedindo o dom de liberalidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Harry Kilbride' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Considerar que os dons espirituais têm o mero objetivo de adornar e beneficiar a pessoa que os tem seria tão absurdo quanto dizer: "Eu acendo o fogo não para esquentar a sala, mas para esquentar a lareira".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Abraham Kuyper' and ass.assunto = 'DONS ESPIRITUAIS'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se alguém não se incomoda com o problema do sofrimento, isto se deve a uma razão entre duas: ou tem um coração duro ou é um cabeça-dura.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'G. A. Studdert Kennedy' and ass.assunto = 'DOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Deus sussurra em nossos ouvidos por meio de nosso prazer, fala-nos mediante nossa consciência, mas clama em alta voz por intermédio de nossa dor; esta é seu megafone para despertar um mundo surdo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. S. Lewis' and ass.assunto = 'DOR'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A questão não é se uma doutrina é bela, mas se ela é verdadeira.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Há tanto direito de crer nas doutrinas do cristianismo quanto dever de praticá-las.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'M. Arnaud' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se você crê somente no que gosta do evangelho e rejeita o que não gosta, não é no evangelho que você crê, mas, sim, em si mesmo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Agostinho' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A indiferença doutrinária não é a solução para o problema das diferenças doutrinárias.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'J. Blanchard' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Doutrina é coisa prática, visto que desperta o coração.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Andrew Bonar' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A doutrina não é tarefa da língua, mas da vida... Ela é recebida apenas quando toma conta da alma toda.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'João Calvino' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Como é humilhante para todos os que estão aprendendo descobrir que sua doutrina ultrapassou suas experiências.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Thomas Chalmers' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Algumas coisas confiamos a Deus, outras Deus confia a nós... Aquilo que Deus confia a nós é principalmente sua verdade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William Gurnall' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Às vezes as verdades mais claras são os argumentos mais fortes em favor dos deveres mais difíceis.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Matthew Henry' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Abracemos toda a verdade ou renunciemos totalmente ao cristianismo.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Joseph Irons' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Você não pode abandonar os grandes temas doutrinários e ainda assim produzir grandes santos.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'John Henry Jowett' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A igreja de hoje... não tem dever mais solene do que conservar a pureza da doutrina.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'R. B. Kuiper' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dizer "Esqueça a doutrina, vamos evangelizar" é tão ridículo quanto uma equipe de futebol que diz "Esqueça a bola, vamos continuar o jogo".' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Peter Lewis' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Qualquer ensinamento que não se enquadre nas Escrituras deve ser rejeitado, mesmo que faça chover milagres todos os dias.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A finalidade para a qual Deus instrui a mente é que Ele possa transformar a vida.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Al Martin' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Doutrinas fracas não são páreo para tentações fortes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Se não tornarmos clara nossa posição, com palavras e obras, em favor da verdade e contra as falsas doutrinas, estaremos edificando um muro entre a próxima geração e o evangelho.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Francis Schaeffer' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que crê mal nunca pode viver bem, pois não tem alicerces.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Richard Sibbes' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens, para serem verdadeiramente ganhos, precisam ser ganhos pela verdade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'C. H. Spurgeon' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'O propósito que está por trás de toda doutrina é garantir a ação moral.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'A. W. Tozer' and ass.assunto = 'DOUTRINA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Para muitos cristãos, incerteza é a moda; tudo o que eles têm é a valentia de suas confusões.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Anônimo' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Todas as dúvidas não são honestas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Victor Budgen' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aquele que duvida não pode encontrar a Deus pela mesma razão que um ladrão não pode encontrar um policial.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Robert Cleath' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Acredite em suas crenças e duvide de suas dúvidas; não cometa o erro de duvidar de suas crenças e de acreditar em suas dúvidas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Charles F. Deems' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Nunca duvide na escuridão do que Deus lhe disse à luz.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'V. Raymond Edman' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Aqueles que duvidam invertem a metáfora e insistem em que precisam de fé tão grande quanto uma montanha para mover uma semente de mostarda.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Webb B. Garrison' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Beneficie-me com suas certezas, se você tiver alguma. Fique com suas dúvidas; eu já tenho dúvidas suficientes.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Johannes Von Goethe' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Dúvida alimentada torna-se rapidamente dúvida concretizada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Frances Ridley Havergal' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'A arte de duvidar é fácil, pois já nascemos com essa habilidade.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'Martinho Lutero' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Satanás adora pescar em águas turvas.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'William S. Plumer' and ass.assunto = 'DÚVIDA'

INSERT INTO FraseCrista(IdAutorFraseCrista, IdAssuntoFrase, IdFonteFraseCrista, Frase)
Select autor.id, ass.id, 1, 'Os homens que estão envoltos em pontos de interrogação não podem tomar parte de uma cruzada.' 
from AutorFraseCrista autor, AssuntoFrase ass
Where autor.Nome = 'David K. Wachtel' and ass.assunto = 'DÚVIDA'
GO

Insert into TagFrase(Tag)
Values ('Amabilidade')
,('Amizade')
,('Amor A Cristo')
,('Amor A Deus')
,('Amor Aos Outros')
,('Amor Pelos Outros')
,('Apatia')
,('Arrependimento')
,('Boas Obras')
,('Boatos')
,('Calúnia')
,('Caridade')
,('Censura')
,('Compaixão')
,('Complacência')
,('Comunhão Com Cristo')
,('Comunhão Com Deus')
,('Comunhão')
,('Concupiscência')
,('Confissão')
,('Consagração')
,('Contrição')
,('Convicção De Pecado')
,('Cristianismo')
,('Críticas Feitas')
,('Críticas Recebidas')
,('Culpa')
,('Dar')
,('Dedicação')
,('Depravação')
,('Depressão')
,('Desespero')
,('Dever')
,('Difamação')
,('Dízimo')
,('Embriaguez')
,('Enfermidade')
,('Eternidade')
,('Ética')
,('Evolução')
,('Expiação')
,('Fé E Obras')
,('Fé Salvadora')
,('Felicidade')
,('Frutos')
,('Ganância')
,('Generosidade')
,('Glutonaria')
,('Gratidão')
,('Homem Um Pecador')
,('Homem')
,('Humildade')
,('Impiedade')
,('Incertezas')
,('Incredulidade')
,('Indiferença')
,('Instrução')
,('Inveja')
,('Jesus Cristo - Morte')
,('Juízo')
,('Luxo')
,('Mansidão')
,('Materialismo')
,('Meditação')
,('Mente')
,('Mentira')
,('Misericórdia Pelos Outros')
,('Moralidade')
,('Mordomia')
,('Morte')
,('Natureza Pecaminosa')
,('Natureza')
,('Oração')
,('Palavras')
,('Pecado')
,('Penitência')
,('Perseverança')
,('Preocupação')
,('Prosperidade')
,('Provações')
,('Razão')
,('Regeneração')
,('Responsabilidade')
,('Revelação')
,('Reverência')
,('Riqueza')
,('Santidade')
,('Justificação')
,('Segurança Eterna')
,('Serviço')
,('Sofrimento')
,('Submissão')
,('Temor De Deus')
,('Temor')
,('Teologia')
,('Vida Em Família')
,('Vida Eterna')
,('Vontade De Deus')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A prática é a alma do conhecimento.' 
and tag in ('DEVER','BOAS OBRAS','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Toda ação de nossa vida toca alguma corda que vibrará na eternidade.' 
and tag in ('DEVER','BOAS OBRAS','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As ações do homem são os melhores indicadores de seus princípios.' 
and tag in ('DEVER','BOAS OBRAS','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As ações são o fruto próprio do conhecimento.' 
and tag in ('DEVER','BOAS OBRAS','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A prática é a própria vida da piedade.' 
and tag in ('DEVER','BOAS OBRAS','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se adorássemos como devemos, não nos preocuparíamos como fazê-lo.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A adoração vem antes do serviço, e o Rei, antes dos negócios do Rei.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O que adoramos determina aquilo em que nos transformamos.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O primeiro fundamento da justiça é sem dúvida a adoração a Deus.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem que não tem o hábito de adorar não passa de um par de óculos por trás do qual não há olhos.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os homens carnais contentam-se com o "ato" de adoração; eles não têm desejo de comunhão com Deus.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada prepara melhor o coração para a adoração ao Senhor do que contemplar a Sua beleza e perfeição.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A adoração pública não nos isenta da adoração secreta.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A adoração é a função mais elevada da alma humana.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Adorar e venerar são tão necessários quanto analisar e explicar.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem que tenta diminuir a glória de Deus, recusando-se a adorá-lO, é como um lunático que deseja apagar o sol, escrevendo a palavra "escuridão" nas paredes de sua cela.'  and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Toda a nossa vida... deve ser dirigida de tal maneira para Deus que não importa o que nos atinja tristeza ou alegria seja imediatamente refletido para cima, para a Sua presença.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As nossas mentes são constituídas de tal forma que não podem, ao mesmo tempo, concentrar-se no Senhor e fixar-se no casaco novo ou chapéu para o próximo inverno.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A adoração é algo que se relaciona com Deus mais do que qualquer outra coisa.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sou chamado a adorar um Deus que não vejo, mas não para submeter-me a um Deus que não posso conhecer e provar.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Somos chamados a uma preocupação perene com Deus.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Afirmo que a maior tragédia do mundo de hoje é que Deus fez o homem à Sua imagem e o criou para adorá-lO, formou-o para tocar a harpa da adoração diante de Sua face, dia e noite, mas ele falhou, deixando cair a harpa; e ela jaz sem som a seus pés.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A adoração não faz parte da vida cristã; ela é a própria vida cristã.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Orar é menos do que adorar.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Muitas vezes, a postura na adoração é nada mais do que impostura.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem não é feito para questionar, mas para adorar.' 
and tag in ('REVERÊNCIA','TEMOR DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum dever é mais urgente do que o de demonstrar gratidão.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dar graças a Deus é vibrar as cordas da alma ao toque suave da benevolência divina.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um homem agradecido é valorizado a peso de ouro.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um coração agradecido está em festa contínua.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As mais doces bênçãos são conseguidas com oração e usufruídas com ação de graças.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A alegria insensível ao agradecimento é sempre suspeita.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A oração sem agradecimento é como um pássaro sem asas.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Agradecer é bom, mas viver agradecido é melhor.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em cada canteiro do livro de Salmos estão plantadas as sementes do agradecimento.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Agradecimentos de coração precisam ser dados a Deus: não da boca para fora, mas do fundo do coração.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão está indeciso entre bênçãos recebidas e bênçãos esperadas; portanto, ele deve sempre dar graças.' 
and tag in ('GRATIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O álcool não torna as pessoas capazes de fazer melhor o que deve ser feito. Ele as torna menos envergonhadas de fazê-lo incorretamente.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O álcool jamais afoga as mágoas; somente as irriga.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Beba como um peixe apenas se você beber o que o peixe bebe.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O jovem que faz pose com um copo de bebida na mão faria bem em considerar qual dos dois deveria jogar fora: a bebida ou ele próprio.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O vinho é um vira-casaca: primeiro um amigo, depois um impostor e, por fim, um inimigo.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se pudéssemos eliminar do país a intemperança, dificilmente haveria pobreza suficiente para exercitar de forma sadia os impulsos de caridade.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tenho uma utilidade melhor para meu cérebro do que envenená-lo com álcool. Colocar álcool no cérebro humano é como colocar areia nas engrenagens de um motor.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Uísque é uma boa coisa no seu devido lugar. Não há nada melhor para preservar um corpo depois de morto. Se você quer preservar o corpo de um homem morto, coloque-o no uísque; se quer matar um homem vivo, coloque uísque nele.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sempre que vejo uma tabuleta: "Autorizado a vender bebidas alcoólicas" penso que se trata de uma licença para arruinar almas.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhuma outra droga conhecida pelo homem é mais amplamente usada nem mais freqüentemente responsável por mortes, ferimentos ou crimes do que a bebida alcoólica.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O vinho tem afogado mais pessoas do que o mar.' 
and tag in ('EMBRIAGUEZ')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Alegria é a bandeira desfraldada na fortaleza do coração qu ando o Rei está em casa.'  and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A alegria é o resultado natural da obediência do cristão à vontade revelada de Deus.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira alegria resplandece no escuro.'  
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão deve ser um "aleluia" da cabeça aos pés.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Pegue um santo, coloque-o sob quaisquer circunstâncias, e ele saberá como regozijar-se no Senhor.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um cristão sem alegria é um difamador de seu Senhor.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Jó era mais feliz na desgraça do que Adão no paraíso.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = '"Prazer" e "alegria" não apenas não são sinônimos como também podem ser profundamente diferentes como céu e inferno.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Alegria santa é o óleo que lubrifica as rodas de nossa obediência.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Alegria é negócio sério no céu.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão deve ser uma doxologia viva.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sem alegria, nada pode ser bem feito, e uma boa consciência é o alicerce para a alegria.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você não tem alegria na vida cristã, existe vazamento em algum lugar de seu cristianismo.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há tanta diferença entre as alegrias espirituais e as terrenas quanto entre um banquete saboreado e outro pintado na parede.' 
and tag in ('FELICIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Está ocupado demais quem está muito ocupado para ser amável.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Toda hora é hora de ser amável.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Amabilidade é uma linguagem que o surdo pode ouvir e o cego pode ver.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O melhor exercício para fortalecer o coração é abaixar-se e levantar os que estão caídos.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Palavras amáveis são a música do mundo.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Amabilidade em nós é o mel que alivia a ferroada da indelicadeza nos outros.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus tem um método secreto para recompensar seus santos: ele toma providências para que eles se tornem os primeiros beneficiados por sua própria beneficência.' 
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Seja amável. Lembre-se de que todos os que você encontra estão enfrentando uma batalha difícil.'
and tag in ('COMPAIXÃO','AMOR AOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Amigo é alguém que se achega quando todo mundo se afasta.'  and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os cristãos podem não se ver face a face; no entanto, podem andar lado a lado.'  and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada é mais perigoso do que nos juntarmos aos ímpios.' 
and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A única forma de ter um amigo é ser amigo.' 
and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada é mais estimulante do que amigos que falam a verdade em amor.' 
and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há pessoas com as quais não concordamos, mas não precisamos afastá-las de nossa amizade.' 
and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Amizade falsa é pior do que dinheiro falso.' 
and tag in ('COMUNHÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A questão ainda é a mesma: Você ama a Jesus? O amor é a resposta para a apatia.' 
and tag in ('COMUNHÃO COM CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A maior prova de nosso amor a Cristo é a obediência às leis de Cristo... O amor é a raiz; a obediência é o fruto.' 
and tag in ('COMUNHÃO COM CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'De todas as coisas que nos irão surpreender na manhã da ressurreição, esta, creio eu, é a que mais causará surpresa: que amamos tão pouco a Cristo durante nossa vida.' 
and tag in ('COMUNHÃO COM CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A maior e melhor coisa que pode ser dita acerca de um homem é que ele amou ao Senhor.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Eu odiaria minha própria alma se descobrisse que ela não ama a Deus.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor e a obediência a Deus estão de tal maneira entrelaçados um com o outro que a existência de um implica a presença do outro.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A obediência a Deus é a prova infalível de um amor sincero e supremo por ele.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nosso amor pelo Senhor não merece nem mesmo ser mencionado, mas seu amor por nós nunca será suficientemente exaltado.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Até mesmo o coração de Deus tem sede de amor.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor da criatura para com o Criador requer necessariamente obediência; caso contrário, não tem qualquer sentido.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor é a única coisa com que podemos pagar a Deus na mesma moeda... Não podemos pagar-lhe tintim por tintim, mas devemos amá-lo generosamente.' 
and tag in ('COMUNHÃO COM DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O mundo está repleto das ruínas do que eros prometeu mas não foi capaz de fornecer.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor pode esperar para dar; a concupiscência é que não pode esperar para receber.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor não é cego. A concupiscência o é. Se o amor fosse cego, Deus também seria.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A diferença entre concupiscência e amor é que este é fixo, e aquele, volúvel. O amor cresce ao ser desfrutado; a concupiscência se desgasta; e a razão disso é que o primeiro nasce da união de almas; o outro, da união de sentidos.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A expressão "amor livre" é uma contradição de palavras. Se é livre, não é amor; se é amor, não é livre.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os homens não temem que a morte seja aniquilação, mas, sim, que ela não o seja.' 
and tag in ('MORTE','ETERNIDADE','JUÍZO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O ímpio não será aniquilado pela segunda morte como julgamento de seus pecados, da mesma forma como Cristo não foi aniquilado quando pagou a pena de nossos pecados.'  and tag in ('MORTE','ETERNIDADE','JUÍZO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ansiedade e oração opõem-se uma à outra mais do que água e fogo.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ansiedade nunca fortalece você para o amanhã; ela apenas o enfraquece para o dia de hoje.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ansiedade é o fenômeno fundamental e o problema central de todas as neuroses.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ansiedade é o resultado natural de centralizarmos nossas esperanças em qualquer coisa menor do que Deus e sua vontade para nós.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Levar preocupações para a cama é dormir com uma carga às costas. ' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O começo da ansiedade é o fim da fé; e o começo da verdadeira fé é o fim da ansiedade.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Mentes e corações inquietos tomarão decisões incertas e não conseguirão firmar-se na graça.' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ansiedade é uma autocontradição da verdadeira humildade. ' 
and tag in ('TEMOR','PREOCUPAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Água e religião paradas congelam mais depressa.' 
and tag in ('COMPLACÊNCIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando Deus fala, permanecer apático é uma prova de ateísmo prático.'  and tag in ('COMPLACÊNCIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A única coisa necessária para o triunfo do mal é que os homens bons não façam nada.' 
and tag in ('COMPLACÊNCIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se nos tornarmos desatentos para com o dever, logo nos tornaremos apáticos para com ele.' 
and tag in ('COMPLACÊNCIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se a doutrina da perfeição sem pecado é heresia, a doutrina da satisfação com imperfeição pecaminosa é heresia ainda maior.' 
and tag in ('COMPLACÊNCIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Arrependimento é a mudança da mente; a regeneração é a mudança do homem.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O arrependimento é uma fonte perene, na qual as águas de uma tristeza santa estão sempre fluindo.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Abandonar o pecado é deixá-lo sem nenhum pensamento oculto de voltar para eles.'  and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Arrependimento é a lágrima nos olhos da fé.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Arrependimento é uma transformação completa do coração natural do homem com respeito ao pecado.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando a Palavra de Deus converte um homem, tira dele o desespero, mas não a capacidade de arrepender-se.'  and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem arrepende-se de verdade somente quando aprende que o pecado o tornou incapaz de arrepender-se sem a ajuda da graça renovadora de Deus.'  and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira água benta não é aquela que o papa esparge, mas a que é destilada dos olhos arrependidos.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ó Jesus, cheio de graça e de verdade, Mais cheio de graça do que eu de maldade, Mais uma vez eu busco tua face gloriosa; Abre teus braços, recebe-me com ternura amorosa, Cura gratuitamente meu pecado cruel E, a despeito disso, ama este pecador infiel.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','CONVICÇÃO DO PECADO','PENITÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para ser ateu, é necessário uma medida de fé infinitamente maior do que para admitir todas as grandes verdades que o ateísmo nega.'  and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O ateísmo é a morte da esperança, o suicídio da alma.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É tão difícil um ateu encontrar Deus quanto um ladrão encontrar um policial.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um problema que um ateu enfrenta é que ele não tem com quem conversar quando está só.'  and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem diz "Deus não existe", a não ser aquele que tem interesse em que ele não exista.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O mundo ainda está esperando pelo primeiro ateu sábio.'  and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quem não acredita na existência de Deus é mais vil do que um demônio. Negar que Deus existe é uma espécie de ateísmo que não será encontrado nem no inferno.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ateu é um homem que não tem nenhum meio invisível de sustento.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Negar a existência de Deus é praticamente a mesma coisa que fechar um olho. Talvez seja esta a razão por que Deus nos deu dois olhos.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para ser ateu não é preciso ter cérebro.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O ateu está um passo à frente do diabo.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sempre me pareceu inteiramente absurdo o fato de um ateu manifestar tão profunda consideração pelos produtos de um universo no qual o acaso é rei.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Admira-me encontrar uma pessoa inteligente que luta contra algo que ela mesma não crê absolutamente que exista.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O diabo divide o mundo entre o ateísmo e a superstição.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A moralidade ateísta não é impossível, mas nunca satisfará nossos objetivos.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Posso entender que é possível olhar para o chão e ser ateu, mas não posso conceber como alguém pode olhar para o céu e dizer que Deus não existe.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A melhor resposta a um ateu é oferecer-lhe um bom jantar e perguntar-lhe se ele crê que existe um cozinheiro.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ateísmo é um negócio cruel e de longo prazo.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em seu coração, a religião do ateu tem um vazio com a forma de Deus.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há ateus em trincheiras nem em botes salva-vidas.' 
and tag in ('IMPIEDADE','INCREDULIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ativismo nos negócios do Rei não é desculpa para negligenciar o Rei.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem tem o direito de levar uma vida de tão grande contemplação a ponto de negligenciar o serviço devido a seu próximo, nem tem o direito de entregar-se de tal forma a uma vida ativa a ponto de esquecer-se da contemplação de Deus.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É perigosamente possível que a atividade não seja nada mais do que um corre-corre atordoado em volta de um vazio central.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Precisamos ter cuidado para não sentirmos que, se não estivermos de pé fazendo algo, o Senhor não estará atuando.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em muitas igrejas de hoje temos movimentação mas não unção.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É possível ser muito ativo no serviço de Cristo e ainda esquecer de amá-lo.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Temos estado ocupados demais em cortar madeira para gastar tempo e afiar o machado.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O fato de nos concentrarmos em serviço e atividade para Deus muitas vezes pode impedir-nos de alcançar a verdade, o próprio Deus.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É difícil ver Jesus quando se está com pressa.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um dos maiores perigos da vida espiritual é viver em função de suas próprias atividades. Em outras palavras, a atividade não está em seu devido lugar como algo que você faz, mas tornou-se algo que o leva a manter-se em movimento.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cuidado com a esterilidade de uma vida atarefada.' 
and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não nos iremos livrar da doença do pecado aumentando nossas atividades.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Estar sempre pregando, ensin ando, fal ando, escrevendo e realiz ando obras em público é inquestionavelmente um sinal de zelo.Mas não é sinal de zelo segundo o conhecimento.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Algumas vezes penso que seria melhor para a igreja se proclamássemos uma moratória de atividades durante cerca de seis semanas e tão somente esperássemos em Deus para ver o que ele está planejando fazer por nós.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Grande parte da atividade de muito obreiro cristão é o túmulo de sua vida espiritual.'  and tag in ('SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A vida oferece apenas duas alternativas: crucificação com Cristo ou autodestruição sem Ele.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conceito de ressurreição é aceito por todos, mas o assunto anterior da autocrucificação tem preço mais elevado do que a maioria dos homens está disposta a pagar.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Mate o pecado antes que ele o mate.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz precisa ser carregada; não temos liberdade de passar por cima dela ou de evitá-la.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Morrer para nosso conforto, nossas ambições e nossos planos faz parte da própria essência do cristianismo' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A mortificação da carne é a vivificação do espírito.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Carregar a cruz é a escolha consciente de uma alternativa dolorosa motivada pelo amor a Cristo.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sem cruz não se segue a Cristo.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Todos os cristãos vivem uma vida de morte para si mesmos; este é o segredo de sua surpreendente vitalidade.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A crucificação é algo feito para nós; não é algo que fazemos em nosso favor. Só podemos iniciá-la tomando a cruz, mediante uma decisão completa e honesta.'  and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O crente mortifica-se porque está em paz com Deus; o legalista o faz para poder apaziguar a Deus por meio de sua mortificação... para ter de que se gloriar.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há outra forma de viver esta vida cristã a não ser mediante uma contínua morte para o eu.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem tem uma cruz de veludo.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Temos ordem de carregar, não de construir nossa cruz. Deus, em sua providência, concederá uma para nós.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus cria a partir do nada. Portanto, enquanto o homem não se reduzir a nada, Deus não poderá fazer nada com ele.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cristãos mortificados são a glória de Cristo.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = '"Crucificada" é o único adjetivo com o qual se descreve a vida cristã.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um dia morri para George Muller, para suas opiniões e preferências, gosto e vontade; morri para o mundo, sua aprovação ou censura; morri para a aprovação ou acusação até mesmo de meus irmãos e amigos; e desde então tenho procurado apenas apresentar-me aprovado diante de Deus.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Que significa para mim estar "crucificado"? Penso que a resposta resume-se magistralmente nas palavras com as quais a multidão referiu-se a Jesus: "Fora com ele!" ' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Esteja matando o pecado ou ele o estará mat ando.'  and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que interrompe a mortificação anula todos os esforços com vistas à santidade.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz de Cristo é o mais suave fardo que eu já carreguei; é um peso como as asas para um pássaro, como as velas para um veleiro.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Preparem-se, meus jovens amigos, para se tornarem cada vez mais fracos; preparem-se para mergulhar a níveis cada vez mais baixos de auto-estima; preparem-se para a auto-aniquilação e orem para que Deus apresse este processo.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para termos aroma suave diante de Deus, precisamos ser quebrados e derramados, não somente ser recipientes de perfume suave.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando você coloca a vida no altar, qu ando se prontifica e aceita morrer, você se torna invencível. Não tem mais nada a perder.'  and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para os "cristãos artificiais" de nossos dias, Jesus sempre precisa experimentar a morte, pois tudo o que desejam ouvir é outro sermão acerca de como Ele morreu.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz é mais fácil para aquele que a carrega do que para aquele que a arrasta pelo caminho.' 
and tag in ('HUMILDADE','MANSIDÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O caminho mais curto para entender a Bíblia é aceitar o fato de que Deus está fal
ando em cada linha.'  and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia não diz que suas palavras foram inspiradas por Deus, mas que foram sopradas por Ele.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia não é nada mais do que a voz dAquele que se assenta no trono. Cada livro, cada capítulo, cada sílaba, cada letra da Bíblia é um pronunciamento direto do Altíssimo.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Observe... que a mesma reverência que temos para com Deus também se deve à Escritura, porque ela procede unicamente dele, e não há nada do homem presente nela.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia é a carta que Deus nos enviou; a oração é uma carta que enviamos a Ele.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As palavras das Escrituras devem ser consideradas palavras do Espírito Santo.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus agracionou-nos com sua autobiografia, de forma que podemos conhecer e ter seus pensamentos em todas as áreas de nossa vida.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A teologia não é nada mais do que a gramática da língua do Espírito Santo.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As Escrituras Sagradas vêm da plenitude do Espírito, de modo que não há nada nos profetas, na lei, no evangelho ou nas epístolas que não desça da majestade divina.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os escritores bíblicos não inventaram suas próprias palavras, de acordo com as coisas que haviam aprendido, mas apenas expressaram as palavras que receberam.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia parece uma orquestra sinfônica, tendo o Espírito Santo como seu maestro; cada instrumento foi trazido voluntária, espontânea e criativamente para tocar suas notas exatamente como o grande maestro queria, embora nenhum dos músicos pudesse ouvir a música como um todo.'  and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A inerrância afirma que a Bíblia não é nada menos do que revelação, revelação que procede de um Deus pessoal e transcendente.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia fala no tom de voz do próprio Deus.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As Escrituras emanam de Deus.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia é a biblioteca do Espírito Santo.' 
and tag in ('REVELAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Somos salvos não por nossos feitos, mas pelo sacrifício de Cristo por nossos defeitos.' 
and tag in ('FÉ E OBRAS','FRUTOS','SANTIDADE', 'JUSTIFICAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando deixamos passar despercebidas nossas boas obras, Deus, certamente, as observa mais.'  and tag in ('FÉ E OBRAS','FRUTOS','SANTIDADE', 'JUSTIFICAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Embora... os discípulos devam ser vistos praticando boas obras, eles não devem praticar boas obras para serem vistos.'  and tag in ('FÉ E OBRAS','FRUTOS','SANTIDADE', 'JUSTIFICAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhuma quantidade de boas obras pode fazer de nós boas pessoas. Precisamos ser bons antes de poder fazer o bem.' 
and tag in ('FÉ E OBRAS','FRUTOS','SANTIDADE', 'JUSTIFICAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Faça todo o bem que puder, de todas as formas, a todas as pessoas, enquanto for possível.' 
and tag in ('FÉ E OBRAS','FRUTOS','SANTIDADE', 'JUSTIFICAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dizem que onde há fumaça há fogo, mas a fumaça pode ser nada mais do que poeira e nevoeiro.' 
and tag in ('DIFAMAÇÃO','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não creia em metade do que você ouve; não repita metade do que crê; quando ouvir uma notícia negativa, divida-a por dois, depois por quatro, e não diga nada acerca do restante dela.'  and tag in ('DIFAMAÇÃO','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A bondade existente no coração sobe até o rosto e imprime ali sua beleza.' 
and tag in ('ÉTICA','MORALIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Podemos fazer mais sendo bons do que de qualquer outra forma.' 
and tag in ('ÉTICA','MORALIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A bondade é o único investimento que nunca falha.' 
and tag in ('ÉTICA','MORALIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A bondade de Deus é a raiz de toda bondade; e a nossa bondade, se temos alguma, origina-se em Sua bondade.' 
and tag in ('ÉTICA','MORALIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Calúnia é algo que entra pelo ouvido e sai pela boca extremamente ampliado.' 
and tag in ('DIFAMAÇÃO','BOATOS','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não pode ser infligida aos homens injúria maior do que lhes ferir a reputação.' 
and tag in ('DIFAMAÇÃO','BOATOS','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A calúnia é um defeito que golpeia duplamente, ferindo tanto aquele que a comete quanto aquele contra quem é cometida.' 
and tag in ('DIFAMAÇÃO','BOATOS','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A caridade dá a si mesma riqueza, a cobiça toma e continua pobre.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A caridade é o próprio uniforme de Cristo.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A maior caridade do mundo é a comunicação da verdade divina àqueles que a desconhecem.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O maior brilho de inteligência é de valor incalculavelmente mais baixo do que a menor fagulha de caridade.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O lugar da caridade é como o de Deus: em toda parte.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A caridade é o melhor caminho para a abundância; quem mais dá, mais recebe.' 
and tag in ('GENEROSIDADE','DAR','AMABILIDADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Assim como pela criação Deus de um fez dois, pelo casamento, ele de dois fez um.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não olhe a seu redor procurando com quem vai se casar; olhe para cima. Qualquer escolha diferente da de Deus significará um desastre.'  and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Casamento é mais do que encontrar a pessoa certa; é ser a pessoa certa.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca se una a alguém que se recuse unir-se a Cristo.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O compromisso de tomar uma mulher como esposa leva o homem a compartilhar toda sua vida com ela.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Como terminariam logo as sessões de aconselhamento matrimonial se maridos e esposas competissem seriamente em negar-se a si mesmos.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus fez o casal humano de tal forma que é natural ao marido liderar, e à esposa seguir.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os filhos de um homem são pedaços dele, mas a esposa é ele próprio.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A mulher foi feita de uma costela tirada do lado de Adão; não de sua cabeça para governar sobre ele, nem de seu pé para ser pisada por ele; mas de seu lado, para ser igual a ele, debaixo de seu braço para ser protegida, e perto de seu coração para ser amada.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um mais um é igual a um pode não ser um conceito matemático correto, mas é uma descrição exata da intenção de Deus para a relação matrimonial.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus é testemunha de toda cerimônia de casamento, e será testemunha de qualquer violação de seus votos.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um casamento bem-sucedido é sempre um triângulo: o homem, a mulher e Deus.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus não criou a mulher para ser uma competidora, mas, sim, uma companheira.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Antes de ter qualquer outra vocação, o homem foi chamado para ser marido.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há sempre o perigo de o casamento tirar o gume afiado da paixão por Jesus e pelas almas.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Procure elogiar sua esposa, mesmo que isso a amedronte a princípio.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor de Deus amarra com tanta força os laços do matrimônio que nem a morte nem o inferno podem desatá-los.' 
and tag in ('VIDA EM FAMÍLIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A censura é um negócio que pode ser feito com muito pouco capital.' 
and tag in ('CRÍTICAS-RECEBIDAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A censura é um talento que deve ser enterrado.' 
and tag in ('CRÍTICAS-RECEBIDAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As pessoas que têm por objetivo encontrar falhas, raramente encontram outra coisa.' 
and tag in ('CRÍTICAS-RECEBIDAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada é mais fácil de encontrar do que falhas.' 
and tag in ('CRÍTICAS-RECEBIDAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando estiver procur ando falhas para corrigir, olhe para o espelho.'  and tag in ('CRÍTICAS-RECEBIDAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O céu é uma realidade não vista pelos olhos de carne, manifestada pela revelação e recebida pela fé.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O céu é um lugar preparado para pessoas preparadas.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os que vivem no Senhor nunca se vêem uns aos outros pela última vez.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em nosso primeiro paraíso, o Éden, havia um caminho de saída, mas não havia forma de entrar de novo. Mas, quanto ao paraíso celestial, há um caminho de entrada, mas não há forma de sair de novo.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um cachorro sente-se em casa neste mundo porque este é o único mundo em que um cachorro viverá. Nós não nos sentimos em casa neste mundo porque fomos feitos para um mundo melhor.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os que conhecem a Deus e a Cristo já estão nos arredores da vida eterna.' 
and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Minha opinião acerca de tudo o que me acontece dever ser regida por estas três coisas: a compreensão que tenho acerca de quem sou, a consciência que tenho de para onde vou, indo e o conhecimento que tenho do que me espera quando eu chegar lá.'  and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando chegar ao céu, verei ali três coisas impressionantes: a primeira será ver muita gente que não esperava ver ali; a segunda será não encontrar muita gente que esperava ali encontrar; e a terceira e mais maravilhosa de todas, será encontrar a mim mesmo ali.'  and tag in ('VIDA ETERNA','SEGURANÇA ETERNA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os ciúmes são a matéria-prima do homicídio.' 
and tag in ('INVEJA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Muitas coisas agradáveis passam ao largo da vida quando os ciúmes assumem o poder.'  and tag in ('INVEJA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os ciúmes nunca se consideram fortes o bastante.' 
and tag in ('INVEJA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A caridade dá a si mesma riqueza; a cobiça toma e continua pobre.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Muitas tribulações são causadas porque nossos sonhos são maiores do que nossos ganhos.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cobiça é a doença que está fazendo secar a vida de nossa igreja em todos os sentidos.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quem sempre se contenta, embora tenha pouco é muito mais feliz, do que aquele que está sempre cobiç
ando, embora tenha muito.'  and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A alma do homem é infinita naquilo que cobiça.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cuidado... com o início da cobiça, pois você não sabe onde ela terminará.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Pode-se cobiçar quando se tem pouco, muito ou o suficiente, pois a cobiça vem do coração e não das circunstâncias da vida.'  and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cobiça está no começo e no fim do alfabeto do diabo o primeiro defeito que aparece na natureza corrupta e o último que morre.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cobiça é o embriaguez sem bebida.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há melhor antídoto contra cobiçar aquilo que é dos outros do que satisfazer-se com o que é seu.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A coceira da cobiça faz com que o homem meta a unha em tudo o que é dos outros.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tenho ouvido milhares de confissões, mas jamais alguma sobre a cobiça.' 
and tag in ('GANÂNCIA', 'GLUTONARIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Compaixão é o que faz uma pessoa sentir dor quando a outra é ferida.'  and tag in ('AMABILIDADE','AMOR PELOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As pessoas não irão interessar-se pelo que você sabe até saberem que você se interessa.' 
and tag in ('AMABILIDADE','AMOR PELOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão deve demonstrar pela compaixão o mesmo interesse que demonstra pelas doutrinas.' 
and tag in ('AMABILIDADE','AMOR PELOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há melhor exercício para o coração do que abaixar-se e levantar os outros.' 
and tag in ('AMABILIDADE','AMOR PELOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus se interessa, Deus se preocupa. E, visto que ele se interessa, seu povo também tem a obrigação de interessar-se pelos outros.' 
and tag in ('AMABILIDADE','AMOR PELOS OUTROS','MISERICÓRDIA PELOS OUTROS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O golpe fatal para o progresso é a auto-satisfação.' 
and tag in ('APATIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum cristão deve ser complacente com sua condição espiritual.' 
and tag in ('APATIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando nos sentimos melhor est ando despreocupados, qu ando todas as coisas correm de acordo com nossa vontade e prazer, é então que, muitas vezes, estamos mais longe de Deus.'  and tag in ('APATIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A calma que nos faz dormir pode ser mais fatal do que uma tempestade que nos mantém bem acordados.' 
and tag in ('APATIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A complacência é inimiga mortal do progresso espiritual.' 
and tag in ('APATIA','INDIFERENÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem é feito para a sociedade, e os cristãos, para a comunhão dos santos.' 
and tag in ('AMIZADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não devemos impor nenhuma condição para a aceitação de nossos irmãos, a não ser as que Deus impôs para aceitá-los.' 
and tag in ('AMIZADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para os primeiros cristãos, koinonia não era a "comunhão" enfeitada de passeios quinzenais patrocinados pela igreja. Não era chá, biscoitos e conversas sofisticadas no salão social depois do sermão. Era um compartilhar incondicional de suas vidas com os outros membros do corpo de Cristo.' 
and tag in ('AMIZADE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Usemos o mundo, mas deleitemo-nos no Senhor.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ligar-se a Cristo é o segredo de desligar-se do mundo.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quanto mais amamos a Cristo, mais temos prazer em estar a sós com Ele. Os que se amam gostam de estar a sós uma com a outra.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você não vive em Cristo, está morto para Deus.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Uma masmorra com Cristo é um trono, e um trono sem Cristo é um inferno.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Agradar a Cristo é viver uma vida em comunhão tão profunda com Ele que a nossa maneira de viver é caracterizada pela ansiedade de conhecer todos os Seus desejos.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em quarenta anos nunca passei quinze minutos acordado sem pensar em Jesus.' 
and tag in ('AMOR A CRISTO','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você é um fracasso em sua vida de devoção, é um impostor em todas as outras coisas.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus sente prazer em nós quando sentimos prazer nEle.'  and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A comunhão com Deus é o princípio do céu.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tenho mais a ver com Deus do que com o mundo todo; sim, mais relação com Ele em um dia do que com todo o mundo a vida toda.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Olhe para a Fonte; só o fato de olhar lhe dará sede.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem que vive perto de Deus vive em vão.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Estar pouco com Deus é fazer pouco para Deus.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão pode ter uma comunhão tão preciosa com Deus quando seus olhos estão rasos dágua como qu ando seu coração está cheio de gozo.'
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O acesso a Deus está aberto somente para seus verdadeiros adoradores.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Posso suportar a perda de todas as coisas, exceto do toque de Deus na minha vida.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Comunhão com Deus significa luta com o mundo.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Embora a alma piedosa sempre deseje mais de Deus, ela nunca deseja mais do que Deus.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Esperar em Deus é viver uma vida desejosa de sua pessoa. É deleitar-se em Deus, depender dele e consagrar-se a ele.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um período de tempo diário adequado para esperar em Deus... é a única maneira pela qual posso escapar da tirania das coisas urgentes.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se gastarmos dezesseis horas por dia em contato com coisas desta vida e apenas cinco minutos por dia em contato com Deus, será de admirar que as coisas desta vida sejam para nós duzentas vezes mais reais do que Deus?' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Atualmente estou tão ocupado que não posso passar menos de quatro horas por dia na presença de Deus.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Devo gastar as melhores horas do dia em comunhão com Deus. É a minha ocupação mais nobre e mais frutífera, e não deve ser colocada em segundo plano.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As gr
andes águias voam sozinhas; os gr andes leões caçam sozinhos; as gr andes almas  andam sozinhas, sozinhas com Deus.'  and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem jamais disse no final de seus dias: "Li a Bíblia, pensei em Deus, orei e cuidei de minha alma demasiadamente!"' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não é suficiente ter comunhão com a verdade, pois esta é impessoal. Precisamos ter comunhão com o Deus da verdade.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O meu Deus e eu somos bons companheiros.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A água não se perde quando é despejada no mar, pois ali ela está em seu próprio ambiente. O cristão não se perde qu ando se lança sobre seu Senhor, sobre seu Salvador.'  and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se formos fracos em nossa comunhão com Deus, seremos fracos em tudo.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tirem tudo o que tenho, mas não tirem a doçura de andar e conversar com o Rei da glória! '  and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus não se curvou à nossa pressa nervosa, nem adotou os métodos de nossa era mecânica. O homem que deseja conhecer a Deus precisa dedicar-lhe tempo.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Só absortos em Deus, podemos manter um entusiasmo espiritual perpétuo, porque só Deus pode suprir novidade perene.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nas maiores profundezas da vida, os homens não falam a respeito de Deus, mas falam com Ele mesmo.' 
and tag in ('AMOR A DEUS','MEDITAÇÃO','ORAÇÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A confissão dos pecados não substitui o ato de abandoná-los.'  and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A confissão de pecados coloca a alma debaixo da bênção de Deus.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Antes de Deus poder libertar-nos, precisamos desenganar a nós mesmos.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O fato de alguém reconhecer que é pecador não é maior convicção de pecado do que crer na verdade acerca de Jesus é fé salvadora.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os pecados ocultados pelo homem nunca são cancelados por Deus.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Confessar pecados não é informar a Deus, é concordar com Ele.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Gr
ande parte de nossa dignidade está em reconhecer nossa indignidade.'  and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A maneira de cobrir nosso pecado é descobri-lo pela confissão.' 
and tag in ('CONTRIÇÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conhecimento dirige a consciência; a consciência aperfeiçoa o conhecimento.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A prática é a alma do conhecimento.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ter consciência da própria ignorância é um grande passo na direção do conhecimento.'  and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ignorância é sua enfermidade; o conhecimento deve ser sua cura.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conhecimento que incha por fim murchará.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Conhecimento na cabeça é como dinheiro guardado; conhecimento no coração é como dinheiro bem usado.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não se pode encontrar o conhecimento reorganizando-se a própria ignorância.'  and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A ação é o fruto adequado do conhecimento.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conhecimento não passa de tolice, a não ser que seja guiado pela graça.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conhecimento sem integridade é perigoso e terrível.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os pecados de omissão são agravados pelo conhecimento.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'De que adianta o conhecimento mais profundo se tivermos os corações mais superficiais? ' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira fé e o conhecimento salvador andam de mãos dadas.'  and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ter orgulho do que se sabe é demonstração da maior ignorância.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O conhecimento são os olhos que devem dirigir os pés da obediência.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Muito do conhecimento de um homem pode ser uma tocha que ilumina seu caminho para o inferno.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A morte do conhecimento não é a ignorância, mas a ignorância da ignorância.' 
and tag in ('INSTRUÇÃO','MENTE','RAZÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Consagração é resolução que não tem medo de sacrifício.' 
and tag in ('DEDICAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O corpo tem dois olhos, mas a alma deve ter apenas um.' 
and tag in ('DEDICAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus pode fazer maravilhas com um coração quebrantado, se você lhe entregar todos os pedaços.' 
and tag in ('CONFISSÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A tristeza espiritual é um dom de Deus. Não há mão, a não ser a divina, que possa tornar o coração leve e sensível diante da visão e da convicção do pecado.' 
and tag in ('CONFISSÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O coração quebrantado é o único coração sadio.' 
and tag in ('CONFISSÃO','CONVICÇÃO DE PECADO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A conversão é uma obra profunda, uma obra no coração. Ela invade o homem, a mente, os membros e toda a vida.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O pecado deforma; a escola informa; Cristo transforma.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Lembro-me de que tudo parecia-me novo... os campos, o gado, as árvores. Eu era como um homem novo em um mundo novo.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A conversão não é um processo suave e fácil como algumas pessoas imaginam; se assim fosse, o coração do homem jamais teria sido comparado a um solo não cultivado, e a Palavra de Deus, a um arado.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Regeneração é mudança espiritual; conversão é ação espiritual.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A conversão não é nada mais do que o primeiro passo na vida cristã. Enquanto vivermos teremos cada vez mais de dar as costas para tudo o que é mau, volt
ando-nos para tudo o que é bom.'  and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A reflexão é o primeiro passo em direção à conversão.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Sem conversão, não há salvação.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Regeneração é um ato único, completo em si mesmo e jamais repetido; conversão, como início da vida santificada, é o começo de um processo constante, infindável e progressivo.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O grande poder de Deus na conversão de um pecador é a mais misteriosa de todas as suas obras.'  and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As conversões precisam ser examinadas tanto quanto enumeradas.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Descobri que não havia apenas me convertido, eu fora invadida.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira conversão dá segurança à pessoa, mas não lhe confere o direito de parar de vigiar.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira conversão dá força e santidade ao homem, mas nunca lhe permite vangloriar-se.' 
and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando a Palavra de Deus converte um homem, tira dele seu desespero, mas não seu arrependimento.'  and tag in ('FÉ SALVADORA','REGENERAÇÃO','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Uma lei universal da vida cristã é que, quanto mais maduro um homem se torna, mais sensível ao pecado ele fica.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'À medida que nosso coração é lavado, tornamo-nos mais sensíveis de sua contaminação restante, da mesma forma como ficamos mais perturbados com uma única mancha em um casaco novo do que com mil em um velho.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem começa a ser bom enquanto não se considera mau.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quanto mais santo, maior a consciência de pecado.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cristo não é doce enquanto o pecado não se faz amargo para nós.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A convicção de pecado é a convicção de um estado pecaminoso... é a convicção de um relacionamento errado com Deus, de ter ficado completamente aquém do que o homem deveria ser.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando os homens começam a se queixar mais de seus pecados do que de suas aflições, começa a surgir alguma esperança para eles.'  and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não tenho outro nome, senão o de pecador; pecador é meu nome; pecador, meu sobrenome.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O reconhecimento do pecado é o começo da salvação.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Você não pode ordenar que a convicção de pecado surja quando você quiser.'  and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Em sua essência, convicção de pecado é a percepção de que seu relacionamento com Deus está errado.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Recordando as multiformes bênçãos de Deus, aquela que me parece ser mais digna de gratidão é a convicção de pecado.'  and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Enquanto o homem não passa por dificuldades com seu coração, provavelmente não sairá das dificuldades com Deus.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum homem pode sentir o pecado, a não ser pela graça.' 
and tag in ('CONFISSÃO','CONTRIÇÃO','PENITÊNCIA','ARREPENDIMENTO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os Himalaias são as letras em relevo sobre as quais nós, filhos cegos, passamos nossos dedos para pronunciar o nome de Deus.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A razão simples, solitária, sublime, que a Bíblia atribui a cada coisa em toda a criação é que ela veio à existência pela vontade de Deus, porque Ele decidiu que deveria existir. Para o incrédulo, nenhuma explicação mais profunda é possível; para o crente, nenhuma é necessária.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus não é um imitador, o diabo o é, pois não pode ser outra coisa; todas as coisas que Deus faz são originais.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A probabilidade de a vida ter surgido por acidente é comparável à probabilidade de um dicionário completo ser resultado da explosão em uma indústria gráfica.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se o universo pudesse ter criado a si mesmo, incorporaria os poderes de um criador, e seríamos forçados a concluir que o universo propriamente dito é um deus.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tudo o que tenho visto ensina-me a confiar no Criador quanto a tudo o que não vejo.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cada obra de Deus serve para mostrar Sua glória e realçar a grandeza de Sua majestade.'  and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há nenhuma teoria sobre o universo que não necessite de um deus para fazê-lo funcionar.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O argumento da organização é irresistível. A natureza realmente dá testemunho de seu Criador.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ninguém pode alegar que é ignorante da existência de Deus. Pode-se ver claramente que existe algo Invisível.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A posteridade algum dia rirá da loucura do materialismo filosófico moderno. Quanto mais estudo a natureza, mais fico assombrado com o Criador.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cada uma das obras de Deus é grandiosa à sua maneira. Todos os anjos e todos os homens unidos não poderiam criar um gafanhoto.'  and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A suprema justificação para toda a criação é que Deus desejou sua existência.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para que o universo tivesse sido formado por uma confluência fortuita de átomos, eu deveria acreditar que qualquer confusão acidental do alfabeto geraria o mais engenhoso tratado de filosofia.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O que pode ser mais insensato do que imaginar que toda esta excelente estrutura dos céus e da terra surgiram por acaso, quando toda a habilidade da arte não é capaz de construir uma ostra?'  and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A criação é tanto um monumento ao poder de Deus quanto um espelho através do qual podemos ver sua sabedoria.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Criar requer poder infinito. O mundo todo não pode criar uma mosca.' 
and tag in ('EVOLUÇÃO','NATUREZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão é um homem possuído.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As ovelhas de Cristo são marcadas na orelha e no pé; elas ouvem a sua voz e o seguem.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os melhores cristãos que existem entre nós são apenas cristãos em formação. De forma alguma são produtos acabados.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão é chamado para viver uma vida sobrenatural, e a ele foi dado o poder para viver essa vida.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão não é alguém que teve um novo começo em sua vida, mas aquele que recebeu uma vida nova para começar com ela.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhum verdadeiro cristão pertence a si mesmo.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Entramos na família cristã por vocação e somos identificados nela por meio do caráter.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você fosse preso por ser cristão, haveria provas suficientes para condená-lo? ' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você é cristão, não é um cidadão deste mundo tentando chegar ao céu; mas, sim, um cidadão do céu abrindo caminho através deste mundo.'  and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Considero cristão de fato aquele que não se envergonha do evangelho nem é uma vergonha para ele.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cristãos são feitos; não nascem prontos.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um Cristo que não esteja em nós é um Cristo que não é nosso.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há um fato único que se pode colocar contra toda a perspicácia e argumentos dos incrédulos, a saber, que nenhum homem jamais se arrependeu de ser cristão em seu leito de morte.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Um santo não é meramente um seguidor professo de Cristo, mas um seguidor professo conhecido pelo que professa.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada perdem os que ganham a Cristo.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão é uma pessoa estranha. Ele está tanto morto como vivo, é miserável e glorioso... Dirige-se para baixo e para cima ao mesmo tempo; pois, à medida que ele morre em pecado e miséria, e a morte natural aproxima-se, vive a vida da graça e cresce cada vez mais até alcançar a glória.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para um homem que vive para Deus nada é secular, tudo é sagrado.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cristão foi transplantado para um novo solo e um novo clima; tanto o solo como o clima são Cristo.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Num sentido os santos do Senhor são um povo à parte, pertencendo-se mutuamente de um modo em que não pertencem a ninguém mais.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os cristãos são retratos ambulantes de Deus.' 
and tag in ('CRISTIANISMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Apagar a estrela dos outros não faz a sua brilhar mais.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca aponte o dedo para as falhas dos outros a não ser que ele faça parte da mão que irá ampará-los.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O melhor lugar para criticar o próximo é na frente do seu espelho.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O crítico que começa consigo mesmo não terá tempo para criticar os outros.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nós, cristãos, jamais pensaríamos em atropelar intencionalmente outras pessoas com nosso carro; então, por que o faríamos com nossas palavras?' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Lembre-se de que sempre que você atira barro em alguém, está perdendo terreno.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem que parece muito preocupado com a degradação dos outros está normalmente preocupado com a promoção de si mesmo.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É muito mais fácil ser crítico do que ser correto.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Limpe seus dedos antes de apontar para minhas manchas.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ninguém é tão crítico das pequenas falhas quanto os culpados das grandes.'  and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se não estivermos dispostos a ajudar uma pessoa a vencer suas falhas, há pouco valor em apontá-las.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Duas coisas fazem muito mal ao coração: subir correndo escadas e criticar pessoas.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem que está muito ocupado em censurar os outros está sempre pouco ocupado em examinar a si próprio.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A crítica é a afirmação do sentimento de superioridade.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A censura é um pecado agradável, extremamente complacente com nossa natureza.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Preferiria brincar com relâmpagos ou segurar em fios de alta tensão com sua corrente faiscante a pronunciar uma palavra precipitada contra qualquer servo de Cristo.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Apedrejar profetas é um trabalho inútil.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O desejo de desgraçar os outros jamais teve origem na graça.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há maneira mais rápida de um homem fazer com que suas palavras sejam questionadas do que tentar diminuir o valor dos outros.' 
and tag in ('CRÍTICAS RECEBIDAS','CENSURA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se os homens falarem mal de você, viva de forma que ninguém creia neles.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não é só justo como também dever do cristão evitar ofender-se tanto quanto evitar ofender.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca tenha medo de testar a si mesmo com suas próprias palavras críticas.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Preferiria que mestres verdadeiros e fiéis me repreendessem e me condenassem, e até mesmo reprovassem meus caminhos, a que hipócritas me bajulassem e me aplaudissem como santo.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando os outros nos chutam, algumas vezes isso é sinal de que estamos à frente deles.'  and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se vocês não fossem estranhos aqui, os cães do mundo não latiriam para vocês.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ficar irritado com as críticas é reconhecer que elas foram merecidas.' 
and tag in ('CRÍTICAS FEITAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz é o preço do meu perdão.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz de Cristo sempre será ofensiva para o homem natural.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O Justo sobre a cruz é o único ponto de contato entre o pecador e o poder salvador de Deus.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Livre para atrair por seu poder intrínseco, a cruz continua sendo o ímã das almas dos homens.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O elemento surpreendente da cruz não é o sangue, mas o sangue de quem e com que propósito.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz é o centro da história do mundo. A encarnação de Cristo e a crucificação de nosso Senhor são o centro ao redor do qual circulam todos os eventos de todos os tempos.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quem na verdade contemplou a cruz de Cristo não pode jamais falar de casos sem esperança.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O poder salvador da cruz não depende de um acréscimo de fé; trata-se de um poder salvador tão grande que a própria fé flui dele.'  and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Este acontecimento único da cruz de Cristo é uma revelação final tanto do caráter e da conseqüência do pecado humano quanto da maravilha e do sacrifício do amor divino.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A cruz de Cristo é a coisa mais revolucionária que já apareceu entre os homens.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O Calvário mostra como os homens podem ir longe no pecado, e como Deus pode ir longe para salvá-los.' 
and tag in ('EXPIAÇÃO','JESUS CRISTO - MORTE')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A culpa é o próprio cerne da tristeza.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem cai de acordo com as disposições da providência de Deus, mas cai também por suas próprias faltas.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O pavor de Deus é efeito da culpa.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A culpa é para o perigo o que o fogo é para a pólvora.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada é mais pessoal do que a culpa.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A culpa relaciona-se com o pecado da mesma forma como o lugar queimado relaciona-se com a labareda.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É o sentimento de culpa que nos faz ter vergonha de Deus.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A culpa está universalmente presente na alma humana, e não podemos tratar dela sem tratar das interrogações religiosas que ela levanta.' 
and tag in ('DEPRAVAÇÃO','HOMEM','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você não dá alguma coisa que Deus quer que você dê, você não a possui; ela o possui.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Devemos contribuir de acordo com nossa renda, para que Deus não faça com que nossa renda torne-se proporcional ao que damos.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dê a todos, para que a pessoa a quem você não der não venha a ser o próprio Cristo.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O que nos torna ricos neste mundo não é o que tomamos, mas sim o que damos.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Seu dinheiro pode fazer de você um missionário no estrangeiro sem que jamais deixe sua cidade, um evangelista sem nunca subir a um palanque, um pregador-radialista sem nunca ter entrado em um estúdio, um mestre da Bíblia sem nunca ter escrito um livro.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É possível dar sem amor, mas é impossível amar sem dar' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'De quantas maldições e humilhações ficaríamos livres se o povo de Deus contribuísse conforme as Escrituras orientam.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Estou convencido de que não há assunto sobre o qual a consciência cristã esteja mais mal-informada do que o da contribuição.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O que gastamos em piedade e caridade não é tributo pago a um tirano, mas resposta de gratidão a nosso Redentor.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Trabalhe arduamente, consuma pouco, dê muito, e tudo a Cristo.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ganhamos a vida pelo que recebemos. Vivemos a vida pelo que damos.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dá duas vezes aquele que dá rapidamente.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se queremos que Deus abra seu tesouro, precisamos abrir o nosso.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nós perguntamos quanto o homem dá; Cristo pergunta quanto ele retém.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não darei valor às orações, ainda que intensas e freqüentes, de quem não dá esmolas de acordo com sua capacidade.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando damos a Deus tudo o que temos e somos, entregamos-lhe simplesmente o que lhe pertence.'  and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há três espécies de contribuição: com ressentimento, por dever e com ações de graça. A contribuição com ressentimento diz: "Tenho de fazê-lo"; a contribuição por dever diz: "Devo fazê-lo"; a contribuição com ações de graças diz: "Quero fazê-lo".' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A graça não torna a contribuição algo opcional.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A única maneira de termos mais do que o suficiente para poupar é dar a Deus mais do que conseguimos poupar.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Muitos homens ficam de mãos vazias porque não conhecem a arte de repartir.' 
and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se eu deixar mais de dez libras, vocês e toda a humanidade serão testemunhas de que vivi e morri como ladrão e bandido.'  and tag in ('CARIDADE','GENEROSIDADE','AMABILIDADE','DÍZIMO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A grandeza do poder de um homem é a medida de sua capacidade de rendição.'  and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Hoje estive diante de Deus e entreguei-lhe tudo o que tenho e o que sou, de forma que já não pertenço a mim mesmo de modo nenhum. Eu me entreguei completamente a Ele.' 
and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não darei nenhum valor a qualquer coisa que eu tenha ou venha a possuir, a não ser que tenham valor para o reino de Cristo.' 
and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Antes de podermos orar: "Venha o Teu reino", precisamos estar dispostos a orar: "Que o meu reino se vá".' 
and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cristianismo é a dedicação total de tudo o que conheço a meu respeito a tudo o que conheço a respeito de Jesus Cristo.' 
and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se todo o reino da natureza fosse meu, Seria mui pequena oferta dá-lo a Deus; Oh! Que amor maravilhoso, que amor tão divinal! Desejo dar minha alma, minha vida, meu ser total! ' 
and tag in ('CONSAGRAÇÃO','SUBMISSÃO','ZELO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Visto que o homem é depravado, ele não fará perguntas de valor eternal enquanto não for acordado de sua ilusão temporal.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Por ocasião da queda, os dons naturais do homem foram corrompidos pelo pecado, enquanto seus dons sobrenaturais perderam-se completamente.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A pessoa não convertida está deliberadamente fora de rumo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nascemos em pecado e passamos a vida lutando contra suas conseqüências.'  and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Existe a semente de todos os pecados, dos pecados mais vis e piores, no melhor dos homens.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem está naturalmente disposto a coroar qualquer coisa, menos Cristo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nossos corações corrompidos são oficinas do diabo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Devemos nossa criação a Deus, e nossa corrupção a nós mesmos.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando olho para meu coração e enxergo minha iniqüidade, ele parece um abismo infinitamente mais profundo do que o próprio inferno.'  and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando nos conhecemos melhor, descobrimos que somos mais depravados do que pensávamos.'  and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem não está evoluindo na direção do conhecimento de Deus. Ele foi criado com o conhecimento de Deus e desde então tem caminhado na direção oposta.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A graça não corre no sangue, mas a corrupção sim. Pecador gera pecador, mas santo não gera santo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem nasceu e vive em pecado; ele não pode fazer nada em favor de si mesmo, pois só é capaz de prejudicar-se a si mesmo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se ficasse por conta dos pecadores, totalmente depravados como são, a iniciativa de reagir com fé ao evangelho, por sua própria vontade, nenhum deles tomaria essa iniciativa.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tão grande é a depravação do homem não-regenerado que, embora não haja nada que ele necessite mais do que o evangelho, não há nada que ele deseje menos.'  and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O pecado original está em nós como a barba. Barbeamo-nos hoje, parecemos apresentáveis e nosso rosto está limpo; amanhã nossa barba cresce de novo, e não pára de crescer enquanto permanecemos na terra. De maneira semelhante, o pecado original não pode ser extirpado de nós; ele brotará em nós enquanto vivermos.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Depravação total significa... que a conversão está além da capacidade do homem natural.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nascemos iníquos; cada um tende a agradar a si mesmo, e a tendência de agradar ao eu é o início de toda a desordem.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os mais profundos problemas do homem estão dentro dele mesmo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se Deus não fosse onisciente, o coração humano iria enganá-lo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É em nosso coração que está o mal, e é de lá que ele precisa ser arrancado.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Jamais houve mãe que tivesse ensinado seu filho a ser um incrédulo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ai de nós! Nosso coração é nosso maior inimigo.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem é um vilão infame. É corrupto por natureza e posteriormente pela prática.' 
and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A depravação é o grande obstáculo à fé, mas... a graça é a maneira pela qual Deus supera esse obstáculo.'  and tag in ('CULPA','HOMEM UM PECADOR','PECADO','NATUREZA PECAMINOSA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nossos sentimentos de depressão e desespero contam mais a nosso respeito do que a respeito de como as coisas realmente são.' 
and tag in ('DESESPERO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os principais perigos para a mente do cristão são a depressão e o desânimo.' 
and tag in ('DESESPERO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O sábio não deseja mais do que pode conseguir de maneira justa, usar de modo sóbrio, distribuir com alegria e abandonar com contentamento.'  and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Freqüentemente desejamos muito mais aquilo que não devemos ter.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A vida do cristão é um estado de desejo santo.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A inclinação constante do coração dos crentes é para o bem, para Deus, para a santidade, para a obediência.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se todos os nossos desejos fossem satisfeitos, a maioria dos nossos prazeres seria destruída.' 
and tag in ('CONCUPISCÊNCIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O desespero é a esperança totalmente morta; a presunção é a esperança totalmente louca.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O desespero é uma obra-prima de Satanás; leva os homens diretamente para o inferno, assim como os demônios precipitaram a manada de porcos no abismo.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O desespero é o desânimo do inferno, assim como a alegria é a serenidade do céu.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que se desespera avilta a Divindade.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca desesperarei, pois tenho um Deus; nunca agirei presunçosamente, pois não passo de um homem.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Você pode desesperar de si mesmo o quanto quiser, mas nunca de Deus.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus não desespera de você; portanto, você não deve desesperar de si mesmo.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Desespero e desânimo andam de mãos dadas.'  and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É impossível que entre em desespero o homem que lembra que seu Ajudador é onipotente.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Desespero é a obra-prima de Satanás.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O desespero destrói a capacidade de fazer empreendimentos.' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca desesperaremos enquanto tivermos Cristo como nosso líder!' 
and tag in ('DEPRESSÃO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Uma das características da rebelião espiritual é trilhar caminhos escusos.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada ofende mais a Deus do que a fraude nas relações pessoais.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O que é mal ganho nunca servirá bem.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nenhuma iniqüidade da terra é mais comum do que o engano em suas várias formas.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O afastamento da verdade testifica que primeiro a pessoa despreza a Deus e depois teme ao homem.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se não houvesse leis contra o roubo, muitos de nós seriam ladrões.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Toda vez que o cristão sonega seu imposto de renda perverte e obscurece o evangelho.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Oh! que teia emaranhada estamos a preparar, Quando o terrível engano começamos a praticar.'  and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A morte honesta é melhor do que uma vida desonesta.' 
and tag in ('MENTIRA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não é a teologia que faz de um homem de valor aquilo que ele é, mas sim, a "trabalhologia".' 
and tag in ('PERSEVERANÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Cristo não deseja pessoas que se contentam com o possível, mas que agarram o impossível.' 
and tag in ('PERSEVERANÇA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dever adiado dá prazer ao diabo.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se Deus nos dá de si mesmo em promessas, precisamos dar-nos a ele em deveres.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Seu dever e glória é fazer todos os dias voluntariamente o que faríamos no último dia de nossa vida.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A negligência do dever nunca aliviará o sentimento de culpa da consciência.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Doutrina sem dever é uma árvore sem frutos; dever sem doutrina é uma árvore sem raízes. Talbot W.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A eternidade não pode libertar-nos do dever.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A recompensa de um dever cumprido é o poder para cumprir outro.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os que dão a Deus apenas a sombra do dever nunca podem esperar dele uma verdadeira recompensa.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que abandona o dever depressa será ab andonado para cometer um delito.'  and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando a lei de Deus está escrita em nosso coração, nosso dever é nosso prazer.'  and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não saiamos do caminho do dever, para que não entremos no caminho do perigo.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Você não consideraria pequeno nenhum dever, se você mesmo fosse grande.'  and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quem escapa de um dever evita um ganho.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O dever prepara o coração para o dever.' 
and tag in ('RESPONSABILIDADE','SERVIÇO')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Difamação é o mau hálito do cérebro.' 
and tag in ('BOATOS','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Ninguém tem língua difamatória sem ter ouvidos difamatórios.' 
and tag in ('BOATOS','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quem contar fofocas para você fofocará de você.' 
and tag in ('BOATOS','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Afirmo isto como um fato: se todas as pessoas soubessem o que cada uma diz da outra, não haveria quatro amigos no mundo.' 
and tag in ('BOATOS','CALÚNIA','PALAVRAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dinheiro é como a água do mar: quanto mais uma pessoa bebe, mais sede sente.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há bolsos em uma mortalha.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Você pode apagar o sol se colocar uma moeda bem perto do olho.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dinheiro é como esterco: só é bom se for espalhado.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Poucas coisas testam mais profundamente a espiritualidade de uma pessoa do que a maneira como ela usa o dinheiro.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O amor ao dinheiro é para a igreja um mal maior do que a soma de todos os outros males do mundo.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Tempo e dinheiro são os fardos mais pesados da vida, e os mortais mais infelizes são os que os têm mais do que são capazes de usar bem.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A verdadeira medida de nossa riqueza está em quanto valeríamos se perdêssemos todo nosso dinheiro.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que serve a Deus por dinheiro servirá ao diabo por salário melhor.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se a religião de um homem não afeta a maneira como ele usa o dinheiro, a religião desse homem é vã.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A chave de todo o nosso relacionamento com o dinheiro está na atitude de nossa mente para com ele.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem mais pobre que conheço é aquele que não tem nada mais do que dinheiro.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dois terços de todas as lutas, brigas e processos judiciais no mundo originam-se de uma simples causa: dinheiro.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Mamom é o maior senhor de escravos do mundo.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O dinheiro ainda não deixou ninguém rico.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dinheiro, o maior deus debaixo do céu.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nada do que é de Deus é obtido com dinheiro.' 
and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando tenho um pouco de dinheiro, livro-me dele tão logo seja possível, para que ele não encontre o caminho de meu coração.'  and tag in ('LUXO','MATERIALISMO','PROSPERIDADE','RIQUEZA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus sempre ilumina seus túneis.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Posso afirmar, por experiência própria, que 95% do conhecimento da vontade de Deus consiste em estar preparado para cumpri-la antes de conhecê-la.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O Senhor não brilha sobre nós, exceto quando tomamos sua Palavra como nossa luz.'  and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aconselhe-se com Deus. Os céus elevam-se acima do inferno. A qualquer momento, Deus pode revelar-nos quais tramas estão sendo maquinadas lá contra você.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O diabo pode dirigi-lo de forma extraordinária... Há poderes que podem simular quase todas as coisas na vida cristã.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não sei por quais caminhos Deus me conduz, mas conheço bem meu guia.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A vida do crente é um passeio dirigido, e o habilidoso guia é o guia de Abraão e o nosso guia. Ele conhece o final da jornada em vista e o melhor caminho para chegar lá.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Onde a glória de Deus repousa, não precisamos perguntar o caminho.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus promete guiar-nos não para livrar-nos da responsabilidade de pensar.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A Bíblia não é uma espécie de horóscopo por meio do qual descobrimos nosso futuro... Eu não nego que Deus algumas vezes revele sua vontade particular iluminando um versículo das Escrituras. Mas este não é seu método habitual, e é altamente perigoso seguir tal suposta direção sem verificá-la e confirmá-la.'  and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Minha convicção deliberada é de que o único caminho para chegar ao conhecimento da vontade divina com respeito a nós passa pela simplicidade de objetivos e pela oração fervorosa.' 
and tag in ('VONTADE DE DEUS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando Deus omite a correção, entra pelas portas a condenação.'  and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus sempre avisa antes de ferir.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As correções ministradas por Deus são nossas instruções; Seus açoites, nossas lições, e Suas chicotadas, nossos mestres.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus não esfregaria de maneira tão forte, se não fosse para eliminar a imundície e as manchas que há em Seu povo.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando Deus ama, Ele aflige em amor, e sempre que o faz, cedo ou tarde, ensina a essas almas lições tais que serão proveitosas por toda a eternidade.'  and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Não há nada mais temível do que o Senhor permitir que afrouxemos as rédeas.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus nada nega ao cristão, a não ser com o objetivo de dar-lhe algo melhor.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus nunca fere, a não ser por amor, e nunca tira nada, a não ser para dar.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Até mesmo nas condenações de Deus, podemos encontrar consolo.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus destrói o teu conforto com o único objetivo de destruir as tuas corrupções; as privações têm o objetivo de fazer morrer a devassidão; a pobreza tem o desígnio de matar o orgulho; as repreensões são consentidas para acabar com a ambição..' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'As feridas causadas por Deus curam; os beijos do pecado matam.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Quando somos açoitados, devemos orar para que sejamos ensinados e examinar a lei como a melhor revelação da providência. Não são os açoites propriamente ditos que produzem o bem, mas o ensinamento que os acompanha e que os elucida.'  and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Crente, não pense em um repouso sem perturbações, enquanto você não se livrar da carne. Há um ciclo incessante de tristeza e tentação nesta vida. Mas nunca despreze os açoites. Eles têm a voz da instrução. São aplicados pela mão de um Pai amoroso.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O cálice mais amargo com Cristo é melhor do que o cálice mais doce sem Ele.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se nada mais separar-me de meus pecados, Senhor, envia-me chaga tão cruel e calamidade tão grande que me despertem do sono mundano.'  and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O Pai celestial não tem filhos mimados. Ele os ama demais para permitir isso.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os rudes entalhes da repreensão têm o único objetivo de colocar-nos no prumo, para que sejamos utilizados no edifício celestial.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nosso Pai celestial nunca tira nada de Seus filhos, a não ser que pretenda dar-lhes algo melhor.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A espada da justiça não nos ameaça mais, mas a vara da correção paternal ainda está em uso.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A dolorosa tesoura de podar está em mão seguras.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'É com misericórdia e moderação que Deus castiga Seus filhos.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus separa de nós aquilo que nos separaria dEle.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O maior castigo de Deus é Ele não nos castigar.' 
and tag in ('PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se Deus lhe desse dez vezes o que você lhe dá, você conseguiria viver com isso? ' 
and tag in ('DAR','MORDOMIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O dízimo não deve ser um teto em que paramos de contribuir, mas um piso a partir do qual começamos.' 
and tag in ('DAR','MORDOMIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dar um décimo não é algo digno de vanglória.' 
and tag in ('DAR','MORDOMIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus requer o dízimo, merece as ofertas, defende as economias e orienta as despesas.' 
and tag in ('DAR','MORDOMIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Pode-se argumentar que no Antigo Testamento os dízimos eram pagos e, portanto, falando especificamente, não estão na categoria de contribuição voluntária. A contribuição cristã só começa qu ando damos mais do que um décimo.'  and tag in ('DAR','MORDOMIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se alguém não se incomoda com o problema do sofrimento, isto se deve a uma razão entre duas: ou tem um coração duro ou é um cabeça-dura.' 
and tag in ('ENFERMIDADE','SOFRIMENTO','PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Deus sussurra em nossos ouvidos por meio de nosso prazer, fala-nos mediante nossa consciência, mas clama em alta voz por intermédio de nossa dor; esta é seu megafone para despertar um mundo surdo.' 
and tag in ('ENFERMIDADE','SOFRIMENTO','PROVAÇÕES')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A questão não é se uma doutrina é bela, mas se ela é verdadeira.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Há tanto direito de crer nas doutrinas do cristianismo quanto dever de praticá-las.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se você crê somente no que gosta do evangelho e rejeita o que não gosta, não é no evangelho que você crê, mas, sim, em si mesmo.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A indiferença doutrinária não é a solução para o problema das diferenças doutrinárias.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Doutrina é coisa prática, visto que desperta o coração.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A doutrina não é tarefa da língua, mas da vida... Ela é recebida apenas quando toma conta da alma toda.'  and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Como é humilhante para todos os que estão aprendendo descobrir que sua doutrina ultrapassou suas experiências.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Algumas coisas confiamos a Deus, outras Deus confia a nós... Aquilo que Deus confia a nós é principalmente sua verdade.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Às vezes as verdades mais claras são os argumentos mais fortes em favor dos deveres mais difíceis.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Abracemos toda a verdade ou renunciemos totalmente ao cristianismo.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Você não pode abandonar os gr andes temas doutrinários e ainda assim produzir gr andes santos.'  and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A igreja de hoje... não tem dever mais solene do que conservar a pureza da doutrina.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dizer "Esqueça a doutrina, vamos evangelizar" é tão ridículo quanto uma equipe de futebol que diz "Esqueça a bola, vamos continuar o jogo".' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Qualquer ensinamento que não se enquadre nas Escrituras deve ser rejeitado, mesmo que faça chover milagres todos os dias.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A finalidade para a qual Deus instrui a mente é que Ele possa transformar a vida.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Doutrinas fracas não são páreo para tentações fortes.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Se não tornarmos clara nossa posição, com palavras e obras, em favor da verdade e contra as falsas doutrinas, estaremos edificando um muro entre a próxima geração e o evangelho.'  and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que crê mal nunca pode viver bem, pois não tem alicerces.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os homens, para serem verdadeiramente ganhos, precisam ser ganhos pela verdade.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O propósito que está por trás de toda doutrina é garantir a ação moral.' 
and tag in ('TEOLOGIA')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Para muitos cristãos, incerteza é a moda; tudo o que eles têm é a valentia de suas confusões.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Todas as dúvidas não são honestas.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aquele que duvida não pode encontrar a Deus pela mesma razão que um ladrão não pode encontrar um policial.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Acredite em suas crenças e duvide de suas dúvidas; não cometa o erro de duvidar de suas crenças e de acreditar em suas dúvidas.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Nunca duvide na escuridão do que Deus lhe disse à luz.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Aqueles que duvidam invertem a metáfora e insistem em que precisam de fé tão grande quanto uma montanha para mover uma semente de mostarda.'  and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Beneficie-me com suas certezas, se você tiver alguma. Fique com suas dúvidas; eu já tenho dúvidas suficientes.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Dúvida alimentada torna-se rapidamente dúvida concretizada.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'A arte de duvidar é fácil, pois já nascemos com essa habilidade.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Satanás adora pescar em águas turvas.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'Os homens que estão envoltos em pontos de interrogação não podem tomar parte de uma cruzada.' 
and tag in ('INCERTEZAS')

insert into TagFraseCrista (IdFraseCrista, IdTagFrase)
Select frase.id, tag.id from FraseCrista frase, TagFrase tag
Where frase = 'O homem não é feito para questionar, mas para adorar.' 
and tag in ('INCERTEZAS')
