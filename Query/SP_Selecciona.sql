USE [DB_Peliculas]
GO
/****** Object:  StoredProcedure [dbo].[sp_pelicula_selecciona]    Script Date: 21/11/2024 06:09:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Daniel-Diego>
-- Create date: <21 de noviembre de 2024>
-- Description:	<Agrega peliculas>
-- =============================================
CREATE OR ALTER       PROCEDURE [dbo].[sp_pelicula_selecciona]
	
	@Filtro varchar (50)= ''


AS
BEGIN
SET NOCOUNT ON
DECLARE @TipoError int
DECLARE @Mensaje varchar(50)
BEGIN TRY 

--Seleccionar Peliculas por medio de filtro
BEGIN
	SELECT 
		   p.Id as ID
		  ,NombrePelicula AS Pelicula
		  ,Director AS Director
		  ,Produccion AS Productora
		  ,Duracion AS Duración
		  ,Pais as País
		  ,FechaPublicacion AS Estreno
		  ,c.NombreCategoria AS Categoría
	  
	  FROM 
	  Pelicula AS p
	  INNER JOIN Categoria as c on p.IdCategoria = c.Id
	  WHERE 
	  NombrePelicula LIKE '%'+@Filtro +'%' 
	  OR 
	  Director LIKE '%'+@Filtro +'%'
	  OR
	  Produccion LIKE '%'+@Filtro +'%'
	  OR 
	  Pais LIKE '%'+@Filtro +'%'
	  OR 
	  c.NombreCategoria LIKE '%'+@Filtro +'%'
	  END
	  
	  SET @TipoError = 1
	  SET @Mensaje = 'Operación correcta'

	 
 END TRY
BEGIN CATCH
	IF (XACT_STATE()=-1)
	rollback transaction
	IF (XACT_STATE()=1)
	commit transaction
	SET @TipoError = 2
	SET @Mensaje = 'Ha ocurrido un error'
END CATCH
END
