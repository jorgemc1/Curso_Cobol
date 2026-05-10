       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG28_LEITURA_2.
      * Programa para ler registros de clientes
      * e gravar os com idade <= 25 em outro arquivo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO-CLIENTE
               ASSIGN TO "clientes_2.dat"
               ORGANIZATION IS SEQUENTIAL.

           SELECT ARQUIVO-CLIENTE-25
               ASSIGN TO "clientes_idade.dat"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

      * Arquivo de entrada
       FD ARQUIVO-CLIENTE.
       01 CLIENTE-REGISTRO.
           05 CLIENTE-NOME     PIC X(20).
           05 CLIENTE-IDADE    PIC 99.        *> Idade como número
           05 CLIENTE-CIDADE   PIC X(30).
           05 CLIENTE-ENDERECO PIC X(50).
           05 CLIENTE-TELEFONE PIC X(15).
           05 CLIENTE-EMAIL    PIC X(30).

      * Arquivo de saída para clientes com idade <= 25
       FD ARQUIVO-CLIENTE-25.
       01 CLIENTE-REGISTRO-25.
           05 CLIENTE25-NOME     PIC X(20).
           05 CLIENTE25-IDADE    PIC 99.      *> Também numérico
           05 CLIENTE25-CIDADE   PIC X(30).
           05 CLIENTE25-ENDERECO PIC X(50).
           05 CLIENTE25-TELEFONE PIC X(15).
           05 CLIENTE25-EMAIL    PIC X(30).

       WORKING-STORAGE SECTION.

       01 FINAL-ARQUIVO        PIC X VALUE "N".

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
      * Abrir os dois arquivos no início do programa
           OPEN INPUT ARQUIVO-CLIENTE
                OUTPUT ARQUIVO-CLIENTE-25.

           PERFORM LIMPA-TELA.
           PERFORM CABECALHO.
           MOVE "N" TO FINAL-ARQUIVO.

           PERFORM EXIBA-REGISTROS UNTIL FINAL-ARQUIVO = "S".

      * Fechar os arquivos ao final
           CLOSE ARQUIVO-CLIENTE
                 ARQUIVO-CLIENTE-25.

       PROGRAM-DONE.
           STOP RUN.

      * Limpa a tela do terminal (no Windows)
        LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".

      * Cabeçalho da tela
       CABECALHO.
           DISPLAY "REGISTROS DO ARQUIVO CLIENTE".
           DISPLAY "==================================".
           DISPLAY "".

      * Leitura do próximo registro
       LEIA-PROXIMO-REGISTRO.
           READ ARQUIVO-CLIENTE
               AT END
                   MOVE "S" TO FINAL-ARQUIVO
           END-READ.

      * Loop de leitura e exibição
       EXIBA-REGISTROS.
           PERFORM LEIA-PROXIMO-REGISTRO.
           IF FINAL-ARQUIVO NOT = "S"
               PERFORM EXIBA-CAMPOS
           END-IF.

      * Exibir e gravar clientes com idade <= 25
       EXIBA-CAMPOS.
           IF CLIENTE-IDADE <= 25
               DISPLAY "NOME     : " CLIENTE-NOME
               DISPLAY "IDADE    : " CLIENTE-IDADE
               DISPLAY "CIDADE   : " CLIENTE-CIDADE
               DISPLAY "ENDERECO : " CLIENTE-ENDERECO
               DISPLAY "TELEFONE : " CLIENTE-TELEFONE
               DISPLAY "EMAIL    : " CLIENTE-EMAIL
               DISPLAY "========================================"
               PERFORM GRAVA-REGISTRO-25
           END-IF.

      * Gravação no segundo arquivo
       GRAVA-REGISTRO-25.
           MOVE CLIENTE-NOME     TO CLIENTE25-NOME
           MOVE CLIENTE-IDADE    TO CLIENTE25-IDADE
           MOVE CLIENTE-CIDADE   TO CLIENTE25-CIDADE
           MOVE CLIENTE-ENDERECO TO CLIENTE25-ENDERECO
           MOVE CLIENTE-TELEFONE TO CLIENTE25-TELEFONE
           MOVE CLIENTE-EMAIL    TO CLIENTE25-EMAIL

           WRITE CLIENTE-REGISTRO-25.
