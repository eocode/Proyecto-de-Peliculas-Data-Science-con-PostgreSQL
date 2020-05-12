-- Tabla recursiva
WITH RECURSIVE tabla_recursiva(n) AS(
	VALUES(1)
	UNION ALL
	SELECT n+1 FROM tabla_recursiva WHERE n < 100
) SELECT SUM(n) FROM tabla_recursiva;

-- Tabla recursiva ejemplo 2
WITH RECURSIVE precio_recursivo(n) AS (
   VALUES (0)
   UNION ALL
   SELECT precio_renta FROM peliculas WHERE precio_renta < 0.99
) SELECT SUM(n) FROM precio_recursivo;

SELECT SUM(precio_renta) FROM peliculas WHERE precio_renta < 0.99;