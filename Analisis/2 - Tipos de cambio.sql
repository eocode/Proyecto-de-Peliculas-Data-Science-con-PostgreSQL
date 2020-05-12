-- Inspección de tablas
SELECT * FROM tipos_cambio
SELECT * FROM precio_peliculas_tipo_cambio

-- Tipo de cambio por peliculas a pesos mexicanos
SELECT 
	peliculas.pelicula_id, 
	tipos_cambio.tipo_cambio_id,
	tipos_cambio.cambio_usd * peliculas.precio_renta AS precio_mxn
FROM peliculas,
	tipos_cambio
WHERE tipos_cambio.codigo = 'MXN';