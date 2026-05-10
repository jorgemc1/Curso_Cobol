       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG4_1.
       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  nome     PIC A(20).
       01  data_s   PIC 9(8). *> AAAAMMDD
       01  hora     PIC 9(8).

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

           CALL "SYSTEM" USING "CLS".
           DISPLAY "Digite seu nome: ".
           ACCEPT nome.

           ACCEPT data_s FROM DATE.
           ACCEPT hora FROM TIME.

           DISPLAY "Ola, " nome.
           DISPLAY "Data atual: " data_s.
           DISPLAY "Hora atual: " hora.

       PROGRAM-DONE.

       STOP RUN.
