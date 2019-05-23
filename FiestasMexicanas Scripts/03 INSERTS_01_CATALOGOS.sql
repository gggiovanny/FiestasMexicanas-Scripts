/* Catalogos de direcciones */

INSERT INTO CATALOGO_PAISES(cpaiIndice, cpaiNombre) VALUES (1, 'MEXICO');                                             
                                             
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   1, 'AGUASCALIENTES      ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   2, 'BAJA CALIFORNIA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   3, 'BAJA CALIFORNIA SUR       ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   4, 'CAMPECHE      ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   5, 'COAHUILA DE ZARAGOZA      ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   6, 'COLIMA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   7, 'CHIAPAS    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   8, 'CHIHUAHUA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   9, 'DISTRITO FEDERAL    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   10,   'DURANGO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   11,   'GUANAJUATO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   12,   'GUERRERO      ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   13,   'HIDALGO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   14,   'JALISCO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   15,   'MÉXICO     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   16,   'MICHOACÁN DE OCAMPO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   17,   'MORELOS    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   18,   'NAYARIT    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   19,   'NUEVO LEÓN    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   20,   'OAXACA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   21,   'PUEBLA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   22,   'QUERÉTARO     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   23,   'QUINTANA ROO     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   24,   'SAN LUIS POTOSÍ     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   25,   'SINALOA    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   26,   'SONORA     ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   27,   'TABASCO    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   28,   'TAMAULIPAS    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   29,   'TLAXCALA      ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   30,   'VERACRUZ DE IGNACIO DE LA LLAVE    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   31,   'YUCATÁN    ')                               
INSERT INTO CATALOGO_ESTADOS(cpaiIndice,cedoIndice,cedoNombre) VALUES (1,   32,   'ZACATECAS     ')                               

INSERT INTO CATALOGO_CIUDADES(cpaiIndice, cedoIndice, cciuIndice, cciuNombre) VALUES (1, 31, 1, 'MERIDA');

/* Catalogos de piñatas */
/* Tipo:
humanoide hombre
humanoide mujer
animal
coche
estrella
cuadro caja
cuadro madera
balon
especial
*/
INSERT INTO CATALOGO_TIPO_PINATA VALUES (1, 'HUMANOIDE HOMBRE');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (2, 'HUMANOIDE MUJER');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (3, 'ANIMAL');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (4, 'COCHE');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (5, 'ESTRELLA');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (6, 'CUADRO CAJA');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (7, 'CUADRO MADERA');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (8, 'BALON');
INSERT INTO CATALOGO_TIPO_PINATA VALUES (9, 'ESPECIAL');

INSERT INTO PRECIO_PINATA VALUES (1, 300, 400, 500, 200, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (2, 350, 450, 600, 300, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (3, 300, 400, 500, 300, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (4, 400, 500, 600, 200, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (5, 200, 300, 800, 100, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (6, 200, 300, 400, 300, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (7, 400, 600, 800, 300, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (8, 300, 400, 500, 200, 6.1, 1);
INSERT INTO PRECIO_PINATA VALUES (9, 600, 800, 900, 200, 6.1, 0);

INSERT INTO CATALOGO_CLIENTES
(
	cclieCodigo,                       
	cclieNombres,
	cclieApellidoPaterno,
	cclieApellidoMaterno,
	cclieRazonSocial,
	cpaiIndice,
	cedoIndice,
	cciuIndice,
	cclieDireccion,
	cclieTelefono,
	cclieCelular,
	cclieEmail
)
VALUES
(
	1,
	'DIDIER',
	'PEÑA',
	'NAVARRETE',
	'DIDI INC.',
	1,
	31,
	1,
	'CALLE 123 COL. PACABTUN II ENTRE 123B Y 123C',
	'+52999412345',
	'+52999412345',
	'didier.pena@gmail.com'
);

INSERT INTO CATALOGO_TAMANO_PINATA VALUES (1,'CHICA');
INSERT INTO CATALOGO_TAMANO_PINATA VALUES (2,'MEDIANA');
INSERT INTO CATALOGO_TAMANO_PINATA VALUES (3,'GRANDE');

INSERT INTO PEDIDO_PINATA
(
	ppedCodigo, 
	ctpinCodigo,
	ctampCodigo,
	ppedLlevaDetalle,
	ppedDescripcion,
	cclieCodigo, 
	ppedPrecioUnitario,
	ppedCantidad,
	ppedFechaPedido,
	ppedFechaEntregaProgramada
)
VALUES
(
	1,
	3,
	1,
	1,
	'Un poni salvaje rosado.',
	1,
	250.5,
	3,
	CONVERT(date, getdate()),
	CONVERT(date, '2019-05-30')
);

UPDATE PEDIDO_PINATA
SET ppedFechaSalida = CONVERT(date, getdate())
WHERE ppedCodigo = 1;

INSERT INTO PEDIDO_PINATA
(
	ppedCodigo, 
	ctpinCodigo,
	ctampCodigo,
	ppedLlevaDetalle,
	ppedDescripcion,
	cclieCodigo, 
	ppedPrecioUnitario,
	ppedCantidad,
	ppedFechaPedido,
	ppedFechaEntregaProgramada
)
VALUES
(
	2,
	8,
	2,
	0,
	'Un balon del america :v',
	1,
	150,
	1,
	CONVERT(date, getdate()),
	CONVERT(date, '2019-06-03')
);



INSERT INTO CATALOGO_PROVEEDORES
(
	cprovCodigo,                       
	cprovNombres,
	cprovApellidoPaterno,
	cprovApellidoMaterno,
	cprovRazonSocial,
	cpaiIndice,
	cedoIndice,
	cciuIndice,
	cprovDireccion,
	cprovTelefono,
	cprovCelular,
	cprovEmail
)
VALUES
(
	1,
	'JUAN CARLOS',
	'AGUILAR',
	'SANCHEZ',
	'PAPELES DEL SURESTE',
	1,
	31,
	1,
	'CALLE 456 COL. MEXICO ENTRE 567B Y 567C',
	'+52999133445',
	'+52999133445',
	'jaguilar@psur.com'
);

INSERT INTO CATALOGO_EMPLEADOS_PUESTOS VALUES (1, 'GERENTE');
INSERT INTO CATALOGO_EMPLEADOS_PUESTOS VALUES (2, 'VENDEDOR');
INSERT INTO CATALOGO_EMPLEADOS_PUESTOS VALUES (3, 'ARTESANO');



INSERT INTO CATALOGO_EMPLEADOS
(
	cempCodigo,
	cemppCodigo,
	cempNombres,
	cempApellidoPaterno,
	cempApellidoMaterno,
	cempSexo, --0 para hombre, 1 para mujer
	cempFechaNacimiento,
	cempHomoclave,
	cpaiIndice,
	cedoIndice,
	cciuIndice,
	cempDireccion,
	cempTelefono,
	cempCelular,
	cempSueldoBruto,
	cempFechaContratacion
)
VALUES
(
	1,
	1, --es gerente
	'DAVID RENAN',
	'MAY',
	'MALDONADO',
	0, --hombre
	CONVERT(date, '1967-12-29'),
	'932',
	1,
	31,
	1,
	'CALLE 123B COL MEXICO',
	'9991123456',
	'9991123456',
	20000,
	CONVERT(date, '1990-07-13')
);

INSERT INTO CATALOGO_EMPLEADOS
(
	cempCodigo,
	cemppCodigo,
	cempNombres,
	cempApellidoPaterno,
	cempApellidoMaterno,
	cempSexo, --0 para hombre, 1 para mujer
	cempFechaNacimiento,
	cempHomoclave,
	cpaiIndice,
	cedoIndice,
	cciuIndice,
	cempDireccion,
	cempTelefono,
	cempCelular,
	cempSueldoBruto,
	cempFechaContratacion
)
VALUES
(
	2,
	3, --es artesano
	'JORGE',
	'CHAN',
	'POOT',
	0, --hombre
	CONVERT(date, '1977-04-15'),
	'963',
	1,
	31,
	1,
	'CALLE 123B COL BRISAS DEL SUR',
	'9991646778',
	'9991676436',
	0,
	CONVERT(date, '2002-03-17')
);

INSERT INTO ARTESANOS (cempCodigo, artGananciaPorcentaje, artSueldoBase) VALUES (2, 0.30, 0);

INSERT INTO CATALOGO_PEDIDO_ESTATUS VALUES (1, 'EN ESPERA');
INSERT INTO CATALOGO_PEDIDO_ESTATUS VALUES (2, 'ARMANDO');
INSERT INTO CATALOGO_PEDIDO_ESTATUS VALUES (3, 'FORRANDO');
INSERT INTO CATALOGO_PEDIDO_ESTATUS VALUES (4, 'TERMINADA');

INSERT INTO ARTESANOS_PEDIDOS (cempCodigo, ppedCodigo, cpestCodigo) VALUES (2, 1, 1);
INSERT INTO ARTESANOS_PEDIDOS (cempCodigo, ppedCodigo, cpestCodigo) VALUES (2, 2, 1);

UPDATE ARTESANOS_PEDIDOS
SET cpestCodigo = 2
WHERE ppedCodigo = 1;

UPDATE ARTESANOS_PEDIDOS
SET artpedFechaCompletado = CONVERT(date, getdate())
WHERE ppedCodigo = 1;

INSERT INTO USUARIOS_SISTEMA VALUES (1, 1, 'DAVID', '123456');
INSERT INTO USUARIOS_SISTEMA VALUES (2, 2, 'JORGE', '246810');
