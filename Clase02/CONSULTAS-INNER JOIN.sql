SELECT * FROM Genero
SELECT * FROM Pais
GO

SELECT * FROM Autor
SELECT * FROM Libro
GO

SELECT * FROM Bibliotecario
GO

SELECT * FROM Cliente
GO

SELECT Libro.tituloLibro, Libro.idLibro FROM Libro
GO

/* utilizando INER JOIN*/
SELECT Libro.tituloLibro, Autor.nomAutor, Autor.apeAutor 
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor

/* Creando Vistas*/
CREATE VIEW VwDatosLibro
AS
SELECT Libro.tituloLibro, Autor.nomAutor, Autor.apeAutor 
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor



CREATE VIEW VwGenLib
AS
SELECT Genero.nomGenero AS Genero , COUNT(Libro.Genero_idGenero) AS total FROM Libro
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
GROUP BY Genero.nomGenero

SELECT * FROM VwGenLib
GO

CREATE VIEW VwPaisLib
AS
SELECT Pais.nomPais AS 'Pais', COUNT(Pais.idPais) As 'Total' 
FROM Libro
INNER JOIN Pais
ON Libro.Pais_idPais = Pais.idPais
GROUP BY Pais.nomPais

SELECT * FROM VwPaisLib
GO


SELECT name FROM sys.views

SELECT Prestamos.fecsalPrestamo, 
CONCAT(Bibliotecario.apeBibliotecario,', ',Bibliotecario.nomBibliotecario) AS 'Bibliotecario',
Libro.tituloLibro
FROM Prestamos
INNER JOIN Bibliotecario
ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario_idBibliotecario
INNER JOIN Detalle_Prestamo
ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
INNER JOIN Libro
ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro






