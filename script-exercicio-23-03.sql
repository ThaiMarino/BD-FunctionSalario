-- TESTE FUNÇÃO AULA


-- Criando função
-- a decimal(10, 2) SIGNIFICA 10 VALORES ANTES DA VIRGULA E 2 VALORES DEPOIS DA VIRGULA
DELIMITER $$
CREATE FUNCTION fn_teste(a decimal(10, 2), b int)
	RETURNS int
    No SQL
BEGIN
	RETURN a * b;
END$$
DELIMITER ;



-- invocando função
-- podemos invocar a função em qualquer lugar do códigoz
select fn_teste(5.2,10) as result;

-- Exercícios 23/03
-- 2) Inclua uma coluna para o valor do ingresso (decimal) na tabela sessao (BDCinema)
-- Atualize o conteúdo dessa coluna com valor 30,00 para todos os registros

select * from sessao;
ALTER TABLE sessao add valorIngresso decimal(10,2);
UPDATE sessao
set valorIngresso = 30.00;


-- 3) Crie uma consulta para calcular o valor da venda de N ingressos através da função fn_teste
-- (criada anteriormente) 
select sala_idsala as 'Sala',
	filme_idfilme as 'Filme',
    fn_teste(valorIngresso, 6) as 'Preço de 6 Ingressos'
from sessao;

-- especificando sessão
SELECT sala_idsala as 'Sala',
	filme_idfilme as 'Filme',
    fn_teste(valorIngresso, 6) as 'Preço de 6 Ingressos'
from sessao
WHERE sala_idsala = 50 and filme_idfilme = 10;


-- ATV 4) Calcular o total da quantidade de ingressos vendidos de uma sala específica utilizando a função fn_teste().
-- Exemplo: Valor total de ingressos vendidos na sala 51.
select * from sala;

SELECT sala_idsala as 'Sala',
	filme_idfilme as 'Filme',
    fn_teste(valorIngresso, qtdeVenda) AS 'VALOR DOS INGRESSOS'
FROM sessao
WHERE sala_idsala = 53;

-- ATV 5) Calcular o valor que uma pessoa irá gastar comprando 4 ingressos do filme "Eagle Eye". Utilize a função fn_teste
SELECT sala_idsala as 'Sala',
	filme_idfilme as 'Filme',
    fn_teste(valorIngresso, 4) AS 'VALOR DE 4 INGRESSOS'
FROM sessao
INNER JOIN filme
ON filme_idfilme = idfilme
WHERE titulo = "Eagle Eye";


select sala_idsala as 'Sala',
	filme_idfilme as 'Filme',
    fn_teste(valorIngresso, 6) as 'Preço de 6 Ingressos'
from sessao;


-- FUNÇÃO PARA CALCULAR UM DESCONTO COM VARIÁVEL LOCAL (PREÇO)
-- Criando a função
DELIMITER %%
CREATE FUNCTION calcula_desconto (idfilme int, idsala int, desconto decimal(10,2))
RETURNS DECIMAL (10,2)
NO SQL
	BEGIN
		DECLARE preco decimal(10,2);
        SELECT valorIngresso from sessao
		WHERE filme_idfilme = idfilme and sala_idsala = idsala INTO preco;
		RETURN preco - desconto;
    END;
%%
SELECT calcula_desconto (10, 50, 10) as Desconto;


-- ATVI 6) Crie uma função para calcular imposto de salário conforme condição: (use IF - ELSEIF)
-- salários menores que 1.000 não tem imposto
-- salários menores que 2.000 imposto de 15%
-- menor que 3.000 imposto de 22%
-- outros salários com 27% de imposto

-- decimal(8,2) SIGNIFICA QUE SÃO 8 VALORES ANTES DA VÍRGULA E 2 VALORES DEPOIS DA VIRGULA
-- VERSAO PROFESSORA 
DELIMITER &&
CREATE FUNCTION calcula_imposto(salario decimal(8,2)) 
	RETURNS decimal(8,2)
BEGIN
	DECLARE valor_imposto decimal(10,2);
    if salario < 1000.00 then
		set valor_imposto = 0.00;
	elseif salario < 2000.00 then
		set valor_imposto = salario * 0.15;
	elseif salario < 3000.00 then
		set valor_imposto = salario * 0.22;
	else 
		set valor_imposto = salario * 0.27;
	end if;   
	RETURN valor_imposto;
END&&
DELIMITER ;

select calcula_imposto(1850.00) as Imposto;





