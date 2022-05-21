'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...        https://jm00092.freehostia.com/progqb/index.htm
'
'______________________________________________________________________
'                                                  VISOR DE DIRECTORIOS
DECLARE FUNCTION Archivo$ ()
PALETTE 6, 62
PALETTE 1, 8
PALETTE 4, 36
nombre$ = Archivo$
CLS
PRINT nombre$

'
'  © JM. :: Hecho en Ronda
'
'
'  Procedente de...    www.jm-web.tk     ::    es.geocities.com/jm00092
'
'______________________________________________________________________
'               
FUNCTION Archivo$

ruta$ = "C:\"
DO
   COLOR 14, 1: CLS

   LOCATE 1, 1: PRINT STRING$(80, 196);
   LOCATE 25, 1: PRINT STRING$(80, 196);

   COLOR 1, 6: LOCATE 1, 6: PRINT " Directorio "
   COLOR 15, 4: LOCATE 25, 7: PRINT SPACE$(50);
   LOCATE 25, 8:  PRINT ruta$;
   LOCATE 25, 57: COLOR 1, 6: PRINT " winbasic";

   COLOR 15, 1
   VIEW PRINT 2 TO 24
   FILES ruta$
   VIEW PRINT

   lin = 2
   col = 1
   alin = 1
   acol = 1
   nomb$ = ""
   anomb$ = ""
   DO
      DO
         kbd$ = INKEY$
      LOOP WHILE kbd$ = ""
      alin = lin
      acol = col
      SELECT CASE kbd$
         CASE CHR$(0) + "H": lin = lin - 1
         CASE CHR$(0) + "P": lin = lin + 1
         CASE CHR$(0) + "K": col = col - 18
         CASE CHR$(0) + "M": col = col + 18
         CASE CHR$(13)
            IF nomb$ = "        ..  <DIR> " THEN
               FOR n = LEN(ruta$) - 1 TO 1 STEP -1
                  x$ = MID$(ruta$, n, 1)
                  IF x$ = "\" THEN
                     ruta$ = MID$(ruta$, 1, n)
                     EXIT FOR
                  END IF
               NEXT
               EXIT DO
            END IF
            IF MID$(nomb$, 13, 1) = "<" AND MID$(nomb$, 1, 1) <> " " THEN
               ruta$ = ruta$ + RTRIM$(MID$(nomb$, 1, 12)) + "\"
               EXIT DO
            ELSE
               Archivo$ = ruta$ + nomb$
               EXIT FUNCTION
            END IF
         CASE CHR$(27)
            IF LEN(ruta$) > 3 THEN
               FOR n = LEN(ruta$) - 1 TO 1 STEP -1
                  x$ = MID$(ruta$, n, 1)
                  IF x$ = "\" THEN
                     ruta$ = MID$(ruta$, 1, n)
                     EXIT FOR
                  END IF
               NEXT
               EXIT DO
            ELSE
               END
            END IF
      END SELECT

      IF lin > 25 XOR lin < 1 THEN lin = alin
      IF col > 58 XOR col < 1 THEN col = acol

      anomb$ = nomb$

      nomb$ = ""
      FOR h = col TO col + 17
         nomb$ = nomb$ + CHR$(SCREEN(lin, h))
      NEXT

      IF MID$(nomb$, 9, 1) = "." OR MID$(nomb$, 13, 1) = "<" THEN
         LOCATE alin, acol: COLOR 15, 1: PRINT anomb$;
         IF MID$(nomb$, 13, 1) = "<" THEN COLOR 15, 4 ELSE COLOR 0, 6
         IF nomb$ = "        .   <DIR> " THEN COLOR 0, 3
         IF nomb$ = "        ..  <DIR> " THEN COLOR 31, 4
         LOCATE lin, col: PRINT nomb$;
      ELSE
         lin = alin
         col = acol
         nomb$ = anomb$
      END IF
   LOOP
LOOP
END FUNCTION
