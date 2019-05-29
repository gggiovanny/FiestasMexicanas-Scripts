SELECT * FROM CATALOGO_PAISES;
SELECT * FROM CATALOGO_ESTADOS;
SELECT * FROM CATALOGO_CIUDADES;


SELECT * FROM PRECIO_PINATA
WHERE ctpinCodigo = 1;

SELECT * FROM PEDIDO_PINATA;
SELECT * FROM CATALOGO_TIPO_PINATA;

select c.name from sys.columns c
inner join sys.views t 
on t.object_id = c.object_id
and t.name = 'v_CATALOGO_CLIENTES' 

select * from sys.columns
select * from sys.tables

SELECT * FROM CATALOGO_CLIENTES;

SELECT
	CC.cclieCodigo,
	CC.cclieNombres,
	CC.cclieApellidoPaterno,
	CC.cclieApellidoMaterno,
	CC.cclieRazonSocial,
	CC.cclieDireccion,
	CC.cclieTelefono,
	CC.cclieCelular,
	CC.cclieEmail,
	CP.cpaiNombre,
	CE.cedoNombre,
	CCIU.cciuNombre
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

SELECT * FROM PEDIDO_PINATA;

SELECT * FROM v_CLIENTES;
SELECT * FROM v_CATALOGO_CLIENTES;

SELECT * FROM v_PROVEEDORES;

SELECT * FROM v_PRECIO_PINATA;

SELECT * FROM v_COTIZACIONES;

SELECT * FROM v_GESTOR_GANANCIAS;

SELECT * FROM v_VISOR_CARGA_TRABAJO;

SELECT * FROM v_ASIGNACION_TRABAJO_ARTESANOS;

SELECT * FROM v_ASIGNACION_TRABAJO_PEDIDOS_ESPERANDO;


SELECT * FROM CATALOGO_CIUDADES WHERE cpaiIndice = 31 AND cedoIndice = 31;

SELECT COUNT(*) FROM PEDIDO_PINATA;

SELECT CONVERT(date, '5/26/2019 8:39:30 PM');


SELECT * FROM PRECIO_PINATA WHERE ctpinCodigo = 5

SELECT * FROM USUARIOS_SISTEMA
WHERE usisCodigo = 3

SELECT 	* FROM CATALOGO_EMPLEADOS 

select * from CATALOGO_EMPLEADOS_PUESTOS


SELECT 
	                                        CE.cemppCodigo 
                                        FROM CATALOGO_EMPLEADOS CE
                                        WHERE CE.cempCodigo = 3;