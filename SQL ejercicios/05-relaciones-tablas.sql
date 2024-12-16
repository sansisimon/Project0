
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select 
	t."Name" as nombre_cancion,
	a."Title" as nombre_album 
from "Track" t 
inner join "Album" a 
	ON t."AlbumId"	= a."AlbumId" 
order by "nombre_cancion";


-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select 
	a."Name" as nombre_artista,
	a2."Title" as nombre_album
from "Artist" a 
inner join "Album" a2 
	ON a."ArtistId" = a2."AlbumId"
order by nombre_artista;


/** 
Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. 
Extrae solo los 5 clientes con mayor total. 
**/
select 
	concat(c."FirstName" , ' ', c."LastName") as nombre_cliente,
	sum(i."Total" ) as total_gastado
from "Invoice" i 
left join "Customer" c 
	ON i."CustomerId" = c."CustomerId" 
group by 
	i."CustomerId" ,
	c."FirstName" ,
	c."LastName" 
order by total_gastado desc 
limit 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select 
	concat(e."FirstName" , ' ', e."LastName") as nombre_empleado ,
	concat(c."FirstName" , ' ', c."LastName") as nombre_cliente	
from "Employee" e 
inner join "Customer" c 
	ON e."EmployeeId" = c."SupportRepId" 
order by nombre_empleado;

	
-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select 
	il."InvoiceId" as ID_factura,
	t."Name"  as nombre_pista
from "InvoiceLine" il 
inner join "Track" t 
	on il."TrackId" = t."TrackId" ;

	
-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select 
	distinct (a."Name") as nombre_artista,
	g."Name" as genero
from "Artist" a 
inner join "Album" a2 
	on a."ArtistId"  = a2."ArtistId" 
		inner join "Track" t
			ON a2."AlbumId" = t."AlbumId" 
				inner join "Genre" g 
					on t."GenreId" = g."GenreId" 
order by nombre_artista;


--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select 
	t."Name"  as nombre_cancion,
	mt."Name" as tipo_de_medio
from "Track" t 
left join "MediaType" mt 
	on t."MediaTypeId" = mt."MediaTypeId" 
order by nombre_cancion;


/** Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros 
 * a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
**/
select 
	t."Name" as nombre_cancion,
	g."Name" as genero
from "Track" t 
left join "Genre" g 
	on t."GenreId" = g."GenreId" 
order by nombre_cancion;

	
/** Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. 
 * Incluye también los clientes que no tienen ninguna factura.
**/
select 
	concat(c."FirstName" , ' ', c."LastName") as nombre_cliente ,
	i."InvoiceId" as numero_factura
from "Customer" c 
left join "Invoice" i 
	on c."CustomerId" = i."CustomerId" ;


/** Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas 
 * que los crearon. Incluye también los álbumes que no tienen un artista asignado 
 * (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
**/
select 
	a."Title" as nombre_album,
	a2."Name" as nombre_artista
from "Album" a 
left join "Artist" a2 
	on a."ArtistId" = a2."ArtistId"
order by nombre_album;
	
/** Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número 
 * de canciones de mayor a menor. 
**/
select 
	g."Name" as nombre_genero,
	count("TrackId") as num_canciones
from "Genre" g 
inner join "Track" t 
	on g."GenreId" = t."GenreId" 
group by g."Name" 
order by num_canciones desc ;

	
--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select 
	a."Title" as nombre_album,
	sum(t."Milliseconds") as duracion_album
from "Album" a
left join "Track" t 
	on a."AlbumId" = t."AlbumId" 
group by a."Title" 
order by duracion_album desc ;
 
-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select 
	concat(c."FirstName" , ' ', c."LastName") as nombre_cliente ,
	sum("Total") as total_gastado 
from "Customer" c 
left join "Invoice" i 
	on c."CustomerId" = i."CustomerId" 
group by 
	i."CustomerId", 
	c."FirstName",
	c."LastName"
order by total_gastado desc ;
	
/** Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes 
 * que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
**/
select
	concat(e."FirstName" , ' ', e."LastName") as nombre_empleado ,
	concat(c."FirstName" , ' ', c."LastName") as nombre_cliente_asignado
from "Employee" e 
left join "Customer" c 
	on e."EmployeeId" = c."SupportRepId" 
order by nombre_empleado;






