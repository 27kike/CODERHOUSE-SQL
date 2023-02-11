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