       IDENTIFICATION DIVISION.
       PROGRAM-ID. BARCO.
      * HELICE-CALCULO
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * CONSTANTES
       77  POTENCIA-HP            PIC 9(4)V9(1) VALUE 130.0.
       77  RPM-MOTOR              PIC 9(4)      VALUE 2500.
       77  RPM-OPERACAO           PIC 9(4)      VALUE 1800.
       77  VELOCIDADE-NOS         PIC 9(2)V9(2) VALUE 8.00.
       77  HP-PARA-WATT           PIC 9(4)V9(4) VALUE 745.7000.
       77  NOS-PARA-MPS           PIC 9(1)V9(6) VALUE 0.514444.
       77  EFICIENCIA-HELICE      PIC 9(1)V9(2) VALUE 0.55.
      *> Valor mais realista para seu barco
       77  K-CONSTANTE            PIC 9(1)V9(1) VALUE 3.2.

      * VARIÁVEIS DE CÁLCULO
       77  POTENCIA-WATT          PIC 9(6)V9(4).
       77  VELOCIDADE-MPS         PIC 9(3)V9(6).
       77  THRUST-NEWTONS         PIC 9(6)V9(2).
       77  DIAMETRO-M             PIC 9(2)V9(6).
       77  PASSO-M                PIC 9(2)V9(6).
       77  DIAMETRO-CM            PIC 9(3)V9(2).
       77  PASSO-CM               PIC 9(3)V9(2).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           PERFORM CALCULO-HELICE.
           PERFORM EXIBE-CALCULO.

       PROGRAM-DONE.
           STOP RUN.

       CALCULO-HELICE.
           COMPUTE POTENCIA-WATT = POTENCIA-HP * HP-PARA-WATT
           COMPUTE VELOCIDADE-MPS = VELOCIDADE-NOS * NOS-PARA-MPS

           COMPUTE THRUST-NEWTONS = POTENCIA-WATT /
              (VELOCIDADE-MPS * EFICIENCIA-HELICE)

           COMPUTE DIAMETRO-M = K-CONSTANTE *
              FUNCTION EXP(
                 (FUNCTION LOG(POTENCIA-HP)
                 - FUNCTION LOG(RPM-OPERACAO)) / 3)

           COMPUTE PASSO-M = (VELOCIDADE-MPS * 60) / RPM-OPERACAO
           COMPUTE DIAMETRO-CM = DIAMETRO-M * 100
           COMPUTE PASSO-CM = PASSO-M * 100.

       EXIBE-CALCULO.
           CALL "SYSTEM" USING "CLS".
           DISPLAY "-------------------------------------------------"
           DISPLAY "               RESULTADOS DO CÁLCULO              "
           DISPLAY "-------------------------------------------------"
           DISPLAY " Diâmetro estimado da hélice : " DIAMETRO-CM " cm"
           DISPLAY " Passo estimado da hélice    : " PASSO-CM    " cm"
           DISPLAY " Empuxo estimado necessário  : " THRUST-NEWTONS " N"
           DISPLAY "-------------------------------------------------".
