-- Ranking por porcentaje
SELECT 
	peliculas.pelicula_id AS id,
	peliculas.titulo,
	count(*) AS numero_rentas,
	-- Window function
	PERCENT_RANK() OVER (
		ORDER BY COUNT(*) ASC
	) AS lugar
FROM rentas
	INNER JOIN inventarios 
		ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN peliculas 
		ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC
LIMIT 10;

-- Ranking por lugar
SELECT 
	peliculas.pelicula_id AS id,
	peliculas.titulo,
	count(*) AS numero_rentas,
	-- Window function
	DENSE_RANK() OVER (
		ORDER BY COUNT(*) DESC
	) AS lugar
FROM rentas
	INNER JOIN inventarios 
		ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN peliculas 
		ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC
LIMIT 10;