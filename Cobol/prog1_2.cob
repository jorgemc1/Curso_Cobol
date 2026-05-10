       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1_2.
       ENVIRONMENT DIVISION.

       PROCEDURE DIVISION.
      * Meu segundo programa.

       PROGRAM-BEGIN.
      * Limpa a tela "Terminal CMD".
           CALL "SYSTEM" USING "cls"
           DISPLAY "PROGRAMADOR :".
           DISPLAY " JORGE MAESTRE CARVALHO".
           DISPLAY "CURSO DE COBOL - NIVEL 1".
           DISPLAY "DATA 08/08/2020".

       PROGRAM-DONE.
           STOP RUN.
