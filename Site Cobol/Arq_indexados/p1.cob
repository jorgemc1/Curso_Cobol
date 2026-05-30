       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1.
      *POR JORGE MAESTRE CARVALHO 
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.
      *Programa principal. 
       PROGRAM-BEGIN.
      *Limpa a tela "Terminal CMD".
           CALL "SYSTEM" USING "cls".
           DISPLAY "==================".
           DISPLAY "   Olá Mundo".
           DISPLAY " CÓPIA DE PROG1".
           DISPLAY " AGORA COM BACKUP".
           DISPLAY "==================".
       PROGRAM-DONE.
           STOP RUN.
