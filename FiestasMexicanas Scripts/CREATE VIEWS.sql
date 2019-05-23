ALTER VIEW v_CLIENTES
AS
	SELECT
		CC.cclieCodigo AS 'ID',
		CC.cclieNombres AS 'NOMBRE',
		CC.cclieApellidoPaterno + ' ' + cclieApellidoMaterno AS 'APELLIDOS',
		CC.cclieRazonSocial AS 'RAZON SOCIAL',
		CC.cclieTelefono AS 'TEL',
		CC.cclieCelular AS 'CEL',
		CC.cclieEmail AS 'EMAIL',
		CC.cclieDireccion AS 'DIRECCION',
		CP.cpaiNombre AS 'PAIS',
		CE.cedoNombre AS 'ESTADO',
		CCIU.cciuNombre AS 'CIUDAD'
	FROM CATALOGO_CLIENTES CC
	INNER JOIN CATALOGO_PAISES CP
		ON CC.cpaiIndice = CP.cpaiIndice
	INNER JOIN CATALOGO_ESTADOS CE
		ON CC.cpaiIndice = CE.cpaiIndice
		AND CC.cedoIndice = CE.cedoIndice
	INNER JOIN CATALOGO_CIUDADES CCIU
		ON CC.cpaiIndice = CCIU.cpaiIndice
		AND CC.cedoIndice = CCIU.cedoIndice
		AND CC.cciuIndice = CCIU.cciuIndice;

ALTER VIEW v_PROVEEDORES
AS
	SELECT
		CPR.cprovCodigo AS 'ID',
		CPR.cprovNombres AS 'NOMBRE',
		CPR.cprovApellidoPaterno + ' ' + cprovApellidoMaterno AS 'APELLIDOS',
		CPR.cprovDireccion AS 'DIRECCION',
		CPR.cprovTelefono AS 'TEL.',
		CPR.cprovCelular AS 'CEL.',
		CPR.cprovEmail AS 'EMAIL',
		CPA.cpaiNombre AS 'PAIS',
		CES.cedoNombre AS 'ESTADO',
		CCIU.cciuNombre AS 'CIUDAD'
	FROM CATALOGO_PROVEEDORES CPR
	INNER JOIN CATALOGO_PAISES CPA
		ON CPR.cpaiIndice = CPA.cpaiIndice
	INNER JOIN CATALOGO_ESTADOS CES
		ON CPR.cpaiIndice = CES.cpaiIndice
		AND CPR.cedoIndice = CES.cedoIndice
	INNER JOIN CATALOGO_CIUDADES CCIU
		ON CPR.cpaiIndice = CCIU.cpaiIndice
		AND CPR.cedoIndice = CCIU.cedoIndice
		AND CPR.cciuIndice = CCIU.cciuIndice;


CREATE VIEW v_PRECIO_PINATA
AS
	SELECT
	PPI.ctpinCodigo AS 'Codigo',
	CTP.ctpinNombre AS 'Tipo piñata',
	PPI.ppinChica AS 'Precio chica',
	PPI.ppinMediana AS 'Precio mediana',
	PPI.ppinGrande AS 'Precio grande',
	PPI.ppinDetalle AS 'Costo detallada',
	PPI.ppinAlambreMetro AS 'Alambre metro',
	PPI.ppinExisteMolde AS 'Molde'
FROM PRECIO_PINATA PPI
INNER JOIN CATALOGO_TIPO_PINATA CTP
	ON PPI.ctpinCodigo = CTP.ctpinCodigo;

CREATE VIEW v_COTIZACIONES
AS
	SELECT
		PED.ppedCodigo AS 'Codigo',
		CTP.ctpinNombre AS 'Tipo',
		TAM.ctampNombre AS 'Tamaño',
		PED.ppedLlevaDetalle AS 'Detalle',
		PPI.ppinExisteMolde AS 'Hay molde',
		PED.ppedDescripcion AS 'Descripcion',
		CLI.cclieNombres + ' ' + CLI.cclieApellidoPaterno + ' ' + CLI.cclieApellidoMaterno AS 'CLIENTE',
		PED.ppedCantidad AS 'CANTIDAD',
		FORMAT(PED.ppedPrecioUnitario*PED.ppedCantidad, 'C', 'es-MX') AS 'Importe venta',
		CASE WHEN PED.ppedFechaSalida IS NOT NULL THEN 1 ELSE 0 END AS 'Entregado'
	FROM PEDIDO_PINATA PED
	INNER JOIN CATALOGO_TIPO_PINATA CTP
		ON PED.ctpinCodigo = CTP.ctpinCodigo
	INNER JOIN PRECIO_PINATA PPI
		ON PED.ctpinCodigo = PPI.ctpinCodigo
	INNER JOIN CATALOGO_TAMANO_PINATA TAM
		ON PED.ctampCodigo = TAM.ctampCodigo
	INNER JOIN CATALOGO_CLIENTES CLI
		ON PED.cclieCodigo = CLI.cclieCodigo;

CREATE VIEW v_GESTOR_GANANCIAS
AS

	SELECT
		FORMAT ( PED.ppedFechaSalida, 'D', 'es-MX' ) AS 'FECHA',
		(select COUNT(x.ppedCodigo) from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'PIÑATAS VENDIDAS',
		(select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario), 'C', 'es-MX') from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'VENTAS BRUTAS',
		(select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario) * 0.16, 'C', 'es-MX') from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'IVA',
		(select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario) - (SUM(x.ppedCantidad * x.ppedPrecioUnitario) * 0.16), 'C', 'es-MX') from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'VENTAS NETAS'
	FROM PEDIDO_PINATA PED
	WHERE DATEPART(week, PED.ppedFechaSalida) = DATEPART(week, getdate());

CREATE VIEW v_VISOR_CARGA_TRABAJO
AS
	SELECT
		ART.cempNombres AS 'NOMBRE',
		ART.cempApellidoPaterno + ' ' + ART.cempApellidoMaterno AS 'APELLIDOS',
		(select COUNT(*) from ARTESANOS_PEDIDOS x where x.cempCodigo = PART.cempCodigo and x.artpedFechaCompletado is null) AS 'PIÑATAS EN COLA',
		PED.ppedCodigo AS 'ID PIÑATA',
		CTP.ctpinNombre AS 'TIPO',
		TAM.ctampNombre AS 'TAMAÑO',
		PED.ppedLlevaDetalle AS 'DETALLE',
		PPI.ppinExisteMolde AS 'MOLDE',
		PED.ppedDescripcion AS 'DESCRIPCION',
		PED.ppedCantidad AS 'CANTIDAD',
		CASE WHEN PART.artpedFechaCompletado IS NOT NULL THEN 'TERMINADA' ELSE CEST.cpestNombre END AS 'ESTATUS'
	FROM PEDIDO_PINATA PED
	INNER JOIN CATALOGO_TIPO_PINATA CTP
		ON PED.ctpinCodigo = CTP.ctpinCodigo
	INNER JOIN PRECIO_PINATA PPI
		ON PED.ctpinCodigo = PPI.ctpinCodigo
	INNER JOIN CATALOGO_TAMANO_PINATA TAM
		ON PED.ctampCodigo = TAM.ctampCodigo
	INNER JOIN ARTESANOS_PEDIDOS PART
		ON PED.ppedCodigo = PART.ppedCodigo
	INNER JOIN CATALOGO_EMPLEADOS ART
		ON PART.cempCodigo = ART.cempCodigo
	INNER JOIN CATALOGO_PEDIDO_ESTATUS CEST
		ON PART.cpestCodigo = CEST.cpestCodigo;

CREATE VIEW v_ASIGNACION_TRABAJO_ARTESANOS
AS
	SELECT
		ART.cempCodigo AS 'ID',
		EMP.cempNombres AS 'NOMBRE',
		EMP.cempApellidoPaterno + ' ' + EMP.cempApellidoMaterno AS 'APELLIDOS',
		(select COUNT(*) from ARTESANOS_PEDIDOS x where x.cempCodigo = ART.cempCodigo and x.artpedFechaCompletado is null) AS 'EN COLA',
		CAST(CAST(ART.artGananciaPorcentaje * 100 AS NUMERIC(3)) AS VARCHAR) + '%' AS 'GANANCIA %',
		(select COUNT(*) from ARTESANOS_PEDIDOS x where x.cempCodigo = ART.cempCodigo and x.artpedFechaCompletado is null) AS 'NO. PEDIDOS'
	FROM ARTESANOS ART
	INNER JOIN CATALOGO_EMPLEADOS EMP
		ON ART.cempCodigo = EMP.cempCodigo;


CREATE VIEW v_ASIGNACION_TRABAJO_PEDIDOS_ESPERANDO
AS
	SELECT
		PED.ppedCodigo AS 'FOLIO',
		FORMAT ( PED.ppedFechaPedido, 'd', 'es-MX' ) AS 'FECHA PEDIDO',
		FORMAT ( PED.ppedFechaEntregaProgramada, 'd', 'es-MX' ) AS 'FECHA ENTREGA',
		CTP.ctpinNombre AS 'TIPO',
		TAM.ctampNombre AS 'TAMAÑO',
		PED.ppedLlevaDetalle AS 'DETALLE',
		PPI.ppinExisteMolde AS 'MOLDE',
		PED.ppedDescripcion AS 'DESCRIPCION',
		PED.ppedCantidad AS 'CANTIDAD',
		CLI.cclieRazonSocial AS 'CLIENTE'
	FROM PEDIDO_PINATA PED
	INNER JOIN CATALOGO_TIPO_PINATA CTP
		ON PED.ctpinCodigo = CTP.ctpinCodigo
	INNER JOIN PRECIO_PINATA PPI
		ON PED.ctpinCodigo = PPI.ctpinCodigo
	INNER JOIN CATALOGO_TAMANO_PINATA TAM
		ON PED.ctampCodigo = TAM.ctampCodigo
	INNER JOIN CATALOGO_CLIENTES CLI
		ON PED.cclieCodigo = CLI.cclieCodigo
	INNER JOIN ARTESANOS_PEDIDOS PART
		ON PED.ppedCodigo = PART.ppedCodigo
	WHERE PART.cpestCodigo < 4
	AND PART.artpedFechaCompletado IS NULL;