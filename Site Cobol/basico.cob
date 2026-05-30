       IDENTIFICATION DIVISION.
           PROGRAM-ID. BASICO.
      * FEITO POR JORGE MAESTRE CARVALHO
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM LIMPA-TELA.
           DISPLAY " PROGRAMA BÁSICO DE COBOL".
           DISPLAY " ESCRITO NO VIM".
           DISPLAY " O código está em basico.cob".
           DISPLAY "==============================".
       PROGRAM-DONE.
           STOP RUN.

      * FUNÇÃO PARA LIMPAR A TELA.
       LIMPA-TELA.        
           CALL "SYSTEM" USING "CLS".
