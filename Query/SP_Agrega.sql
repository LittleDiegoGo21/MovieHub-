USE [DB_Peliculas]
GO
/****** Object:  StoredProcedure [dbo].[sp_peliculas_agregar]    Script Date: 21/11/2024 05:39:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Daniel-Diego>
-- Create date: <21 de noviembre de 2024>
-- Description:	<Agrega peliculas>
-- =============================================
CREATE OR ALTER     PROCEDURE [dbo].[sp_pelicula_agrega]
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

---Paso 1 Registrar en Tabla Peliculas
	BEGIN TRANSACTION
	INSERT INTO Pelicula
	VALUES (
	 @nombrePelicula
	,@director
	,@produccion
	,@duracion
	,@pais
	,@fechaPublicacion
	,GETDATE()
	,@idCategoria
	
	)
	COMMIT TRANSACTION 



		SET @TipoError = 1
		SET @Mensaje = 'Operacion Correcta.'

		SELECT @TipoError AS TipoError, @Mensaje AS Mensaje

END TRY
BEGIN CATCH
	if(XACT_STATE()=-1)
	rollback transaction
	if(XACT_STATE()=1)
	commit transaction
	set @TipoError = 2
	set @Mensaje = 'Ha ocurrido un error'
END CATCH
END

