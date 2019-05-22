CREATE VIEW v_CLIENTES
AS
	SELECT
		CC.cclieCodigo AS 'ID',
		CC.cclieNombres AS 'NOMBRE',
		CC.cclieApellidoPaterno + ' ' + cclieApellidoMaterno AS 'APELLIDOS',
		CC.cclieDireccion AS 'DIRECCION',
		CC.cclieTelefono AS 'TEL.',
		CC.cclieCelular AS 'CEL.',
		CC.cclieEmail AS 'EMAIL',
		CP.cpaiNombre AS 'PAIS',
		CE.cedoNombre AS 'ESTADO',
		CCIU.cciuNombre AS 'CIUDAD'
	FROM CATALOGO_CLIENTES CC
	INNER JOIN CATALOGO_PAISES CP
		ON CC.cpaiIndice = CP.cpaiIndice
	INNER JOIN CATALOGO_ESTADOS CE
		ON CC.cedoIndice = CE.cedoIndice
	INNER JOIN CATALOGO_CIUDADES CCIU
		ON CC.cciuIndice = CCIU.cciuIndice;
