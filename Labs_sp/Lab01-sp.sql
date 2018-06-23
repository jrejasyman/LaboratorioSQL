USE dbLibrary;

EXEC sp_databases;

EXEC sp_stored_procedures;
GO



/*Elaborar un sp que permita ingresar dos numeros y devuelva la sumatoria de ellos */

CREATE PROCEDURE sp_Evaluar
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno > @NumDos
            PRINT 'El mayor número ingresado es' + @NumDos
    END
GO

CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
    PRINT 'Los numero son iguales'
        ELSE 
            IF @NumUno > @NumDos
    SELECT @NumUno AS 'Numero Mayor'
        ELSE
    SELECT @NumDos AS 'Numero Mayor'
END

EXEC sp_Evaluar2 @NumUno = 800, @NumDos = 80
EXEC sp_Evaluar2 @NumUno = 800, @NumDos = 800
GO

CREATE PROCEDURE sp_Evaluar3
    @NumUno INT,
    @NumDos INT
AS
    BEGIN
        IF @NumUno = @NumDos
    PRINT 'Los numero son iguales'
        ELSE 
            IF @NumUno > @NumDos
                SELECT @NumDos AS 'Numero Mayor'
        ELSE
    SELECT @NumDos AS 'Numero Mayor'
END

EXEC sp_Evaluar3 @NumUno = 100, @NumDos = 20
EXEC sp_Evaluar3 @NumUno = 30, @NumDos = 50
GO


CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
    BEGIN
        WHILE (@Inicio < @Num)
            BEGIN
                SET @Inicio = @Inicio + 1
                PRINT @Inicio
            END
    END
GO

/*Listar 5 números*/
EXEC sp_Listar @Num = 25
Go

/*Elaborar un sp que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMAS" 
de acuerdo a un número que ha sido ingresado*/

/*Elaborar un SP un nombre y devuelva un mensaje de saludo con el mismo nombre*/
CREATE PROCEDURE sp_Saludo
    @nombre VARCHAR(40)
AS
    BEGIN
        PRINT 'Hola' + @nombre
    END
GO

EXEC sp_Saludo @nombre = Manuel
Go

/*Elaborar un Sp que permita ingresar un nombre y una Fecha de Nacimiento*/
CREATE PROCEDURE sp_NomFecNac
    @nombre VARCHAR(40),
    @FecNac DATE
AS
    BEGIN
        SELECT @nombre, @FecNac AS 'Fecha Nacimiento'
    END
GO

EXEC sp_NomFecNac @nombre = 'Manuel Alberto', @FecNac = '05/05/218'
Go

---ver la configuracion de idioma del servidor---
SELECT @@LANGUAGE
--- Ver formato de fecha de acuerdo al sistema---
EXEC sp_helplanguage
go

/*Elaborar un sp que permita ingresar un nombre y  fecha d enaciemiento en formato dd/mm/yyyy*/
ALTER PROCEDURE sp_NomFecNac2
    @nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @nombre AS nombre,
        FORMAT(CONVERT(DATETIME, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento'
    END
GO

EXEC sp_NomFecNac2 @nombre = Oscar, @FecNac = '02/12/2000'
GO

/*Elaborar un SP que permita ingresar un nombre, una fecha de nacimiento y de devuelva los mismos datos mas la edad */
CREATE PROCEDURE sp_NomFecNac3
    @nombre VARCHAR(40),
    @FecNac VARCHAR(10)
AS
    BEGIN
        SELECT @nombre AS nombre,
        FORMAT(CONVERT(DATETIME, @FecNac, 103), 'd', 'en-gb') AS 'Fecha de Nacimiento',
        DATEDIFF(YEAR,CONVERT(DATETIME, @FecNac, 103), GETDATE()) AS 'Edad'
    END
GO
DROP PROCEDURE sp_NomFecNac3
EXEC sp_NomFecNac3 @nombre = Oscar, @FecNac = '28/09/1999'
GO

