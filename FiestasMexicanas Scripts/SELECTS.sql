SELECT * FROM CATALOGO_PAISES;
SELECT * FROM CATALOGO_ESTADOS;

SELECT * FROM PRECIO_PINATA PP
JOIN CATALOGO_TIPO_PINATA CTP
	ON PP.ctpinCodigo = CTP.ctpinCodigo
