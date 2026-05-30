       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC-FUSCA.

       AUTHOR: Jorge Maestre Carvalho.
       INSTALLATION: DELL Core I5 4210U 8GB RAM.
       DATE-WRITTEN: Data 15/11/2025.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      * ---- INPUT VARIABLES ----
       01  RPM               PIC 9(5)V9(2).
       01  FINAL-DRIVE       PIC 9(2)V9(4).
       01  GEAR-RATIO        PIC 9(1)V9(2).
       01  TIRE-WIDTH        PIC 9(3).
       01  TIRE-ASPECT       PIC 9(3).
       01  TIRE-RIM          PIC 9(2).
       01  DIAMETRO-PENUS    PIC 9(5)V9(2).

      * ---- INTERNAL VARIABLES ----
       01  TIRE-DIAMETER     PIC 9(4)V9(4).
       01  TIRE-CIRC         PIC 9(4)V9(4).
       01  RPM-WHEEL         PIC 9(5)V9(4).
       01  SPEED-THEORETICAL PIC 9(5)V9(2).
       01  SPEED-REAL        PIC 9(5)V9(2).

      * Constants
       01  PI                PIC 9V9(6)  VALUE 3.141593.
       01  CDA               PIC 9V9(2)  VALUE 0.48.
       01  DRAG-LOSS         PIC 9V9(2)  VALUE 0.85.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "============================================"
           DISPLAY " CALCULADORA DE VELOCIDADE - FUSCA GNU COBOL "
           DISPLAY "============================================".

           DISPLAY "Informe o RPM maximo do motor: "
           ACCEPT RPM.

           DISPLAY "Informe a relacao final (ex.: 3.875): "
           DISPLAY "CAMBIOS COMUNS DO FUSCA".
           DISPLAY "8:31 (3.875) – fusca 1300 até 1973".
           DISPLAY "8:33 (4.125) – fusca 1200/1300 mais antigo".
           DISPLAY "8:35 (4.375) – mais curto, usado em 1200 antigos".
           DISPLAY "7:31 (4.429) – câmbio muito curto, alguns 1500".

           ACCEPT FINAL-DRIVE.

           DISPLAY "Informe a relacao da 4a marcha (ex.: 0.89): "
           ACCEPT GEAR-RATIO.

           DISPLAY "Informe a largura do pneu (mm), ex.: 185: "
           ACCEPT TIRE-WIDTH.

           DISPLAY "Informe o perfil do pneu (ex.: 65): "
           ACCEPT TIRE-ASPECT.

           DISPLAY "Informe o aro do pneu (ex.: 15): "
           ACCEPT TIRE-RIM.

      * ---- CALCULAR DIAMETRO DO PNEU ----
           COMPUTE TIRE-DIAMETER =
                   (TIRE-RIM * 25.4) +
                   (2 * (TIRE-WIDTH * TIRE-ASPECT / 100)).

      * ---- CIRCUNFERENCIA ----
           COMPUTE TIRE-CIRC = (TIRE-DIAMETER / 1000) * PI.

      * ---- RPM NA RODA ----
           COMPUTE RPM-WHEEL = RPM / (FINAL-DRIVE * GEAR-RATIO).

      * ---- VELOCIDADE TEORICA (km/h) ----
           COMPUTE SPEED-THEORETICAL =
                   (RPM-WHEEL * TIRE-CIRC * 60) / 1000.

      * ---- VELOCIDADE REAL ----
           COMPUTE SPEED-REAL = SPEED-THEORETICAL * DRAG-LOSS.

      * ---- DIAMETRO TOTAL DO PNEU.
           COMPUTE DIAMETRO-PENUS = TIRE-DIAMETER / 1000.

           DISPLAY " ".
           DISPLAY "======== RESULTADOS ========".
           DISPLAY "Diametro total do pneu (m): " DIAMETRO-PENUS.
           DISPLAY "Circunferencia (m): " TIRE-CIRC.
           DISPLAY "RPM na roda: " RPM-WHEEL.
           DISPLAY "Velocidade TEORICA (km/h): " SPEED-THEORETICAL.
           DISPLAY "Velocidade REAL (km/h):    " SPEED-REAL.
           DISPLAY "=============================".

           STOP RUN.
