       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG12.
      *    PROGRAMA PARA EXIBIR PARAGRAFOS. AGORA USANDO PARAGRAFOS.
       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  MINHA-MENSAGEM PIC X(80).
       01  ID-MENSAGEM PIC 9(2).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           MOVE 0 TO ID-MENSAGEM.

       PERFORM LIMPA-TERMINAL.

      *    ESCREVENDO A MENSAGEM DE DUAS FORMAS.
      *    PRIMEIRA MENSAGEM.
           MOVE " Maria marque uma reuniao com nossos fornecedores."
            TO MINHA-MENSAGEM.
           PERFORM ADICIONA-ID-E-EXIBE.

      *    SEGUNDA MENSAGEM.
           MOVE " Paulo agora voce eh responsavel pelo setor de vendas."
            TO MINHA-MENSAGEM.
           PERFORM ADICIONA-ID-E-EXIBE.

       PROGRAM-DONE.
           STOP RUN.

       LIMPA-TERMINAL.
           CALL "SYSTEM" USING "CLS".

       ADICIONA-ID-E-EXIBE.
           PERFORM AUMENTA-ID.
           PERFORM EXIBE-MENSAGEM.

       AUMENTA-ID.
           ADD 1 TO ID-MENSAGEM.

       EXIBE-MENSAGEM.
           DISPLAY ID-MENSAGEM
                   MINHA-MENSAGEM.
