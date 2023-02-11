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