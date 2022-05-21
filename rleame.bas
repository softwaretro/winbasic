'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'                                            VISOR DE FICHEROS DE TEXTO
DECLARE SUB mensaje (t$)
DECLARE SUB desplazamiento (v!, n!)
DECLARE SUB borde (Row1!, COL1!, row2!, col2!, PAPEL!, MARCO!)
DIM SHARED mat$(0 TO 1000)
ON ERROR GOTO errores

COLOR 15, 1: CLS
PALETTE 6, 62
PALETTE 1, 8
PALETTE 4, 36
borde 1, 1, 25, 80, 6, 1
COLOR 1, 6: LOCATE 1, 6: PRINT SPACE$(35)
LOCATE 1, 7: PRINT "Presentaci¢n de archivos de texto"
COLOR 1, 6: LOCATE 25, 30: PRINT SPACE$(45);
LOCATE 25, 31: COLOR 1: PRINT "Escribir el nombre ";
COLOR 1: PRINT "          WINBAS";

LOCATE 16, 13: PRINT " Nombre del archivo ";
COLOR 4: PRINT "  [Unidad:][Ruta\]Archivo.Extensi¢n "
borde 15, 11, 20, 70, 6, 1
LOCATE 18, 13: INPUT "", nombre$

OPEN nombre$ FOR INPUT AS #1
COLOR 1, 6: LOCATE 25, 30: PRINT SPACE$(45);
LOCATE 25, 31: COLOR 4: PRINT " Cargando Archivo...  ";
COLOR 1: PRINT "       Hecho en Ronda ";


DO
   n = n + 1
   LINE INPUT #1, mat$(n)
LOOP WHILE NOT EOF(1)

FOR nnnn = 1 TO 22
   n = n + 1
   mat$(n) = SPACE$(78)
NEXT
COLOR 15, 1
vv = 0
DO
   LOCATE 2, 1
   FOR nn = 1 + vv TO 23 + vv
      txt$ = MID$(mat$(nn), 1, 78)
      COLOR 6, 1: PRINT "³";
      COLOR 15: PRINT txt$; SPACE$(78 - LEN(txt$));
      COLOR 9: PRINT "°";
   NEXT
   desplazamiento vv, n

   COLOR 1, 6: LOCATE 25, 30: PRINT SPACE$(45);
   LOCATE 25, 31: COLOR 4: PRINT "";
   COLOR 1: PRINT " Mover  ";
   COLOR 4: PRINT "ESC ";
   COLOR 1: PRINT "Salir          WINBAS ";
   VIEW PRINT 2 TO 24
   DO
      kbd$ = INKEY$
   LOOP WHILE kbd$ = ""
   IF n > 23 THEN
      SELECT CASE kbd$
         CASE CHR$(0) + "H": vv = vv - 1
         CASE CHR$(0) + "P": vv = vv + 1
         CASE CHR$(27): END
      END SELECT
      IF vv < 0 THEN vv = 0
      IF vv > n - 23 THEN vv = n - 23
   END IF
LOOP UNTIL kbd$ = CHR$(27)


END


errores:
SELECT CASE ERR
   CASE 7: CLEAR : mensaje "Memoria agotada."
   CASE 14: CLEAR : mensaje "Archivo demasiado grande."
   CASE 52: mensaje "El nombre del archivo es incorrecto."
   CASE 53: mensaje "No se ha encontrado el archivo."
   CASE 55: mensaje "El archivo ya est  abierto."
   CASE 64: mensaje "El nombre del archivo es incorrecto."
   CASE 70: mensaje "Permiso de acceso denegado."
   CASE 71: mensaje "No se encuentra el diskete en la unidad."
   CASE 72: mensaje "Error en los discos."
   CASE 75: mensaje "Error de acceso al archivo."
   CASE 76: mensaje "No se encuentran los directorios de la ruta de acceso."
   CASE ELSE: mensaje "Se ha producido el error n§" + STR$(ERR) + " de QBasic."
END SELECT

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...    www.jm-web.tk     ::    es.geocities.com/jm00092
'
'______________________________________________________________________
'                                  
SUB borde (Row1, COL1, row2, col2, PAPEL, MARCO) STATIC
COLOR PAPEL, MARCO
ANCHO = col2 - COL1 + 1
LOCATE Row1, COL1
PRINT "Ú"; STRING$(ANCHO - 2, "Ä"); "¿";
FOR A = Row1 + 1 TO row2 - 1
   LOCATE A, COL1
   PRINT "³";
   LOCATE A, COL1 + (ANCHO - 1): PRINT "³";
NEXT A
LOCATE row2, COL1
PRINT "À"; STRING$(ANCHO - 2, "Ä"); "Ù";
END SUB

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...    www.jm-web.tk     ::    es.geocities.com/jm00092
'
'______________________________________________________________________
'                                  
SUB desplazamiento (v, n)
COLOR 1, 6
LOCATE 2, 80: PRINT ""
LOCATE 24, 80: PRINT "";
'li = ((25 / n) * v) + 3
li = INT((v / n) * 25) + 3
IF li > 23 THEN li = 23
LOCATE li, 80: COLOR 15, 4: PRINT " "; '"";
LOCATE 25, 12: PRINT SPACE$(18);
LOCATE 25, 12: PRINT " L¡nea"; v + 1; "de"; n - 22;
END SUB

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...    www.jm-web.tk     ::    es.geocities.com/jm00092
'
'______________________________________________________________________
'                                  
SUB mensaje (t$)
COLOR 14, 1: CLS
borde 11, 6, 15, 75, 6, 1
LOCATE 13, 40 - (LEN(t$) / 2): PRINT t$
COLOR 1, 1
END
END SUB

