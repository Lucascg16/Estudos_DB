use universidade_u;

# Para datas, manter o padrao YYYY-MM-DD

# Diferença entre char e varchar, o primeiro é fixo e o segundo pode variar o tamanho conforme a quantidade de dados
# limitado ao tamanho escolhido.

#Constraint é uma regra dada a uma coluna que indica para o SGBD que ele deve analisar e controlar se a regra está sendo seguida
#As principais constraints encontradas no MYSQL são, PRIMARY KEY, FOREIGN KEY, UNIQUE, ENUM e NOT NULL

#Primary key = chave e entidade(unique e not null);
#Foreign key = referencia um PK de outra tabela;
#Unique = mandei um dado como unico em uma tabela;
#Enum = limita as opções de valores de uma coluna;
#Not null = impede que o valor seja nulo;

# 1FN - As tabelas devem ser atômicas, ou seja, devem ter apenas um valor especifico.

CREATE TABLE Aluno (#exemplo de criacao de tabela com varios elementos
    sexo char(1),
    telefone varchar(20),
    idade int,
    nome varchar(25),
    endereco text,
    data_de_inscricao date,
    valor_pago float(10,2),
    ativo_sn int,
    cfp varchar(11),
    email varchar(150)
);
# Em caso de nome de coluna ser o mesmo que uma palavra reservada do SGBD é utilizada crase para identificar a coluna
# É importante evitar uso de palavra reservada nas colunas pois pode dar problemas em outros pontos do projeto

desc aluno;#mostra a descricao de cada atributo da tabela #exclusivo do MYSQL

#alter
alter table tabela add coluna varchar(11);#adiciona uma nova coluna na tabela com o tipo especificado e no final
alter table tabela add coluna varchar(150) after coluna;#adicionar nova coluna apos uma coluna selecionada
alter table tabela modify column coluna varchar(14);#modificar uma coluna ja existente
alter table tabela modify coluna varchar(14) primary key;#tranforma a coluna em chave primaria
alter table tabela drop coluna;#dropa/remove uma coluna da tabela
alter table tabela add constraint nomeconstraint unique(coluna);#Adiciona uma constraint que deixa a coluna para dados unicos
																#O nome da constraint sempre começa com uc_ e segue com o nome da tabela e da coluna
#alter table para criar constrains de chaves estrangeiras
alter table tabela add constraint nomeConstraint #Adicionar uma constraint na tabela
	foreign key (coluna) #Indica qual coluna que será chave estrangeira na tabela. OBS: essa coluna deve existir previamente
    references tabelaOrigem (coluna); #Indica de que tabela que está vindo a chave e de qual coluna.

#drop
drop table alunos;#desativa a tabela selecionada

#Insert dado
insert into tabela( colunas ) values ( valores respectivos das colunas );

#Select dado
#O '*' indica que tudo na tabela será retornado, caso queira apenas uma o algumas colunas especificar deverá indicar
#no lugar do '*', separando as colunas por virgulas.
select * from tabela; #seleciona tudo que contem na tabela
select coluna, coluna, coluna from tabela;# seleciona as colunas indicadas

select * from tabela where coluna = 18;# adiciona um filtro na pesquisa
select * from tabela where coluna between 18 and 55;# adiciona um range ao filtro da pesquisa

select * from tabela where coluna in (valor, valor, valor);# busca apenas os dados indicados contendo na tabela
select * from tabela where coluna not in (valor, valor, valor);# nega o de cima

select * from tabela where coluna like valor;# funicona parecido com o operador =
select * from tabela where coluna like '%o';# verifica se algum elemento termina com a letra O
select * from tabela where coluna like '%o%';# verifica se algum elemento contem a letra O
select * from tabela where coluna like 'o%';# verifica se algum elemento comeca com a letra O
select * from tabela where coluna like 'm%o';# verifica se algum elemento comeca com a letra M e termina com a letra O

select * from tabela where coluna like '_ucas';# indica que podera conter qualquer caracter onde ouver um '_'
select * from tabela where coluna like '_uca%';# combinando os coringas

select * from tabela order by coluna asc;# ordena os dados retornados pela coluna selecionada de forma acendente
select * from tabela order by coluna asc, coluna desc;# podendo combinar as colunas

#group by
select coluna from tabela group by coluna;# agrupa os resultados pela coluna indicada
select coluna, count(*) from tabela group by coluna;# conta quantas vezes os elementos aparecem
select coluna1, coluna2 from tabela group by coluna1, coluna2;# agrupa os resultados pela coluna indicada

#order by
select coluna from tabela group by coluna order by coluna desc;# ordena em ordem decrescente
select coluna from tabela group by coluna order by coluna asc;# ordena em ordem crescente
select coluna from tabela group by coluna order by coluna asc limit 1;# limita o resultado a apenas um registro exibido

#Comandos de agregação, tambem podem ser utilizadas em uma única chamada
#count
select count(*) from tabela;# retorna o número de registros que exsitem na tabela selecionada
select count( distinct coluna) from tabela;# retorna o número de registros unicos na tabela selecionada
#max
select max(coluna) from tabela;# retorna o maior valor encontrado na coluna selecionada
#min
select min(coluna) from tabela;# retorna o menor valor encontrado na coluna selecionada
#avg
select avg(coluna) from tabela;# retorna o valor médio encontrado na coluna selecionada
#sum
select sum(coluna) from tabela;# retorna o valor médio encontrado na coluna selecionada

#Ceil
select ceil(valor) from tabela;# arredonda para cima
#floor
select floor(valor);# arredonda para baixo
#truncate
select truncate(valor, 1);# remove os números após a virgula e mostra apenas o número inteiro
						  # o segundo parametro indica a quantidade de números que se manteram no numero após truncar
#round
select round(valor, 1);# arredondamento inteligente

#Aplicando um apelido para o resultado
select max(coluna) from tabela as maior_valor;

#Update dado
update tabela set coluna = valor where coluna = valor;# ex: altera idade existente na coluna onde o nome for pedro

#Delete dado
delete from tabela where coluna = valor;# deleta o dado de acordo com o filtro selecionado
