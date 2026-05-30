       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAY2.
       ENVIRONMENT DIVISION.
      *Constantes e variáveis do sistema.
      * USO DE TABELA (ARRAY).
      * COMANDO OCCURS n TIMES.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Criando uma tabela (Array) com 10 elementos.
       01  VETOR-NUMEROS.
           05 NUMERO PIC 9(3) OCCURS 10 TIMES.
       01  I PIC 9(2) VALUE 1.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           DISPLAY "PREENCHENDO O VETOR...".

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               MOVE I TO NUMERO(I)
           END-PERFORM.

           DISPLAY "MOSTRANDO OS VALORES".
           DISPLAY VETOR-NUMEROS.
           
       PROGRAM-DONE.
           STOP RUN.

