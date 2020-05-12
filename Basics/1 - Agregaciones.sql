-- Obtener el precio máximo y mínimo de una película por título
SELECT titulo, MAX(precio_renta), MIN(precio_renta)
FROM peliculas
GROUP BY titulo;

-- Cuanto nos costaría rentar todas las peliculas
SELECT SUM(precio_renta) 
FROM peliculas;

-- Peliculas por clasificación
SELECT clasificacion, COUNT(*)
FROM peliculas
GROUP BY clasificacion;

__ Costo promedio de peliculas
SELECT AVG(precio_renta)
FROM peliculas;

-- Precio promedio por clasificación
SELECT clasificacion, AVG(precio_renta) AS precio_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY precio_promedio DESC;

-- Duración promedio por clasificación
SELECT clasificacion, AVG(duracion) AS duracion_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY duracion_promedio DESC;

-- Duración de renta promedio por clasificación
SELECT clasificacion, AVG(duracion_renta) AS duracion_renta_promedio
FROM peliculas
GROUP BY clasificacion
ORDER BY duracion_renta_promedio DESC;
