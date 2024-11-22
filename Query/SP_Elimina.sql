USE [DB_Peliculas]
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar]    Script Date: 21/11/2024 05:00:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Daniel-Diego>
-- Create date: <21 de noviembre de 2024>
-- Description:	<Elimina peliculas>
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[sp_pelicula_elimina]
    @id int = 0
AS
BEGIN
SET NOCOUNT ON
DECLARE @TipoError int = 0
DECLARE @Mensaje varchar(50) = ''
BEGIN TRY 
--Eliminar tabla Pelicula
	  BEGIN TRANSACTION 
		DELETE FROM Pelicula
		WHERE
		Id   = @id
	  COMMIT TRANSACTION

	  SET @TipoError = 1
	  SET @Mensaje = 'El registro se elimino correctamente'

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
