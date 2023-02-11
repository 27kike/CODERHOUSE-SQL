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
    (2,1,0000000011, 'Teclado con conexion USB C', 200.00, 0, 1, 2)

-- Insertar datos en tabla Entrada
INSERT INTO ENTRADA (ID, FK_USUARIO, FECHA) VALUES
	(1,1,'2022-12-20 14:05:39'),
    (2,3,'2022-12-22 19:05:39');

-- Insertar datos en tabla Salida
INSERT INTO SALIDA (ID, FK_USUARIO, FECHA) VALUES
	(1,1,'2022-12-25 10:01:19'),
    (2,3,'2022-12-26 12:15:59');