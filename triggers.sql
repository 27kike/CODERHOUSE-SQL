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