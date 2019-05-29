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

ALTER VIEW v_COTIZACIONES
AS
	SELECT
		PED.ppedCodigo AS 'txtCodigo',
		PED.ctpinCodigo AS 'cmbTipo',
		PED.ctampCodigo AS 'cmbTamaño',
		PED.ppedLlevaDetalle AS 'chkDetalle',
		PPI.ppinExisteMolde AS 'chkHay molde',
		PED.ppedDescripcion AS 'txtDescripcion',
		PED.cclieCodigo AS 'cmbCliente',
		FORMAT(PED.ppedPrecioUnitario, 'C', 'es-MX') AS 'txtImporte Venta',
		PED.ppedCantidad AS 'txtCantidad',
		--FORMAT(PED.ppedPrecioUnitario*PED.ppedCantidad, 'C', 'es-MX') AS 'Importe venta',
		CASE	WHEN PED.ppedFechaSalida IS NULL THEN 0
				WHEN FORMAT ( PED.ppedFechaSalida, 'd', 'es-MX' ) = FORMAT ( CONVERT(date, '01/01/1900'), 'd', 'es-MX' ) THEN 0
				ELSE 1 END AS 'chkEntregado'
	FROM PEDIDO_PINATA PED
	INNER JOIN PRECIO_PINATA PPI
		ON PED.ctpinCodigo = PPI.ctpinCodigo

ALTER VIEW v_GESTOR_GANANCIAS
AS/*
	SELECT
		FORMAT ( PED.ppedFechaSalida, 'D', 'es-MX' ) AS 'FECHA',
		(	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad AS 'PIÑATAS VENDIDAS',
		(	select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario), 'C', 'es-MX') 
			from PEDIDO_PINATA x
			/*inner join ARTESANOS_PEDIDOS ap
				on x.ppedCodigo = ap.ppedCodigo*/
			where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)
		) AS 'VENTAS BRUTAS',
		(select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario) * 0.16, 'C', 'es-MX') from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'IVA',
		(select FORMAT(SUM(x.ppedCantidad * x.ppedPrecioUnitario) - (SUM(x.ppedCantidad * x.ppedPrecioUnitario) * 0.16), 'C', 'es-MX') from PEDIDO_PINATA x where DATEPART(week, x.ppedFechaSalida) = DATEPART(week, PED.ppedFechaSalida)) AS 'VENTAS NETAS'
	FROM PEDIDO_PINATA PED
	WHERE DATEPART(week, PED.ppedFechaSalida) = DATEPART(week, getdate());
	*/

	SELECT
		FORMAT ( PED.ppedFechaSalida, 'D', 'es-MX' ) AS 'FECHA',
		(	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad AS 'PIÑATAS VENDIDAS',
		FORMAT((	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad*PED.ppedPrecioUnitario, 'C', 'es-MX') AS 'VENTAS BRUTAS',
		FORMAT((	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad*PED.ppedPrecioUnitario*0.16, 'C', 'es-MX') AS 'IVA',
		FORMAT(((	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad*PED.ppedPrecioUnitario)-((	select COUNT(x.ppedCodigo) 
			from PEDIDO_PINATA x 
			where x.ppedFechaSalida = PED.ppedFechaSalida
		)*PED.ppedCantidad*PED.ppedPrecioUnitario*0.16), 'C', 'es-MX') AS 'VENTAS NETAS'
	FROM PEDIDO_PINATA PED
	WHERE DATEPART(week, PED.ppedFechaSalida) = DATEPART(week, getdate());


ALTER VIEW v_VISOR_CARGA_TRABAJO
AS
	SELECT
		PED.ppedCodigo AS 'CODIGO_PEDIDO',
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


ALTER VIEW v_ASIGNACION_TRABAJO_PEDIDOS_ESPERANDO
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
	FULL OUTER JOIN ARTESANOS_PEDIDOS PART
		ON PED.ppedCodigo = PART.ppedCodigo
	WHERE PART.cpestCodigo IS NULL
	

ALTER VIEW v_CATALOGO_CLIENTES
AS
	SELECT
		CC.cclieCodigo,
		CC.cclieNombres + ' ' + CC.cclieApellidoPaterno + ' ' + CC.cclieApellidoMaterno AS 'cclieNombre'
	FROM CATALOGO_CLIENTES CC

ALTER VIEW v_ARTESANOS_SUELDOS
AS
	SELECT
		ART.cempCodigo AS 'CODIGO',
		EMP.cempNombres AS 'NOMBRE',
		EMP.cempApellidoPaterno + ' ' + EMP.cempApellidoMaterno AS 'APELLIDOS',
		(	select SUM(pp.ppedCantidad)
			from ARTESANOS_PEDIDOS ap
			inner join PEDIDO_PINATA pp
				on ap.ppedCodigo = pp.ppedCodigo
			where ap.cempCodigo = ART.cempCodigo
			and ap.artpedFechaCompletado > CONVERT(date, '01/01/1900')		
			and DATEPART(week, ap.artpedFechaCompletado) = DATEPART(week, getdate())
		) AS 'PIÑATAS HECHAS',
		CAST(CAST(ART.artGananciaPorcentaje * 100 AS NUMERIC(3)) AS VARCHAR) + '%' AS 'GANANCIA %',
		FORMAT((	select SUM(pp.ppedPrecioUnitario*ppedCantidad) 
			from PEDIDO_PINATA pp
			inner join ARTESANOS_PEDIDOS ap
				ON pp.ppedCodigo = ap.ppedCodigo
			where ap.cempCodigo = ART.cempCodigo
			and ap.cpestCodigo = 4
			and DATEPART(week, ap.artpedFechaCompletado) = DATEPART(week, getdate())
		) * ART.artGananciaPorcentaje, 'C', 'es-MX' ) AS 'TOTAL GANANCIA',
		FORMAT(ART.artSueldoBase, 'C', 'es-MX') AS 'SUELDO BRUTO',
		FORMAT(ART.artSueldoBase * 0.16 , 'C', 'es-MX') AS 'I.V.A.',
		FORMAT(ART.artSueldoBase - (ART.artSueldoBase * 0.16), 'C', 'es-MX')AS 'SUELDO NETO'
	FROM ARTESANOS ART
	INNER JOIN CATALOGO_EMPLEADOS EMP
		ON ART.cempCodigo = EMP.cempCodigo




