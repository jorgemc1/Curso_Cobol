       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG17_4.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NUMERO-RAW      PIC 9(3).    *> Aceita até 3 dígitos
       01  NUMERO          PIC 99.      *> Com exatamente dois dígitos
       01  MULTIPLICADOR   PIC 99.
       01  PRODUTO         PIC 9999.
       01  QUANTOS-RAW     PIC 9(3).
       01  QUANTOS         PIC 99.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM PEGA-TABUADA.
           PERFORM EXIBIR-TABUADA.
           STOP RUN.

       PEGA-TABUADA.
           CALL "SYSTEM" USING "CLS".
           PERFORM ATE-ENTRADA-VALIDA
               UNTIL NUMERO-RAW >= 1 AND NUMERO-RAW <= 99.
           MOVE NUMERO-RAW TO NUMERO.

           PERFORM ATE-ENTRADA-VALIDA-QUANTOS
               UNTIL QUANTOS-RAW >= 1 AND QUANTOS-RAW <= 99.
           MOVE QUANTOS-RAW TO QUANTOS.

       ATE-ENTRADA-VALIDA.
           DISPLAY "Digite a tabuada do número (01-99):"
           ACCEPT NUMERO-RAW
           IF NUMERO-RAW < 1 OR NUMERO-RAW > 99
               DISPLAY "Valor inválido. Digite um número entre 01 e 99."
               PERFORM LIMPA-TELA
           END-IF.

       ATE-ENTRADA-VALIDA-QUANTOS.
           DISPLAY "Digite o tamanho da tabuada (01-99):"
           DISPLAY "Para o número : " NUMERO.
           ACCEPT QUANTOS-RAW
           IF QUANTOS-RAW < 1 OR QUANTOS-RAW > 99
               DISPLAY "Valor inválido. Digite um número entre 01 e 99."
               PERFORM LIMPA-TELA
           END-IF.

       EXIBIR-TABUADA.
           DISPLAY "------------------------------"
           DISPLAY "   A TABUADA DE " NUMERO
           DISPLAY "------------------------------"
           PERFORM CALCULA-E-EXIBE
               VARYING MULTIPLICADOR
               FROM 1 BY 1
               UNTIL MULTIPLICADOR > QUANTOS.

       CALCULA-E-EXIBE.
           COMPUTE PRODUTO = NUMERO * MULTIPLICADOR
           DISPLAY NUMERO " * " MULTIPLICADOR " = " PRODUTO.

       LIMPA-TELA.
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           CALL "SYSTEM" USING "CLS".
