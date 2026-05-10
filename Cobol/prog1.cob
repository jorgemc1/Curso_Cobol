       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG1.
       ENVIRONMENT DIVISION.

       PROCEDURE DIVISION.
      * Meu primeiro programa.

       PROGRAM-BEGIN.
      * Limpa a tela "Terminal CMD".
           CALL "SYSTEM" USING "cls"
           DISPLAY "Ola Mundo".

       PROGRAM-DONE.
           STOP RUN.
