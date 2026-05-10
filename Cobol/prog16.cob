       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG16.
      * Exemplo de menu com uso de GO TO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 VALOR_A    PIC S9(5)V99.
           01 VALOR_B    PIC S9(5)V99.
           01 RESULTADO  PIC S9(5)V99.
           01 ESCOLHA    PIC 9(1).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           GO TO MENU-DO-SISTEMA.

       PROGRAM-DONE.
           STOP RUN.

       MENU-DO-SISTEMA.
           PERFORM LIMPA-TELA.
           DISPLAY "Calculador simples".
           DISPLAY "1. SOMAR".
           DISPLAY "2. SUBTRAIR".
           DISPLAY "3. MULTIPLICAR".
           DISPLAY "4. DIVIDIR".
           DISPLAY "5. SAIR".
           DISPLAY "ENTRE COM A OPÇÃO:".
           ACCEPT ESCOLHA.

           IF ESCOLHA = 1
               GO TO SUB-SOMA.
           IF ESCOLHA = 2
               GO TO SUB-SUBTRACAO.
           IF ESCOLHA = 3
               GO TO SUB-MULTIPLICACAO.
           IF ESCOLHA = 4
               GO TO SUB-DIVISAO.
           IF ESCOLHA = 5
               GO TO SUB-FIM-PROGRAMA.

      * Se a entrada for inválida, volta ao menu.
           DISPLAY "OPÇÃO INVÁLIDA!".
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           GO TO MENU-DO-SISTEMA.

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".

       SUB-SOMA.
           DISPLAY "ENTRE COM UM VALOR PARA A:".
           ACCEPT VALOR_A.
           DISPLAY "ENTRE COM UM VALOR PARA B:".
           ACCEPT VALOR_B.
           COMPUTE RESULTADO = VALOR_A + VALOR_B.
           DISPLAY "SOMA = " RESULTADO.
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           GO TO MENU-DO-SISTEMA.

       SUB-SUBTRACAO.
           DISPLAY "ENTRE COM UM VALOR PARA A:".
           ACCEPT VALOR_A.
           DISPLAY "ENTRE COM UM VALOR PARA B:".
           ACCEPT VALOR_B.
           COMPUTE RESULTADO = VALOR_A - VALOR_B.
           DISPLAY "SUBTRAÇÃO = " RESULTADO.
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           GO TO MENU-DO-SISTEMA.

       SUB-MULTIPLICACAO.
           DISPLAY "ENTRE COM UM VALOR PARA A:".
           ACCEPT VALOR_A.
           DISPLAY "ENTRE COM UM VALOR PARA B:".
           ACCEPT VALOR_B.
           COMPUTE RESULTADO = VALOR_A * VALOR_B.
           DISPLAY "MULTIPLICAÇÃO = " RESULTADO.
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           GO TO MENU-DO-SISTEMA.

       SUB-DIVISAO.
           DISPLAY "ENTRE COM UM VALOR PARA A:".
           ACCEPT VALOR_A.
           DISPLAY "ENTRE COM UM VALOR PARA B:".
            ACCEPT VALOR_B.
           IF VALOR_B = 0
               DISPLAY "ERRO: DIVISÃO POR ZERO!"
           ELSE
               COMPUTE RESULTADO = VALOR_A / VALOR_B
               DISPLAY "DIVISÃO = " RESULTADO
           END-IF.
           DISPLAY "Pressione <ENTER> para continuar...".
           ACCEPT OMITTED.
           GO TO MENU-DO-SISTEMA.

       SUB-FIM-PROGRAMA.
           DISPLAY "ENCERRANDO...".
           GO TO PROGRAM-DONE.
