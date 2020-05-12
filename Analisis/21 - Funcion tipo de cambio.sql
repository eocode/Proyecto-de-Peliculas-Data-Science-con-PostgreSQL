-- Funciona para cambiar tipo de cambio
-- FUNCTION: public.precio_peliculas_tipo_cambio()
-- DROP FUNCTION public.precio_peliculas_tipo_cambio();
CREATE FUNCTION public.precio_peliculas_tipo_cambio()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
	INSERT INTO precio_peliculas_tipo_cambio(
		pelicula_id,
		tipo_cambio_id,
		precio_tipo_cambio,
		ultima_actualizacion
	)
	SELECT NEW.pelicula_id,
		tipos_cambio.tipo_cambio_id,
		tipos_cambio.cambio_usd * NEW.precio_renta AS precio_tipo_cambio,
		CURRENT_TIMESTAMP
	FROM tipos_cambio
	WHERE tipos_cambio.codigo = 'MXN';
	RETURN NEW;
END$BODY$;

ALTER FUNCTION public.precio_peliculas_tipo_cambio()
    OWNER TO elias;
