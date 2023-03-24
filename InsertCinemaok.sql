-- Genero
INSERT INTO `cinema`.`genero`
(`idgenero`,`descricao`) VALUES
(1,'Ação'),
(2,'Suspense'),
(3,'Drama'),
(4,'Policial'),
(5,'Aventura'),
(6,'Comédia'),
(7,'Documentário');

select * from genero;

-- ator

INSERT INTO `cinema`.`ator`
(`idator`,`nome`)VALUES
(20,'Anthony Mackie'),
(21,'Damson Idris'),
(22,'Emily Beecham'),
(23,'Chris Evans'),
(24,'Robert Downey Jr'),
(25,'Paul Rudd'),
(26,'Jason Statham');


select * from ator;

-- filme
INSERT INTO `cinema`.`filme`
(`idfilme`, `titulo`,`duracao`,`genero_idgenero`)VALUES
(10,'Outside the Wire',115,5),
(11,'Eagle Eye',118,1),
(12,'Captain America: Civil War',147,5),
(13,'Adrenalina',104,1),
(14,'Carga explosiva 1',101,1),
(15,'Capitão America 2',136,5);


select * from filme;

-- Elenco
INSERT INTO `cinema`.`elenco` 
(`ator_idAtor`, `filme_idFilme`, `personagemNome`) VALUES 
(20, 10, 'Captain Leo'),
(21, 10, 'Thomas Harp'),
(22, 10, 'Sofiya'),
(20, 11, 'Major William Bowman'),
(22, 12, 'Capitão américa'),
(24, 12, 'Tony Stark'),
(25, 12, 'Ant-man'),
(26, 13, 'Chev Chelios'),
(26, 14, 'Frank Martin'),
(23, 15, 'Capitão America');



select * from elenco;


-- sala
INSERT INTO `cinema`.`sala`
(`idsala`,`nome`,`qtdeAssento`)VALUES
(50,'XD',45),
(51,'3D',50),
(52,'D-Box',45),
(53,'Prime', 30);

select * from sala;

-- sessão
INSERT INTO `cinema`.`sessao`
(`sala_idsala`,`filme_idfilme`,`dataHora`,`qtdeVenda`)VALUES
(50,10,'2021-08-21 14:00',40),
(51,10,'2021-08-21 18:00',30),
(51,12,'2021-08-21 14:00',40),
(53,12,'2021-08-21 18:00',20),
(50,11,'2021-08-21 14:00',40);

select * from sessao;

