'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        es.geocities.com/jm00092
'
'______________________________________________________________________
'
'
'                                 
'
'
'
DECLARE SUB acercade ()
DECLARE SUB ayuda ()
DECLARE SUB fileman ()
DECLARE SUB leame ()
DECLARE SUB linea25 (p%, f%, text$)
DECLARE SUB center (ROW%, text$)
DECLARE SUB entrada ()
DECLARE FUNCTION menu! (comando$, v!, h!, l!, f!, lr!, fr!, pp!, s!, t!)
DECLARE SUB caja (F1!, C1!, F2!, C2!, papel!, marco!, fondo!, sombra!)
DECLARE SUB pantalla ()
DIM SHARED conjuntomenu$(1 TO 8)

SCREEN 0

entrada




PROGRAMA:
pantalla

COLOR 1, 15

SUB acercade
pantalla
caja 8, 20, 17, 59, 7, 1, 1, 8
 LOCATE 9, 22: PRINT "M A S T E R"
LOCATE 10, 22: PRINT "BASEWIN 2.0"
LOCATE 11, 22: PRINT "--------------------------"
LOCATE 12, 25: PRINT "BASEWIN"
LOCATE 13, 25: PRINT "en mayo de 2022"
COLOR 9
LOCATE 15, 38: PRINT "Pulse cuaquier tecla"
LOCATE 16, 38: PRINT " para volver al men£"

DO: LOOP WHILE INKEY$ = ""
caja 8, 20, 17, 59, 7, 7, 7, 7
entrada
END SUB

SUB ayuda
pantalla
linea25 15, 4, " MINI-TUTORIAL        Pulse cualquier tecla para seguir"
caja 8, 20, 17, 59, 7, 1, 1, 8


LOCATE 10, 31: PRINT "AYUDA EN PANTALLA"
LOCATE 13, 25: PRINT "Uso del programa"
COLOR 9
LOCATE 15, 37: PRINT " Pulse cuaquier tecla"
LOCATE 16, 37: PRINT "para empezer la ayuda"

DO: LOOP WHILE INKEY$ = ""
caja 8, 20, 17, 59, 7, 1, 1, 8

LOCATE 11, 25: PRINT "Hay que copiar el texto"
LOCATE 12, 25: PRINT "sin equivocarse"
LOCATE 13, 25: PRINT "El programa mide las"
LOCATE 14, 25: PRINT "pulsaciones por minuto"

COLOR 9

LOCATE 16, 50: PRINT "Seguir"

DO: LOOP WHILE INKEY$ = ""

caja 8, 20, 17, 59, 7, 1, 1, 8


LOCATE 12, 25: PRINT "La pantalla se divide"
LOCATE 13, 25: PRINT "en dos ventanas "


COLOR 9

LOCATE 16, 50: PRINT "Seguir"

DO: LOOP WHILE INKEY$ = ""

caja 8, 20, 17, 59, 7, 7, 7, 7

caja 5, 20, 9, 59, 7, 1, 1, 8
LOCATE 7, 25: PRINT "Aqu¡ sale el texto"
SLEEP 1

caja 17, 20, 21, 59, 7, 1, 1, 8

LOCATE 19, 25: PRINT "Aqu¡ hay que escribir"
SLEEP 1
pantalla
linea25 15, 4, " MINI-TUTORIAL        Pulse cualquier tecla para seguir"
FOR a = 3 TO 18
caja a - 1, 30, a + 1, 49, 7, 7, 7, 7
caja a, 30, a + 2, 49, 7, 1, 1, 8
LOCATE a + 1, 35: PRINT "T E X T O"

SOUND a * 200, 3

NEXT
SLEEP 1
pantalla
linea25 15, 4, " MINI-TUTORIAL        Pulse cualquier tecla para terminar la ayuda"
caja 8, 20, 17, 59, 7, 1, 1, 8

LOCATE 9, 25: PRINT "   IMPORTANTE"
LOCATE 11, 25: PRINT "El programa no es un procesador"
LOCATE 12, 25: PRINT "de texto: Pulse s¢lo las teclas"
LOCATE 13, 25: PRINT "que se sugieren en cada momento"
LOCATE 14, 25: PRINT "para escribir, no se puede usar"
LOCATE 15, 25: PRINT "el rat¢n ni moverse libremente."

COLOR 9

LOCATE 16, 52: PRINT "Men£"

DO: LOOP WHILE INKEY$ <> ""
DO: LOOP WHILE INKEY$ = ""
pantalla
entrada
END SUB

SUB caja (F1, C1, F2, C2, papel, marco, fondo, sombra) STATIC

COLOR marco, fondo
    ANCHO = C2 - C1 + 1

     LOCATE F1, C1
    PRINT "Ú"; STRING$(ANCHO - 2, "Ä"); "¿";
     LOCATE F1, C1 + ANCHO: COLOR sombra, papel: PRINT "Ü"


    FOR a = F1 + 1 TO F2 - 1
        LOCATE a, C1
        COLOR marco, fondo: PRINT "³"; SPACE$(ANCHO - 2); "³";
         LOCATE a, C1 + ANCHO: COLOR sombra, papel: PRINT "Û"
    NEXT a

    LOCATE F2, C1
    COLOR marco, fondo: PRINT "À"; STRING$(ANCHO - 2, "Ä"); "Ù";
    LOCATE F2, C1 + ANCHO: COLOR sombra, papel: PRINT "Û"
    LOCATE F2 + 1, C1 + 1: COLOR sombra, papel:  PRINT STRING$(ANCHO, "ß")
    COLOR 15, fondo
END SUB

DEFINT A-Z
'Center:
'  Centers text on given row
SUB center (ROW, text$) STATIC
    LOCATE ROW, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

DEFSNG A-Z
SUB entrada
pantalla
linea25 15, 4, "Men£ principal"
caja 5, 20, 20, 50, 7, 1, 1, 8

LOCATE 6, 22: PRINT "Bienvenido "
LOCATE 7, 22: PRINT "WinBasic "
LOCATE 9, 22: PRINT "version 1.5"
COLOR 9
LOCATE 17, 22: PRINT "Elija opci¢n"
LOCATE 18, 22: PRINT "y pulse Enter"
SELECT CASE menu("Fileman usuario-leame reconocido-Ayuda en pantalla-Acerca de...-Salir", 12, 41, 15, 4, 14, 2, 7, 8, 0)
CASE 1: fileman
CASE 2: leame
CASE 3: ayuda
CASE 4: acercade
CASE 5: pantalla: END
END SELECT
caja 5, 20, 20, 70, 7, 7, 7, 7


END SUB

SUB fileman
pantalla

caja 8, 20, 17, 59, 7, 1, 1, 8
LOCATE 10, 22: PRINT "           Fileman"
LOCATE 13, 22: PRINT "................................."

COLOR 9

CLS

SHELL "FILEMAN"



COLOR 9
LOCATE 15, 38: PRINT "Pulse cuaquier tecla"
LOCATE 16, 38: PRINT "para empezar"

DO: LOOP WHILE INKEY$ = ""
pantalla
 

END SUB

SUB leame
pantalla

caja 8, 20, 17, 59, 7, 1, 1, 8
LOCATE 10, 22: PRINT "           leame"
LOCATE 13, 22: PRINT "................................."

COLOR 9

CLS

SHELL "LEAME"



COLOR 9
LOCATE 15, 38: PRINT "Pulse cuaquier tecla"
LOCATE 16, 38: PRINT "para empezar"

DO: LOOP WHILE INKEY$ = ""
pantalla
 

END SUB

' ESCRIBE ALGO EN EL CENTRO DE LA LINEA 25
' p% = COLOR DE LETRA
' f% = COLOR DE FONDO
' fext$ = TEXTO A ESCRIBIR
'
SUB linea25 (p%, f%, text$) STATIC
VIEW PRINT 25 TO 25
COLOR p%, f%: PRINT SPACE$(80)
center 25, text$
VIEW PRINT
END SUB

'SUB menu (lin, col, letra, fondo, letrares, fondores, forma, orden, cadenalinea$)
'
'  camando$....Conjunto de ordenes del men£ separadas por guiones
'  v,h.........Posici¢n superior izquierda
'  l...........Color de letra
'  f...........Color de fondo
'  lr..........Color de letra resaltada
'  fr..........Color de fondo resaltado
'  p...........Color del fondo de la pantalla detr s del men£
'  s...........Color de la sombra del men£ en relieve
'  t...........Tipo se men£  0=Simple  1=Sombra   2=Borde y sombra
'
'
FUNCTION menu (comando$, v, h, l, f, lr, fr, pp, s, t)
comando$ = comando$ + "-"
p = 0
linea$ = ""
FOR n = 1 TO LEN(comando$)
letra$ = MID$(comando$, n, 1)
SELECT CASE letra$
CASE "-": p = p + 1: conjuntomenu$(p) = linea$: linea$ = ""
CASE ELSE: linea$ = linea$ + letra$
END SELECT
NEXT
numlineas = p
largo = 0
FOR n = 1 TO numlineas
la = LEN(conjuntomenu$(n))
IF la > largo THEN : largo = la
NEXT
h2 = h + largo + 1
v2 = v + numlineas - 1
SELECT CASE t
CASE 1: caja v, h, v2, h2, pp, l, f, s
CASE 2: caja v - 1, h - 1, v2 + 1, h2 + 1, pp, l, f, s
END SELECT
FOR n = 1 TO numlineas
la = LEN(conjuntomenu$(n))
nuevalinea$ = " " + conjuntomenu$(n) + SPACE$((largo - la) + 1)
conjuntomenu$(n) = nuevalinea$
NEXT
COLOR l, f
FOR vv = v + 1 TO v + numlineas - 1
LOCATE vv, h: PRINT conjuntomenu$(vv - v + 1); ' Numlineas; largo
NEXT
LOCATE v, h: COLOR lr, fr: PRINT conjuntomenu$(1);
p = 1
DO
DO
kbd$ = INKEY$
LOOP WHILE kbd$ = ""
COLOR l, f
FOR vv = v TO v + numlineas - 1
LOCATE vv, h: PRINT conjuntomenu$(vv - v + 1);
NEXT
SELECT CASE kbd$
CASE CHR$(0) + "H": p = p - 1
CASE CHR$(0) + "P": p = p + 1
CASE CHR$(13): EXIT DO
CASE ELSE: SOUND 400, 2
END SELECT
IF p < 1 THEN : p = numlineas
IF p > numlineas THEN : p = 1
LOCATE v + p - 1, h: COLOR lr, fr: PRINT conjuntomenu$(p);
LOOP
LOCATE v + p - 1, h: COLOR lr, fr: PRINT conjuntomenu$(p);
menu = p
END FUNCTION

SUB pantalla
COLOR 31, 15: CLS

COLOR 15, 1
LOCATE 1, 1: PRINT SPACE$(80)
LOCATE 1, 24: PRINT "winbasic 1.5"
linea25 31, 4, "Hecho en softwaretro"

END SUB

