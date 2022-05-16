create database greenhouse;

use greenhouse;

-- tabela estufa
create table estufa(
idEstufa int primary key auto_increment,
produto varchar(45),
tempIdeal double,
luminoIdeal double,
umidIdeal double,
largura int,
comprimento int
);

-- tabela sensor
create table sensor(
idSensor int auto_increment,
fkEstufa int,
foreign key (fkEstufa) references estufa(idEstufa),
localizacao varchar(45),
primary key (idSensor, fkEstufa)
);

-- tabela dados
create table dado(
idDados int auto_increment,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor),
temperatura double,
luminosidade double,
umidade double,
dataHora datetime,
primary key (idDados, fkSensor)
);

-- tabela usuario
create table usuario (
idUsuario int primary key auto_increment,
nome_razaoSocial varchar(40),
dtNasc date,
tipo char(2),
constraint chkTipo check (tipo = 'PF' or tipo = 'PJ'),
 CPF_CNPJ varchar(14),
 email varchar (60),
 senha varchar(45),
 fkDependente int,
 foreign key (fkDependente) references usuario(idUsuario)
);

-- tabela fazenda, associativa
create table fazenda(
fkUsuario int,
foreign key (fkUsuario) references usuario(idUsuario),
fkEstufa int,
foreign key (fkEstufa) references estufa (idEstufa),
numero int,
cep char(9)
);
