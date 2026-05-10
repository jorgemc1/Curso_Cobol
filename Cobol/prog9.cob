       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG9.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       PROCEDURE DIVISION.
      * PROGRAMA QUE DEMONSTRA O USO DO COMANDO PERFORM.
       PROGRAM-BEGIN.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "A mensagem de hoje eh".
           PERFORM MINHA-MENSAGEM.
           DISPLAY "Voce concorda?".
       PROGRAM-END.
           STOP RUN.

       MINHA-MENSAGEM.
           DISPLAY "Programar em Cobol eh legal.".
