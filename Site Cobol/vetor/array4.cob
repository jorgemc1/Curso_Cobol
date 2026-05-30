       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAY4.
       ENVIRONMENT DIVISION.
      * Constantes e variáveis do sistema.
      * USO DE TABELA (ARRAY).
      * COMANDO OCCURS n TIMES e Ordenação.
      * Feito por Jorge Maestre Carvalho.
      * =============================================
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Criando uma tabela (Array) com 10 elementos.
       01  VETOR-NUMEROS.
           05 NUMERO PIC 9(3) OCCURS 10 TIMES.
       01  I PIC 9(2) VALUE 1.
       01  TROCA PIC 9(3) VALUE ZERO.
       01  J PIC 9(2) VALUE 2.
       01  K PIC 9(2) VALUE ZERO.
       01  LINHA PIC X(50) VALUE ALL "=".    

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM LIMPA-TELA.
           PERFORM PREENCHE-VETOR.
           PERFORM ORDENAR-VETOR.
           PERFORM MOSTRA-ORDENADO.
       PROGRAM-DONE.
           STOP RUN.

      * PREENCHER O VETOR.
       PREENCHE-VETOR.
           DISPLAY "PREENCHENDO 10 VALORES NO VETOR...".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
                   DISPLAY "ENTRE COM UM NÚMERO INTEIRO"
                   DISPLAY "POSIÇÃO [" I "] DO VETOR"
                   ACCEPT NUMERO(I)
           END-PERFORM.       
      
      * LIMPAR A TELA 
       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS". 
      
      * MOSTRA O VETOR ORDENADO.
       MOSTRA-ORDENADO.     
           DISPLAY "MOSTRANDO OS VALORES ORDENADOS".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
                   DISPLAY "[" NUMERO(I) "]" WITH NO ADVANCING
           END-PERFORM.
           DISPLAY SPACE.
           DISPLAY LINHA.

      * ORDENAR VETOR
       ORDENAR-VETOR.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 9
            COMPUTE K = I + 1
             PERFORM VARYING J FROM K BY 1 UNTIL J > 10
              IF NUMERO(I) > NUMERO(J)
                MOVE NUMERO(I) TO TROCA
                MOVE NUMERO(J) TO NUMERO(I)
                MOVE TROCA TO NUMERO(J)
              END-IF
             END-PERFORM
           END-PERFORM.       
