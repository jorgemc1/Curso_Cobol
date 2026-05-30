       IDENTIFICATION DIVISION.
       PROGRAM-ID. DECISAO_SIMPLES.
      *    DEMONSTRAÇÃO DO USO DA DECISÃO SIMPLES.
      *    JOTA TREINAMENTOS. 10/10/2021.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    VARIÁVEIS DO SISTEMA.
       01  VAR-NOME      PIC X(20) VALUE SPACES.
       01  VAR-IDADE-TXT PIC X(3)  VALUE SPACES.
       01  VAR-IDADE     PIC 9(3)  VALUE ZEROS.
       01  RESULT        PIC 9(3)  VALUE ZEROS.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM LIMPA-TELA.
           PERFORM TELA-QUESTAO.
       PROGRAM-DONE.
           STOP RUN.

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".

       TELA-QUESTAO.
           DISPLAY "========================".
           DISPLAY "SEU NOME...:".
           ACCEPT VAR-NOME.
           DISPLAY "++++++++++++++++++++++++".
           DISPLAY "SUA IDADE..:".
           ACCEPT VAR-IDADE.
           DISPLAY "++++++++++++++++++++++++".
      *    CONVERTE UMA VARIÁVEL TIPO ALFA NUMÉRICA PARA NUMÉRICA.
           MOVE FUNCTION NUMVAL(VAR-IDADE-TXT) TO VAR-IDADE.

           PERFORM TESTE-CALCULO.

       TESTE-CALCULO.
           IF VAR-IDADE < 18
               DISPLAY "NAO PODE TIRAR HABILITACAO PARA VEICULOS."
           END-IF.

           IF VAR-IDADE >= 18
               DISPLAY "PODE TIRAR HABILITACAO PARA VEICULOS"
           END-IF.
           DISPLAY "==============================================".
