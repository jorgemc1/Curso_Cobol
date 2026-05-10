       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG4.
      * DATE-WRITTEN. 08/08/2025.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *01  NOME PICTURE IS XXXXXXXXXX.
       01  NOME PIC X(10).

       PROCEDURE DIVISION.
      * Variável do tipo texto.

       PROGRAM-BEGIN.

           CALL "SYSTEM" USING "CLS".
           DISPLAY "Entre com o seu nome :".
           ACCEPT NOME.

           DISPLAY "OLA " NOME.

       PROGRAM-DONE.
           STOP RUN.
