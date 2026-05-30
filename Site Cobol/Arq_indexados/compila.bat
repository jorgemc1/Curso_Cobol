@echo off
cls
rem Arquivo de Lote para compilar GnuCobol.
rem Feito por Jorge Maestre Carvalho.

rem Quando o arquivo existe e antes da
rem compilação modamos sua extenção.
rem Verifica se não entrou com o nome do programa.
if "%~1"=="" (
    echo Informe o nome do programa COBOL
    goto fim
)

rem Verifica se o usuario digitou extensao
if not "%~x1"=="" (
    echo PROGRAMA NAO FOI COMPILADO
    echo ERRO DE ENTRADA DE DADOS
	echo ENTRE SOMENTE COM O NOME
    echo DO PROGRAMA
	echo SEM A EXTENSÃO DO ARQUIVO
    goto fim
)

if exist "%~1.old_exe" del "%~1.old_exe"
if exist "%~1.exe" ren "%~1.exe" "%~1.old_exe"

rem Compilando o programa se não tiver erros.
echo Compilaçao de um programa GnuCobol
cobc -x -Wall %1.cob -o %1
if not exist %1.exe (goto erro) else (goto certo)
:erro
echo PROGRAMA NÂO FOI COMPILADO
goto fim
:certo
echo PROGRAMA %1 FOI COMPILADO COM SUCESSO
goto fim
:fim
