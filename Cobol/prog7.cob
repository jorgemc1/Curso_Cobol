       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG7.
      * DATA-WRITTEN. 08/08/2025.
       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * Variáveis do Programa.
       01  MENSAGEM PIC X(32).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           CALL "SYSTEM" USING "CLS".
           MOVE "=========== Mensagem ===========" TO MENSAGEM.
           DISPLAY MENSAGEM.
           DISPLAY "Mensagem do sistema para o usario, sobre uma "
      -    "linha que quebra.".

       PROGRAM-DONE.
           STOP RUN.
