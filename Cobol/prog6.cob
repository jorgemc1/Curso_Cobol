       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG6.
      * DATE-WRITTEN. 08/08/2025.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
      * Variáveis do programa.
       01  IDADE   PIC 9(2).
       01  VALOR_A PIC 9(3).
       01  VALOR_B PIC 9(3).
       01  VALOR_C PIC 9(3).
       01  VALOR_X PIC 9(3).
       01  VALOR_Y PIC 9(3).
       01  VALOR_Z PIC 9(3).
       01  SOMA_V  PIC 9(3).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "Entre com a sua idade :".
           ACCEPT IDADE.
           DISPLAY "Hoje voce tem " IDADE " anos.".

           ADD 15 TO IDADE.

           DISPLAY "Daqui a 15 anos voce tera " IDADE " anos".

           COMPUTE VALOR_A = 1.
           COMPUTE VALOR_B = 1.
           COMPUTE VALOR_C = 1.
           COMPUTE VALOR_X = 10.
           COMPUTE VALOR_Y = 15.
           COMPUTE VALOR_Z = 20.

           DISPLAY "VALORES ANTES DO ADD.".
           DISPLAY "VALOR DE A : " VALOR_A.
           DISPLAY "VALOR DE B : " VALOR_B.
           DISPLAY "VALOR DE A : " VALOR_C.

           DISPLAY "VALOR DE X : " VALOR_X.
           DISPLAY "VALOR DE Y : " VALOR_Y.
           DISPLAY "VALOR DE Z : " VALOR_Z.

      * Fazendo o uso do ADD, para multiplos valores.
           ADD VALOR_A VALOR_B VALOR_C TO SOMA_V.
           ADD VALOR_A VALOR_B VALOR_C TO VALOR_X VALOR_Y VALOR_Z.

           DISPLAY "SOMA DE A COM B COM C = " SOMA_V.
           DISPLAY "VALORES DE X Y Z APOS O COMANDO ADD.".
           DISPLAY "VALOR DE X : " VALOR_X.
           DISPLAY "VALOR DE Y : " VALOR_Y.
           DISPLAY "VALOR DE Z : " VALOR_Z.

       PROGRAM-DONE.
           STOP RUN.
