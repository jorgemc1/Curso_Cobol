       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG16.
      * Usando decisões (IF THEN ELSE).
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * O uso do “S9” para reconhecimento de números negativos.
       01  VALOR_A PIC S9(4).
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM ENTRADA-DE-DADOS.
           PERFORM COMPARACAO.
       PROGRAM-DONE.
           STOP RUN.

       ENTRADA-DE-DADOS.
           PERFORM LIMPA-TELA.
           DISPLAY "Entre com um valor maior que 0 e menor que 999:".
           ACCEPT VALOR_A.

       COMPARACAO.
           IF VALOR_A < 0 OR VALOR_A > 999
               DISPLAY "Valor de entrada inválido !"
           ELSE
               DISPLAY "Valor está entre 0 e 999".

      * Pode ou não usar o END-IF, pois tem PONTO FINAL DE LINHA.
       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".
