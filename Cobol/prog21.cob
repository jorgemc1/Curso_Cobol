       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG21.
      * NÚMEROS DECIMAIS.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  VALOR_1     PIC 9(5)V9(2) VALUE 86543.98.
       01  VALOR_2     PIC 9(2)V9(2) VALUE 12.86.
       01  RESULTADO   PIC 9(5)V9(2) VALUE ZEROS.
       01  VALOR_3     PIC S999V99 VALUE -587.21.
       01  RESULTADO_2 PIC S9(5)V9(2) VALUE ZEROS.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM LIMPA-TELA.
           COMPUTE RESULTADO = VALOR_1 + VALOR_2.
           DISPLAY "VALOR 1 + VALOR 2 = RESULTADO".
           DISPLAY VALOR_1 " + " VALOR_2 " = " RESULTADO.
           DISPLAY "===================================".
           COMPUTE RESULTADO_2 = VALOR_2 + VALOR_3.
           DISPLAY "RESULTADO = VALOR_2 + VALOR_3".
           DISPLAY RESULTADO_2 " = " VALOR_2 " + (" VALOR_3  ")".
           DISPLAY "===================================".
       PROGRAM-DONE.
           STOP RUN.

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".
