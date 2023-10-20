CREATE DATABASE lab_prog_3_des_1;
GO

USE lab_prog_3_des_1;

CREATE TABLE AutomovilMarcas(
	id INT PRIMARY KEY IDENTITY (1,1),
	nombre VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Automoviles(
	id INT PRIMARY KEY IDENTITY (1,1),
	modelo VARCHAR(100) NOT NULL,
	idAutomovilMarca INT NOT NULL,
	FOREIGN KEY (idAutomovilMarca) REFERENCES AutomovilMarcas(id) ON DELETE CASCADE
);
