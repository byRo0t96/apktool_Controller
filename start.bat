@echo off
title apktool Controller v.0.0.1
color 0c
mode con: cols=90 lines=30
cls

goto jar

:jar
if exist "apktool.jar" (
  echo apktool.jar exist.
  goto bat
) ELSE (
  echo downloading apktool_2.4.1.jar
  powershell -Command "Invoke-WebRequest https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.1.jar -OutFile apktool.jar"
  goto bat
)

:bat
if exist "apktool.bat" (
  echo apktool.bat exist.
  goto start
) ELSE (
  echo downloading apktool.bat
  curl https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat -o apktool.bat
  goto start
)


:start
cls
echo [1] Decoding .apk file.
echo [2] Building .apk file.
echo.
echo [0] exit
echo.

set /p opt=your option : 


IF "%opt%"=="1" (
  goto Decoding
) ELSE IF "%opt%"=="2" (
  goto Build
) ELSE IF "%opt%"=="0" (
  exit
) ELSE (
  goto start
)

:Decoding
set /p file=.apk file for Decoding : 

if exist "%file%" (
  apktool.bat d %file%
) ELSE (
  echo %file% is not exist.
  goto Decoding
)

:Build
set /p file=folder for Building : 

if exist "%file%" (
  apktool.bat b %file%
) ELSE (
  echo %file% is not exist.
  goto Build
)
