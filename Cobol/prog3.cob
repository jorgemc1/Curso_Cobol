       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG3.
       ENVIRONMENT DIVISION.
      * Constantes e Variáveis do Sistema.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *    VARIÁVEIS DE PROGRAMA.
       01  PRIMEIRO-NUMERO PIC 99(2).
       01  SEGUNDO-NUMERO  PICTURE 99.
       01  RESULTADO       PICTURE IS 999.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "======SOMA DE DOIS NUMEROS=======".
           DISPLAY "Informe o primeiro numero :".
           ACCEPT PRIMEIRO-NUMERO.

           DISPLAY "Informe o segundo  numero :".
           ACCEPT SEGUNDO-NUMERO.

           COMPUTE RESULTADO = PRIMEIRO-NUMERO + SEGUNDO-NUMERO.

           DISPLAY "O resultado da soma eh : " RESULTADO.

       PROGRAM-DONE.
           STOP RUN.
