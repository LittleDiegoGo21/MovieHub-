USE [DB_Peliculas]
GO
/****** Object:  StoredProcedure [dbo].[sp_pelicula_actualiza]    Script Date: 21/11/2024 06:29:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Daniel-Diego>
-- Create date: <21 de noviembre de 2024>
-- Description:	<Actualiza peliculas>
-- =============================================
CREATE OR ALTER       PROCEDURE [dbo].[sp_pelicula_actualiza]
    @id int = 0,
    @nombrePelicula varchar(50) = '',
	@director varchar(50)='',
	@produccion varchar(50)='',
	@duracion decimal (32,2) = 0,
	@pais varchar(50)='',
	@fechaPublicacion varchar(50)='',
	@idCategoria int = 0
AS
BEGIN
SET NOCOUNT ON
DECLARE @TipoError int = 0
DECLARE @Mensaje varchar(50) = ''
BEGIN TRY 
--Actualizar datos tabla Pelicula
	  BEGIN TRANSACTION 
		UPDATE Pelicula
		SET
		 NombrePelicula = @nombrePelicula
		,Director = @director
		,Produccion = @produccion
		,Duracion = @duracion
		,Pais = @pais
		,FechaPublicacion = @fechaPublicacion
		,FechaUltimaModificacion = getdate()
		,IdCategoria = @idCategoria
		where
		Id = @id
	  COMMIT TRANSACTION
	  SET @TipoError = 1
	  SET @Mensaje = 'El registro se actualizo correctamente'

	  SELECT @TipoError AS TipoError, @Mensaje AS Mensaje
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
