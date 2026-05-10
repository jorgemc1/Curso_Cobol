       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG13_2.
      * O USO DA CONDICIONAL IF COM MAIS DE UMA LINHA.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  RESPOSTA PIC X(1).
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM PERGUNTA.
           PERFORM EXIBE-RESPOSTA.
       PROGRAM-DONE.
           STOP RUN.

       PERGUNTA.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "Voce gosta de churrasco SIM ou NAO? S/N.".
           ACCEPT RESPOSTA.

       EXIBE-RESPOSTA.
      * PODERIA SER USADO O SINAL DE "=".
           IF RESPOSTA = "S"
               DISPLAY "Realmente eh muito bom"
               DISPLAY "Coisa linda"
           END-IF.

           IF RESPOSTA IS EQUAL TO "N"
               DISPLAY "Que pena. Voce esta perdendo muita coisa."
               DISPLAY "Coisa feia"
           END-IF.
