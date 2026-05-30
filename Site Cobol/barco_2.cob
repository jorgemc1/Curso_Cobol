       IDENTIFICATION DIVISION.
       PROGRAM-ID. BARCO_2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  POTENCIA-HP            PIC 9(4)V9(1) VALUE 130.0.
       77  RPM-MOTOR              PIC 9(4)      VALUE 2500.
       77  RPM-OPERACAO           PIC 9(4)      VALUE 1800.
       77  VELOCIDADE-NOS         PIC 9(2)V9(2) VALUE 8.00.
       77  EFICIENCIA-HELICE      PIC 9(1)V9(2) VALUE 0.55.
       77  HP-PARA-WATT           PIC 9(4)V9(4) VALUE 745.7000.
       77  NOS-PARA-MPS           PIC 9(1)V9(6) VALUE 0.514444.
       77  K-CONSTANTE            PIC 9(1)V9(1) VALUE 3.2.

       77  POTENCIA-WATT          PIC 9(6)V9(4).
       77  VELOCIDADE-MPS         PIC 9(3)V9(6).
       77  THRUST-NEWTONS         PIC 9(6)V9(2).
       77  DIAMETRO-M             PIC 9(2)V9(6).
       77  PASSO-M                PIC 9(2)V9(6).
       77  DIAMETRO-CM            PIC 9(3)V9(2).
       77  PASSO-CM               PIC 9(3)V9(2).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           PERFORM LIMPA-TELA.
           PERFORM EXIBE-TITULO.

           PERFORM ENTRA-DADOS.
           PERFORM CALCULA-HELICE.
           PERFORM EXIBE-RESULTADO.
       PROGRAM-DONE.
           STOP RUN.

       LIMPA-TELA.
           CALL "SYSTEM" USING "CLS".
           EXIT.

       EXIBE-TITULO.
           DISPLAY "-----------------------------------------------"
           DISPLAY "       CÁLCULO DE HÉLICE - PROJETO BARCO       "
           DISPLAY "-----------------------------------------------"
           EXIT.

       ENTRA-DADOS.
           DISPLAY "Digite a potência do motor (HP) [" POTENCIA-HP "]: "
           ACCEPT POTENCIA-HP
           DISPLAY "Digite o RPM de operação [" RPM-OPERACAO "]: "
           ACCEPT RPM-OPERACAO
           DISPLAY "Digite a velocidade desejada (nós) ["
            VELOCIDADE-NOS "]: "
           ACCEPT VELOCIDADE-NOS
           DISPLAY "Digite a eficiência da hélice (0.00 a 1.00)["
            EFICIENCIA-HELICE "]: ".
           ACCEPT EFICIENCIA-HELICE
           EXIT.

       CALCULA-HELICE.
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
           COMPUTE PASSO-CM = PASSO-M * 100
           EXIT.

       EXIBE-RESULTADO.
           DISPLAY "-------------------------------------------------"
           DISPLAY "               RESULTADOS DO CÁLCULO              "
           DISPLAY "-------------------------------------------------"
           DISPLAY " Diâmetro estimado da hélice : " DIAMETRO-CM " cm"
           DISPLAY " Passo estimado da hélice    : " PASSO-CM    " cm"
           DISPLAY " Empuxo estimado necessário  : " THRUST-NEWTONS " N"
           DISPLAY "-------------------------------------------------"
           EXIT.
