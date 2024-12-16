
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title" 
from "Album" 
order by "Title" ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select 
	"AlbumId" ,
	count ("Name") as numero_canciones
from "Track" 
group by ("AlbumId")
order by numero_canciones desc 
limit 1;

/* Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
 */
select 
	"Composer" as Compositor,
	round(avg("Milliseconds"), 2) as promedio,
	round(stddev("Milliseconds"), 2) as desv_estandar,
	round(variance("Milliseconds"), 2) as varianza
from "Track"
where "Composer" is not null 
group by "Composer" ;

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select 
	"Name" as titulo_pista ,
	"UnitPrice" as precio_pista
from "Track" 
limit 10;
   
-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select 
	concat("FirstName", ' ', "LastName") as nombre_empleado,
	"EmployeeId" 
from "Employee" 
order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.

-- OPCIÓN 6.1: mostramos el número (recuento) de géneros disponibles en la BD.
select count("GenreId") as num_gen_distintos
from "Genre";


-- OPCIÓN 6.2: mostramos cuántas canciones hay por cada género disponible en la BD.
select 
	"GenreId" as genero_musica_id,
	count("TrackId") as num_canciones
from "Track" 
group by "GenreId" ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select 
	concat("FirstName", ' ', "LastName") as nombre_cliente,
	"Country" as pais  
from "Customer" 
order by nombre_cliente
limit 5; 

-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select 
	"Country" as pais,
	count("CustomerId") as num_clientes
from "Customer" 
group by "Country" ;


/**
Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
**/
select 
	"BillingCountry" as pais,
	sum("Total") as total_facturas
from "Invoice" 
group by "BillingCountry"
having sum("Total") > 10000;

/**
Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
**/
select 
	"Country" as pais,
	count("CustomerId") as num_clientes
from "Customer" 
group by "Country" 
having count("CustomerId") > 5;

/**
Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración 
mayor a 250,000 milisegundos.
**/   
select 
	"MediaTypeId" as tipo_de_medio,
	count("TrackId") as num_pistas
from "Track" 
where "Milliseconds" > 250000
group by "MediaTypeId" 
order by "MediaTypeId" ;

/**
Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante 
de ventas específico, cuyo ID sea menor a 5.
**/   
select 
	"Country" ,
	"SupportRepId",
	count("CustomerId") as num_clientes_asistidos
from "Customer"
where "SupportRepId" < 5
group by 
	"Country" ,
	"SupportRepId" 
order by 
	"Country", 
	"SupportRepId";


-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
select 
	"BillingPostalCode" as codigo_postal_cliente ,
	count("CustomerId") as num_compras_cliente
from "Invoice" i 
where "BillingPostalCode" is not null 
group by ("BillingPostalCode")
having count("CustomerId") > 5;

/**
Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde 
el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. 
Muestra el tipo de medio y el número total de pistas.
**/
select 
	"MediaTypeId" as tipo_de_medio,
	count("TrackId") as cantidad_total_pistas
from "Track" 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "MediaTypeId" ;


/** 
Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante 
con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
**/
select 
	"Country" as pais,
	"State" as estado,
	count("CustomerId") as num_clientes
from "Customer" 
where "SupportRepId" > 3 and "Company" notnull 
group by 
	"Country" ,
	"State" ;






