-- Trigger que llama a la función tipo de cambio
CREATE TRIGGER trigger_update_tipos_cambio
	AFTER INSERT OR UPDATE
	ON public.peliculas
	FOR EACH ROW
	EXECUTE PROCEDURE public.precio_peliculas_tipo_cambio();