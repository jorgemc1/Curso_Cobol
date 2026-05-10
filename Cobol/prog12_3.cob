       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG12_3.
      * PROGRAMA PARA ESCREVER TEXTO COM VARIÁVEL.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MENSAGEM PIC X(50).
       01  VALOR_A  PIC 9(3).
       01  VALOR_B  PIC 9(3).
       01  SOMA     PIC 9(4).
       01  TAMANHO  PIC 9(5).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM ENTRADA-DE-DADOS.
           PERFORM CALCULA-SOMA.
           PERFORM CONCATENA-VALORES.
           PERFORM SAIDA-DOS-DADOS.
       PROGRAM-DONE.
           STOP RUN.

       ENTRADA-DE-DADOS.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "Entre com um valor para A:".
           ACCEPT VALOR_A.
           DISPLAY "Entre com um valor para B".
           ACCEPT VALOR_B.

       CALCULA-SOMA.
           ADD VALOR_A TO VALOR_B GIVING SOMA.

       CONCATENA-VALORES.
           MOVE 1 TO TAMANHO.
           STRING
               "A soma de A com B eh igual a "
               SOMA
               DELIMITED BY SIZE
               INTO MENSAGEM
               WITH POINTER TAMANHO.

       SAIDA-DOS-DADOS.
           DISPLAY MENSAGEM.
