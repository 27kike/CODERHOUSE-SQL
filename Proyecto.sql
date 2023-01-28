CREATE DATABASE Inventario;
USE Inventario;
/*
	Creacion de tablas
*/
CREATE TABLE USUARIO (
	ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    LastNamep VARCHAR(50) NOT NULL,
    LastNamem VARCHAR(50) NOT NULL,
    Rol VARCHAR(10) NOT NULL,
    Tel VARCHAR(12) NOT NULL,
    Email VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE ENTRADA (
	ID INT NOT NULL AUTO_INCREMENT,
    FK_USUARIO INT NOT NULL,
    FECHA DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_USUARIO) REFERENCES USUARIO(ID)
);

CREATE TABLE SALIDA (
	ID INT NOT NULL AUTO_INCREMENT,
    FK_USUARIO INT NOT NULL,
    FECHA DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_USUARIO) REFERENCES USUARIO(ID)
);

CREATE TABLE UBICACION(
	ID INT NOT NULL AUTO_INCREMENT,
    CALLE VARCHAR(50) NOT NULL,
    COLONIA VARCHAR(50) NULL,
    NUM INT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE PROVEEDOR(
	ID INT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    RFC VARCHAR(10) NULL,
    FK_UBI INT NOT NULL,
    EMAIL VARCHAR(50) NULL,
    TEL VARCHAR(12) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_UBI) REFERENCES UBICACION(ID)
);

CREATE TABLE CATEGORIA(
		ID INT NOT NULL AUTO_INCREMENT,
        PRECIO DECIMAL(10,2) NOT NULL,
        DESCR VARCHAR(100) NOT NULL,
        PRIMARY KEY (ID)
);

CREATE TABLE ARTICULO(
	ID INT NOT NULL AUTO_INCREMENT,
    FK_PROVEEDOR INT NOT NULL,
    CODIGO INT NOT NULL,
    DESCR VARCHAR(100) NULL,
    COSTO DECIMAL(10,2) NOT NULL,
    EXISTENCIA INT NOT NULL,
    FK_CATEGORIA INT NOT NULL,
    FK_USUARIO INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(FK_PROVEEDOR) REFERENCES PROVEEDOR(ID),
    FOREIGN KEY(FK_CATEGORIA) REFERENCES CATEGORIA(ID),
    FOREIGN KEY(FK_USUARIO) REFERENCES USUARIO(ID)
);
-- Creacion de tabla de log
CREATE TABLE LOG_USUARIO (
  ID int(11) NOT NULL AUTO_INCREMENT,
  ACCION varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);
/*
	-------------------------------------------------------------------------------
*/


/*
	Insertar datos a tablas
*/
-- Insertar datos en tabla Usuario
INSERT INTO USUARIO (ID, NAME, LastNamep, LastNamem, Rol, Tel, Email) VALUES
	(1, 'Hector', 'Llanos', 'Banuelos', 'Admin', 5519941429, 'correo@hotmail.com'),
    (2, 'Esmeralda', 'Calvario', 'Avalos', 'Usuario', 5516641429, 'correo1@hotmail.com'),
    (3, 'Oscar', 'Llanos', 'Banuelos', 'Usuario', 2219941429, 'correo3@hotmail.com');

-- Insertar datos en tabla Ubicacion
INSERT INTO UBICACION (ID, CALLE, COLONIA, NUM) VALUES
	(1,'Calle 1', 'Colonia 33', 432),
    (2,'Calle 12', 'Colonia 1', 983);

-- Insertar datos en tabla Proveedor
INSERT INTO PROVEEDOR (ID, NAME, RFC, FK_UBI, EMAIL, TEL) VALUES
	(1,'27PC','AAA129DA90',1,'27PC@correo.com','332244556688'),
    (2,'ArmaPC','AAA129CF90',2,'ArmaPC@correo.com','307046544633');

-- Insertar datos en tabla Categoria
INSERT INTO CATEGORIA (ID, PRECIO, DESCR) VALUES
	(1,120.50,'Teclado mecanico'),
    (2,770.00,'Gabinete para PC');

-- Insertar datos en tabla Articulo
INSERT INTO ARTICULO (ID, FK_PROVEEDOR, CODIGO, DESCR, COSTO, EXISTENCIA, FK_CATEGORIA, FK_USUARIO) VALUES
	(1,2,0000000010, 'Gabinete para PC chica', 1200.00, 1, 2, 3),
    (2,1,0000000011, 'Teclado con conexion USB C', 200.00, 0, 1, 2);

-- Insertar datos en tabla Entrada
INSERT INTO ENTRADA (ID, FK_USUARIO, FECHA) VALUES
	(1,1,'2022-12-20 14:05:39'),
    (2,3,'2022-12-22 19:05:39');

-- Insertar datos en tabla Salida
INSERT INTO SALIDA (ID, FK_USUARIO, FECHA) VALUES
	(1,1,'2022-12-25 10:01:19'),
    (2,3,'2022-12-26 12:15:59');
/*
	--------------------------------------------------------------------
*/



/*
	Creacion de vistas
*/
-- Vista para saber que usuario a registrado entradas de productos
CREATE VIEW vista_usuario_proIN AS
SELECT NAME AS 'Usuarios que registran la Entrada de productos'
FROM USUARIO
RIGHT JOIN ENTRADA ON USUARIO.ID = ENTRADA.FK_USUARIO;

SELECT * FROM vista_usuario_proIN;

-- Vista para saber que usuario a registrado entradas de productos
CREATE VIEW vista_usuario_proOUT AS
SELECT NAME AS 'Usuarios que registran la Salida de productos'
FROM USUARIO
RIGHT JOIN SALIDA ON USUARIO.ID = SALIDA.FK_USUARIO;

SELECT * FROM vista_usuario_proOUT;

-- Vista para saber cuantos productos hay en existencia
CREATE VIEW vista_productos_total as
	SELECT COUNT(ARTICULO.ID) FROM ARTICULO WHERE ARTICULO.EXISTENCIA = 1;
SELECT * FROM vista_productos_total;

-- Vista proveedor producto
CREATE VIEW vista_proveedor_producto as
	SELECT PROVEEDOR.NAME, ARTICULO.DESCR
    FROM PROVEEDOR
    RIGHT JOIN ARTICULO ON PROVEEDOR.ID = ARTICULO.FK_PROVEEDOR;
SELECT * FROM vista_proveedor_producto;

-- Usuarios que no tengan el rol de administrador
CREATE VIEW vista_usuarios_noAdmin as
	SELECT COUNT(USUARIO.ID) FROM USUARIO WHERE USUARIO.Rol = 'Usuario';
SELECT * FROM vista_usuarios_noAdmin;

/*
	--------------------------------------------------------------------------------
*/


/*
	Creacion de funcion
*/
CREATE DEFINER=`root`@`localhost` FUNCTION `Contar_Usuarios`(Codigo INT) RETURNS int(11)
BEGIN
	DECLARE Encontrado INT;
    SELECT COUNT(*) INTO Encontrado FROM ENTRADA WHERE FK_USUARIO LIKE CONCAT(Codigo);
    RETURN Encontrado;
END
/*
	--------------------------------------------------------------------------------
*/


/*
	Stored procedures
*/
DELIMITER //
CREATE PROCEDURE InsertarUsuario(
	IN id INT,
    IN nombre VARCHAR(50),
    IN apellidop VARCHAR(50),
    IN apellidom VARCHAR(50),
    IN rol VARCHAR(10),
    IN tel VARCHAR(12),
    IN email VARCHAR(20)
)
BEGIN
	INSERT INTO USUARIO (ID, NAME, LastNamep, LastNamem, Rol, Tel, Email) VALUES
	(id, nombre, apellidop, apellidom, rol, tel, email);
END//
    
    
CALL InsertarUsuario(4,'Robin','Hood','Tercero','Admin','333450133633','correo4@correo.com');

DELIMITER //
CREATE PROCEDURE Ordenar(
	IN columna VARCHAR(2)
)
BEGIN
	SELECT * FROM USUARIO ORDER BY columna ASC;
END//

CALL Ordenar('ID');
/*
	--------------------------------------------------------------------------------
*/


/*
	CREACION DE TRIGGERS
*/
CREATE TRIGGER LOG_TABLA_USUARIO AFTER INSERT ON USUARIO
FOR EACH ROW 
INSERT INTO LOG_USUARIO (ID, ACCION) VALUES(1,'Dato insertado');

SELECT * FROM LOG_USUARIO;
/*
	--------------------------------------------------------------------------------
*/