       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG23.
      * USANDO REGISTRO EM COBOL.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 PESSOA.
           05 NOME         PIC A(30).
           05 IDADE        PIC 99 VALUE ZEROS.
           05 CPF          PIC 9(11) VALUE ZEROS.
           05 SEXO         PIC X.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           CALL "SYSTEM" USING "CLS".
           MOVE "JOAO DA SILVA" TO NOME.
           MOVE 35              TO IDADE.
           MOVE "12345678901"   TO CPF.
           MOVE "M"             TO SEXO.

           DISPLAY "Nome: " NOME.
           DISPLAY "Idade: " IDADE.
           DISPLAY "CPF: " CPF.
           DISPLAY "Sexo: " SEXO.
           DISPLAY "======================".
           DISPLAY PESSOA.

       PROGRAM-DONE.
           STOP RUN.
