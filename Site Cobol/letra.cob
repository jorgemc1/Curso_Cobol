       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1.
      *  POR JORGE MAESTRE CARVALHO 
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.
      *Programa principal. 
       PROGRAM-BEGIN.
      *Limpa a tela "Terminal CMD".
            CALL "SYSTEM" USING "cls".
            DISPLAY "Ola Mundo".
            DISPLAY "Ç Ã Á É Í Ó Ú".
       PROGRAM-DONE.
            STOP RUN.
