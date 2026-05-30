       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG_ALTERAR.
      *    ALTERANDO REGISTROS
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY "SELFUNCIONARIO.cob".
       DATA DIVISION.
       FILE SECTION.
           COPY "FDFUNCIONARIO.cob".
       WORKING-STORAGE SECTION.


       77  REGISTRO-ENCONTRADO PIC X.
      *    possui o mesmo tamanho do codigo do funcionario.
       77  CODIGO-FUNCIONARIO-ALTERAR PIC 9(5).
      *     campo que sera alterado
       77  QUAL-CAMPO PIC 9.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           OPEN I-O ARQUIVO-FUNCIONARIO.
           PERFORM PEGA-REGISTRO-FUNCIONARIO.

           PERFORM ALTERAR-REGISTRO
              UNTIL FUNCIONARIO-CODIGO = ZEROES.

           CLOSE ARQUIVO-FUNCIONARIO.
       PROGRAM-DONE.
           STOP RUN.

       PEGA-REGISTRO-FUNCIONARIO.
      *    Limpa a Tela.
           PERFORM LIMPA-TELA.     
      *    inicializacao das variaveis.
           MOVE SPACE TO  FUNCIONARIO-REGISTRO.
           MOVE ZEROS TO FUNCIONARIO-CODIGO.
      *    pergunta qual registro deve ser alterado
           DISPLAY "INFORME O CODIGO DO FUNCIONARIO".
           DISPLAY "PARA ALTERAR(1-9999)".
           DISPLAY "DIGITE 0(ZERO) PARA CANCELAR:".
           ACCEPT CODIGO-FUNCIONARIO-ALTERAR.
      *    atribui o codigo fornecido ao registro.
           MOVE CODIGO-FUNCIONARIO-ALTERAR TO  FUNCIONARIO-CODIGO.

           MOVE "N" TO REGISTRO-ENCONTRADO.

           PERFORM ENCONTRA-REGISTRO-FUNCIONARIO
               UNTIL REGISTRO-ENCONTRADO = "S" OR
                     FUNCIONARIO-CODIGO = ZEROES.

       ENCONTRA-REGISTRO-FUNCIONARIO.
           MOVE "S" TO REGISTRO-ENCONTRADO.
           READ ARQUIVO-FUNCIONARIO RECORD
      *    se não encontrar o registro atribui N a REGISTRO-ENCONTRADO
            INVALID KEY
              MOVE "N" TO REGISTRO-ENCONTRADO.

           IF REGISTRO-ENCONTRADO = "N"
               DISPLAY "REGISTRO NAO ENCONTRADO"
               DISPLAY "INFORME O CODIGO DO FUNCIONARIO"
               DISPLAY "PARA ALTERAR(1-9999)"
               DISPLAY "DIGITE 0(ZERO) PARA CANCELAR:"
               ACCEPT CODIGO-FUNCIONARIO-ALTERAR.
           MOVE CODIGO-FUNCIONARIO-ALTERAR TO FUNCIONARIO-CODIGO.

       ALTERAR-REGISTRO.
      *    exibir todos os capos do registro.
           DISPLAY " ".
           DISPLAY "CODIGO: " FUNCIONARIO-CODIGO.
           DISPLAY "1.NOME: " FUNCIONARIO-NOME.
           DISPLAY "2.ENDERECO: " FUNCIONARIO-ENDERECO.
           DISPLAY "3. TELEFONE: " FUNCIONARIO-TELEFONE.
           DISPLAY "4. EMAIL: " FUNCIONARIO-EMAIL.
           DISPLAY " ".
      *    o usuario deve escolher um campo para alterar.
           DISPLAY "DIGITE O NUMERO DO CAMPO".
           DISPLAY "PARA ALTERAR(1-4) OU 0(ZERO) PARA SAIR".
           ACCEPT QUAL-CAMPO.
           IF QUAL-CAMPO > 4
               DISPLAY "CAMPO INVALIDO".

           PERFORM MUDA-E-GRAVA-UM-CAMPO.

           PERFORM PEGA-REGISTRO-FUNCIONARIO.

       MUDA-E-GRAVA-UM-CAMPO.
           IF QUAL-CAMPO = 1
               DISPLAY "INFORME O NOME:"
               ACCEPT FUNCIONARIO-NOME
               PERFORM REESCREVER-REGISTRO
           END-IF.

           IF QUAL-CAMPO = 2
               DISPLAY "INFORME O ENDERECO"
               ACCEPT FUNCIONARIO-ENDERECO
               PERFORM REESCREVER-REGISTRO
           END-IF. 

           IF QUAL-CAMPO = 3
               DISPLAY "INFORME O TELEFONE"
               ACCEPT FUNCIONARIO-TELEFONE
               PERFORM REESCREVER-REGISTRO
           END-IF. 

           IF QUAL-CAMPO = 4
               DISPLAY "INFORME O EMAIL"
               ACCEPT FUNCIONARIO-EMAIL
               PERFORM REESCREVER-REGISTRO
           END-IF.

           IF  QUAL-CAMPO > 4
               DISPLAY "CAMPO ESCOLHIDO INVÁLIDO"
               DISPLAY "PRESSIONE ENTER PARA COMTINUAR..."
               ACCEPT OMITTED  
               PERFORM LIMPA-TELA
           END-IF.

       REESCREVER-REGISTRO.
           REWRITE FUNCIONARIO-REGISTRO
              INVALID KEY
              DISPLAY "ERRO AO REESCREVER O REGSITRO!".

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".    
