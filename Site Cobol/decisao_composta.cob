       IDENTIFICATION DIVISION.
       PROGRAM-ID. DECISAO_COMPOSTA.
      *    DEMONSTRAÇÃO DO USO DA DECISÃO COMPOSTA.
      *    JOTA TREINAMENTOS. 10/10/2021.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    VARIÁVEIS DO SISTEMA.
       01  PESO         PIC 9(5)V9(2) VALUE ZEROS.   *> Ex: 07500 = 75.00 kg
       01  ALTURA       PIC 9(1)V9(2) VALUE ZEROS.   *> Ex: 175 = 1.75 m
       01  ALTURA-QUAD  PIC 9(3)V9(4) VALUE ZEROS.
       01  IMC          PIC 9(3)V9(2) VALUE ZEROS.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM LIMPA-TELA.
           PERFORM ENTRADA-DADOS.
           PERFORM CALCULO.
           PERFORM MOSTRA-RESULTADO.
           PERFORM PROCESSA-IMC.
       PROGRAM-DONE.
           STOP RUN.

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".

       ENTRADA-DADOS.
           DISPLAY "============================".
           DISPLAY "===    CALCULO DO IMC    ===".
           DISPLAY "============================".
           DISPLAY "Informe o peso (ex: 75.00): ".
           ACCEPT PESO.
           DISPLAY "Informe a altura (ex: 1.75): ".
           ACCEPT ALTURA.

       CALCULO.
           COMPUTE ALTURA-QUAD = ALTURA * ALTURA.
           COMPUTE IMC = PESO / ALTURA-QUAD.

       MOSTRA-RESULTADO.
           DISPLAY "===================".
           DISPLAY "Seu IMC é: " IMC.
           DISPLAY "===================".

       PROCESSA-IMC.
           IF IMC < 18.5
              DISPLAY "BAIXO PESO"
           ELSE
              IF IMC >= 18.5 AND IMC <= 24.9
                 DISPLAY "PESO NORMAL"
              ELSE
                IF IMC >= 25.9 AND IMC <= 29.9
                  DISPLAY "SOBRE PESO"
                ELSE
                  IF IMC >= 30 AND IMC <= 34.9
                    DISPLAY "OBESIDADE GRAU I"
                  ELSE
                    IF IMC >= 35.0 AND IMC <= 39.9
                      DISPLAY "OBESIDADE GRAU II"
                    ELSE
                      DISPLAY "OBESIDADE GRAU III (MORBIDA)"
                    END-IF
                 END-IF
               END-IF
             END-IF
           END-IF.
