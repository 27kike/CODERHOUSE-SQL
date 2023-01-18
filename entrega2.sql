-- Dato ingresado mediante SP
CALL InsertarUsuario(10,'Batman','Hood','Tercero','Usuario','387440043633','batman1@correo.com');

-- Creacion de vista
CREATE VIEW vista_usuario_proIN AS
SELECT NAME AS 'Usuarios que registran la Entrada de productos'
FROM USUARIO
RIGHT JOIN ENTRADA ON USUARIO.ID = ENTRADA.FK_USUARIO;

-- Creacion de funcion
CREATE DEFINER=`root`@`localhost` FUNCTION `Contar_Usuarios`(Codigo INT) RETURNS int(11)
BEGIN
	DECLARE Encontrado INT;
    SELECT COUNT(*) INTO Encontrado FROM ENTRADA WHERE FK_USUARIO LIKE CONCAT(Codigo);
    RETURN Encontrado;
END

-- Creacioin Stored procedures
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

-- Creacion triggers
CREATE TRIGGER LOG_TABLA_USUARIO AFTER INSERT ON USUARIO
FOR EACH ROW 
INSERT INTO LOG_USUARIO (ID, ACCION) VALUES(1,'Dato insertado');