Create database DB_Peliculas

use DB_Peliculas

Create table Categoria(
IdCategoria int primary key identity,
NombreCategoria varchar (50),
FechaUltimaModificacion datetime default getdate()
)

Create table Pelicula(
IdPelicula int primary key identity,
NombrePelicula varchar (50),
Director varchar (50),
Produccion varchar (50),
Duracion decimal (32,2),
Pais varchar (50),
FechaPublicacion datetime,
FechaUltimaModificacion datetime default getdate()
)



insert into Categoria (NombreCategoria) values
('Terror'),
('Acción'),
('Romance'),
('Comedia'),
('Ciencia Ficción'),
('Drama'),
('Musical'),
('Aventura'),
('Animado')

