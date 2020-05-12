-- Generar tabla con soporte JSON
CREATE TABLE ordenes(
	ID serial NOT NULL PRIMARY KEY,
	info json NOT NULL
)

-- Insertamos los datos
INSERT INTO ordenes(info)
VALUES
(
	'{"cliente": "Elias Ojeda", "items": {"producto": "Biberón", "cantidad": "24"}}'
),
(
	'{"cliente": "Liliana Goméz", "items": {"producto": "Carro juguete", "cantidad": "1"}}'
);

-- Accedemos a los datos
SELECT * FROM ordenes

-- Consultamos JSONs
SELECT info ->> 'cliente' AS cliente
FROM ordenes

SELECT info ->> 'cliente' AS cliente
FROM ordenes
WHERE info -> 'items' ->> 'producto' = 'Biberón'