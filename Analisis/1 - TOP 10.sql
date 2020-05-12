-- Número de rentas por título
SELECT 
	peliculas.pelicula_id AS id,
	peliculas.titulo,
	count(*) AS numero_rentas,
	-- Window function
	ROW_NUMBER() OVER (
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