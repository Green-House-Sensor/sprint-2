CREATE DATABASE greenhouse;

USE greenhouse;

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),   
    fkDependente INT,
    dtNasc DATE,  
    tipo CHAR(2),
	CONSTRAINT tipo CHECK (tipo in('PF', 'PJ')),
    CPFCNPJ VARCHAR(14),
    CEP CHAR(9),
    numero VARCHAR(5),    
    email VARCHAR(60),
    senha VARCHAR(45),
    FOREIGN KEY(fkDependente) REFERENCES usuario(idUsuario)
);

CREATE TABLE estufa(
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario),
    produto VARCHAR(45),
    tempIdeal VARCHAR(20),
    luminoIdeal VARCHAR(20),
    umidIdeal VARCHAR(20)
);

CREATE TABLE sensor(
	idSensor INT AUTO_INCREMENT,
    fkEstufa INT,
    PRIMARY KEY(idSensor, fkEstufa),
    localizacao VARCHAR(45)
);

CREATE TABLE dados(
	idDados INT AUTO_INCREMENT,
    fkSensor INT,
    PRIMARY KEY(idDados, fkSensor),
    temperatura VARCHAR(20),
    luminosidade VARCHAR(20),
    umidade VARCHAR(20),
    dataHora DATETIME
);

