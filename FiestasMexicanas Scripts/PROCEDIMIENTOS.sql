CREATE PROC UPDATE_COTIZACIONES
@Codigo int,
@CodigoTipoPiñata tinyint,
@CodigoTamañoPiñata tinyint,
@LlevaDetalle bit,
@Descripcion varchar(300),
@CodigoCliente int,
@ImporteVentaUnidad money,
@Cantidad int,
@FechaSalidaEntregado datetime
AS
	UPDATE PEDIDO_PINATA
	SET
		ctpinCodigo = @CodigoTipoPiñata,
		ctampCodigo = @CodigoTamañoPiñata,
		ppedLlevaDetalle = @LlevaDetalle,
		ppedDescripcion = @Descripcion,
		cclieCodigo = @CodigoCliente,
		ppedPrecioUnitario = @ImporteVentaUnidad,
		ppedCantidad = @Cantidad,
		ppedFechaSalida = @FechaSalidaEntregado
	WHERE ppedCodigo = @Codigo;


CREATE PROC UPDATE_PRECIOS_PINATAS
@Codigo int,
@PrecioChica money,
@PrecioMediana money,
@PrecioGrande money,
@PrecioDetalle money,
@PrecioAlambreMetro money,
@ExisteMolde bit
AS
	UPDATE PRECIO_PINATA
	SET
		ppinChica = @PrecioChica,
		ppinMediana = @PrecioMediana,
		ppinGrande = @PrecioGrande,
		ppinDetalle = @PrecioDetalle,
		ppinAlambreMetro = @PrecioAlambreMetro,
		ppinExisteMolde = @ExisteMolde
	WHERE ctpinCodigo = @Codigo;


