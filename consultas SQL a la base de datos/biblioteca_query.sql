--CREAR LAS TABLAS--

CREATE TABLE socio(
	id SERIAL NOT NULL PRIMARY KEY,
	rut VARCHAR(12) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(10) NOT NULL
);

CREATE TABLE autor(
	id SERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	fecha_muerte DATE,
	tipo_autor VARCHAR(20) NOT NULL
);

CREATE TABLE libro(
	id SERIAL NOT NULL PRIMARY KEY,
	isbn VARCHAR(15) NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	numero_paginas INT NOT NULL,
	disponibilidad BOOLEAN
);

CREATE TABLE autor_libro(
	id_autor INT NOT NULL,
	id_libro INT NOT NULL,
	PRIMARY KEY (id_autor, id_libro),
	FOREIGN KEY (id_autor) REFERENCES autor (id),
	FOREIGN KEY (id_libro) REFERENCES libro (id)
);

CREATE TABLE prestamo(
	id SERIAL NOT NULL PRIMARY KEY,
	fecha_inicio DATE NOT NULL,
	fecha_devolucion DATE,
	fecha_devolucion_real DATE,
	devuelto BOOLEAN,
	id_socio INT,
	id_libro INT,
	FOREIGN KEY (id_socio) REFERENCES socio(id),
	FOREIGN KEY (id_libro) REFERENCES libro(id)
);


--INSERTAR DATOS EN LAS TABLAS--

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES
('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111'),
('2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222'),
('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333'),
('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444'),
('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');

INSERT INTO autor(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES
('ANDRÉS', 'ULLOA', '1982-01-01', null, 'PRINCIPAL'),
('SERGIO', 'MARDONES', '1950-01-01', '2012-01-01', 'PRINCIPAL'),
('JOSE', 'SALGADO', '1968-01-01', '2020-01-01', 'PRINCIPAL'),
('ANA', 'SALGADO', '1972-01-01', null, 'COAUTOR'),
('MARTIN', 'PORTA', '1976-01-01', null, 'PRINCIPAL');

INSERT INTO libro(isbn, titulo, numero_paginas, disponibilidad) VALUES
('111-1111111-111','CUENTOS DE TERROR', 344, 'T'),
('222-2222222-222','POESÍAS CONTEMPORANEAS', 167, 'T'),
('333-3333333-333','HISTORIA DE ASIA', 511, 'T'),
('444-4444444-444','MANUAL DE MECÁNICA', 298, 'T');

INSERT INTO autor_libro(id_autor, id_libro) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 4);

INSERT INTO prestamo(fecha_inicio, fecha_devolucion, fecha_devolucion_real, devuelto, id_socio, id_libro) VALUES
('20-01-2020', '27-01-2020', '27-01-2020', 'T', 1, 1),
('20-01-2020', '27-01-2020', '30-01-2020', 'T', 5, 2),
('22-01-2020', '29-01-2020', '30-01-2020', 'T', 3, 3),
('23-01-2020', '30-01-2020', '30-01-2020', 'T', 4, 4),
('27-01-2020', '03-02-2020', '04-02-2020', 'T', 2, 1),
('31-01-2020', '07-02-2020', '12-02-2020', 'T', 1, 4),
('31-01-2020', '07-02-2020', '12-02-2020', 'T', 3, 2);


--COMPROBAR LA INFORMACION INGRESADA--

SELECT * FROM socio;
SELECT * FROM autor;
SELECT * FROM libro;
SELECT * FROM autor_libro;
SELECT * FROM prestamo;


--CONSULTAS SQL--

--a. Mostrar todos los libros que posean menos de 300 páginas.
SELECT titulo, numero_paginas 
FROM libro 
WHERE numero_paginas < 300;

--b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
SELECT nombre, apellido, fecha_nacimiento 
FROM autor
WHERE fecha_nacimiento > '1970-01-01';

--c. ¿Cuál es el libro más solicitado?
SELECT li.titulo, COUNT(*) AS veces_solicitado 
FROM prestamo pr, libro li 
WHERE pr.id_libro = li.id GROUP BY li.titulo 
ORDER BY veces_solicitado DESC LIMIT 1;
--otra forma de hacerlo.
--ORDER BY veces_solicitado DESC;

--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto 
--debería pagar cada usuario que entregue el préstamo después de 7 días.
SELECT so.nombre, so.apellido, pr.fecha_inicio, pr.fecha_devolucion_real, 
((fecha_devolucion_real - fecha_inicio) - 7) AS dias_atraso,
((fecha_devolucion_real - fecha_inicio) - 7) * 100 AS multa
FROM prestamo pr, socio so
WHERE so.id = pr.id_socio AND (fecha_devolucion_real - fecha_inicio) > 7; 
