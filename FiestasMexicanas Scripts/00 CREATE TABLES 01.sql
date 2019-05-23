USE FiestasMexicanas
GO

CREATE TABLE CATALOGO_PAISES (
	cpaiIndice tinyint NOT NULL,
	cpaiNombre varchar(50) NOT NULL,
	CONSTRAINT PK_PAISES PRIMARY KEY (cpaiIndice)
);

CREATE TABLE CATALOGO_ESTADOS (
	cpaiIndice tinyint,
	cedoIndice tinyint NOT NULL,
	cedoNombre varchar(50) NOT NULL	

	CONSTRAINT PK_ESTADOS PRIMARY KEY (cpaiIndice, cedoIndice),
	CONSTRAINT FK_PAISES_ESTADOS FOREIGN KEY (cpaiIndice)
		REFERENCES CATALOGO_PAISES (cpaiIndice)
);

CREATE TABLE CATALOGO_CIUDADES (
	cpaiIndice tinyint,
	cedoIndice tinyint,
	cciuIndice tinyint NOT NULL,
	cciuNombre varchar(50) NOT NULL

	CONSTRAINT PK_CIUDADES PRIMARY KEY (cpaiIndice, cedoIndice, cciuIndice),
	CONSTRAINT FK_ESTADOS_CIUDADES FOREIGN KEY (cpaiIndice, cedoIndice)
		REFERENCES CATALOGO_ESTADOS(cpaiIndice, cedoIndice)
);

CREATE TABLE CATALOGO_TIPO_PINATA
(
	ctpinCodigo int,
	ctpinNombre VARCHAR(30),
	CONSTRAINT PK_TIPO_PINATA PRIMARY KEY (ctpinCodigo)	
);

CREATE TABLE PRECIO_PINATA
(
	ctpinCodigo int,
	ppinChica money,
	ppinMediana money,
	ppinGrande money,
	ppinDetalle money,
	ppinAlambreMetro money,
	ppinExisteMolde bit,
	CONSTRAINT PK_PRECIO_PINATA PRIMARY KEY (ctpinCodigo)
);
ALTER TABLE PRECIO_PINATA
ADD CONSTRAINT FK_PRECIO_PINATA_CATALOGO_TIPO_PINATA
FOREIGN KEY (ctpinCodigo) REFERENCES CATALOGO_TIPO_PINATA(ctpinCodigo);
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

CREATE TABLE CATALOGO_CLIENTES
(
	cclieCodigo int,
	cclieNombres varchar(60),
	cclieApellidoPaterno varchar(60),
	cclieApellidoMaterno varchar(60),
	cclieRazonSocial varchar(200),
	cpaiIndice tinyint,
	cedoIndice tinyint,
	cciuIndice tinyint,
	cclieDireccion varchar(200),
	cclieTelefono varchar(13),
	cclieCelular varchar(13),
	cclieEmail varchar(30),

	CONSTRAINT PK_CATALOGO_CLIENTES PRIMARY KEY (cclieCodigo)
)
ALTER TABLE CATALOGO_CLIENTES
ADD CONSTRAINT FK_CATALOGO_CLIENTES_CATALOGO_CIUDADES
FOREIGN KEY (cpaiIndice, cedoIndice, cciuIndice) REFERENCES CATALOGO_CIUDADES(cpaiIndice, cedoIndice, cciuIndice)


CREATE TABLE CATALOGO_TAMANO_PINATA
(
	ctampCodigo tinyint,
	ctampNombre VARCHAR(20),
	CONSTRAINT PK_CATALOGO_TAMANO_PINATA PRIMARY KEY (ctampCodigo)
);

CREATE TABLE PEDIDO_PINATA
(
	ppedCodigo int,
	ctpinCodigo int,
	ctampCodigo tinyint,
	ppedLlevaDetalle bit,
	ppedDescripcion varchar(300),
	cclieCodigo int,
	ppedPrecioUnitario money,
	ppedCantidad int,
	ppedFechaPedido datetime,
	ppedFechaEntregaProgramada datetime,
	ppedFechaSalida datetime,

	CONSTRAINT PK_PEDIDO_PINATA PRIMARY KEY (ppedCodigo)
);
ALTER TABLE PEDIDO_PINATA
ADD CONSTRAINT FK_PEDIDO_PINATA_CATALOGO_TIPO_PINATA
FOREIGN KEY (ctpinCodigo) REFERENCES CATALOGO_TIPO_PINATA(ctpinCodigo);
ALTER TABLE PEDIDO_PINATA
ADD CONSTRAINT FK_PEDIDO_PINATA_CATALOGO_CLIENTES
FOREIGN KEY (cclieCodigo) REFERENCES CATALOGO_CLIENTES (cclieCodigo)
ALTER TABLE PEDIDO_PINATA
ADD CONSTRAINT FK_PEDIDO_PINATA_CATALOGO_TAMANO_PINATA
FOREIGN KEY (ctampCodigo) REFERENCES CATALOGO_TAMANO_PINATA (ctampCodigo)


CREATE TABLE CATALOGO_PROVEEDORES
(
	cprovCodigo int,
	cprovNombres varchar(60),
	cprovApellidoPaterno varchar(60),
	cprovApellidoMaterno varchar(60),
	cprovRazonSocial varchar(200),
	cpaiIndice tinyint,
	cedoIndice tinyint,
	cciuIndice tinyint,
	cprovDireccion varchar(200),
	cprovTelefono varchar(13),
	cprovCelular varchar(13),
	cprovEmail varchar(30),

	CONSTRAINT PK_CATALOGO_PROVEEDORES PRIMARY KEY (cprovCodigo)
);
ALTER TABLE CATALOGO_PROVEEDORES
ADD CONSTRAINT FK_CATALOGO_PROVEEDORES_CATALOGO_CIUDADES
FOREIGN KEY (cpaiIndice, cedoIndice, cciuIndice) REFERENCES CATALOGO_CIUDADES(cpaiIndice, cedoIndice, cciuIndice);

CREATE TABLE CATALOGO_EMPLEADOS_PUESTOS
(
	cemppCodigo tinyint,
	cemppNombrePuesto varchar(50),
	CONSTRAINT PK_CATALOGO_EMPLEADOS_PUESTOS PRIMARY KEY (cemppCodigo)
);

CREATE TABLE CATALOGO_EMPLEADOS
(
	cempCodigo int,
	cemppCodigo tinyint, ---puesto
	cempNombres varchar(60),
	cempApellidoPaterno varchar(60),
	cempApellidoMaterno varchar(60),
	cempSexo bit, --0 para hombre, 1 para mujer
	cempFechaNacimiento date,
	cempHomoclave varchar(3),
	cpaiIndice tinyint,
	cedoIndice tinyint,
	cciuIndice tinyint,
	cempDireccion varchar(200),
	cempTelefono varchar(13),
	cempCelular varchar(13),
	cempSueldoBruto money,
	cempFechaContratacion date,

	CONSTRAINT PK_CATALOGO_EMPLEADOS PRIMARY KEY (cempCodigo)
);

ALTER TABLE CATALOGO_EMPLEADOS
ADD CONSTRAINT FK_CATALOGO_EMPLEADOS_CATALOGO_EMPLEADOS_PUESTOS
FOREIGN KEY (cemppCodigo) REFERENCES CATALOGO_EMPLEADOS_PUESTOS (cemppCodigo);
ALTER TABLE CATALOGO_EMPLEADOS
ADD CONSTRAINT FK_CATALOGO_EMPLEADOS_CATALOGO_CIUDADES
FOREIGN KEY (cpaiIndice, cedoIndice, cciuIndice) REFERENCES CATALOGO_CIUDADES (cpaiIndice, cedoIndice, cciuIndice);

CREATE TABLE ARTESANOS
(
	cempCodigo int,
	artGananciaPorcentaje decimal,
	artSueldoBase money
);
ALTER TABLE ARTESANOS
ADD CONSTRAINT FK_ARTESANOS_CATALOGO_EMPLEADOS
FOREIGN KEY (cempCodigo) REFERENCES CATALOGO_EMPLEADOS(cempCodigo);


CREATE TABLE CATALOGO_PEDIDO_ESTATUS
(
	cpestCodigo tinyint,
	cpestNombre varchar(30),

	CONSTRAINT PK_CATALOGO_PEDIDO_ESTATUS PRIMARY KEY (cpestCodigo)
);

CREATE TABLE ARTESANOS_PEDIDOS
(
	cempCodigo int, --Numero de artesano
	ppedCodigo int,	--Numero de pedido
	cpestCodigo tinyint, --estatus
	artpedFechaCompletado datetime
);
ALTER TABLE ARTESANOS_PEDIDOS
ADD CONSTRAINT FK_ARTESANOS_PEDIDOS_CATALOGO_EMPLEADOS
FOREIGN KEY (cempCodigo) REFERENCES CATALOGO_EMPLEADOS(cempCodigo);
ALTER TABLE ARTESANOS_PEDIDOS
ADD CONSTRAINT FK_ARTESANOS_PEDIDOS_PEDIDO_PINATA
FOREIGN KEY (ppedCodigo) REFERENCES PEDIDO_PINATA (ppedCodigo);
ALTER TABLE ARTESANOS_PEDIDOS
ADD CONSTRAINT FK_ARTESANOS_PEDIDOS_CATALOGO_PEDIDO_ESTATUS
FOREIGN KEY (cpestCodigo) REFERENCES CATALOGO_PEDIDO_ESTATUS (cpestCodigo);

CREATE TABLE USUARIOS_SISTEMA
(
	usisCodigo int,
	cempCodigo int,
	usisAlias VARCHAR(20),
	usisPassword VARCHAR(30),
	CONSTRAINT PK_USUARIOS_SISTEMA PRIMARY KEY (usisCodigo)
);
ALTER TABLE USUARIOS_SISTEMA
ADD CONSTRAINT FK_USUARIOS_SISTEMA_CATALOGO_EMPLEADOS
FOREIGN KEY (cempCodigo) REFERENCES CATALOGO_EMPLEADOS (cempCodigo)

/* CORRECCIONES */
-- se me olvido ponerle llave primaria xd
ALTER TABLE ARTESANOS
ALTER COLUMN cempCodigo int NOT NULL;

DELETE FROM ARTESANOS;

ALTER TABLE ARTESANOS
ADD CONSTRAINT PK_ARTESANOS PRIMARY KEY (cempCodigo);

--cambiado el valor del decimal en el porcentaje de ganancia
ALTER TABLE ARTESANOS
ALTER COLUMN artGananciaPorcentaje decimal(3,2)

GO