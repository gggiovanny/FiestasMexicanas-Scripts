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

INSERT INTO CATALOGO_CIUDADES(cpaiIndice, cedoIndice, cciuIndice, cciuNombre) VALUES (1, 32, 1, 'MERIDA');

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


